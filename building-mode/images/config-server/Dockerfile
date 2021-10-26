FROM docker.io/openjdk:8u282-jdk

VOLUME /usr/root/acuity-spring-configs

ENV CONFIG_PROFILE local-no-security
ENV CFG_SRV_LOGIN acuity
ENV CFG_SRV_PASSWORD ac3tbasic

ENV JAVA_OPTIONS -Xms384m -Xmx384m

EXPOSE 8888

CMD java $JAVA_OPTIONS -jar /usr/root/builds/$WAR_NAME
