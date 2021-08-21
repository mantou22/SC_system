from django.contrib import admin

# Register your models here.
from .models import student, stu_admin, micro_course, \
    mc_type, stu_course, model_essay, essay_style, writing_task, stu_writing

admin.site.register(student)
admin.site.register(stu_admin)
admin.site.register(micro_course)
admin.site.register(stu_course)
admin.site.register(mc_type)
admin.site.register(model_essay)
admin.site.register(essay_style)
admin.site.register(writing_task)
admin.site.register(stu_writing)
