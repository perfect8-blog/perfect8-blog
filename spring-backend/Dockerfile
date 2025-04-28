FROM eclipse-temurin:24-jre-alpine

COPY target/blog-0.0.1-SNAPSHOT.jar /app/blog.jar
WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "blog.jar"]
