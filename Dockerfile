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

# Only copy the development tools from the requirements for tests
COPY requirements-dev.txt .
RUN pip install -r requirements-dev.txt

# All the requirements are installed and so the test cases can be executed 
CMD ["pytest", "test_minitwit.py"]

###
### Runtime environment containing only the runtime dependencies.
### Note that this image does NOT have anything for testing!
###
FROM builder AS runtime

# All the other resources are there, so let's add the run-app as it's part of the runtime
# Note that the builder runtime defines the WORKDIR already so we can COPY to .
COPY run-app .
COPY init-db .

RUN rm -rf requirements* test_minitwit.py

ENTRYPOINT ["bash", "/viasat/minitwit/run-app"]
