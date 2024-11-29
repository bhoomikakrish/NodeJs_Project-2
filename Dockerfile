FROM node:alpine
WORKDIR /app
COPY ./package.json ./
RUN npm install build
COPY . .
CMD ["node", "server.js"]