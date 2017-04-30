from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.models import User
from home.models import *
from django.db import connection
from django.contrib import messages

def signup(request):
	return render(request,'signup.html')
def succesful_signup(request):
	name=request.POST.get('name')
	contact_no=request.POST.get('contact_no')
	USER_TYPE=request.POST.get('user_type')
	username=request.POST.get('username')
	password=request.POST.get('password')
	password_re=request.POST.get('password_re')
	print username
	#t=User.objects.get(username=username)
	cursor=connection.cursor()
	cursor.execute("Select username from auth_user where username=%s",[username])
	t=cursor.fetchall()
	if(len(t)!=0):
		messages.error(request, 'Username already exists')
		return HttpResponseRedirect('/signup')
	else:
		'''elif contact_no!="" and len(contact_no)!=10:
			messages.error(request, 'Contact number is incorrect. Please enter again.')
			return HttpResponseRedirect('/signup')'''
		if password!="" and password_re!="" and (password!=password_re):
			messages.error(request, 'Passwords do not match. Please enter again.')
			return HttpResponseRedirect('/signup')
		elif username!="" and password!="" and password_re!="" and name!="":
			print username,"again"
			user=User.objects.create_user(username=username,password=password)
			cursor.execute("Select max(customer_id) from Customer")
			x=cursor.fetchone()
			val=x[0]
			#Usermyproject.objects.create(user_default_info=user, user_id=val+1, user_type=USER_TYPE)
			cursor.execute("Insert into Customer values(%s,%s,%s)",[val+1,name,contact_no])
		else:
			messages.error(request, 'Form not filled properly. Please fill again.')
			return HttpResponseRedirect('/signup')
	return HttpResponse("Welcome")