from django.db import models


# Create your models here.


class student(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=256, null=False, default='')
    pass_wd = models.CharField(max_length=256, null=False, default='')
    join_time = models.DateTimeField('date published')
    tel_number = models.CharField(max_length=256, null=True)
    zh_name = models.CharField(max_length=256, null=True)
    en_name = models.CharField(max_length=256, null=True)
    gender = models.CharField(max_length=4, null=True)
    nationality = models.CharField(max_length=256, null=True)  # 国际
    zh_proficiency = models.CharField(max_length=256, null=True)  # 中文水平
    college_major = models.CharField(max_length=128, null=True)  # 专业
    stu_category = models.CharField(max_length=128, null=True)  # 教育程度/学历
    records = models.CharField(max_length=128, null=True)  # 预留字段。

    def __str__(self):
        return self.username + str(self.join_time) + str(self.tel_number) + self.zh_name


class tea_admin(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=256, null=False, default='')
    pass_wd = models.CharField(max_length=256, null=False, default='')


class micro_course(models.Model):
    id = models.AutoField(primary_key=True)
    c_name = models.CharField(max_length=256, null=False, default='')
    c_path = models.CharField(max_length=256, null=False, default='')  # 微课存放路径
    #create date,example:2019-12-03
    create_time = models.CharField(max_length=45,null=True,default="")# 创建时间
    t_id = models.IntegerField(null=True, default=0)
    c_desc = models.CharField(max_length=3000, null=True)  # 微课描述
    type = models.CharField(max_length=256, null=True)  # 微课类型


class mc_type(models.Model):
    id = models.AutoField(primary_key=True)
    mc_id = models.IntegerField(null=True, default=0)
    type = models.CharField(max_length=256, null=True)
    type_name = models.CharField(max_length=256, null=False, default='')


class stu_course(models.Model):
    id = models.AutoField(primary_key=True)
    s_id = models.IntegerField(null=True, default=0)
    mc_id = models.IntegerField(null=True, default=0)
    process = models.CharField(max_length=256, null=True)


class model_essay(models.Model):  # 模板范文
    id = models.AutoField(primary_key=True)
    es_id = models.IntegerField(null=True, default=0)  # 文章类型
    title = models.CharField(max_length=256, null=True)  # 文章标题
    content = models.CharField(max_length=3000, null=True)  # 内容
    writing_theme = models.CharField(max_length=256, null=True)  # 写作主题
    tea_id = models.IntegerField(null=True, default=0)  # 老师id（谁发布的）
    #create date,example:2019-12-03
    create_time = models.CharField(max_length=45,null=True,default="")# 创建时间
    # -------------------------------------------
    # convert to dict,you can convert object to json use:  json.dumps(subclass_object, default=subclass_object.conver_to_dict)
    # -------------------------------------------
    def conver_to_dict(self, obj):
        d = {}
        d.update(obj.__dict__)
        return d


class essay_style(models.Model):  # 文章类型  （记叙、应用..）
    id = models.AutoField(primary_key=True)
    type_name = models.CharField(max_length=256, null=True)

    def __str__(self):
        return "id:" + str(self.id) + ", type_name:" + self.type_name


class writing_task(models.Model):  # 发布写作任务表
    id = models.AutoField(primary_key=True)  # 主键
    es_id = models.IntegerField(null=True, default=0)  # 文章类型
    title = models.CharField(max_length=256, null=True)  # 文章标题
    requirement = models.CharField(max_length=256, null=True)  # 写作要求
    #finish_time date,example:2019-12-03
    deadline_time = models.CharField(max_length=45,null=True,default="")# 截至时间


class stu_writing(models.Model):  # 学生写作
    id = models.AutoField(primary_key=True)  # 主键
    wt_id = models.IntegerField(null=True, default=0)  # 写作任务id
    s_id = models.IntegerField(null=True, default=0)  # 学生id
    content = models.CharField(max_length=3000, null=True)  # 内容
    writing_theme = models.CharField(max_length=256, null=True)  # 写作主题
    notes = models.CharField(max_length=3000, null=False)  # 老师评论
    tea_score = models.CharField(max_length=256, null=False)  # 老师评分
    total_score = models.CharField(max_length=256, null=False)  # 总分数
    machine_score = models.CharField(max_length=256, null=False)  # 机器评分
    #finish_time date,example:2019-12-03
    finish_time = models.CharField(max_length=45,null=True,default="")# 完成时间
    practice_type = models.IntegerField(null=True, default=0)  # 0--正式练习需要老师评分，1--自由练习--不需要老师评分，机器评分就行。
    is_upload = models.IntegerField(null=True, default=0)  # 是否上传。
