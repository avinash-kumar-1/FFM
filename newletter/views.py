from django.shortcuts import render,redirect
from django.db import connection
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib.auth import authenticate, logout
import MySQLdb
c = connection.cursor()
# Create your views here.
from forms import ContactForm

def home(request):
	
	try:
 		#c = connection.cursor()
 		c.execute("select * from Food")
 		row = c.fetchone()
 		print row
 	
 	except Exception as e:
 		print e
 	finally:
 		c.close()

 	#db = MySQLdb.connect("localhost","root","avi916148","Fast_Food_Managment_System")
 	#c = db.cursor()
 	#c.execute("select * from STUDENTS")
 	#sql = " INSERT INTO Food(food_name,food_price,food_id,vat_nv) VALUES ('%s', '%d', '%d', '%s' )" % ('Chat',20, 11,'3.5')
 	#c.execute(sql)
 	#db.commit()
 	#row = c.fetchall()
 	#print(row)
 	title   = "welcome"
 	if request.user.is_authenticated():
 		signin =True
 		title = "Welcome %s" % (request.user)
 	else:
 		signin = False
 	print signin
 	context = {"title":title,"is_logged_in":signin}
 	
 	return render(request,"home.html",context)

def index(request):
    return HttpResponse("Myproject: Hello world! <a href='/home/'>About</a>")

def about(request):
	return HttpResponse(" Myproject: Here is the about page.<a href='/home/'>Index</a>.")

def show(request):
	c = connection.cursor()
 	c.execute("select * from Food")
 	row1 = c.fetchall()
 	context = {"table1":row1}
 	c = connection.cursor()
 	c.execute("select * from Orders")
 	row2 = c.fetchall()
 	context = {"table2":row2}
 	c = connection.cursor()
 	c.execute("select * from Customer")
 	row3 = c.fetchall()
 	context = {"table3":row3}
 	c = connection.cursor()
 	c.execute("select * from Bill")
 	row4 = c.fetchall()
 	context = {"table4":row4}
 	c = connection.cursor()
 	c.execute("select * from Waiter")
 	row5 = c.fetchall()
 	context = {"table5":row5}
 	c = connection.cursor()
 	c.execute("select * from Batch")
 	row6 = c.fetchall()
 	context = {"table6":row6}
 	c = connection.cursor()
 	c.execute("select * from Chef")
 	row7 = c.fetchall()
 	context = {"table7":row7}

 	#return render(request,"display.html",context)
	#c1 = connection.cursor()
	c.execute("select * from Items")
	row = c.fetchall()	
	context = {"table8":row, "table1":row1, "table2":row2, "table3":row3, "table4":row4, "table5":row5,"table6":row6, "table7":row7}
	return render(request,"display.html",context)	
def contact(request):
	form = ContactForm(request.POST or None)
	context = { "form":form}
	if form.is_valid():
		print form
		print form.cleaned_data

		context["form"] = None
		
	return render(request,"forms.html",context)

def Logout(request):
	logout(request)
	return redirect('http://localhost:8000/home/')

def profit(request):
	print "Debugging"
	c = connection.cursor()
	c.execute("select sum(bill_amount) from Bill where datediff(bill_date,curdate()) < 30")
	row = c.fetchall()
	print row
	print row[0]
	print row[0][0]
	print row[0][0]
	context = {"table":row}
	c = connection.cursor()
	c.execute("select sum(waiter_salary) from Waiter")
	row1 = c.fetchall()
	print row1
	context = {"table1":row1}
	c = connection.cursor()
	c.execute("select sum(chef_salary) from Chef")
	row2 = c.fetchall()
	print row2
	context = {"table":row, "table1":row1, "table2":row2, "value3":row[0][0]-row1[0][0]-row2[0][0]}
	#print row3
	return render(request,"profit.html",context)

def customer_frequency(request):
	c = connection.cursor()
	c.execute("select count(bill_date) from Bill where datediff(bill_date,curdate()) < 30")
	row = c.fetchall()
	context = {"table3":row}
	return render(request,"customer.html",context)

def food_item_view(request):
	c = connection.cursor()
	c.execute("select * from Food")
	row = c.fetchall()
	context = {"table":row}
	return render(request,"food_item_input.html",context)

def food_item_view1(request):
	c = connection.cursor()
	c.execute("select * from Food")
	row = c.fetchall()
	context = {"table":row}
	return render(request,"food_item_input1.html",context)

def food_item_insert(request):
	#Food_id1 = int(request.POST.get("food_id"))
	Foo_name1 = request.POST.get("food_name")
	Food_price1 = int(request.POST.get("food_price"))
	Vat_nv1 = str(request.POST.get("vat_nv"))

	db = MySQLdb.connect("localhost","root","avi916148","Fast_Food_Managment_System")
 	c1 = db.cursor()
 	#c1.execute("select * from STUDENTS")
 	sql = "INSERT INTO Food(food_name,food_price,vat_nv) VALUES ('%s',%d,'%s')"%(Foo_name1,Food_price1,Vat_nv1)
 	c1.execute(sql)
 	db.commit()
 	c = connection.cursor()
	c.execute("select * from Food")
	row = c.fetchall()
 	print row
 	context={"table":row}
 	#return HttpResponse("woohoo")
 	return render(request,"food_item_view.html",context)

