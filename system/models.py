from django.db import models
from django.db.models.fields import CharField
from django.template.defaultfilters import default
from utilslibrary.base.base import BaseModel

# Create your models here.
class user(BaseModel):
    loginname=models.CharField(max_length=256,null=False,default='')
    passwd=models.CharField(max_length=256,null=False,default='')
    realname=models.CharField(max_length=256,null=False,default='')
    age=models.IntegerField(default=0,null=True)
    addr=models.CharField(max_length=256,null=True)
    email=models.CharField(max_length=128,null=True)
    mobile=models.CharField(max_length=128,null=True)
    phone=models.CharField(max_length=128,null=True)
    icon=models.CharField(max_length=512,null=True)
    office_id=models.CharField(max_length=512,null=True)
    office_name=models.CharField(max_length=512,null=True)
    
    isadmin=models.IntegerField(default=0)
    addr = models.CharField(max_length=512,null=True)
    
    remarks = models.CharField(max_length=512,null=True)
    loginflag = models.IntegerField(default=0,null=True)
  
#dictionary model
class dict(BaseModel):
    id = models.AutoField(primary_key=True)
    value = models.CharField(max_length=256,null=False,default='')
    label = models.CharField(max_length=256,null=False,default='')
    type = models.CharField(max_length=256,null=False,default='')
    description = models.CharField(max_length=256,null=True,default='')
    sort = models.IntegerField(null=False,default=0)
    parent_id = models.CharField(max_length=256,null=True,default='')
        
#log into db
class log(BaseModel):
    id = models.AutoField(primary_key=True)
    obj = models.CharField(max_length=256,null=False,default='')
    data_id = models.CharField(max_length=256,null=True,default='')
    user_id = models.CharField(max_length=256,null=False,default='')
    user_name = models.CharField(max_length=256,null=False,default='')
    action = models.CharField(max_length=256,null=False,default='')
    json = models.CharField(max_length=2048,null=False,default='')
    ip = models.CharField(max_length=56,null=False,default='')    

#system role model
class role(BaseModel):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=256,null=False,default='')
    role_type = models.CharField(max_length=256,null=False,default='')
    useable = models.IntegerField(null=False,default=1)
    remarks = models.CharField(max_length=256,null=True,default='')  
    
#office model
class office(BaseModel):
    id =  models.AutoField(primary_key=True)
    name = models.CharField(max_length=256,null=False,default='')
    parent_id = models.CharField(max_length=256,null=True,default='')
    parent_ids = models.CharField(max_length=256,null=True,default='')
    parent_name = models.CharField(max_length=256,null=True,default='')
    
    type = models.CharField(max_length=64,null=True,default='')
    
    sort = models.IntegerField(null=False,default=0)
    area_id = models.CharField(max_length=256,null=True,default='')
    code = models.CharField(max_length=256,null=False,default='')
    useable = models.IntegerField(null=False,default=1)
    remarks = models.CharField(max_length=256,null=True,default='')
#user role correlation    
class user_role(BaseModel):
    user =    models.ForeignKey('user',
                                   null=True,
                                   on_delete=models.CASCADE)
    role =  models.ForeignKey('role',
                                   null=True,
                                   on_delete=models.CASCADE)
    
class menu(BaseModel):
    id =  models.AutoField(primary_key=True)
    parent_id =  models.IntegerField(null=False,default=0)
    parent_name = models.CharField(max_length=256,null=True,default='')
    parent_ids = models.CharField(max_length=256,null=True,default='')
    name = models.CharField(max_length=256,null=False,default='')
    sort  = models.IntegerField(null=False,default=0)
    href  = models.CharField(max_length=256,null=True,default='')
    base_href  = models.CharField(max_length=256,null=True,default='')
    is_show  = models.IntegerField(null=False,default=0)
    type  = models.IntegerField(null=False,default=0)
    has_children = models.CharField(max_length=256,null=True,default='false')
    icon = models.CharField(max_length=256,null=True,default='')
    remarks = models.CharField(max_length=256,null=True,default='')
    
class role_menu(BaseModel):
    id =  models.AutoField(primary_key=True)
    role  = models.ForeignKey('role',
                                   null=False,
                                   on_delete=models.CASCADE)

    menu  = models.ForeignKey('menu',
                                   null=True,
                                   on_delete=models.CASCADE)
    #-----------------------------------------------
    #为角色赋值菜单时，父节点保存类型为0，叶节点为1，
    #显示角色有哪些菜单权限时，只查询1
    #首页左侧菜单显示时，查询所有
    #-----------------------------------------------
    type = models.IntegerField(null=False,default=0)
        