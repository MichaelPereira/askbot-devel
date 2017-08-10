cd /askbot
pip install -r requirements-tests.txt
pip install django_lamson
askbot-setup --dir-name=. --db-engine=2 --db-name=db.sql
python manage.py migrate --noinput
python manage.py collectstatic --noinput
coverage run manage.py test askbot.tests
