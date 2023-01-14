FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .

RUN npm i -g pm2 && pm2 start elaina.js && pm2 save && pm2 logs

COPY . .

EXPOSE 5000

CMD ["node", "."]
