FROM node:10-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
RUN npm config set registry https://registry.npmjs.org/
RUN npm install
COPY . .
COPY --chown=node:node . .
USER node
EXPOSE 8080
CMD [ "node", "index.js" ]
