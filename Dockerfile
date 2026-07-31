FROM openjdk:17-jdk-slim
# 换成alpine版本！
FROM openjdk:17-jdk-alpine
WORKDIR /app
RUN apk update && apk add wget
RUN wget https://dl.halo.run/release/halo-2.20.12.jar -O halo.jar
EXPOSE 8090
ENTRYPOINT ["java","-Xms256m","-Xmx384m","-jar","halo.jar","--server.port=8090","--management.endpoints.web.base-path=/","--management.endpoint.health.path=/health"]
