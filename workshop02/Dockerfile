FROM node:24 AS angular

WORKDIR /src

# Install Angular CLI
RUN npm i -g @angular/cli

COPY *.json .
COPY public public
COPY src src

# Install the packages and build
RUN npm ci && ng build

## Create caddy server
FROM caddy:2.10

WORKDIR /app

COPY caddy/Caddyfile .

RUN mkdir html
COPY caddy/error.html html
COPY --from=angular /src/dist/angular/browser/ html

ENV CADDY_PORT=3000

EXPOSE ${CADDY_PORT}

ENTRYPOINT caddy run --config=/app/Caddyfile