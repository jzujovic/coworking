FROM python:3.10-slim-buster
RUN apt -y update
RUN apt -y install build-essential libpq-dev
RUN pip install --upgrade pip setuptools wheel
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY *.py /analytics/
ENTRYPOINT python /analytics/app.py
