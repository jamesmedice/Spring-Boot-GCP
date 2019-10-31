FROM maven:3.5.2-jdk-8-alpine as BUILD
RUN mvn clean install -DskipTests
 
FROM openjdk:8-jre-alpine
COPY --from=BUILD /target/*.jar  application.jar
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=dev", "/application.jar"]