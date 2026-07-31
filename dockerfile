FROM openjdk:17-jdk-slim
WORKDIR /app
COPY halo.jar /app/halo.jar
EXPOSE 8090
ENTRYPOINT ["java","-Xms256m","-Xmx384m","-jar","halo.jar","--server.port=8090"]