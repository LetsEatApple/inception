#specifing the base image that the build will extend
FROM alpine:3.22.4

#specifing the "work directory" or path in the image where files will be copied and cmds will be executed
#WORKDIR /srcs/requirements/nginx

#telling builder to run the specified cmd
RUN apk add openssl curl ca-certificates
RUN apk update
RUN apk add nginx
#RUN openssl req -x509 -nodes -days 365 \
#-newkey rsa:2048 \
#-keyout /etc/ssl/private/nginx-selfsigned.key \
#-out /etc/ssl/certs/nginx-selfsigned.crt \
#-subj "/C=DE/L=BER/O=42/OU=student/CN=lhagemos.42.de"

#RUN apk upgrade

#telling the builder to copy files from host and put them into container image
#COPY ./website/index.html /var/www/html/index.html
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/script.sh /script.sh

#set an evironment variable that a running container will use
#ENV <name> <value>

#set the default cmd a container using this image will run
RUN chmod +x /script.sh

#CMD ["nginx", "-g", "daemon off;"]
CMD ["/script.sh"]
