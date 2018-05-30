FROM openjdk:8-jre-alpine
WORKDIR /app
ADD target/saxonheservlet-0.1.0.jar /
ENTRYPOINT ["java", "-jar", "/saxonheservlet-0.1.0.jar"]
