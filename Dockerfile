# Stage 1: Build the application with Maven
FROM maven:3.9.6-amazoncorretto-17 AS build
WORKDIR /app

# Copy Maven config and source code
COPY pom.xml .
COPY src ./src

# Build the jar, skip tests to save time
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM amazoncorretto:17 AS run
WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/target/service-registry-0.0.1-SNAPSHOT.jar app.jar

# Expose Eureka port
EXPOSE 8761

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
