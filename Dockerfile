FROM openjdk:8-jdk-alpine
WORKDIR /var/lib/jenkins/workspace/test
VOLUME /tmp
RUN git clone https://github.com/livaok/rest-service.git

# Путь должен быть внутри контекста билда
COPY rest-service-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
