# Generated by Django 2.1.7 on 2020-01-07 09:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('system', '0014_user_loginflag'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='addr',
            field=models.CharField(max_length=512, null=True),
        ),
    ]
