# Node base image with deependencies
FROM node:14.20.0 AS base

USER node

WORKDIR /home/node/app

RUN mkdir -p /home/node/app

# ----------------------------------------------------------------
from base as dependencies

COPY package.json yarn.lock  .

RUN yarn --silent

# ----------------------------------------------------------------

# Run the app in dev mode
FROM base AS dev

COPY --from=dependencies /home/node/app/node_modules ./node_modules

COPY . .

CMD yarn start --port ${PORT}

# ----------------------------------------------------------------

# Build the app for production
FROM base AS build

COPY --from=dependencies /app/node_modules ./node_modules

CMD yarn build --prod

# ----------------------------------------------------------------

# Serve the app with nginx
FROM nginx:1.17-alpine

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/dist/front/ /usr/share/nginx/html

EXPOSE 80