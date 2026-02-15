FROM python:3.11-slim-bullseye

RUN apt-get update && apt-get install -y p7zip-full
