FROM docker.io/httpd:2.4.48-alpine
COPY open-ssl-update.sh open-ssl-update.sh
RUN chmod +x open-ssl-update.sh
RUN ./open-ssl-update.sh