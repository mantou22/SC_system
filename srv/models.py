from django.db import models


# Create your models here.


class sc_student(models.Model):
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


class sc_admin(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=256, null=False, default='')
    pass_wd = models.CharField(max_length=256, null=False, default='')


class sc_micro_course(models.Model):
    id = models.AutoField(primary_key=True)
    c_name = models.CharField(max_length=256, null=False, default='')
    c_path = models.CharField(max_length=256, null=False, default='')  # 微课存放路径
    create_time = models.DateTimeField('date published')
    t_id = models.IntegerField(null=True, default=0)
    c_desc = models.CharField(max_length=3000, null=True)
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


class sc_model_essay(models.Model):
    id = models.AutoField(primary_key=True)
    es_id = models.IntegerField(null=True, default=0)  # 文章类型
    title = models.CharField(max_length=256, null=True)
    content = models.CharField(max_length=3000, null=True)
    writing_theme = models.CharField(max_length=256, null=True)
    tea_id = models.IntegerField(null=True, default=0)
    create_time = models.DateTimeField('date published')


class sc_essay_style(models.Model):
    id = models.AutoField(primary_key=True)
    type_name = models.CharField(max_length=256, null=True)

    def __str__(self):
        return "id:" + str(self.id) + ", type_name:" + self.type_name


class sc_writing_practice(models.Model):
    id = models.AutoField(primary_key=True)
    s_id = models.IntegerField(null=True, default=0)
    wt_id = models.IntegerField(null=True, default=0)
    content = models.CharField(max_length=3000, null=True)
    finish_time = models.DateTimeField('date published')
    notes = models.CharField(max_length=3000, null=False)
    tea_score = models.CharField(max_length=256, null=False)
    total_score = models.CharField(max_length=256, null=False)
    machine_score = models.CharField(max_length=256, null=False)
    practice_type = models.IntegerField(null=True, default=0)  # 0--正式练习需要老师评分，1--自由练习--不需要老师评分，机器评分就行。
    is_upload = models.IntegerField(null=True, default=0)  # 是否上传。
