"""BTW URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from newletter.views import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^home/',home,name='home'),
    url(r'^$', index, name='index'),
    url(r'^Food/about/',about,name='about'),
    url(r'^Food/', index, name='index'),
    url(r'^show/', show, name='show'),
    url(r'^contact/', contact, name='contact'),
    url(r'^logout/',Logout,name='logout'),
    url(r'^login/',include('login.urls')),
    url(r'^signup/',include('signup.urls')),
    url(r'^profit/',profit,name='profit'),
    url(r'^customer_frequency/',customer_frequency,name='customer_frequency'),
    url(r'^food_item_view/',food_item_view,name='food_item_view'),
    url(r'^food_item_view1/',food_item_view1,name='food_item_view1'),
    url(r'^food_item_insert/',food_item_insert,name='food_item_insert'),
    url(r'^food_item_delete/',food_item_delete,name='food_item_delete'),
    url(r'^workers/',workers,name='workers'),
    url(r'^purchases/',purchases,name='purchases'),
    url(r'^purchases_view/',purchases_view,name='purchases_view'),
    url(r'^waiter_view/',waiter_view,name='waiter_view'),
    url(r'^waiter_add/',waiter_add,name='waiter_add'),
    url(r'^chef_view/',chef_view,name='chef_view'),
    url(r'^chef_add/',chef_add,name='chef_add'),
    url(r'^waiter_delete/',waiter_delete,name='waiter_delete'),
    url(r'^waiter_delete_view/',waiter_delete_view,name='waiter_delete_view'),






]

