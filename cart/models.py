from django.db import models
from User.models import Users
from products.models import Products


# Create your models here.
class Cart(models.Model):
    user = models.ForeignKey(Users, on_delete=models.DO_NOTHING, null=True)
    product = models.ForeignKey(Products, on_delete=models.DO_NOTHING, null=False)
    quantity = models.IntegerField(default=1, null=False)
    is_active = models.BooleanField(default=1, null=False)
    created_at = models.DateTimeField(auto_now_add=True, null=False)
    updated_at = models.DateTimeField(auto_now_add=False, null=False)

    class Meta:
        db_table = "cart"
