from django.urls import path
from . import views

app_name = 'segmentation_gallery'
urlpatterns = [
    path('', views.index, name='index')
]