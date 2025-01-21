FROM ubuntu:22.04
RUN apt update && apt install -y tomcat
COPY *.jar /usr/local/tomcat/webapps/ROOT.jar
