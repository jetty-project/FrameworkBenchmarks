FROM maven:3.6.1-jdk-11-slim as maven
WORKDIR /jetty
COPY pom.xml pom.xml
COPY src src
RUN mvn clean install -q -Pservlet

FROM openjdk:10-jre-slim
WORKDIR /jetty
COPY --from=maven /jetty/target/jetty-example-0.1.jar app.jar
COPY --from=maven /jetty/target/libs libs
CMD ["java", "-XX:+UseNUMA", "-XX:+UseParallelGC", "-jar", "app.jar"]
