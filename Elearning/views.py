from django.shortcuts import render, redirect
from django.contrib import messages, auth
from django.views.decorators.csrf import csrf_protect
from django.contrib.auth import authenticate, login as auth_login
from Forms.sign_up import CreateUser
from User.models import Users


def home_page(request):
    return render(request, "Home/home.html")


def logout(request):
    if request.user.is_active:
        auth.logout(request)

    return redirect("/")


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
                if user_is_valid.role == 2:
                    return redirect("/tutor/home")
                else:
                    return redirect("/")
            else:
                return redirect("/login", messages.error(request, "Credentials Not Verified "))
        elif request.method == "GET":
            if request.user.is_authenticated:
                return redirect("/")
            else:
                return render(request, "user/login.html")
    except Exception as e:
        print(e)
        return redirect("/login", messages.error(request, "Some Error Occurred. Please Contact Administrator"))


@csrf_protect
def signup(request):
    if request.method == "GET":
        user_form = CreateUser()
        return render(request, "user/sign_up.html", {"user_form": user_form})
    elif request.method == "POST":
        check_form = CreateUser(request.POST)
        if check_form.is_valid():
            data = request.POST
            username = data["username"]
            password = data["password1"]
            first_name = data["firstname"]
            last_name = data["lastname"]
            email = data["email"]
            phone = data["mobile"]
            gender = data["gender"]
            Users.objects.create_user(username, password, first_name=first_name, last_name=last_name, email=email,
                                      phone=phone, gender=gender, role_id=3)
            return redirect("/login", messages.success(request, "Successfully Signed Up"))
        else:
            return render(request, 'user/sign_up.html', {"user_form": check_form})


