## Building the application
FROM node:24

# mkdir /app, cd /app
WORKDIR /app

# we are now inside /app

# Copy files from my project into the image
COPY package.json .
COPY package-lock.json .
COPY main.js .
COPY public public
COPY views views

# Install the dependencies, will create the node_modules
RUN npm ci

## Run the application
ENV APP_PORT=8080

# What are the ports the application is listening on
EXPOSE ${APP_PORT}

#ENTRYPOINT node main.js
ENTRYPOINT ["/usr/bin/node", "/app/main.js" ]
#CMD node main.js