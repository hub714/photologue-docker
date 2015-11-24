#!/bin/bash

source /configs/ENV_VAR

mkdir $PROJECT_FILES_ROOT && cd $PROJECT_FILES_ROOT
virtualenv $VENV
source $VENV/bin/activate
pip install -r /configs/requirements.txt
pip install django-photologue
#django-admin.py startproject $PROJECT_NAME .
#aws s3 cp myproject/settings.py s3://huberttest/settings.py
#cp /configs/settings.py myproject/settings.py
#sed 's/myproject/'$PROJECT_NAME'/' myproject/settings.py

#./manage.py makemigrations
#./manage.py migrate

#./manage.py createsuperuser --noinput --username admin --email hubertcheung@gmail.com
# This can only be run once apparently.


