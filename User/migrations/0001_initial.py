# Generated by Django 3.0.2 on 2020-03-28 15:51

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('sessions', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Roles',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40, unique=True)),
                ('created_at', models.DateTimeField()),
                ('updated_at', models.DateTimeField()),
            ],
            options={
                'db_table': 'roles',
            },
        ),
        migrations.CreateModel(
            name='ShortUrl',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('path', models.CharField(max_length=255)),
                ('parameters', models.CharField(blank=True, max_length=255, null=True)),
                ('expiery_date', models.DateTimeField()),
                ('created_at', models.DateTimeField()),
                ('md5', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'short_url',
            },
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('username', models.CharField(max_length=100, unique=True)),
                ('password', models.CharField(max_length=50)),
                ('first_name', models.CharField(max_length=40)),
                ('gender', models.CharField(max_length=10, null=True)),
                ('phone', models.BigIntegerField(blank=True, null=True)),
                ('email', models.CharField(blank=True, max_length=40, null=True)),
                ('state', models.CharField(blank=True, max_length=30, null=True)),
                ('country', models.CharField(blank=True, max_length=40, null=True)),
                ('created_at', models.DateTimeField(blank=True, null=True)),
                ('updated_at', models.DateTimeField(blank=True, null=True)),
                ('last_name', models.CharField(max_length=40)),
                ('api_key', models.CharField(max_length=64, null=True)),
                ('role', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='User.Roles')),
            ],
            options={
                'db_table': 'users',
            },
        ),
        migrations.CreateModel(
            name='ActivityPeriod',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('log_in_time', models.DateTimeField(auto_now_add=True)),
                ('session', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='sessions.Session')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'user_activity_period',
                'unique_together': {('user', 'session')},
            },
        ),
    ]
