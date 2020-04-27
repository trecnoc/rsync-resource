FROM alpine:latest

RUN apk add --no-cache bash rsync jq openssh

COPY ./assets/* /opt/resource/
