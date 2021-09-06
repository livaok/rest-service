FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY ./var/lib/jenkins/.m2/repository/com/example/rest-service/0.0.1-SNAPSHOT/rest-service-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
# RUN apt update && apt upgrade -y
