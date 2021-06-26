from django.contrib import admin

# Register your models here.
from .models import sc_student, sc_admin, sc_micro_course, \
    mc_type, stu_course, sc_model_essay, sc_essay_style, sc_writing_practice

admin.site.register(sc_student)
admin.site.register(sc_admin)
admin.site.register(sc_micro_course)
admin.site.register(stu_course)
admin.site.register(mc_type)
admin.site.register(sc_model_essay)
admin.site.register(sc_essay_style)
admin.site.register(sc_writing_practice)
