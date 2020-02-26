from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth import authenticate, login as auth_login
from django.contrib import messages, auth
from django.views.decorators.cache import cache_page
from django.views.decorators.csrf import csrf_protect


# Create your views here.

@csrf_protect
def login(request):
    try:
        if request.method == "POST":
            request_data = request.POST
            username = request_data["username"]
            password = request_data["password"]
            user_is_valid = authenticate(request, username=username, password=password)
            if user_is_valid:
                auth_login(request, user_is_valid)
                request.user = user_is_valid
                return redirect("/user/home")
            else:
                return redirect("/user/login", messages.error(request, "Credentials Not Verified "))
        elif request.method == "GET":
            if request.user.is_authenticated:
                return redirect("/user/home")
            else:
                return render(request, "user/login.html")

    except Exception as e:
        print(e)
        return redirect("/user/login", messages.error(request, "Some Error Occurred. Please Contact Administrator"))


def logout(request):
    if request.user.is_active:
        auth.logout(request)
        return redirect("/user/login", messages.success(request, "Successfully Logged Out"))
    else:
        return redirect("/user/login")


def handle404(request, exception):
    return render(request, 'Errors/404.html')