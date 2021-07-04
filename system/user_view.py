# --coding:utf-8 --
"""user and auth manage

"""
from django.shortcuts import render

from system.models import user
from django.http.response import HttpResponseRedirect, JsonResponse
from utilslibrary.system_constant import Constant
from django.http import HttpResponse
from django.db.models import Q
from django.contrib.auth.hashers import make_password, check_password

import json
from utilslibrary.models.userInfo_model import UserInfo
from system.service.user_service import UserService
from system.service.role_service import RoleService

from utilslibrary.base.base import BaseView


# Create your views here.
class Login(BaseView):
    def get(self, request):
        return render(request, 'system_login.html')

    def post(self, request):

        username = request.POST['username']
        passwd = request.POST['password']
        user_list = user.objects.filter(loginname=username)
        if user_list and user_list.__len__() > 0:
            user_o = user_list[0]
            # check password

            if not user_o.passwd or not check_password(passwd, user_o.passwd):
                return render(request, 'system_login.html',
                              {'login_error': 'Login Name or Password error! Retry Please!'})
            user_i = UserInfo()
            user_i.Id = user_o.id
            user_i.LoginName = user_o.loginname
            userinfo = UserInfo()
            userinfo.id = user_o.id
            userinfo.LoginName = user_o.loginname
            user_json = json.dumps(userinfo, default=userinfo.conver_to_dict)
            # save data to session
            request.session[Constant.SESSION_CURRENT_USER] = user_json
            request.session[Constant.SESSION_CURRENT_USER_LOGINNAME] = user_o.loginname
            request.session[Constant.SESSION_CURRENT_USER_ID] = user_o.id
            # delete other session key of current user id
            u_s = UserService()
            UserService.deleteSessionKey(request, user_o.id)
            # query role_menu
            permission_list = []
            permission_menu_id_list = []
            _user_role_list = user_o.user_role_set.all()
            for _o_user_role in _user_role_list:
                _o_role = _o_user_role.role
                _role_menu_list = _o_role.role_menu_set.all()
                for _o_role_menu in _role_menu_list:
                    _o_menu = _o_role_menu.menu
                    permission_list.append(_o_menu.href)
                    permission_menu_id_list.append(_o_menu.id)
            request.session[Constant.SESSION_CURRENT_USER_PERMISSION_LIST] = permission_list
            # 存储当前用户有权访问的所有按钮ID
            request.session[Constant.SESSION_CURRENT_USER_PERMISSION_MENU_ID_LIST] = permission_menu_id_list

            return HttpResponseRedirect('/')
        return render(request, 'system_login.html', {'login_error': 'Login Name or Password error!Retry Please！！！'})


class Logout(BaseView):
    def get(self, request):
        if request.session.get(Constant.SESSION_CURRENT_USER):
            del request.session[Constant.SESSION_CURRENT_USER]
        if request.session.get(Constant.SESSION_CURRENT_USER_LOGINNAME):
            del request.session[Constant.SESSION_CURRENT_USER_LOGINNAME]
        return render(request, 'system_login.html')


class UserList(BaseView):
    def get(self, request):
        return render(request, 'system_user_list.html')

    def post(self, request):
        # -----------------------------
        # 需要获得翻页参数时添加
        # 代码中使用self.startIndex和self.endIndex获取相应范围的记录
        # ------------------------------
        super().post(request)

        # 接收查询参数---与页面上要查询的条件匹配
        loginname = request.POST.get('loginname', '')
        realname = request.POST.get('realname', '')
        isadmin = request.POST.get('isadmin', '')
        """query by where1"""
        # 添加查询条件，设置为逻辑与查询
        q = Q()
        q.connector = 'and '
        q.children.append(('is_delete', 0))
        if loginname:
            q.children.append(('loginname__contains', loginname))
        if realname:
            q.children.append(('realname__contains', realname))
        if isadmin != '':
            q.children.append(('isadmin', isadmin))
        print('startIndex{} endIndex{}'.format(self.startIndex, self.endIndex))
        # 执行查询
        u_list = user.objects.filter(q).order_by('-id')[self.startIndex:self.endIndex].values()

        # 组装JSON数据
        data = {}
        # 设置总记录数
        data["total"] = user.objects.filter(q).count()
        data["rows"] = list(u_list)
        print(data)

        return JsonResponse(data, safe=False)


