FROM openjdk:11-jre-slim
COPY target/your-app.jar /app/your-app.jar
ENTRYPOINT ["java", "-jar", "/app/your-app.jar"]

