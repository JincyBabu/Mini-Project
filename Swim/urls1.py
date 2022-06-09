"""swimschool URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin

from django.conf import settings
from django.conf.urls import include,url,patterns
from swimapp.views import *

from django.conf.urls import include, url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.views.generic import TemplateView
from django.conf.urls.static import static

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^index/$',index, name="index"),
	url(r'^searchlogin/$',searchlogin, name="searchlogin"),
	url(r'^login/$',login, name="login"),
	url(r'^adminhome/$',adminhome, name="adminhome"),
	url(r'^logout/$',logout, name="logout"),
	url(r'^student/$',student, name="student"),
	url(r'^trainer/$',trainer, name="trainer"),
	url(r'^studaction/$',studaction, name="studaction"),
	url(r'^traiaction/$',traiaction, name="traiaction"),
	url(r'^viewtrainer/$',viewtrainer, name="viewtrainer"),
	url(r'^course/$',course, name="course"),
	url(r'^courseassign/$',courseassign, name="courseassign"),
	url(r'^courseassignaction/$',courseassignaction, name="courseassignaction"),
	url(r'^coaction/$',coaction, name="coaction"),
	url(r'^viewstud/$',viewstud, name="viewstud"),
	url(r'^vendor/$',vendor, name="vendor"),
	url(r'^venaction/$',venaction, name="venaction"),
	url(r'^viewvendor/$',viewvendor, name="viewvendor"),
	url(r'^category/$',category, name="category"),
	url(r'^cataction/$',cataction, name="cataction"),
	url(r'^delcat/$',delcat, name="delcat"),
	url(r'^item/$',item, name="item"),
	url(r'^itemaction/$',itemaction, name="itemaction"),
	url(r'^delitem/$',delitem, name="delitem"),
	

]
