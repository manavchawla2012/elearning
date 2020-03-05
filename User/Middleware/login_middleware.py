from django.utils.deprecation import MiddlewareMixin
from django.contrib.auth import logout
from django.http import JsonResponse
from django.shortcuts import redirect
from django.conf import settings
import re

#EXEMPT_URLS = [re.compile(settings.LOGIN_URL.lstrip('/'))]
EXEMPT_URLS = []
EXEMPT_NAMES = []
if hasattr(settings, 'LOGIN_URL'):
    EXEMPT_NAMES += [re.compile("^"+url+"/*") for url in settings.LOGIN_URL]


if hasattr(settings, 'LOGIN_EXEMPT_URLS'):
    EXEMPT_URLS += [re.compile(url) for url in settings.LOGIN_EXEMPT_URLS]


class Login(MiddlewareMixin):

    """def process_request(self, request):
        assert hasattr(request, 'user')
        path = request.path_info.lstrip('/')
        if request.user.is_authenticated:
            if not str(path):
                return redirect(settings.LOGIN_REDIRECT_URL)

        else:
            if not any(url.match(path) for url in EXEMPT_URLS):
                return redirect(settings.LOGIN_URL)"""
    def process_request(self, request):
        assert hasattr(request, 'user')
        path = request.path_info.lstrip('/')
        check_login = re.compile(r"^[a-z]*/login$")
        check_user_access_tutor = re.compile(r"^tutor/*")
        if request.user.is_authenticated:
            if request.user.role.pk == 3:
                if check_user_access_tutor.match(path):
                    return redirect("/")

        else:
            if not any(url.match(path) for url in EXEMPT_URLS):
                if any(url.match(path) for url in EXEMPT_NAMES):
                    return redirect("/")



            """if not check_login.match(path):
                for url in EXEMPT_URLS:
                    if url.match(path):
                            page = path.split("/")[0]
                            return redirect("/%s/login" % page)"""