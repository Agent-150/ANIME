FROM python

RUN RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
COPY . /app/
WORKDIR /app/
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD ["python3", "__main__.py"]
