FROM ubuntu:22.04

RUN apt update && apt install -y tomcat9

# Set working directory for any following commands
WORKDIR /app

COPY *.jar /usr/share/tomcat9/webapps/ROOT.jar

# Expose Tomcat default port (8080)
EXPOSE 8080

# Start Tomcat (if required, modify accordingly)
CMD ["catalina.sh", "run"]


# java -jar helloworld-1.0-SNAPSHOT-SNAPSHOT.jar 
# java -jar helloworld-0.0.1-SNAPSHOT-jar-with-dependencies.jar ./home/ubuntu/Config.properties (if you have any config property to pass in jar)
