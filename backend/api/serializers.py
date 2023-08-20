from rest_framework import serializers

from database.models import *


class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = '__all__'

class LocationsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ['id', 'name', 'population', 'user_rating', 'picture']


class SpacecraftSerializer(serializers.ModelSerializer):
    class Meta:
        model = Spacecraft
        fields = '__all__'


class SpacecraftStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = SpacecraftStatus
        fields = '__all__'


class FlightSerializer(serializers.ModelSerializer):
    class Meta:
        model = Flight
        fields = '__all__'

class FlightUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Flight
        fields = ['duration_hours', 'duration_minutes', 'available_seats', 'departure_date', 'departure_time', 'spacecraft', 'status']


class FlightStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = FlightStatus
        fields = '__all__'


class TicketStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = TicketStatus
        fields = '__all__'


class TripStatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = TripStatus
        fields = '__all__'


class TravelPlanSerializer(serializers.ModelSerializer):
    class Meta:
        model = TravelPlan
        fields = '__all__'


class PackageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Package
        fields = '__all__'

class PackageUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Package
        fields = ['price']


class TripSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trip
        fields = '__all__'

class TripUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Trip
        fields = ['status']


class TicketSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = '__all__'

class TicketUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = ['status']


