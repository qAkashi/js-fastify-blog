FROM node:20.12.2

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends make \
    && rm -rf /var/lib/apt/lists/*

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

EXPOSE 8080

ENV NODE_ENV=production

RUN npm run build

CMD ["npm", "start"]
