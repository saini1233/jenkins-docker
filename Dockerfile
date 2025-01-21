FROM ubuntu:22.04

RUN apt update && apt install -y tomcat

# Set working directory for any following commands
WORKDIR /app

COPY *.jar /usr/local/tomcat/webapps/ROOT.jar

# Expose Tomcat default port (8080)
EXPOSE 8080

# Start Tomcat (if required, modify accordingly)
CMD ["catalina.sh", "run"]
FROM ubuntu:22.04
RUN apt update && apt install -y tomcat
COPY *.jar /usr/local/tomcat/webapps/ROOT.jar
