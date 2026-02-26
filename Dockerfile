# 1. Собираем проект с помощью Maven
FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# 2. Запускаем готовый jar-файл
FROM openjdk:17-jdk-slim
COPY --from=build /target/history_grodno-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
