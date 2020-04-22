FROM wordpress:latest

## install sendmail alternative for php
RUN apt-get update && \
   apt-get install -y msmtp && \
   apt-get clean

# add any CA certificates
COPY ca /usr/local/share/ca-certificates/ca
RUN update-ca-certificates

