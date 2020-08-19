# Start with a base image containing Java runtime
FROM openjdk:13-jdk-alpine

# Add Maintainer Info
LABEL maintainer="ucbabu@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8181

ARG JAR_FILE=build/libs/demo1*.jar

ADD ${JAR_FILE} /app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
