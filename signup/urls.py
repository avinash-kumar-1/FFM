from django.conf.urls import url,include
from django.contrib import admin
from . import views

app_name = "signup"
urlpatterns = [
    url(r'^$', views.signup, name='signup'),
    url(r'^signup/', views.signup, name='signup'),
    url(r'^successful_signup/$', views.succesful_signup, name='succesful_signup'),
]