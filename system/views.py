from django.shortcuts import render
from utilslibrary.base.base import BaseView
from django.shortcuts import render_to_response
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Q
from utilslibrary.utils.common_utils import getCurrentSessionID
from wsgiref.validate import check_status
from system.models import menu


# Create your views here.

# tree select
class TreeSelect(BaseView):
    def get(self, request):
        url = request.GET.get('url')
        return render(request, 'system_tree_select.html', {"url": url})


def page_not_found(self, exception):
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


def page_error(self):
    return render_to_response('500.html')


def permission_error(self):
    return render_to_response('permission_error.html')


# home
class Home(BaseView):
    def get(self, request):
        # query tooling form list
        return render(request, 'home.html')


# index
class Index(BaseView):
    def get(self, request):
        # query menu
        _menu_list_parent = menu.objects.filter(is_delete=0, is_show=1, type=1, parent_id=0).order_by("sort")
        _menu_list_sub = menu.objects.filter(is_delete=0, is_show=1, type=1).exclude(parent_id=0).order_by("sort")
        return render(request, "index.html", {"menu_list_parent": _menu_list_parent, "menu_list_sub": _menu_list_sub})
