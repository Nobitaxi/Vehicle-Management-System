# Generated by Django 2.2.17 on 2021-05-13 10:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0010_extra_charge_is_valid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='extra_charge',
            name='vip_begintime',
            field=models.DateTimeField(null=True),
        ),
        migrations.AlterField(
            model_name='extra_charge',
            name='vip_deadline',
            field=models.DateTimeField(null=True),
        ),
    ]