FROM gradle:8.5-jdk21 AS build
WORKDIR /home/app
COPY . .
RUN gradle bootJar

FROM azul/zulu-openjdk:23-latest
WORKDIR /app
COPY --from=build /home/app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
