from django.urls import path, include
from . import views


urlpatterns = [
    path('device/<int:device_id>', views.device)
]