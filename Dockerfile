FROM tomcat:latest
COPY *.jar /usr/local/tomcat/webapps/ROOT.jar
