
FROM openjdk:11
LABEL Name=roomatematching-backend Version=0.0.1
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
#2 ways to copy the java files into the container
#COPY roomatematching.jar roomatematching.jar
#COPY . /usr/src/myapp
#WORKDIR /usr/src/myapp
#RUN javac Main.java
EXPOSE 3000
#ENTRYPOINT exec java $JAVA_OPTS -jar roomatematching.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar roomatematching.jar
