from rest_framework.response import Response
from rest_framework.decorators import api_view

from rest_framework import generics, authentication
from database.models import Location

from .serializers import LocationSerializer


@api_view(['GET'])
def RESTView(request, pk=None, *args, **kwargs):
    if request.method == 'GET':
        data_obj = {
            'project': 'Intergalactic Space Travelling Management System',
            'team': 'Team Unity',
            'message': "Hello, world. You're at the nucleus_server."
        }
        return Response({'data': data_obj}, status=200)
    return Response({'message': "HTTP request type not allowed"}, status=405)


class LocationListView(generics.ListAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    authentication_classes = [authentication.TokenAuthentication, authentication.SessionAuthentication]

class LocationCreateView(generics.CreateAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    authentication_classes = [authentication.TokenAuthentication, authentication.SessionAuthentication]

class LocationDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Location.objects.all()
    serializer_class = LocationSerializer
    authentication_classes = [authentication.TokenAuthentication, authentication.SessionAuthentication]