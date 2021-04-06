# Generated by Django 2.1.7 on 2020-01-08 07:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('system', '0017_role'),
    ]

    operations = [
        migrations.AlterField(
            model_name='role',
            name='remarks',
            field=models.CharField(default='', max_length=256, null=True),
        ),
        migrations.AlterField(
            model_name='role',
            name='useable',
            field=models.IntegerField(default=1),
        ),
    ]
