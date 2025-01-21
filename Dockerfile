FROM ubuntu:22.04
RUN apt install -y tomcat
COPY *.jar /usr/local/tomcat/webapps/ROOT.jar
