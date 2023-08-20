from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Person


class MyUserAdmin(UserAdmin):
    model = Person

    fieldsets = (
            (None, {'fields': ('universal_id','universal_travel_id','name','date_of_birth','picture','travel_plan','username','is_staff','is_superuser','is_active')}),
    )

admin.site.register(Person, MyUserAdmin)
# admin.site.register(Role)
# admin.site.register(Company)

