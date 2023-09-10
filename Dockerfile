FROM node:latest

EXPOSE 3000

WORKDIR /dashboard

COPY entrypoint.sh /dashboard/

RUN npm i -g @3kmfi6hp/nodejs-proxy

RUN apt-get update &&\
    apt-get install -y iproute2 vim netcat-openbsd &&\
    npm install -g pm2 &&\
    addgroup --gid 10001 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10001 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]