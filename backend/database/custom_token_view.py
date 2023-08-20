from .authtoken.views import ObtainAuthToken


class CustomObtainAuthToken(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        return super(CustomObtainAuthToken, self).post(request, *args, **kwargs)


