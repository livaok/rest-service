FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY /var/lib/jenkins/workspace/test/target/rest-service-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
