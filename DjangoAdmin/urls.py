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

from django.contrib import admin
from index.views import index


from django.conf.urls import url, include,handler400,handler404,handler500
from system.views import page_not_found,page_error,Home,Index
from django.views import static
from django.conf import settings

urlpatterns = [
    url('test',index),
    url(r'^static/(?P<path>.*)$', static.serve,{'document_root': settings.STATICFILES_DIRS}, name='static'),
    #url(r'^static/(?P<path>.*)$', static.serve, {'document_root': settings.STATIC_ROOT}),  
  
    url('admin/', admin.site.urls),
    url(r'^$', Index.as_view()),
    url(r'^index/$', Index.as_view()),
    url(r'^home/$', Home.as_view()),
    
    url('test/', index),
    url(r'^index/$', index),
    url(r'^system/', include('system.urls')),
    url(r'^srv/', include('srv.urls')),
   

]

handler404 = page_not_found
handler500 = page_error
