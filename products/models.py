from django.db import models

# Create your models here.


class Offers(models.Model):
    name = models.CharField(max_length=255, null=False)
    code = models.CharField(max_length=255, null=False)
    min_buy = models.IntegerField(null=False, default=0)
    free_items = models.IntegerField(null=False, default=0)
    created_at = models.DateTimeField(auto_now_add=True, null=False)
    updated_at = models.DateTimeField(auto_now_add=False, null=False)

    class Meta:
        db_table = "offers"


class Products(models.Model):
    name = models.CharField(max_length=255, null=False)
    offer = models.ForeignKey(Offers, models.DO_NOTHING, null=True)
    price = models.IntegerField(null=False, default=0)
    created_at = models.DateTimeField(auto_now_add=True, null=False)
    updated_at = models.DateTimeField(auto_now_add=False, null=False)

    class Meta:
        db_table = "products"
