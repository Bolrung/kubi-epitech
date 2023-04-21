FROM node:14.20.0

WORKDIR /app

COPY . .
ENV AMQP_URI amqp://rabbitmq:rabbitmq@rabbitmq:5672/
ENV ELASTICSEARCH_URI http://elastic-search:9200
RUN yarn 

CMD [ "yarn", "start" ]