class UserAdd(BaseView):
    def get(self, request):
        return render(request, 'system_user_form.html', {"method": "add"})

    def post(self, request):
        data = {}

        id = request.POST.get('id')
        loginname = request.POST.get('loginName', '')
        realname = request.POST.get('realName', '')
        passwd = request.POST.get('newPassword', '')
        passwd = make_password(passwd, None, 'pbkdf2_sha256')
        email = request.POST.get('email', '')
        phone = request.POST.get('phone', '')
        mobile = request.POST.get('mobile', '')
        loginflag = request.POST.get('loginFlag', '')
        parent_id = request.POST.get('parent_id', '')
        parent_name = request.POST.get('parent_name', '')
        remarks = request.POST.get('remarks')
        addr = request.POST.get('addr')

        if loginname == '' or realname == '' or passwd == '':
            data["success"] = False
            data["msg"] = "Input Data Error!"
            return JsonResponse(data, safe=False)

        # insert data

        # check the record has exist
        _o = user.objects.filter(loginname=loginname, is_delete=0)
        if _o:
            data["success"] = False
            data["msg"] = "login name exists!"
            return JsonResponse(data, safe=False)
        _o = user()
        _o.loginname = loginname
        _o.realname = realname
        _o.passwd = passwd
        _o.email = email
        _o.phone = phone
        _o.mobile = mobile
        _o.loginflag = loginflag
        _o.office_id = parent_id
        _o.office_name = parent_name
        _o.remarks = remarks
        _o.addr = addr
        _s = UserService()

        return _s.add_user(_o)


class UserView(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print(id)
        if not id:
            return render(request, 'system_user_form.html', {"method": "edit"})
        else:
            _o = user.objects.get(id=id)
            return render(request, 'system_user_form.html', {"user": _o, "method": "edit"})


class UserEdit(BaseView):
    def get(self, request):
        id = request.GET.get("id")
        print(id)
        if not id:
            return render(request, 'system_user_form.html', {"method": "edit"})
        else:
            _o = user.objects.get(id=id)
            return render(request, 'system_user_form.html', {"user": _o, "method": "edit"})

    def post(self, request):
        data = {}

        id = request.POST.get('id')
        loginname = request.POST.get('loginName', '')
        realname = request.POST.get('realName', '')
        passwd = request.POST.get('newPassword', '')
        passwd = make_password(passwd, None, 'pbkdf2_sha256')
        email = request.POST.get('email', '')
        phone = request.POST.get('phone', '')
        mobile = request.POST.get('mobile', '')
        loginflag = request.POST.get('loginFlag', '')
        parent_id = request.POST.get('parent_id', '')
        parent_name = request.POST.get('parent_name', '')
        remarks = request.POST.get('remarks')
        addr = request.POST.get('addr')

        if loginname == '' or realname == '' or passwd == '':
            data["success"] = False
            data["msg"] = "Input Data Error!"
            return JsonResponse(data, safe=False)

        if id:
            # update data
            _o = user.objects.get(id=id)
            _o.loginname = loginname
            _o.realname = realname
            _o.passwd = passwd
            _o.email = email
            _o.phone = phone
            _o.mobile = mobile
            _o.loginflag = loginflag
            _o.office_id = parent_id
            _o.office_name = parent_name
            _o.remarks = remarks
            _o.addr = addr

            _s = UserService()
            return _s.upd_user(_o)
        else:

            data["success"] = False
            data["msg"] = "ID Error!"
            return JsonResponse(data, safe=False)


# user delete
class UserDel(BaseView):
    def get(self, request):
        data = {}
        ids = request.GET.get("ids")
        data["success"] = True
        data["msg"] = "Success"
        _o = user()
        _o.id = ids
        _s = UserService()

        return _s.del_user(_o)

        # check login name


class UserCheckLoginName(BaseView):
    def get(self, request):
        ln = request.GET.get('loginName')
        oln = request.GET.get('oldLoginName')
        if ln == oln:
            return HttpResponse('true')
        _o_list = user.objects.filter(loginname=ln, is_delete=0)
        if _o_list:
            return HttpResponse('false')
        else:
            return HttpResponse('true')


class UserSelect(BaseView):
    def get(self, request):
        return render(request, 'system_user_select.html')

    def post(self, request):
        id = request.POST.get('id')
        ids = request.POST.get('ids')
        data = {}
        data["success"] = True
        data["msg"] = "Success"
        _s = RoleService()
        _s.assgin_user_role(id, ids)

        return JsonResponse(data, safe=False)
