from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login


# Create your views here.
def home_page(request):
	return render(request, 'index.html')

def login_page(request):
	return render(request, 'login.html')
