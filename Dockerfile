FROM adoptopenjdk:11-jre-hotspot
ENV SPRING_OUTPUT_ANSI_ENABLED=ALAWAYS \
    JHIPSTER_SLEEP=0 \
	JAVA_OPTS=""
COPY /var/jenkins_home/workspace/first-pipeline-job/build/libs/*.war /app.war
EXPOSE 8088s