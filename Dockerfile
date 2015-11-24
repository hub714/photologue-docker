FROM ubuntu:latest

RUN apt-get update 
RUN apt-get install -y apache2 \
  build-essential \
  curl \
  git \
  libapache2-mod-wsgi-py3 \
  libmysqlclient-dev \
  python3-dev \
  python3-pip

RUN ln /usr/bin/pip3 /usr/bin/pip 
RUN pip install --upgrade pip
RUN pip install virtualenv

ADD scripts/* /scripts/
ADD configs/* /configs/
RUN chmod -R 700 /scripts/


RUN /scripts/installvenv.sh
RUN /scripts/installawscli.sh
#RUN /scripts/installdjango.sh
RUN /scripts/modapache2.sh

#Deploy my code first (Folder creation stuff)

RUN /scripts/setupssh.sh

RUN /scripts/deploy.sh

#RUN mkdir djangoproject

#WORKDIR djangoproject
#RUN pwd
#RUN virtualenv mysiteenv
#RUN source /mysiteenv/bin/activate
#RUN django-admin.py startproject myproject
#RUN /usr/local/bin/virtualenvwrapper.sh
EXPOSE 8080
#CMD ["/bin/bash"]
#CMD ["/scripts/startenv.sh"]
CMD ["apache2ctl", "-D", "FOREGROUND"]

