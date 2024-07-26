FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt
#RUN mkdir /service
WORKDIR /service
COPY service /service

EXPOSE 8000

RUN apk add postgresql-client build-base postgresql-dev
RUN pip install -r /temp/requirements.txt

RUN adduser --disabled-password service-user
#RUN chown service-user:service-user -R /service/
#RUN chmod +x /service

USER service-user