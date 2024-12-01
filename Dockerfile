# Use an OpenJDK image to support both frontend and backend
FROM openjdk:16-jdk-slim

# Set the working directory
WORKDIR /app

# Install Node.js and npm (for frontend)
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# Install the frontend dependencies (npm install)
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the project into the container
COPY . .


# Build the Spring Boot application using Maven
RUN ./mvnw clean verify

# Expose port 8080 for Spring Boot backend
EXPOSE 8080

# Start the Spring Boot application
CMD java -jar /app/target/react-and-spring-data-rest-*.jar
