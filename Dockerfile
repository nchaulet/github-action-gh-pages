FROM node:10.14.2-alpine

RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh

RUN npm install -g gh-pages

ADD entrypoint.sh /entrypoint.sh

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
