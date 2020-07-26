from rest_framework import serializers
from apis.models import UserProfile, Contact
# from django.urls import reverse
from rest_framework.reverse import reverse
import random, string
class UserSerializer(serializers.ModelSerializer):
	class Meta:
		model = UserProfile
		fields = ('name', 'phone_no', 'email')

class ContactSerializer(serializers.HyperlinkedModelSerializer):
	contact_link = serializers.HyperlinkedIdentityField(
        view_name='ContactDetail',
        lookup_field='pk'
    )
	# contact_link = serializers.SerializerMethodField()
	class Meta:
		model = Contact
		fields = ('name', 'phone_no', 'is_spam', 'contact_link','email')

	def get_contact_link(self, obj):
		return reverse('ContactDetail', kwargs={'pk':obj.id})
