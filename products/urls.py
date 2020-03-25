from django.urls import path, include
from . import views

offerURL = [

]
urlpatterns = [
    path('new', views.new),
    path('offer', include(offerURL))
]
