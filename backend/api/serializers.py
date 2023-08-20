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

