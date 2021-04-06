# coding:utf-8
"""system/user/ process method

"""
from utilslibrary.proxy.log_db_proxy import ProxyFactory,InvocationHandler
from django.http.response import HttpResponseRedirect, JsonResponse
from django.contrib.sessions.models import Session
from django.db.models import F,Q
from django.db import transaction


from django.utils import timezone

from utilslibrary.system_constant import Constant
from utilslibrary.base.base import BaseService
from system.models import user,user_role
@ProxyFactory(InvocationHandler)
class UserService(BaseService):
    def add_user(self,user):
        #return msg object
        data = {}
        try:
            user.save()
            data["success"]=True
            data["msg"]="Success"
        except Exception as e:
            print(e)
            data["success"]=False
            data["msg"]="Failed" 
        
        return JsonResponse(data,safe=False)
    
    
    def que_user(self,request,user):
        print('{} que data:{}')    
    
    def upd_user(self,user):
        data = {}
        try:
            user.save()
            data["success"]=True
            data["msg"]="Success"
        except Exception as e:
            print(e)
            data["success"]=False
            data["msg"]="Failed" 
        
        return JsonResponse(data,safe=False)    
    #del_
    #upd_ 
    
    
    #delete other session key of current user id
    def deleteSessionKey(self,request,user_id):
        #single user login
        #query session list from db when login,delete it when has current user old session,
        session_key = request.session.session_key
        for session in Session.objects.filter(~Q(session_key=session_key),expire_date__gte=timezone.now()):
            data = session.get_decoded()
            u_id = data.get(Constant.SESSION_CURRENT_USER_ID,None)
            if u_id ==user_id:
                session.delete()
    
    #delete user by ids
    @transaction.atomic
    def del_user(self,obj):  
        #return msg object  
        data = {}
        data["success"]=False
        data["msg"]="Failed"
        ids = obj.id
        if not ids:
            data["success"]=False
            data["msg"]="Failed" 
            return JsonResponse(data,safe=False)
        
        with transaction.atomic():
            id_list=ids.split(",")
            for id in id_list:
                if id:
                    _o = user.objects.get(id=id)
                    if _o:
                        #logic delete
                        _o.is_delete = 1
                        _o.save()
                    
        data["success"]=True
        data["msg"]="Success"
        return JsonResponse(data,safe=False)    


        