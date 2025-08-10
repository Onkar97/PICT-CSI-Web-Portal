# PICT CSI Web Portal

A Java-based web portal for student events and content publishing. It supports user authentication, event listing/registration, and real-time media updates via JDBC-backed persistence.

## Features
- **Event Management:** list events, register, and manage attendance
- **Auth & Roles:** student/organizer access levels (if configured)
- **Database-Backed:** SQL schema and JDBC integration for persistence
- **Responsive UI:** Bootstrap-based frontend

## Tech Stack
- **Backend:** Java 8+, Maven
- **Web:** JSP/Servlets (typical), Bootstrap, jQuery
- **Database:** MySQL/PostgreSQL (configure via JDBC)

## Setup
```bash
# Build
mvn clean package

# Run (example with embedded server or app server config)
# Deploy the WAR to Tomcat/Jetty OR use Spring Boot if present
```
Configure database in `src/main/resources/*` (or webapp config) with JDBC URL/credentials.

## Structure
```
src/main/java/...    # Java source
src/main/webapp/...  # JSP/HTML/CSS/JS
src/main/resources/  # configs
database/*.sql       # SQL schema/dumps (if included)
```
