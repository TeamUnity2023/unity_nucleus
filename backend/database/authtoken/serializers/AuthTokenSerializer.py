from django.contrib.auth import authenticate
from django.utils.translation import gettext_lazy as _

from rest_framework import serializers


class AuthTokenSerializer(serializers.Serializer):
    universal_id = serializers.CharField(
        label=_("universal_id"),
        write_only=True
    )
    universal_travel_id = serializers.CharField(
        label=_("universal_travel_id"),
        write_only=True
    )
    travel_password = serializers.CharField(
        label=_("travel_password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        write_only=True
    )
    token = serializers.CharField(
        label=_("Token"),
        read_only=True
    )

    def validate(self, attrs):
        universal_id = attrs.get('universal_id')
        universal_travel_id = attrs.get('universal_travel_id')
        travel_password = attrs.get('travel_password')

        if universal_id and universal_travel_id and travel_password:
            user = authenticate(request=self.context.get('request'), universal_id=universal_id, password=travel_password)
            # The authenticate call simply returns None for is_active=False
            # users. (Assuming the default ModelBackend authentication
            # backend.)
            user = user if user and user.universal_travel_id == universal_travel_id else None
            if not user:
                msg = _('Unable to log in with provided credentials.')
                raise serializers.ValidationError(msg, code='authorization')
        else:
            msg = _('Must include "universal_id", "universal_travel_id" and "travel_password".')
            raise serializers.ValidationError(msg, code='authorization')

        attrs['user'] = user
        return attrs
