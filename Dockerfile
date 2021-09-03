FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY /var/lib/jenkins/.m2/repository/com/example/rest-service/rest-service-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
