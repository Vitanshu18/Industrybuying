# Generated by Django 3.0.8 on 2020-07-26 05:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0004_userprofile_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='contact',
            name='is_spam',
            field=models.BooleanField(default=False),
        ),
    ]
