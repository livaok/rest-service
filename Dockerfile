FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY rest-service-0.0.1-SNAPSHOT.jar /workspace/source/app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
