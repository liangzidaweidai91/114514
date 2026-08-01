FROM openjdk:17-jdk-alpine

WORKDIR /app

# 安装依赖 + cloudflared
RUN apk update && apk add --no-cache wget curl bash
RUN wget -O halo.jar https://dl.halo.run/release/halo-2.20.0.jar
RUN wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
RUN chmod +x cloudflared

# 上传启动脚本到容器内
COPY start.sh /app/start.sh
RUN chmod +x start.sh

EXPOSE 8090
ENTRYPOINT ["/app/start.sh"]
