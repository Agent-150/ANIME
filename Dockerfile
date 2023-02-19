FROM python:3.9-slim-buster

RUN apt-get update && \
    apt-get install -y build-essential libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

CMD [ "python", "./__main__.py" ]
