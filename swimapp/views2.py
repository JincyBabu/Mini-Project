from django.shortcuts import render

from django.db import connection
from django.http import HttpResponse
from datetime import *
'''from swimapp.forms import pform
from swimapp.forms import pform1
from swimapp.models import pmodel
from swimapp.models import pmodel2
from swimapp.models import pmodel1'''
from  datetime import date 
from datetime import datetime
now = date.today()
today1=date.today()
import datetime
today_date = datetime.date.today()
today = today_date.strftime("%Y-%m-%d")

from django.views.decorators.csrf import csrf_exempt
@csrf_exempt

# Create your views here.
def index(request):
	try:
		del request.session['uid']
		del request.session['utype']
	except:
		pass
	return render(request,'index.html')
def login(request):
	return render(request,'login.html')
def searchlogin(request):
	cursor=connection.cursor()
	p=request.GET['uname']
	q=request.GET['upass']
	sql2="select* from login where uname='%s' and upass='%s'"%(p,q)
	cursor.execute(sql2)
	result=cursor.fetchall()
	if{cursor.rowcount}>0:
		sql3="select* from login where uname='%s' and upass='%s'"%(p,q)
		cursor.execute(sql3)
		result1=cursor.fetchall()
		for row1 in result1:
			request.session['uid']=row1[0]
			request.session['uname']=row1[1]
			request.session['upass']=row1[2]
			request.session['utype']=row1[3]
		if(request.session['utype']=='admin'):
			return render(request,'adminhome.html')

		elif(request.session['utype']=='user'):
			return render(request,'userhome.html')
	else:
		html="<script>alert('inavlid password and user name'):window.location='/regload/':</script>"
		return HttpResponse(html)
def userhome(request):
    return render(request,'studenthome.html')
def login(request):
    return render(request,'login.html')
def trainer(request):
    return render(request,'trainer.html')
def adminhome(request):
    return render(request,'adminhome.html')
def student(request):
    return render(request,'student.html')
def vendor(request):
    return render(request,'vendor.html')
def logout(request):
	try:
		del request.session['uid']
		del request.session['utype']
	except:
		pass
	return render(request,'index.html')

	
def studaction(request):
	cur=connection.cursor()
	name=request.GET['snm']
	hnm=request.GET['shn']
	sp=request.GET['sp']
	sdir=request.GET['sdir']
	pin=request.GET['spin']
	gen=request.GET['g']
	mail=request.GET['mail']
	dob=request.GET['sdob']
	phn=request.GET['sphn']
	passwd=request.GET['pass']
	today = date.today()
	sql="insert into student values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%('',name,hnm,sp,sdir,pin,gen,dob,phn,mail,'')
	cur.execute(sql)
	sql1="select max(stid) from student"
	cur.execute(sql1)
	result=cur.fetchall()
	for row in result:
		id=row[0]
        sql2="insert into login(uid,uname,upass,utype)values('%s','%s','%s','%s')"%(id,mail,passwd,'student')
        cur.execute(sql2)
	#return HttpResponse(sql2)
	h="<script>alert('success');window.location='/index/';</script>"
	return HttpResponse(h)

def traiaction(request):
    cur=connection.cursor()
    name=request.GET['tnm']
    hnm=request.GET['thn']
    tp=request.GET['tp']
    tdir=request.GET['tdir']
    pin=request.GET['tpin']
    gen=request.GET['g']
    mail=request.GET['mail']
    phn=request.GET['tphn']
    dob=request.GET['tdob']
    doj=request.GET['tdoj']
    tq=request.GET['tq']
    passwd=request.GET['pass']    
    today = date.today()
    birthdate=datetime.datetime.strptime(dob, "%Y-%m-%d")
    age = today.year - birthdate.year - ((today.month, today.day) < (birthdate.month, birthdate.day))
    if age>=18:
        sql="insert into trainer values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%('',name,hnm,tp,tdir,pin,gen,dob,doj,phn,mail,tq,'')
        cur.execute(sql)
        h="<script>alert('success');window.location='/adminhome/';</script>"
    else :
        h="<script>alert('Trainer must be 18+;');window.location='/adminhome/';</script>"
    return HttpResponse(h)

def itemaction(request):
    cur=connection.cursor()
    itid=request.GET['itid']
    inm=request.GET['inm']
    cid=request.GET['cid']
    ides=request.GET['ides']
    qty=request.GET['qty']
    sql="insert into item values('%s','%s','%s','%s','%s')"%(itid,inm,cid,ides,qty)
    cur.execute(sql)
    h="<script>alert('success');window.location='/item/';</script>"
    return HttpResponse(h)

