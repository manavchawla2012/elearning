"""Elearning URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path, include
from . import settings
from django.conf.urls.static import static
from django.conf.urls import handler404
from . import views
a = {}

urlpatterns = [
                  path('user/', include("User.urls")),
                  path('tutor/', include("Tutor.urls")),
                  path('', views.home_page),
                  path('logout', views.logout),
                  path('oauth', include('social_django.urls', namespace='social')),
                  path('login', views.login),
                  path('signup', views.signup),
                  path('url/<str:md5>', views.url_short),
                  path('url', views.url_short),
                  path('product/', include('products.urls')),
                  path('cart/', include('cart.urls')),
                  path('api/', include('api.urls'))
              ] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

handler404 = 'User.views.handle404'
