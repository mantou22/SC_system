# Generated by Django 2.1.7 on 2020-01-03 06:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('system', '0007_log'),
    ]

    operations = [
        migrations.RenameField(
            model_name='log',
            old_name='method',
            new_name='action',
        ),
    ]
