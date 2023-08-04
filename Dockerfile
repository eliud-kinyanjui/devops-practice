FROM node:19-alpine

WORKDIR /app

COPY package.json .

COPY package-lock.json .

RUN npm install

COPY . .

EXPOSE 5173

CMD ["npm", "run", "host"]