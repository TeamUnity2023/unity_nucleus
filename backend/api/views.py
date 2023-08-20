from rest_framework.response import Response

from rest_framework import generics
from database.models import Location, Spacecraft, SpacecraftStatus

from .serializers import LocationSerializer, LocationsSerializer, SpacecraftSerializer, SpacecraftStatusSerializer


class LocationListView(generics.ListAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationsSerializer

class LocationCreateView(generics.CreateAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer

class LocationDetailView(generics.RetrieveAPIView):
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

