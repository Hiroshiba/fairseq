FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime
SHELL ["/bin/bash", "-c"]

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y swig libsndfile1-dev libasound2-dev && \
    apt-get clean

RUN mkdir /app && \
    cd /app && \
    git clone https://github.com/pytorch/fairseq && \
    cd fairseq && \
    git reset --hard 14c5bd027f04aae9dbb32f1bd7b34591b61af97f && \
    pip install --editable ./ && \
    pip install soundfile

WORKDIR /app/fairseq
