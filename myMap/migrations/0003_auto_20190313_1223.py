# Generated by Django 2.1.4 on 2019-03-13 04:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myMap', '0002_auto_20190305_1406'),
    ]

    operations = [
        migrations.CreateModel(
            name='Basic',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lng_lat', models.CharField(max_length=60)),
                ('name', models.CharField(max_length=60)),
                ('address', models.CharField(blank=True, max_length=60)),
                ('telephone', models.CharField(blank=True, max_length=20)),
                ('img_url', models.CharField(blank=True, max_length=30)),
                ('price', models.CharField(blank=True, max_length=10)),
                ('uid', models.CharField(db_index=True, max_length=200)),
            ],
            options={
                'db_table': 'basic',
            },
        ),
        migrations.RenameModel(
            old_name='detailInfo',
            new_name='Detail',
        ),
        migrations.DeleteModel(
            name='BasicInfo',
        ),
        migrations.AlterModelTable(
            name='detail',
            table='detail',
        ),
    ]
