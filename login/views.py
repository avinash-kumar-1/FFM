from django.shortcuts import render
from django.shortcuts import render,get_object_or_404
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib.auth import authenticate, login
from django.contrib import messages

def Login(request):
	return render(request,'login.html')

def succesful_login(request):
	username = request.POST.get("username")
	password = request.POST.get("password")
	user=authenticate(username=username, password=password)
	if user is not None:
		login(request, user)
		return HttpResponseRedirect("/")
	elif len(username)==0 or len(password)==0:
		messages.error(request, 'username and password cannot be empty')
		return HttpResponseRedirect('/login/')
	else:
		messages.error(request, 'username and/or password incorrect')
		return HttpResponseRedirect('/login/')
