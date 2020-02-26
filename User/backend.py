from .models import Users
from django.contrib.auth.backends import BaseBackend
from django.contrib.auth.models import AnonymousUser
import hashlib


class CustomUserAuth(BaseBackend):

    def authenticate(self, request, username=None, password=None):
        try:
            encrypt_password = hashlib.sha1(password.encode("utf-8")).hexdigest()
            user = Users.objects.get(username=username, password=encrypt_password)
            if user:
                return user
            else:
                return None

        except Users.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            user = Users.objects.get(pk=user_id)
            if user.is_active:
                return user
            return AnonymousUser()
        except Users.DoesNotExist:
            return AnonymousUser()

