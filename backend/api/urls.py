from django.urls import path
from . import views

urlpatterns = [
    path('locations', views.LocationListView.as_view(), name='location-list-view'),
    path('location', views.LocationCreateView.as_view(), name='location-detail-view'),
    path('location/<slug:pk>', views.LocationDetailView.as_view(), name='location-detail-view'),

]

