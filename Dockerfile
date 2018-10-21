FROM python:3.7.0-alpine3.8

RUN mkdir /app

COPY requirements.txt /app/requirements.txt
COPY /app/app.py /app/app.py
WORKDIR /app

RUN apk add postgresql-dev

RUN pip install --no-cache-dir -r requirements.txt
ENV FLASK_ENV="docker"
ENV FLASK_APP="app.py"

EXPOSE 5000
