from django.shortcuts import render, redirect
from django.contrib import messages, auth


def home_page(request):
    return render(request, "Home/home.html")


def logout(request):
    if request.user.is_active:
        auth.logout(request)

    return redirect("/")
