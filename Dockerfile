FROM adoptopenjdk:11-jre-hotspot
COPY ./build/libs/kiot-0.0.1-SNAPSHOT.war /app.war
EXPOSE 8088
CMD ["java", "-jar", "app.war"]