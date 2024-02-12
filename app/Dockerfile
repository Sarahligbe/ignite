#specify base image
FROM node:16-bullseye-slim

#create working directory and make node the owner
RUN mkdir /app && chown -R node:node /app

#specify the working directory
WORKDIR /app

#set node as user
USER node

#copy code to the image
COPY --chown=node:node . /app

#install dependencies
RUN npm ci --only=production && npm cache clean --force

CMD ["node", "index.js"]