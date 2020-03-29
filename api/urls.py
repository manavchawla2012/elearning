from django.urls import path, include
from . import views


v1 = [
    path("user_details", views.get_user_details)
]

urlpatterns = [
    path("v1/", include(v1))
]
