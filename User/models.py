from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)
from datetime import datetime
import hashlib
from django.contrib.sessions.models import Session


# Create your models here.
class UserManager(BaseUserManager):
    def create_user(self, username, password, first_name, gender,
                    phone, email, last_name, role_id, state=None, country=None):
        now = datetime.now()
        encrypt_password = hashlib.sha1(password.encode("utf-8")).hexdigest()
        user = self.model(username=username, password=encrypt_password, first_name=first_name, gender=gender,
                          phone=phone, email=email, state=state, country=country, last_name=last_name, role_id=role_id,
                          created_at=now, updated_at=now)
        user.save()
        return user


class Roles(models.Model):
    name = models.CharField(unique=True, max_length=40)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()

    class Meta:
        db_table = 'roles'


class Users(AbstractBaseUser):
    #REQUIRED_FIELDS = ('username', 'first_name', 'last_name', 'email', 'password')
    username = models.CharField(unique=True, max_length=100, null=False)
    password = models.CharField(max_length=50)
    first_name = models.CharField(max_length=40)
    gender = models.CharField(null=True, max_length=10)
    phone = models.BigIntegerField(blank=True, null=True)
    email = models.CharField(max_length=40, blank=True, null=True)
    state = models.CharField(max_length=30, blank=True, null=True)
    country = models.CharField(max_length=40, blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)
    last_name = models.CharField(max_length=40)
    role = models.ForeignKey(Roles, models.DO_NOTHING)
    api_key = models.CharField(max_length=64, null=True)
    objects = UserManager()
    USERNAME_FIELD = 'username'

    class Meta:
        db_table = 'users'


class ShortUrl(models.Model):
    path = models.CharField(max_length=255)
    parameters = models.CharField(max_length=255, blank=True, null=True)
    expiery_date = models.DateTimeField()
    created_at = models.DateTimeField()
    md5 = models.CharField(max_length=255)

    class Meta:
        db_table = 'short_url'


class ActivityPeriod(models.Model):
    user = models.ForeignKey(Users, on_delete=models.DO_NOTHING)
    log_in_time = models.DateTimeField(auto_now_add=True, null=False)
    expire_time = models.DateTimeField(null=True)
    session = models.ForeignKey(Session, on_delete=models.DO_NOTHING)

    class Meta:
        db_table = "user_activity_period"
        unique_together = ('user', 'session')


