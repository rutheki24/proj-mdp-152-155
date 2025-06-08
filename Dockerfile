# ---------- STAGE 1: Build ----------
FROM maven:3.8.5-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ---------- STAGE 2: Run with Tomcat ----------
FROM tomcat:10.1-jdk17
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
