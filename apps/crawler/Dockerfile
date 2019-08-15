FROM python:3.7-alpine

ADD . /app/

WORKDIR /app/

RUN pip install -r requirements.txt

EXPOSE 8000

CMD [ "./docker-entrypoint.sh" ]
