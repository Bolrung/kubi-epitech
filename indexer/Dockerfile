FROM node:14.20.0 as base

USER node
WORKDIR /node/app

FROM base as dependencies

COPY package.json yarn.lock ./

RUN yarn --silent

from base as dev

COPY --from=dependencies /node/app/node_modules /node/node_modules

ENV PATH /node/node_modules/.bin:$PATH

CMD [ "yarn", "dev" ]

from base as prod

COPY --from=dependencies /node/app/node_modules /node/node_modules
COPY . .

CMD [ "yarn", "start" ]