FROM hypriot/rpi-node:7-slim

MAINTAINER Cedric Gatay <c.gatay@code-troopers.com>

RUN apt-get update \
    && apt-get install -yq libpcap-dev vim git python make g++ \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g node-dash-button request
ENV NODE_PATH /usr/local/lib/node_modules

VOLUME /app
WORKDIR /app

ADD app.js /app/app.js

ENV DASH_MAC '00:00:00:00:00:00'
ENV AUTH ''
ENV URL ''
ENV METHOD 'GET'

CMD ["node", "app.js"]
