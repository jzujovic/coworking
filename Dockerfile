FROM python:3.10-slim-buster
RUN apt -y update
RUN apt -y install build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
ENV DB_USERNAME=myuser
ENV DB_PASSWORD=mypassword
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=mydatabase
COPY *.py /analytics/
ENTRYPOINT python /analytics/app.py
