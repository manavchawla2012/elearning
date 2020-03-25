from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import redirect
from django.conf import settings
import re

TUTOR_URLS = []

if hasattr(settings, 'TUTOR_APPS_REST'):
    TUTOR_URLS += [re.compile("^"+url+"/*") for url in settings.TUTOR_APPS_REST]


class CheckValidTutor(MiddlewareMixin):
    def process_request(self, request):
        path = request.path_info.lstrip('/')
        if request.user.is_authenticated:
            if any(url.match(path) for url in TUTOR_URLS):
                if request.user.role.pk != 2:
                    return redirect("/")