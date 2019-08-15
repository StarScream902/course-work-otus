FROM python:3.7-alpine

ADD . /app/

WORKDIR /app/

RUN pip install -r requirements.txt

EXPOSE 8000

CMD [ "cd ui && FLASK_APP=ui.py gunicorn ui:app -b 0.0.0.0" ] 
