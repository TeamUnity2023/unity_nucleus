from django.urls import path
from . import views


urlpatterns = [
    path('locations', views.LocationListView.as_view()),
    path('location', views.LocationCreateView.as_view()),
    path('location/<int:pk>', views.LocationDetailView.as_view()),
    path('location-update/<int:pk>', views.LocationUpdateView.as_view()),

    path('spacecraft-status/<int:pk>', views.SpacecraftStatusDetailView.as_view()),
    path('spacecraft-status', views.SpacecraftStatusCreateView.as_view()),
    path('spacecraft-status-update/<int:pk>', views.SpacecraftStatusUpdateView.as_view()),

    path('spacecraft/<int:pk>', views.SpacecraftDetailView.as_view()),
    path('spacecraft', views.SpacecraftCreateView.as_view()),
    path('spacecraft-update/<int:pk>', views.SpacecraftUpdateView.as_view()),

    path('flight-status/<int:pk>', views.FlightStatusDetailView.as_view()),
    path('flight-status', views.FlightStatusCreateView.as_view()),
    path('flight-status-update/<int:pk>', views.FlightStatusUpdateView.as_view()),

    path('flight/<int:pk>', views.FlightDetailView.as_view()),
    path('flight', views.FlightCreateView.as_view()),
    path('flights', views.FlightListView.as_view()),
    path('flight-update/<int:pk>', views.FlightUpdateView.as_view()),

    path('ticket-status/<int:pk>', views.TicketStatusDetailView.as_view()),
    path('ticket-status', views.TicketStatusCreateView.as_view()),
    path('ticket-status-update/<int:pk>', views.TicketStatusUpdateView.as_view()),

    path('trip-status/<int:pk>', views.TripStatusDetailView.as_view()),
    path('trip-status', views.TripStatusCreateView.as_view()),
    path('trip-status-update/<int:pk>', views.TripStatusUpdateView.as_view()),

    path('travel-plan/<int:pk>', views.TravelPlanDetailView.as_view()),
    path('travel-plan', views.TravelPlanCreateView.as_view()),
    path('travel-plans', views.TravelPlanListView.as_view()),
    path('travel-plan-update/<int:pk>', views.TravelPlanUpdateView.as_view()),

    path('package/<int:pk>', views.PackageDetailView.as_view()),
    path('package', views.PackageCreateView.as_view()),
    path('packages', views.PackageListView.as_view()),
    path('package-update/<int:pk>', views.PackageUpdateView.as_view()),

    path('trip/<int:pk>', views.TripDetailView.as_view()),
    path('trip', views.TripCreateView.as_view()),
    path('trips', views.TripListView.as_view()),
    path('trip-update/<int:pk>', views.TripUpdateView.as_view()),

    path('ticket/<int:pk>', views.TicketDetailView.as_view()),
    path('ticket', views.TicketCreateView.as_view()),
    path('tickets', views.TicketListView.as_view()),
    path('ticket-update/<int:pk>', views.TicketUpdateView.as_view()),

    path('search', views.GetSearchResultsView.as_view()),
    path('booking', views.BookingCreateView.as_view())
]

