FROM openjdk:8-alpine
ADD build/libs/springbootApp.jar springbootApp.jar
EXPOSE 9999
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
