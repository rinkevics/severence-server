FROM eclipse-temurin:25
RUN mkdir /opt/app
COPY app.jar /opt/app
ENV MY_PORT=8001
EXPOSE 8001
ENTRYPOINT ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5001", "-jar", "/opt/app/app.jar"]
