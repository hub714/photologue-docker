#!/bin/bash

source /configs/ENV_VAR

source /$ROOTDIR/$VENV/bin/activate

cd $ROOTDIR

django-admin.py startproject $PROJECT_NAME .
#aws s3 cp myproject/settings.py s3://huberttest/settings.py
cp /configs/settings.py /$ROOTDIR/$PROJECT_NAME/settings.py
sed -i "s/myproject/$PROJECT_NAME/g" /$ROOTDIR/$PROJECT_NAME/settings.py

./manage.py makemigrations
./manage.py migrate
