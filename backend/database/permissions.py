from rest_framework import permissions


class AccessOwnAccountPermission(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        if request.user == obj:
            return True
        return False

class IsAuthenticated(permissions.IsAuthenticated):
    pass
