FROM adoptopenjdk:11-jre-hotspot
ENV SPRING_OUTPUT_ANSI_ENABLED=ALAWAYS \
    JHIPSTER_SLEEP=0 \
	JAVA_OPTS=""
COPY ./build/libs/*.war /app.war
CMD echo "Initiating in ${JHIPSTER_SLEEP}s..." && \
    sleep${JHIPSTER_SLEEP} && \
	java ${JAVA_OPTS} -Djava.security-egd=file:/dev/./urandom -jar /app.war