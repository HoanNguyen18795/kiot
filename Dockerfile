FROM adoptopenjdk:11-jre-hotspot
ENV SPRING_OUTPUT_ANSI_ENABLED=ALAWAYS \
    JHIPSTER_SLEEP=0 \
	JAVA_OPTS=""
COPY build/libs/kiot-0.0.1-SNAPSHOT.war app.war
EXPOSE 8088
ENTRYPOINT ["java", "-jar", "app.war"]