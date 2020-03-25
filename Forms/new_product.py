from django import forms
from products.models import Offers
from .fields import UserModelChoiceField


class CreateProduct(forms.Form):

    name = forms.CharField(required=True, max_length=40, widget=forms.TextInput(attrs={'class': "form-control"}))
    price = forms.IntegerField(required=True, widget=forms.TextInput(attrs={'class': "form-control"}))
    offer = UserModelChoiceField(queryset=Offers.objects.all(), required=False, empty_label="Select Offer",
                                 widget=forms.Select(attrs={'class': "form-control"}))

