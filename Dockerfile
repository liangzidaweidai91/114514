FROM openjdk:17-jdk-alpine
WORKDIR /app
RUN apk update && apk add --no-cache wget
RUN wget -O halo.jar https://dl.halo.run/release/halo-2.20.12.jar
EXPOSE 8090

ENTRYPOINT ["java", "-Xms256m", "-Xmx320m", "-jar", "halo.jar", \
            "--server.port=8090", \
            "--management.endpoints.web.base-path=/actuator"]
