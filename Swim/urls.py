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
	url(r'^$',index, name="index"),
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
	url(r'^purchase/$',purchase, name="purchase"),
	url(r'^purchaseitem/$',purchaseitem, name="purchaseitem"),
	url(r'^puritemaction/$',puritemaction, name="puritemaction"),
	url(r'^puraction/$',puraction, name="puraction"),
	url(r'^viewcoassign/$',viewcoassign, name="viewcoassign"),
	url(r'^aviewapply/$',aviewapply, name="aviewapply"),
	url(r'^delcoursea/$',delcoursea, name="delcoursea"),
	url(r'^delcourse/$',delcourse, name="delcourse"),
	url(r'^reports/$',reports, name="reports"),
	url(r'^coursetime/$',coursetime, name="coursetime"),
	url(r'^coursetimeaction/$',coursetimeaction, name="coursetimeaction"),

	url(r'^trainerhome/$',trainerhome, name="trainerhome"),
	url(r'^editprofile/$',editprofile, name="editprofile"),
	url(r'^tviewstud/$',tviewstud, name="tviewstud"),
	url(r'^tviewcoassign/$', tviewcoassign, name="tviewcoassign"),
	url(r'^att/$', att, name="att"),
	url(r'^apr/$', apr, name="apr"),
	url(r'^rej/$', rej, name="rej"),
	url(r'^attaction/$', attaction, name="attaction"),
	url(r'^viewitem/$', viewitem, name="viewitem"),

	url(r'^studenthome/$',studenthome, name="studenthome"),
	url(r'^viewcourse/$',viewcourse, name="viewcourse"),
	url(r'^apply/$',apply, name="apply"),
	url(r'^studprofile/$',studprofile, name="studprofile"),
	url(r'^viewapply/$',viewapply, name="viewapply"),
	url(r'^pay/$',pay, name="pay"),
	url(r'^payaction/$',payaction, name="payaction"),
	url(r'^sviewcoassign/$',sviewcoassign, name="sviewcoassign"),
	url(r'^viewatten/$',viewatten, name="viewatten"),
	url(r'^picaction/$',picaction, name="picaction"),
	url(r'^atpicaction/$',atpicaction, name="atpicaction"),
	url(r'^picaction1/$',picaction1, name="picaction1"),
	url(r'^upstudaction/$',upstudaction, name="upstudaction"),
	url(r'^upstudaction/$',upstudaction, name="upstudaction"),


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += staticfiles_urlpatterns()
