#specifing the base image that the build will extend
FROM alpine:3.22.4

#telling builder to run the specified cmd
RUN apk add openssl curl ca-certificates
RUN apk update
RUN apk add nginx
#RUN apk upgrade

#telling the builder to copy files from host and put them into container image
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/script.sh /script.sh

RUN chmod +x /script.sh

#set the default cmd a container using this image will run
CMD ["/script.sh"]
