#specify base image
FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

#specify working directory
WORKDIR /home/node/app

COPY ./app/package*.json ./

USER node

#install dependencies
RUN npm install

COPY --chown=node:node ./app .

EXPOSE 3000

CMD [ "node", "index.js" ]
