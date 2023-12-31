from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, generics
from django.contrib.auth import authenticate, login, logout
from .serializers import LoginSerializer, UserRegistrationSerializer, PersonDetailSerializer, PersonUpdateSerializer
from .permissions import IsAuthenticated, AccessOwnAccountPermission
from .models import Person

class CustomLoginView(APIView):
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            username = serializer.validated_data['universal_id']
            universal_travel_id = serializer.validated_data['universal_travel_id']
            password = serializer.validated_data['travel_password']
            user = authenticate(username=username, password=password)

            if user and user.universal_travel_id == universal_travel_id:    # If credentials are valid(match)
                login(request, user)
                return Response({'message': f'Welcome, {user.name}!'}, status=status.HTTP_200_OK)

            else:       # If credentials are invalid(do not match)
                return Response({'message': 'Invalid credentials'}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class CustomLogoutView(APIView):
    def get(self, request):
        logout(request)
        return Response({'message': 'Logout successful!'}, status=status.HTTP_200_OK)


class SignUpView(APIView):
    def post(self, request):
        serializer = UserRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            # Login the user after successful registration
            login(request, user)
            return Response({'message': 'SignUp successful!'}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PersonRetrieveView(generics.RetrieveAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonDetailSerializer
    permission_classes = [IsAuthenticated, AccessOwnAccountPermission]


class PersonUpdateView(generics.UpdateAPIView):
    queryset = Person.objects.all()
    serializer_class = PersonUpdateSerializer
    permission_classes = [IsAuthenticated, AccessOwnAccountPermission]


