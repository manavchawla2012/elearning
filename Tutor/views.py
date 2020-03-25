from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth import authenticate, login as auth_login
from User.models import Users
from django.contrib import messages


# Create your views here.


@csrf_protect
def login(request):
    if request.method == "POST":
        request_data = request.POST
        username = request_data["username"]
        password = request_data["password"]
        if _verify_user_tutor(username):
            user_is_valid = authenticate(request, username=username, password=password)
            if user_is_valid:
                auth_login(request, user_is_valid)
                request.user = user_is_valid
                return redirect("/tutor/home")
            else:
                return redirect("/tutor/login", messages.error(request, "Credentials Not Verified "))
        else:
            return redirect("/tutor/login", messages.error(request, "Not a valid Tutor. Contact Admin"))

    elif request.method == "GET":
        return render(request, "Tutor/login.html")


def home(request):
    return render(request, "Tutor/home.html")



def _verify_user_tutor(username):
    if '@' in username:
        kwargs = {'email': username}
    else:
        kwargs = {'username': username}

    user = Users.objects.get(**kwargs)
    print(user.role.id)
    if user.role.id == 2 or user.role.id == 1:
        return True
    else:
        return False


