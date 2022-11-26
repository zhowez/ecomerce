FROM mysql:latest
LABEL Name=roomatematching-database Version=0.0.1

ENV MYSQL_ROOT_PASSWORD=root

ADD Create.sql /docker-entrypoint-initdb.d

EXPOSE  3306
#in future will copy test files into the database