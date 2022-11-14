FROM node:17

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

USER node

RUN npm install prettier -g
RUN npm install 

COPY --chown=node:node . .

EXPOSE 8880

CMD [ "node", "app.js" ]