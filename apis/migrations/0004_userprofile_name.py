# Generated by Django 3.0.8 on 2020-07-26 04:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('apis', '0003_contact_userconact'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='name',
            field=models.CharField(default='vitanshu', max_length=50),
            preserve_default=False,
        ),
    ]
