FROM openjdk:17-jdk-alpine

WORKDIR /app

RUN apk add --no-cache wget
RUN wget -O halo.jar https://dl.halo.run/release/halo-2.20.0.jar

EXPOSE 8090

ENTRYPOINT ["java", "-Xms128m", "-Xmx256m", "-jar", "halo.jar", \
"--server.port=8090", \
"--halo.external-url=https://www.langzi91.us.ci", \
"--server.forward-headers-strategy=native", \
"--spring.profiles.active=prod"]
