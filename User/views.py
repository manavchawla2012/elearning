from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth import authenticate, login as auth_login
from django.contrib import messages, auth
from django.views.decorators.cache import cache_page
from django.views.decorators.csrf import csrf_protect


# Create your views here.


def logout(request):
    if request.user.is_active:
        auth.logout(request)
        return redirect("/user/login", messages.success(request, "Successfully Logged Out"))
    else:
        return redirect("/user/login")


def device(request, device_id):
    if request.method == "GET":
        return render(request, "Errors/404.html")


def handle404(request, exception):
    return render(request, 'Errors/404.html')