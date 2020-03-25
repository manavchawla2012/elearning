# Generated by Django 3.0.2 on 2020-03-24 19:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0003_auto_20200324_1958'),
    ]

    operations = [
        migrations.RenameField(
            model_name='products',
            old_name='offer_id',
            new_name='offer',
        ),
        migrations.AlterField(
            model_name='products',
            name='offer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='products.Offers'),
        ),
    ]