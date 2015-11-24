#!/bin/bash

source /configs/ENV_VAR

#This is needed for aws cli.
source /$PROJECT_FILES_ROOT/$VENV/bin/activate

mkdir /root/.ssh

aws s3 cp s3://awshubfiles/djangophotos/bbdepkey /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

touch /root/.ssh/known_hosts
ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
