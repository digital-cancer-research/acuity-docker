FROM docker.io/postgres:11.10

WORKDIR /usr/root

RUN apt update \
	&& apt-get install postgresql-11-orafce -y

EXPOSE 5432