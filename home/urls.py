from django.conf.urls import url,include

from . import views

urlpatterns = [
    url(r'^login/', include('login.urls')),
    url(r'^signup/',include('signup.urls')),
    url(r'^$', views.home, name='home'),
]