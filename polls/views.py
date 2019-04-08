from django.shortcuts import render
from django.http import HttpResponse, Http404
from .models import Question
# Create your views here.

def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:5]
    ctx = {'latest_question_list': latest_question_list}
    return render(request, 'polls/index.html', context=ctx)


def detail(request, question_id):
    try:
        question = Question.objects.get(pk=question_id)
    except Question.DoesNotExist:
        raise Http404("Question does not exist.")
    
    return render(request, 'polls/detail.html', context={'question': question})


def results(request, question_id):
    response = f"You're looking at the results of question {question_id}"
    return HttpResponse(response)


def vote(request, question_id):
    return HttpResponse(f"You're voting for the question {question_id}")