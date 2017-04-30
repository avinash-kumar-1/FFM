from django.db import models

# Create your models here
from django.contrib.auth.models import User
from django.db.models.signals import post_save

class Usermyproject(models.Model):
    user_default_info = models.OneToOneField(User)

    user_type = models.CharField(max_length=20)
    user_id=models.IntegerField(default=0)
