"""
URL configuration for flower_shop project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
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
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from shop_app import views
urlpatterns = [
    path('', views.home, name='home'),
    path('flower/<int:flower_id>/', views.flower_detail, name='flower_detail'),
    path('cart/', views.cart_view, name='cart'),
    path('cart/remove/<int:flower_id>/', views.remove_from_cart, name='remove_from_cart'),
    path('register/', views.register, name='register'),
    path('checkout/', views.checkout, name='checkout'),  # Dodaj widok checkout

    path('add_to_cart/<int:flower_id>/', views.add_to_cart, name='add_to_cart'),
]
