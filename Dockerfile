#使用node:8.16-alpine 作为基础进行构建
FROM node:14.17.3-alpine

#创建/app 目录作为部署目录,创建容器实例时,挂载此目录
RUN mkdir -p /app
COPY ./ /app
WORKDIR /app

#安装 bash 和 busybox
RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \
    bash-doc \
    bash-completion \
    && /bin/bash \
    && apk add --no-cache git \
    && rm -rf /var/cache/apk/*

RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
RUN npm run build

#设置node环境变量为production
ENV NODE_ENV=production

EXPOSE 3000

ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

CMD [ "npm", "start" ]