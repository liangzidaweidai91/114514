FROM openjdk:17-jdk-slim
WORKDIR /app
RUN apt update && apt install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget https://dl.halo.run/release/halo-2.20.12.jar -O halo.jar
EXPOSE 8090
ENTRYPOINT ["java","-Xms256m","-Xmx384m","-jar","halo.jar","--server.port=8090"]
