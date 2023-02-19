FROM python

RUN apt update && apt install -y libsm6 libxext6 libfontconfig1 libxrender1 libgl1-mesa-glx ffmpeg

COPY . /app/
WORKDIR /app/
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD python3 -m main