def courseassignaction(request):
    cur=connection.cursor()
    coid=request.GET['coid']
    trid=request.GET['trid']
    sql="insert into courseassign values(null,'%s','%s')"%(coid,trid)
    cur.execute(sql)
    h="<script>alert('success');window.location='/adminhome/';</script>"
    return HttpResponse(h)

def venaction(request):
    cur=connection.cursor()
    name=request.GET['vnm']
    ownm=request.GET['onm']
    bnm=request.GET['bnm']
    city=request.GET['city']
    vdt=request.GET['vdt']
    vstate=request.GET['vstate']
    pin=request.GET['vpin']
    vnum=request.GET['vnum']
    vmail=request.GET['vmail']
    sql="insert into vendor values(null,'%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(name,ownm,bnm,city,vdt,vstate,vnum,pin,vmail)
    cur.execute(sql)
    h="<script>alert('success');window.location='/adminhome/';</script>"
    return HttpResponse(h)

def puritemaction(request):
    cur=connection.cursor()
    purid=request.GET['purid']
    itid=request.GET['itid']
    qty=request.GET['qty']
    amt=request.GET['amt']
    sql="insert into purchaseitem values('%s','%s','%s','%s','%s')"%('',purid,itid,qty,amt)
    cur.execute(sql)
    h="<script>alert('success');window.location='/purchase/';</script>"
    return HttpResponse(h)

def cataction(request):
    cur=connection.cursor()
    caid=request.GET['caid']
    canm=request.GET['canm']
    cades=request.GET['cades']
    sql="insert into category values('%s','%s','%s')"%(caid,canm,cades)
    cur.execute(sql)
    h="<script>alert('success');window.location='/category/';</script>"
    return HttpResponse(h)

def coaction(request):
    cur=connection.cursor()
    coid=request.GET['coid']
    cnm=request.GET['cnm']
    cdes=request.GET['cdes']
    cdur=request.GET['cdur']
    cfee=request.GET['cfee']
    ctype=request.GET['ctype']
    sql="insert into course values('%s','%s','%s','%s','%s','%s')"%(coid,cnm,cdes,cdur,cfee,ctype)
    cur.execute(sql)
    h="<script>alert('success');window.location='/adminhome/';</script>"
    return HttpResponse(h)

def viewtrainer(request):
	cur=connection.cursor()
	list=[]
	s="select * from trainer"
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'tid':row[0],'tnm':row[1],'thn':row[2],'tp':row[3],'tdir':row[4],'tpin':row[5],'g':row[6],'tdob':row[7],'tdoj':row[8],'tphn':row[9],'mail':row[10],'tq':row[11],'img':row[12]}
		list.append(w)
	return render(request,'viewtrainer.html',{'list':list,})

'''def purchaseitem(request):
	cur=connection.cursor()
	purid=request.GET['purid']
	list=[]
	s2="select * from item where itid not in (select itid from purchaseitem where purid='%s')"%purid
	s="select * from purchaseitem where purid='%s'"%purid
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'chpurid':row[0],'purid':row[1],'itid':row[2],'qty':row[3],'amt':row[4]}
		list.append(w)
	return render(request,'purchaseitem.html',{'list':list,}'''
    
def viewstud(request):
	cur=connection.cursor()
	list=[]
	s="select * from student"
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'stid':row[0],'snm':row[1],'shn':row[2],'sp':row[3],'sdir':row[4],'spin':row[5],'g':row[6],'sdob':row[7],'sphn':row[8],'mail':row[9],'img':row[10]}
		list.append(w)
	return render(request,'viewstud.html',{'list':list,})
    
def viewcoassign(request):
	cur=connection.cursor()
	list=[]
	coid=request.GET['coid']
	s="select * from courseassign inner join trainer on trainer.tid=courseassign.trid where coid='%s'"%coid
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'asid':row[0],'coid':row[1],'trid':row[2],'tid':row[3],'tnm':row[4],'thn':row[5],'tp':row[6],'tdir':row[7],'tpin':row[8],'g':row[9],'tdob':row[10],'tdoj':row[11],'tphn':row[12],'mail':row[13],'tq':row[14],'img':row[15]}
        list.append(w)
	return render(request,'viewcoassign.html',{'list':list,})

def aviewapply(request):
	cur=connection.cursor()
	list=[]
	s="select * from student inner join apply on student.stid=apply.stid inner join course on course.coid=apply.coid order by apid desc"
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'stid':row[0],'snm':row[1],'shn':row[2],'sp':row[3],'sdir':row[4],'spin':row[5],'g':row[6],'sdob':row[7],'sphn':row[8],'mail':row[9],'img':row[10],'apid':row[11],'apdate':row[12],'stid':row[13],'coid':row[14],'status':row[15],'pstatus':row[16],'coid':row[17],'cnm':row[18],'cdes':row[19],'cdur':row[20],'cfee':row[21],'ctype':row[22]}
        list.append(w)
	return render(request,'aviewapply.html',{'list':list,})

