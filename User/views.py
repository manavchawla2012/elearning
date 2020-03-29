from django.shortcuts import render, redirect
from django.contrib import messages, auth
from datetime import datetime
from User.models import ActivityPeriod

# Create your views here.


def logout(request):
    if request.user.is_active:
        return redirect("/user/login", messages.success(request, "Successfully Logged Out"))
    else:
        return redirect("/user/login")


def device(request, device_id):
    if request.method == "GET":
        return render(request, "Errors/404.html")


def handle404(request, exception):
    return render(request, 'Errors/404.html')