from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager


class Location(models.Model):
    name = models.CharField(max_length=50)
    description = models.TextField()
    population = models.IntegerField()
    user_rating = models.FloatField()
    picture = models.ImageField(upload_to='location_pictures/')

class SpacecraftStatus(models.Model):
    title = models.CharField(max_length=30)
    available = models.BooleanField(default=False)

class Spacecraft(models.Model):
    name = models.CharField(max_length=30)
    code = models.CharField(max_length=50)
    capacity = models.IntegerField()
    status = models.ForeignKey(SpacecraftStatus, on_delete=models.SET_NULL, null=True, blank=True, related_name='spacecrafts')
    seat_alignment = models.JSONField(null=True, blank=True)

class FlightStatus(models.Model):
    title = models.CharField(max_length=30)
    available = models.BooleanField(default=False)

class Flight(models.Model):
    duration_hours = models.IntegerField()
    duration_minutes = models.IntegerField()
    # available_seats must be less than capacity of the spacecraft
    available_seats = models.IntegerField()
    distance = models.FloatField()
    departure_date = models.DateField()
    departure_time = models.TimeField()
    departure_location = models.ForeignKey(Location, on_delete=models.CASCADE, related_name='flight_departures')
    destination_location = models.ForeignKey(Location, on_delete=models.CASCADE, related_name='flight_arrivals')
    spacecraft = models.ForeignKey(Spacecraft, on_delete=models.CASCADE, related_name='flights')
    status = models.ForeignKey(FlightStatus, on_delete=models.SET_NULL, null=True, blank=True, related_name='flights')

class Package(models.Model):
    class_type = models.ForeignKey('TravelPlan', on_delete=models.CASCADE, related_name='packages')
    price = models.FloatField()
    flight = models.ForeignKey(Flight, on_delete=models.CASCADE, related_name='packages')

class TripStatus(models.Model):
    title = models.CharField(max_length=30)
    available = models.BooleanField(default=False)

class TravelPlan(models.Model):
    title = models.CharField(max_length=30)
    value = models.IntegerField(default=0)

class Trip(models.Model):
    person = models.ForeignKey('Person', on_delete=models.CASCADE, related_name='trips')
    departure_location = models.ForeignKey(Location, on_delete=models.CASCADE, related_name='departure_trips')
    destination_location = models.ForeignKey(Location, on_delete=models.CASCADE, related_name='destination_trips')
    status = models.ForeignKey(TripStatus, on_delete=models.SET_NULL, null=True, blank=True, related_name='trips')

class TicketStatus(models.Model):
    title = models.CharField(max_length=30)
    valid = models.BooleanField(default=False)

class Ticket(models.Model):
    ticket_number = models.CharField(max_length=50)
    status = models.ForeignKey(TicketStatus, on_delete=models.SET_NULL, null=True, blank=True, related_name='tickets')
    seat_number = models.IntegerField()
    package = models.ForeignKey(Package, on_delete=models.CASCADE, related_name='tickets')
    trip = models.ForeignKey(Trip, on_delete=models.CASCADE, related_name='tickets')
    trip_order = models.IntegerField()
    flight = models.ForeignKey(Flight, on_delete=models.CASCADE, related_name='tickets')


class UserManager(BaseUserManager):
    def create_user(self, universal_id=None, universal_travel_id=None, travel_password=None, name=None, date_of_birth=None, picture="", travel_plan=None, admin=False, *args, **kwargs):
        if not universal_id:
            raise ValueError("User must have an universal_id")
        if not universal_travel_id:
            raise ValueError("User must have universal_travel_id")
        if not travel_password:
            raise ValueError("User must have a travel_password")
        if not name:
            raise ValueError("User must have a name")
        if not date_of_birth:
            raise ValueError("User must have a date_of_birth")

        user = self.model(
            universal_id=universal_id,
            universal_travel_id=universal_travel_id,
        )

        user.set_password(travel_password)  # change password to hash
        user.name = name
        user.date_of_birth = date_of_birth
        user.picture = picture
        user.travel_plan = travel_plan
        if admin:
            user.is_superuser = True
            user.is_staff = True
        else:
            user.is_superuser = False
            user.is_staff = False
        user.save(using=self._db)
        return user


class Person(AbstractUser):
    universal_id = models.CharField(max_length=60, primary_key=True)
    universal_travel_id = models.CharField(max_length=60, unique=True, null=False, blank=False)
    name = models.CharField(max_length=40)
    date_of_birth = models.DateField()
    picture = models.ImageField(upload_to='person_pictures/', null=True, blank=True)
    travel_plan = models.ForeignKey(TravelPlan, on_delete=models.SET_NULL, null=True, blank=True)

    username = models.CharField(max_length=50, unique=False, default="")
    is_active = models.BooleanField(default=True, editable=False)

    USERNAME_FIELD = 'universal_id'
    # This specifies which fields are required along with USERNAME_FIELD and password for user registration
    REQUIRED_FIELDS = ['universal_travel_id', 'name', 'date_of_birth']

    objects = UserManager()





