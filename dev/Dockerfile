FROM openjdk:8-jdk-alpine
ADD saxon9he.jar /
RUN apk update
RUN apk add maven
RUN apk add httpie
WORKDIR /app
ENTRYPOINT ["/bin/sh"]
