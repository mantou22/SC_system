# Generated by Django 2.1.7 on 2020-01-07 09:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('system', '0013_auto_20200107_1657'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='loginflag',
            field=models.IntegerField(default=0, null=True),
        ),
    ]
