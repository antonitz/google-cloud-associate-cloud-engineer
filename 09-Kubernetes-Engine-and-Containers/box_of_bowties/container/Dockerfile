FROM centos:latest
LABEL vendor="Bowtie Inc"
RUN yum -y install httpd
COPY index.html /var/www/html/
COPY boxofbowties*.jpg /var/www/html/
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80