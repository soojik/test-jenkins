FROM openjdk:8-alpine
ADD ci-0.0.1-SNAPSHOT.jar springbootApp.jar
EXPOSE 9999
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
