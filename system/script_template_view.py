#--coding:utf-8 --
"""script and file templates manage

"""
from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect

def script_template_list(request):
    return render(request,"script_templates_list.html")


def script_template_update(request):
    return render(request,"script_templates_update.html")

def script_template_list_api(request):
     
    return HttpResponse("""{"total":20,"rows":[{"id":"6566203f8de347958b2c2de384818eb2",
    "createDate":"2019-12-13 18:00:08","updateDate":"2019-12-20 10:15:29","template_name":
    "Frame Fracture","type":"VSB12i","genIdType":"2"},{"id":"80e9e2e8da67497992a849c85cef129b","createDate":"2019-12-13 18:00:08","updateDate":"2019-12-13 18:00:08","template_name":"Device Fracture","type":"VSB12i"},{"id":"c3a5e6da7d314cf391e6e41c8a797512","createDate":"2019-12-13 18:00:08","updateDate":"2019-12-13 18:00:08","template_name":"Frame Fracture","type":"VSB12"},{"id":"905fdc773219485ea6c6c22ccad4f172","createDate":"2019-12-13 18:00:08","updateDate":"2019-12-13 18:00:08","template_name":"layout.ini","type":"VSB12i"},{"id":"b899fb3539034c27af58d9076ddd60d2","createDate":"2019-12-23 15:43:02","updateDate":"2019-12-23 15:43:02","template_name":"Layout.ini","type":"Mode5"},{"id":"fd40ef4f092f41a19c32cafabad017ff","createDate":"2019-12-13 18:00:08","updateDate":"2019-12-13 18:00:08","template_name":"Chip.ini","type":"VSB12i"},{"id":"58c1558ade774e66802da90c3178a297","createDate":"2019-12-13 18:00:08","updateDate":"2019-12-13 18:00:08","template_name":"Aux.xml","type":"VSB12i"},{"id":"3c98bea023e44dd5b63fcb1b6c40f20e","createDate":"2019-12-13 18:00:08","updateDate":"2019-12-13 18:00:08","template_name":"OD.aw.xml","type":"VSB12i"},{"id":"4519a82f2c614560a193e5fe6ec1ad04","createDate":"2019-12-13 18:00:08","updateDate":"2019-12-13 18:00:08","template_name":"Layout.mds","type":"VSB12"},{"id":"7368f5d3b0be45df8302fecb2558771f","createDate":"2019-12-13 18:00:08","updateDate":"2019-12-13 18:00:08","template_name":"layout.mds","type":"VSB12i"}]}""")