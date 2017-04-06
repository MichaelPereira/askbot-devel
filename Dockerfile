FROM python:2

ENV PYTHONUNBUFFERED 1
ARG ASKBOT_DATABASE_ENGINE
ARG ASKBOT_DATABASE_NAME
ARG ASKBOT_DATABASE_USER
ARG ASKBOT_DATABASE_PASSWORD

ENV DATABASE_PASSWORD ${ASKBOT_DATABASE_PASSWORD}
ENV DATABASE_NAME ${ASKBOT_DATABASE_NAME}
ENV DATABASE_USER ${ASKBOT_DATABASE_USER}

WORKDIR /src/

ADD askbot_requirements.txt /src/askbot_requirements.txt
RUN pip install -r askbot_requirements.txt

ADD . /src/
RUN python setup.py install

RUN mkdir /site/
WORKDIR /site/
#RUN askbot-setup --dir-name=. --db-engine=${ASKBOT_DATABASE_ENGINE:-2} \
#    --db-name=${ASKBOT_DATABASE_NAME:-db.sqlite} \
#    --db-user="${ASKBOT_DATABASE_USER}" \
#    --db-password="${ASKBOT_DATABASE_PASSWORD}"

#RUN sed -i "s/ROOT_URLCONF.*/ROOT_URLCONF = 'urls'/"  settings.py

#RUN python manage.py migrate --noinput
#RUN python manage.py collectstatic --noinput


#CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]

EXPOSE 8080
