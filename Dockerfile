FROM ubuntu:20.04

ENV PATH="/root/venv/bin:${PATH}"
ARG PATH="/root/venv/bin:${PATH}"

RUN apt update && apt install -y python3-dev htop

RUN apt install -y python3-pip \
    && apt install -y build-essential libssl-dev libffi-dev \
    && apt install -y python3-venv

RUN python3 -m venv docTest

COPY . /src

RUN /bin/bash -c "source /docTest/bin/activate && pip install -r /src/requirements.txt"
