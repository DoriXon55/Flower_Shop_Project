from django import forms
from .models import Individual, Firm

class IndividualLoginForm(forms.Form):
    first_name = forms.CharField(max_length=255)
    contact = forms.CharField(max_length=15)

class FirmLoginForm(forms.Form):
    NIP = forms.CharField(max_length=14)
    contact = forms.CharField(max_length=15)

class IndividualRegistrationForm(forms.Form):
    first_name = forms.CharField(max_length=255)
    last_name = forms.CharField(max_length=255)
    contact = forms.CharField(max_length=15)
    address = forms.CharField(max_length=255)

class FirmRegistrationForm(forms.Form):
    firm_name = forms.CharField(max_length=255)
    NIP = forms.CharField(max_length=14)
    contact = forms.CharField(max_length=15)
    address = forms.CharField(max_length=255)