from django.urls import path
from . import views
from .custom_token_view import CustomObtainAuthToken

urlpatterns =[
    path('login/', views.CustomLoginView.as_view(), name='login-view'),
    path('logout/', views.CustomLogoutView.as_view(), name='logout-view'),
    path('signup/', views.SignUpView.as_view(), name='signup-view'),
    path('get-token/', CustomObtainAuthToken.as_view(), name='get-token-view'),
]

