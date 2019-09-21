FROM alpine

LABEL maintainer="Sky Jia <me@skyjia.com>"

ENV SSH_PORT=22
ENV SSH_USER=root
ENV SSH_ID_FILE=/key.pem

RUN apk --update add openssh-client \
    && rm -f /var/cache/apk/*

ADD entrypoint.sh /entrypoint.sh
WORKDIR /

EXPOSE 1-65535

ENTRYPOINT [ "sh", "/entrypoint.sh" ]