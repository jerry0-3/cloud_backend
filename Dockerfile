FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /app
COPY . .
RUN ./gradlew clean build

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/ChatApp-0.0.1-SNAPSHOT.jar ./
EXPOSE 8081
CMD [ "java", "-jar", "ChatApp-0.0.1-SNAPSHOT.jar" ]