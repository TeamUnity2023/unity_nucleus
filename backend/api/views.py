from rest_framework.response import Response

from rest_framework import generics
from database.models import *

from .serializers import *


class LocationListView(generics.ListAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationsSerializer

class LocationCreateView(generics.CreateAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer

class LocationDetailView(generics.RetrieveAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer

class LocationUpdateView(generics.UpdateAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer


class SpacecraftCreateView(generics.CreateAPIView):
    queryset = Spacecraft.objects.all()
    serializer_class = SpacecraftSerializer

class SpacecraftDetailView(generics.RetrieveAPIView):
    queryset = Spacecraft.objects.all()
    serializer_class = SpacecraftSerializer

class SpacecraftUpdateView(generics.UpdateAPIView):
    queryset = Spacecraft.objects.all()
    serializer_class = SpacecraftSerializer


class SpacecraftStatusCreateView(generics.CreateAPIView):
    queryset = SpacecraftStatus.objects.all()
    serializer_class = SpacecraftStatusSerializer

class SpacecraftStatusDetailView(generics.RetrieveAPIView):
    queryset = SpacecraftStatus.objects.all()
    serializer_class = SpacecraftStatusSerializer

class SpacecraftStatusUpdateView(generics.UpdateAPIView):
    queryset = SpacecraftStatus.objects.all()
    serializer_class = SpacecraftStatusSerializer


class FlightCreateView(generics.CreateAPIView):
    queryset = Flight.objects.all()
    serializer_class = FlightSerializer

class FlightDetailView(generics.RetrieveAPIView):
    queryset = Flight.objects.all()
    serializer_class = FlightSerializer

class FlightListView(generics.ListAPIView):
    queryset = Flight.objects.all()
    serializer_class = FlightSerializer

class FlightUpdateView(generics.UpdateAPIView):
    queryset = Flight.objects.all()
    serializer_class = FlightUpdateSerializer


class FlightStatusCreateView(generics.CreateAPIView):
    queryset = FlightStatus.objects.all()
    serializer_class = FlightStatusSerializer

class FlightStatusDetailView(generics.RetrieveAPIView):
    queryset = FlightStatus.objects.all()
    serializer_class = FlightStatusSerializer

class FlightStatusUpdateView(generics.UpdateAPIView):
    queryset = FlightStatus.objects.all()
    serializer_class = FlightStatusSerializer


class TicketStatusCreateView(generics.CreateAPIView):
    queryset = TicketStatus.objects.all()
    serializer_class = TicketStatusSerializer

class TicketStatusDetailView(generics.RetrieveAPIView):
    queryset = TicketStatus.objects.all()
    serializer_class = TicketStatusSerializer

class TicketStatusUpdateView(generics.UpdateAPIView):
    queryset = TicketStatus.objects.all()
    serializer_class = TicketStatusSerializer


class TripStatusCreateView(generics.CreateAPIView):
    queryset = TripStatus.objects.all()
    serializer_class = TripStatusSerializer

class TripStatusDetailView(generics.RetrieveAPIView):
    queryset = TripStatus.objects.all()
    serializer_class = TripStatusSerializer

class TripStatusUpdateView(generics.UpdateAPIView):
    queryset = TripStatus.objects.all()
    serializer_class = TripStatusSerializer


class TravelPlanCreateView(generics.CreateAPIView):
    queryset = TravelPlan.objects.all()
    serializer_class = TravelPlanSerializer

class TravelPlanDetailView(generics.RetrieveAPIView):
    queryset = TravelPlan.objects.all()
    serializer_class = TravelPlanSerializer

class TravelPlanListView(generics.ListAPIView):
    queryset = TravelPlan.objects.all()
    serializer_class = TravelPlanSerializer

class TravelPlanUpdateView(generics.UpdateAPIView):
    queryset = TravelPlan.objects.all()
    serializer_class = TravelPlanSerializer


class PackageCreateView(generics.CreateAPIView):
    queryset = Package.objects.all()
    serializer_class = PackageSerializer

class PackageDetailView(generics.RetrieveAPIView):
    queryset = Package.objects.all()
    serializer_class = PackageSerializer

class PackageListView(generics.ListAPIView):
    queryset = Package.objects.all()
    serializer_class = PackageSerializer

class PackageUpdateView(generics.UpdateAPIView):
    queryset = Package.objects.all()
    serializer_class = PackageUpdateSerializer


class TripCreateView(generics.CreateAPIView):
    queryset = Trip.objects.all()
    serializer_class = TripSerializer

class TripDetailView(generics.RetrieveAPIView):
    queryset = Trip.objects.all()
    serializer_class = TripSerializer

class TripListView(generics.ListAPIView):
    queryset = Trip.objects.all()
    serializer_class = TripSerializer

class TripUpdateView(generics.UpdateAPIView):
    queryset = Trip.objects.all()
    serializer_class = TripUpdateSerializer



class TicketCreateView(generics.CreateAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer

class TicketDetailView(generics.RetrieveAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer

class TicketListView(generics.ListAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TicketSerializer

class TicketUpdateView(generics.UpdateAPIView):
    queryset = Ticket.objects.all()
    serializer_class = TicketUpdateSerializer

