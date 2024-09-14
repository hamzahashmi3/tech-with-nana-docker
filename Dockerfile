FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password
WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app .
EXPOSE 3000

CMD [ "npm", "run", "dev" ]