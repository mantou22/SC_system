from django.contrib import admin

# Register your models here.
from .models import (essay_style, mc_type, micro_course, model_essay,
                     stu_course, stu_writing, student, tea_admin, writing_task)

admin.site.register(student)
admin.site.register(tea_admin)
admin.site.register(micro_course)
admin.site.register(stu_course)
admin.site.register(mc_type)
admin.site.register(model_essay)
admin.site.register(essay_style)
admin.site.register(writing_task)
admin.site.register(stu_writing)
