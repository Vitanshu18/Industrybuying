from django.db import models
# Create your models here.


from django.contrib.auth.models import AbstractUser
class UserProfile(AbstractUser):
	phone_no = models.CharField(max_length=10, unique=True)
	name = models.CharField(max_length=50)

	REQUIRED_FIELDS = ['email','phone_no']

class Contact(models.Model):
	name = models.CharField(max_length=50)
	email = models.EmailField(blank=True, null=True)
	phone_no = models.CharField(max_length=10, unique=True)
	is_spam = models.BooleanField(default=False)

class UserConact(models.Model):
	user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
	contact = models.ForeignKey(Contact, on_delete=models.CASCADE)

	class Meta:
		unique_together = ['user', 'contact']