FROM python:3.7-alpine
LABEL maintainer="CRAIG" version="1.0"

ENV PYTHONUNBUFFERED 1

# Copies the requirements to our Docker image and installs it
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Creates app folder, then switch to it as the working directory and
# Copys the app folder from our local machine to the app folder on our immage
RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user


## To build the image -> docker build .