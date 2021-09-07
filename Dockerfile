FROM openjdk:8-jdk-alpine
WORKDIR /var/lib/jenkins/workspace/test/.git
VOLUME /tmp
# Путь должен быть внутри контекста билда
COPY rest-service-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