def food_item_delete(request):
	Foo_name1 = request.POST.get("food_name")
	db = MySQLdb.connect("localhost","root","avi916148","Fast_Food_Managment_System")
	c1 = connection.cursor()
	sql = "delete from  Food  where food_name = %s"
	c1.execute(sql,[Foo_name1])
	c = connection.cursor()
	c.execute("select * from Food")
	row = c.fetchall()
	context = {"table":row}
	return render(request,"food_item_view1.html",context)
def workers(request):
	c = connection.cursor()
	c.execute("select * from Waiter")
	row = c.fetchall()
	context = {"table":row}
	c.execute("select * from Chef")
	row1 = c.fetchall()	
	context = {"table":row, "table1":row1}
	return render(request,"workers.html",context)
def purchases_view(request):
	c = connection.cursor()
	c.execute("select * from Items")
	row = c.fetchall()
	context = {"table":row}
	return render(request,"purchases_input.html",context)	

def purchases(request):
	Name = (request.POST.get("item_name"))
	Price = float(request.POST.get("item_price"))
	Stock = int(request.POST.get("item_stock"))
	Veg_Nveg = str(request.POST.get("Veg_nonveg"))
	
	db = MySQLdb.connect("localhost","root","avi916148","Fast_Food_Managment_System")
 	c1 = db.cursor()
 	#c1.execute("select * from STUDENTS")
 	sql = "INSERT INTO Items(item_name,item_price,item_stock,Veg_nonveg) VALUES ('%s',%d,%d,'%s')"%(Name,Price,Stock,Veg_Nveg)
 	c1.execute(sql)
 	db.commit()
 	c = connection.cursor()
	c.execute("select * from Items")
	row = c.fetchall()
 	print row
 	context={"table":row}
 	#return HttpResponse("woohoo")
 	return render(request,"Purchases_view.html",context)
def waiter_add(request):
	#ID = int(request.POST.get("waiter_id"))
 	Name = (request.POST.get("waiter_name"))
	Salary = int(request.POST.get("waiter_salary"))
	Adress = (request.POST.get("waiter_aderess"))
	Phon = int(request.POST.get("phone_no"))
	
	db = MySQLdb.connect("localhost","root","avi916148","Fast_Food_Managment_System")
 	c1 = db.cursor()
 	#c1.execute("select * from STUDENTS")
 	sql = "INSERT INTO Waiter(waiter_name,waiter_salary,waiter_aderess,phone_no) VALUES ('%s',%d,'%s',%d)"%(Name,Salary,Adress,Phon)
 	c1.execute(sql)
 	db.commit()
 	c = connection.cursor()
	c.execute("select * from Waiter")
	row = c.fetchall()
 	print row
 	context={"table":row}
 	#return HttpResponse("woohoo")
 	return render(request,"waiter_view.html",context)
def waiter_view(request):
	c = connection.cursor()
	c.execute("select * from Waiter")
	row = c.fetchall()
	context = {"table":row}
	return render(request,"waiter_input.html",context)
def waiter_delete_view(request):
	c = connection.cursor()
	c.execute("select * from Waiter")
	row = c.fetchall()
	context = {"table":row}
	return render(request,"waiter_input_delete.html",context)	
def waiter_delete(request):
	Waiter_ID = request.POST.get("waiter_id")
	db = MySQLdb.connect("localhost","root","avi916148","Fast_Food_Managment_System")
	c1 = connection.cursor()
	sql = "delete from  Waiter  where waiter_id = %s"
	c1.execute(sql,[Waiter_ID])
	c = connection.cursor()
	c.execute("select * from Waiter")
	row = c.fetchall()
	context = {"table":row}
	return render(request,"waiter_delete_view.html",context)


def chef_add(request):
 	#ID1 = int(request.POST.get("chef_id"))
 	Name1 = (request.POST.get("chef_name"))
	Salary1 = int(request.POST.get("chef_salary"))
	Adress1 = (request.POST.get("chef_adress"))
	Phon1 = int(request.POST.get("phone_no"))
	
	db = MySQLdb.connect("localhost","root","avi916148","Fast_Food_Managment_System")
 	c1 = db.cursor()
 	#c1.execute("select * from STUDENTS")
 	sql = "INSERT INTO Chef(chef_name,chef_salary,chef_adress,phone_no) VALUES ('%s',%d,'%s',%d)"%(Name1,Salary1,Adress1,Phon1)
 	c1.execute(sql)
 	db.commit()
 	c = connection.cursor()
	c.execute("select * from Chef")
	row = c.fetchall()
 	print row
 	context={"table":row}
 	#return HttpResponse("woohoo")
 	return render(request,"chef_view.html",context)
def chef_view(request):
	c = connection.cursor()
	c.execute("select * from Chef")
	row = c.fetchall()
	context = {"table":row}
	return render(request,"chef_input.html",context)	