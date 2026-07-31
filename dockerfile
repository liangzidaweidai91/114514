FROM openjdk:17-jdk-slim
WORKDIR /app
# 构建阶段自动下载官方jar
RUN wget https://dl.halo.run/release/halo-2.20.12.jar -O halo.jar
EXPOSE 8090
ENTRYPOINT ["java","-Xms256m","-Xmx384m","-jar","halo.jar","--server.port=8090"]
