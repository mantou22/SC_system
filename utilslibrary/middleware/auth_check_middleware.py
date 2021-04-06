from django.utils.deprecation import MiddlewareMixin
from utilslibrary.system_constant import Constant
from django.http.response import HttpResponseRedirect
from django.conf import settings
         
         
#check auth
class AuthCheckMiddleWare(MiddlewareMixin):
    
    white_list = ['/system/login/']
    
    
    def process_request(self,request):
        print('AuthCheck process_request:{}'.format(request.path))
        #access login,pass
        if  request.path in self.white_list:
            return None
        #check session
        if not request.session.get(Constant.SESSION_CURRENT_USER):
            return HttpResponseRedirect(settings.LOGIN_URL)
    
    def process_view(self, request, callback,callback_args, callback_kwargs):
        pass
        #get permission from session
        
        #check auth,in permission list
        
        
            
                  