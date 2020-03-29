import hashlib
import os
import pytz
from datetime import datetime, timedelta
from urllib.parse import urlparse
import secrets

from django.contrib import messages, auth
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.contrib.auth.signals import user_logged_out

from Forms.sign_up import CreateUser
from User.models import Users, ShortUrl, ActivityPeriod
from products.models import Products


def home_page(request):
    if request.method == "GET":
        all_products = Products.objects.all()
        return render(request, "Product/view.html", {"products": all_products})


def logout(request):
    if request.user.is_active:
        session_key = request.session.session_key
        user = getattr(request, 'user', None)
        if not getattr(user, 'is_authenticated', True):
            user = None
        user_logged_out.send(sender=user.__class__, request=request, user=user)
        ActivityPeriod.objects.filter(session_id=session_key).update(expire_time=datetime.now())
    request.session.set_expiry(-1)
    if hasattr(request, 'user'):
        from django.contrib.auth.models import AnonymousUser
        request.user = AnonymousUser()

    return redirect("/")


@csrf_exempt
def url_short(request, md5=None):
    if request.method == "POST":
        url = urlparse(request.POST["url"])
        path = url.path + url.query
        current_time = datetime.now(pytz.timezone("Asia/Kolkata"))
        expiry_time = current_time + timedelta(seconds=20)
        path_md5 = hashlib.md5(path.encode("utf-8")).hexdigest()
        insert_short_url = ShortUrl.objects.model(parameters=url.query, path=url.path, md5=path_md5,
                                                  expiery_date=expiry_time,
                                                  created_at=current_time)
        insert_short_url.save()
        return JsonResponse({"success": True, "link": os.path.join(url.scheme + "://" + url.netloc, "url", path_md5)})
    elif request.method == "GET":
        get_url_data = ShortUrl.objects.filter(md5=md5).order_by('-created_at').first()
        current_date = datetime.now(pytz.timezone("Asia/Kolkata"))
        expiry_date = get_url_data.expiery_date
        if expiry_date > current_date:
            path = get_url_data.path
            parameters = get_url_data.parameters
            url = path + "?" + parameters
            return redirect(url)
        else:
            return JsonResponse({"success": False, "msg": "url expired"})


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
                request.session.set_expiry(1000)
                if not user_is_valid.api_key:
                    api_key = secrets.token_hex(32)
                    Users.objects.filter(pk=user_is_valid.pk).update(api_key=api_key)

                try:
                    current_time = datetime.now()
                    user_id = user_is_valid.id
                    session_id = request.session.session_key
                    add_user_activity = ActivityPeriod(user_id=user_id, session_id=session_id,
                                                       log_in_time=current_time,
                                                       expire_time=None)
                    add_user_activity.save()
                except Exception as e:
                    print(e)
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
