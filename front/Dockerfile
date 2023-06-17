# Node base image with deependencies
FROM node:14.20.0 AS base

USER node

WORKDIR /home/node/app

RUN mkdir -p /home/node/app

# ----------------------------------------------------------------
from base as dependencies

COPY --chown=node package.json yarn.lock  .

RUN yarn

# ----------------------------------------------------------------

# Run the app in dev mode
FROM base AS dev

COPY --from=dependencies --chown=node /home/node/app/node_modules /home/node/node_modules

ENV PATH /home/node/node_modules/.bin:$PATH

CMD yarn start --port ${PORT}

# ----------------------------------------------------------------

# Build the app for production
FROM base AS build

COPY --from=dependencies /home/node/app/node_modules ./node_modules

RUN yarn build --prod

# ----------------------------------------------------------------

# Serve the app with nginx
FROM nginx:1.17-alpine

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=build /home/node/app/dist/front/ /usr/share/nginx/html

EXPOSE 80