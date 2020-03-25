# Generated by Django 3.0.2 on 2020-03-24 19:57

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='offers',
            name='price',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='offers',
            name='free_items',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='offers',
            name='min_buy',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='products',
            name='offer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='products.Offers'),
        ),
    ]
