FROM python:3.8.16-alpine3.17 AS builder

# https://stackoverflow.com/questions/59554493/unable-to-fire-a-docker-build-for-django-and-mysql/59554601#59554601
RUN apk add musl-dev python3-dev mariadb-dev gcc build-base bash

WORKDIR /viasat/minitwit

COPY requirements.txt .

RUN pip install -r requirements.txt

ENV FLASK_APP=minitwit.py
ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8

COPY ./static /viasat/minitwit/static
COPY ./templates /viasat/minitwit/templates

COPY *.py /viasat/minitwit
COPY *.sql /viasat/minitwit

####
#### tester image that installs the dev dependencies and executes the test cases during build
#### and during a container execution! The build will fail if any test case fails.
#### The test image is good for inspection of test environments and ca be used in CI/CD envs.
####
FROM builder AS tester

COPY requirements-dev.txt .
RUN pip install -r requirements-dev.txt

# Note that we are executing the tests here because we don't want to build
# A runtime image before the tests are executed successfully!
RUN pytest test_minitwit.py
CMD ["pytest", "test_minitwit.py"]

###
### runtime environment containing only the runtime dependencies.
###
FROM builder AS runtime

# All the other resources are there, so let's add the run-app as it's part of the runtime
COPY run-app .

ENTRYPOINT ["bash", "/viasat/minitwit/run-app"]
