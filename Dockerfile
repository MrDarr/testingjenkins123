FROM openjdk:16-alpine3.13
WORKDIR /app
COPY .mvnw/ .mvnw
COPY mvnw pom.xml ./
COPY src ./src
CMD ["./mvnw", "spring-boot:run"]
