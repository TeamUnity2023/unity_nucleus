from rest_framework import serializers
from .models import Person



class LoginSerializer(serializers.Serializer):
    universal_id = serializers.CharField()
    universal_travel_id = serializers.CharField()
    travel_password = serializers.CharField()


class UserRegistrationSerializer(serializers.ModelSerializer):
    travel_password = serializers.CharField(write_only=True)
    admin = serializers.BooleanField(write_only=True, default=False)

    class Meta:
        model = Person
        fields = ['universal_id', 'universal_travel_id', 'travel_password', 'name', 'date_of_birth', 'admin']

    def create(self, validated_data):
        password = validated_data.pop('travel_password', None)
        admin = validated_data.pop('admin', False)
        user = super().create(validated_data)
        if password:
            user.set_password(password)
            user.is_staff = admin
            user.is_superuser = admin
            user.save()
        return user


class PersonDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ['universal_id', 'universal_travel_id', 'name', 'date_of_birth', 'picture', 'travel_plan']


class PersonUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ['name', 'date_of_birth', 'picture', 'travel_plan']


