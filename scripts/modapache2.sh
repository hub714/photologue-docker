#!/bin/bash
source /configs/ENV_VAR

cp /configs/000-default.conf /etc/apache2/sites-available/000-default.conf

sed -i "s/GIT_NAME/$GIT_NAME/g" /etc/apache2/sites-available/000-default.conf

sed -i "s/PROJECT_NAME/$PROJECT_NAME/g" /etc/apache2/sites-available/000-default.conf

sed -i "s/PROJECT_FILES_ROOT/$PROJECT_FILES_ROOT/g" /etc/apache2/sites-available/000-default.conf

sed -i "s/VENV/$VENV/g" /etc/apache2/sites-available/000-default.conf

sed -i "s/80/8080/g" /etc/apache2/ports.conf
