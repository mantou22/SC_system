#coding:utf-8
"""DjangoAdmin URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url
from system.user_view import Login,Logout,UserList,UserAdd,UserView,UserEdit,UserDel,\
    UserCheckLoginName,UserSelect
from system.dict_view import DictList,DictAdd,DictView,DictEdit,DictDel,DictValueForm,\
    DictValueList,DictValueDel
from system.role_view import RoleList,RoleAdd,RoleView,RoleEdit,RoleDel,RoleCheckName,\
    RoleUserList,RoleUserOut,RolePermissionView,RolePersmissionTree,RolePersmissionSave,RoleAdd,RoleView

from system.office_view import OfficeList,OfficeAdd,OfficeView,OfficeEdit,OfficeDel,\
    OfficeTreeData,OfficeGetChildren
from system.views import TreeSelect,Home,Index,permission_error

from system.script_template_view import script_template_list,script_template_update,\
    script_template_list_api
from system import log_view
from system.log_view import LogList, LogForm
from system.menu_view import MenuList,MenuView,MenuAdd,MenuEdit,MenuDel,MenuTree,\
    GetChildren,MenuIconSelect,MenuSort,GenerateSubMenu





urlpatterns = [
    
    
    
    #用户操作
    url(r'^login/$', Login.as_view()),
    url(r'^logout/$', Logout.as_view()),
    url(r'^user/list/$', UserList.as_view()),
    url(r'^user/add/$', UserAdd.as_view()),
    url(r'^user/view/$', UserView.as_view()),
    url(r'^user/edit/$', UserEdit.as_view()),
    url(r'^user/del/$', UserDel.as_view()),
    url(r'^user_check_loginname/$', UserCheckLoginName.as_view()),
    url(r'^user/select/$', UserSelect.as_view()),
    
    #操作日志操作
    url(r'log/list/$',LogList.as_view()),
    url(r'log/form/$',LogForm.as_view()),
    
    
    
    #脚本模板操作
    url(r'^script_template_list/$', script_template_list),
    url(r'^script_template_update/$', script_template_update),
    url(r'^script_template_list_api/$', script_template_list_api),
    
    #dictionary operation
    url(r'^dict/list/$', DictList.as_view()),
    url(r'^dict/add/$', DictAdd.as_view()),
    url(r'^dict/view/$', DictView.as_view()),
    url(r'^dict/edit/$', DictEdit.as_view()),
    url(r'^dict/del/$', DictDel.as_view()),
    url(r'^dict/value/form/$', DictValueForm.as_view()),
    url(r'^dict/value/list/$', DictValueList.as_view()),
    url(r'^dict/value/del/$', DictValueDel.as_view()),
    
    #role operation
    url(r'^role/list/$', RoleList.as_view()),
    url(r'^role/add/$', RoleAdd.as_view()),
    url(r'^role/view/$', RoleView.as_view()),
    url(r'^role/edit/$', RoleEdit.as_view()),
    url(r'^role/del/$', RoleDel.as_view()),
    url(r'^role/check/name/$', RoleCheckName.as_view()),
    url(r'^role/user/list/$', RoleUserList.as_view()),
    url(r'^role/user/out/$', RoleUserOut.as_view()),
    url(r'^role/permission/view/$', RolePermissionView.as_view()),
    url(r'^role/permission/tree/$', RolePersmissionTree.as_view()),
    url(r'^role/permission/save/$', RolePersmissionSave.as_view()),
    
    
    #office opration url
    url(r'^office/list/$', OfficeList.as_view()),
    url(r'^office/add/$', OfficeAdd.as_view()),
    url(r'^office/view/$', OfficeView.as_view()),
    url(r'^office/edit/$', OfficeEdit.as_view()),
    url(r'^office/del/$', OfficeDel.as_view()),
    url(r'^office/tree/data/$', OfficeTreeData.as_view()),
    url(r'^office/getChildren/$', OfficeGetChildren.as_view()),
    
    #tree select
    url(r'^tree/select/$', TreeSelect.as_view()),
    
    #menu url
    url(r'^menu/list/$', MenuList.as_view()),
    url(r'^menu/add/$', MenuAdd.as_view()),
    url(r'^menu/view/$', MenuView.as_view()),
    url(r'^menu/edit/$', MenuEdit.as_view()),
    url(r'^menu/del/$', MenuDel.as_view()),
    url(r'^menu/tree/$', MenuTree.as_view()),
    url(r'^menu/getChildren/$', GetChildren.as_view()),
    url(r'^menu/iconselect/$', MenuIconSelect.as_view()),
    url(r'^menu/sort/$', MenuSort.as_view()),
    url(r'^menu/generateSubMenu/$', GenerateSubMenu.as_view()),
    
    #permission error
    
    url(r'^permission_error/$', permission_error),
]
