# Generated by Django 2.2.17 on 2021-04-18 18:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0003_car_manage_car_record_license_plate'),
    ]

    operations = [
        migrations.AlterField(
            model_name='license_plate',
            name='car_img',
            field=models.ImageField(blank=True, null=True, unique=True, upload_to='car_imgs'),
        ),
    ]