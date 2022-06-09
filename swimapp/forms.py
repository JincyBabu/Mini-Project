from django import forms
from django.forms import CharField
from swimapp.models import pmodel
from swimapp.models import pmodel1

class pform(forms.Form):
	img = forms.FileField()
	class Meta:
		model = pmodel
		fields = ['sid','img']

class pform1(forms.Form):
	img = forms.FileField()
	class Meta:
		model = pmodel
		fields = ['tid','img']
        
