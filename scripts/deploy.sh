#!/bin/bash

source /configs/ENV_VAR

git clone git@bitbucket.org:hub714/djangophotos.git

#ln -s /djangophotos/djangophotos /$ROOTDIR/$PROJECT_NAME
#ln -s /djangophotos/manage.py /djangoproject/manage.py
chgrp -R www-data /djangophotos
chmod 770 -R /djangophotos
source /$PROJECT_FILES_ROOT/$VENV/bin/activate

cd $GIT_NAME
./manage.py collectstatic --noinput
./manage.py makemigrations
./manage.py migrate
