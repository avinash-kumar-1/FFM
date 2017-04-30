from django.conf.urls import url,include
from django.contrib import admin
from . import views

urlpatterns = [
    url(r'^$', views.Login,name='login'),
    url(r'^successful_login/$', views.succesful_login, name='succesful_login'),
]