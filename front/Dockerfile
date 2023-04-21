# Stage 1 - the build process
FROM node:14.20.0 AS build

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH

COPY . .

RUN yarn 

RUN yarn build --prod

# Stage 2 - the production environment

FROM nginx:1.17-alpine

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

COPY --from=build /app/dist/front/ /usr/share/nginx/html

EXPOSE 80