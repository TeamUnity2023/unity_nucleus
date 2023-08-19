from rest_framework import serializers
from .models import Person



class LoginSerializer(serializers.Serializer):
    universal_id = serializers.CharField()
    universal_travel_id = serializers.CharField()
    travel_password = serializers.CharField()


class UserRegistrationSerializer(serializers.ModelSerializer):
    travel_password = serializers.CharField(write_only=True)

    class Meta:
        model = Person
        fields = ['universal_id', 'universal_travel_id', 'travel_password', 'name', 'date_of_birth', 'is_superuser', 'is_staff', 'is_active']

    def create(self, validated_data):
        password = validated_data.pop('travel_password', None)
        user = super().create(validated_data)
        if password:
            user.set_password(password)
            user.save()
        return user


