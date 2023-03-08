FROM python:3.8.16-alpine3.17

# The requirements to build SqlAlchemy includes compiling from source-code, at least in Alpine
# It does require GCC to compile also the MySQL client from sources.
# https://stackoverflow.com/questions/59554493/unable-to-fire-a-docker-build-for-django-and-mysql/59554601#59554601
# https://stackoverflow.com/questions/8878676/compile-error-g-error-trying-to-exec-cc1plus-execvp-no-such-file-or-dir
RUN apk add musl-dev python3-dev mariadb-dev gcc build-base bash

WORKDIR /viasat/minitwit

COPY requirements*.txt .

RUN pip install -r requirements.txt

ENV FLASK_APP=minitwit.py
ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8

COPY . /viasat/minitwit

ENTRYPOINT ["bash", "/viasat/minitwit/run-app"]
