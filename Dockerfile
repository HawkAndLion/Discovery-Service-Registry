# Stage 2: Run the application
FROM amazoncorretto:17 AS run
RUN mkdir -p /opt/app
WORKDIR /opt/app

# Copy the built jar from the build stage
COPY target/service-registry-0.0.1-SNAPSHOT.jar /opt/app

# Expose Eureka port
EXPOSE 8761

# Run the jar
ENTRYPOINT ["java", "-jar", "service-registry-0.0.1-SNAPSHOT.jar"]
