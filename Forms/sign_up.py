from django import forms
from User.models import Users
from phonenumber_field.modelfields import PhoneNumberField


class CreateUser(forms.Form):

    gender_choices = (('male', 'Male'), ('female', 'Female'), ('other', 'Others'))
    firstname = forms.CharField(required=True, label="First Name", max_length=30, min_length=5)
    lastname = forms.CharField(required=True, label="Last Name", max_length=30, min_length=5)
    email = forms.EmailField(required=True, label="Email", max_length=40, min_length=10)
    username = forms.CharField(required=True, label="Username", max_length=20, min_length=5)
    mobile = PhoneNumberField()
    password1 = forms.CharField(widget=forms.PasswordInput(), required=True)
    password2 = forms.CharField(widget=forms.PasswordInput(), required=True)
    gender = forms.ChoiceField(choices=gender_choices, required=True)

    def clean_password1(self):
        if self.data["password1"] != self.data["password2"]:
            raise forms.ValidationError("Passwords do not match")
        return self.data['password1']

    def clean_username(self):
        check_username = Users.objects.filter(username=self.data["username"])
        if check_username:
            raise forms.ValidationError("Username Already Taken")
        return self.data["username"]

    def clean_email(self):
        check_email = Users.objects.filter(email=self.data["email"])
        if check_email:
            raise forms.ValidationError("You have already registered with this Email")
        return self.data["email"]