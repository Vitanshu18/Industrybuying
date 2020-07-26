from django.shortcuts import render
from rest_framework import generics
from .serializers import UserSerializer, ContactSerializer
import random, string
from .models import *
from django_filters import rest_framework as filters
from django_filters import CharFilter
from rest_framework.permissions import IsAuthenticated

# Create your views here.

class ContactFilter(filters.FilterSet):
	name =  CharFilter(field_name='name', method='filter_name')
	phone_no = CharFilter(field_name='phone_no', method='filter_phone')

	class Meta:
		model = Contact
		fields = ['name', 'phone_no']

	def filter_name(self, queryset, name, value):
		# construct the full lookup expression.
		queryset1 = queryset.filter(name=value)
		queryset2 = queryset.filter(name__icontains=value).exclude(id__in=queryset1.values_list('id',flat=True))
		return queryset1|queryset2

	def filter_phone(self, queryset, name, value):
		# construct the full lookup expression.
		queryset1 = queryset.filter(phone_no=value)
		queryset2 = queryset.filter(phone_no__icontains=value).exclude(id__in=queryset1.values_list('id',flat=True))
		return queryset1|queryset2

class RegisterUser(generics.CreateAPIView):
	serializer_class = UserSerializer

	def perform_create(self, serializer):
		name = serializer.validated_data.get('name')
		letters = string.ascii_lowercase
		user_name = serializer.validated_data.get('name').replace(" ", "") + "-" + ''.join(random.choice(letters) for i in range(2))
		serializer.save(username=user_name)

class ContactList(generics.ListAPIView):
	# permission_classes = (IsAuthenticated,)
	queryset = Contact.objects.all()
	serializer_class = ContactSerializer
	filterset_class = ContactFilter

	def get(self, request, *args, **kwargs):
		response =  self.list(request, *args, **kwargs)
		# if request.user.is_authenticated:
		for data in response.data:
			if request.user.is_authenticated and data['email'] == request.user.email and data['email'] != "":
				pass
			else:
				data.pop('email')
		return response

class ContactDetailView(generics.RetrieveAPIView):
	queryset = Contact.objects.all()
	serializer_class = ContactSerializer