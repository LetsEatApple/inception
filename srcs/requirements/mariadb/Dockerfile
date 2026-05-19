FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY ./tools/script.sh .

RUN mkdir /run/mysqld && chmod +x script.sh

#CMD ["mysqld"]
CMD ["./script.sh"]