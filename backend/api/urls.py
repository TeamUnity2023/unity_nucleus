from django.urls import path
from . import views

urlpatterns = [
    path('locations', views.LocationListView.as_view()),
    path('location', views.LocationCreateView.as_view()),
    path('location/<int:pk>', views.LocationDetailView.as_view()),

    path('spacecraft-status/<int:pk>', views.SpacecraftStatusDetailView.as_view()),
    path('spacecraft-status', views.SpacecraftStatusCreateView.as_view()),
    path('spacecraft-status-update/<int:pk>', views.SpacecraftStatusUpdateView.as_view()),

    path('spacecraft/<int:pk>', views.SpacecraftDetailView.as_view()),
    path('spacecraft', views.SpacecraftCreateView.as_view()),
    path('spacecraft-update/<int:pk>', views.SpacecraftUpdateView.as_view()),


]

