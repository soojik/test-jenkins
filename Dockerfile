FROM openjdk:8-alpine
ADD /var/lib/jenkins/workspace/test/build/libs/springbootApp.jar springbootApp.jar
EXPOSE 9999
ENTRYPOINT ["java", "-jar", "springbootApp.jar"]
