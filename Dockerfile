FROM python

RUN pip3 install -r requirements.txt

RUN  apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
COPY . /app/
WORKDIR /app/
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD python3 -m main
