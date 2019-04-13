from django.shortcuts import render

# Create your views here.
def index(request):
    ctx = {'greeting': 'Hello Gallery!'}
    return render(request, 'segmentation_gallery/index.html', context=ctx)