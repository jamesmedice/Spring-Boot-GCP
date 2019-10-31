FROM openjdk:8u212-jdk-slim
 
LABEL maintainer="tiago.sllater@gmail.com"
 
VOLUME /tmp
 
EXPOSE 8080
 
ARG JAR_FILE=target/*.jar
 
ADD ${JAR_FILE} app.jar
 
ENTRYPOINT ["java","-jar","/app.jar"]