def purchase(request):
	list=vendorlist(request)
	list1=purchaselist(request)
	return render(request,'purchase.html',{'list':list,'list1':list1,})
    
def course(request):
	list=courselist(request)
	return render(request,'course.html',{'list':list,})
    
def category(request):
	list=categorylist(request)
	return render(request,'category.html',{'list':list,})
    
def item(request):
	list=itemlist(request)
	list1=categorylist(request)
	return render(request,'item.html',{'list':list,'list1':list1,})

def viewvendor(request):
	list=vendorlist(request)
	return render(request,'viewvendor.html',{'list':list,})

def delcat(request):
	cursor=connection.cursor()
	caid=request.GET['caid']
	sql="delete from category where caid='%s'"%(caid)
	cursor.execute(sql)
	h="<script>alert('success');window.location='/category/';</script>"
	return HttpResponse(h)
    
def delitem(request):
	cursor=connection.cursor()
	itid=request.GET['itid']
	sql="delete from item where itid='%s'"%(itid)
	cursor.execute(sql)
	h="<script>alert('success');window.location='/item/';</script>"
	return HttpResponse(h)
    
def categorylist(request):
	cur=connection.cursor()
	list=[]
	s="select * from category"
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'caid':row[0],'canm':row[1],'cades':row[2]}
		list.append(w)
	return list

def itemlist(request):
	cur=connection.cursor()
	list=[]
	s="select * from item"
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'itid':row[0],'inm':row[1],'caid':row[2],'ides':row[3],'qty':row[4], }
		list.append(w)
	return list

def courselist(request):
	cur=connection.cursor()
	list=[]
	s="select * from course"
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'coid':row[0],'cnm':row[1],'cdes':row[2],'cdur':row[3],'cfee':row[4],'ctype':row[5]}
		list.append(w)
	return list

def purchaselist(request):
	cur=connection.cursor()
	list=[]
	s="select * from purchase"
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'purid':row[0],'vid':row[1],'dop':row[2],'tqty':row[3],'tamt':row[4],}
        list.append(w)
	return list

def vendorlist(request):
	cur=connection.cursor()
	list=[]
	s="select * from vendor"
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'vid':row[0],'vnm':row[1],'onm':row[2],'bnm':row[3],'city':row[4],'vdt':row[5],'vstate':row[6],'vpin':row[7],'vnum':row[8],'vmail':row[9]}
        list.append(w)
	return list

def courseassign(request):
    cur=connection.cursor()
    list1=courselist(request)
    list=[]
    tid=request.GET['tid']
    tnm=request.GET['tnm']
    '''if request.GET.get('trid'):
        trid=request.GET['tid']
    else:
        trid=0'''
    s="select * from trainer inner join courseassign on trainer.tid=courseassign.trid where trid='%s'"%(tid)
    cur.execute(s)
    result=cur.fetchall()
    for row in result:
        tmpid=tid
        tmpnm=tnm
        w={'tid':row[0],'tnm':row[1],'thn':row[2],'tp':row[3],'tdir':row[4],'tpin':row[5],'g':row[6],'tdob':row[7],'tdoj':row[8],'tphn':row[9],'mail':row[10],'tq':row[11],'img':row[12],'asid':row[13],'coid':row[14],'trid':row[15],'tmpid':tmpid,'tmpnm':tmpnm}
        list.append(w)
    return render(request,'courseassign.html',{'list':list,'list1':list1,'tid':tid,'tnm':tnm,})
 


def purchaseitem(request):
	cur=connection.cursor()
	list=[]
	list1=[]
	purid=request.GET['purid']
	s2="select * from item where itid not in (select itid from purchaseitem where purid='%s')"%purid
	s="select * from purchaseitem where purid='%s'"%purid
	cur.execute(s)
	result=cur.fetchall()
	for row in result:
		w={'chpurid':row[0],'purid':row[1],'itid':row[2],'qty':row[3],'amt':row[4],}
		list.append(w)
	cur.execute(s2)
	result1=cur.fetchall()
	for row1 in result1:
		w1={'itid':row1[0],'inm':row1[1],'caid':row1[2],'qty':row1[4],'ides':row1[3],}
		list1.append(w1)
	return render(request,'purchaseitem.html',{'list1':list1,'list':list,'purid':purid})