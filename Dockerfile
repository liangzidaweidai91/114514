# 基础JDK镜像（Halo推荐）
FROM openjdk:17-jdk-slim

# 设置环境变量（解决监听0.0.0.0、端口8090）
ENV HALO_SERVER_ADDRESS=0.0.0.0
ENV HALO_SERVER_PORT=8090
ENV TZ=Asia/Shanghai

WORKDIR /app

# 复制jar包，注意：如果你的jar名字不一样，自行修改
COPY target/halo.jar app.jar

# 暴露端口（仅文档标注，平台实际端口看面板）
EXPOSE 8090

# 启动命令
ENTRYPOINT ["java","-jar","app.jar"]
