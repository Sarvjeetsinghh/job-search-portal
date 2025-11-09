# Use official Tomcat image with JDK
FROM tomcat:10.1-jdk17

# Copy WAR file to Tomcat webapps
COPY job-search-portal.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
