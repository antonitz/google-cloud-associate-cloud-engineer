FROM ubuntu:latest
LABEL vendor="Bowtie Inc"
RUN apt-get update && apt-get install -y apache2
COPY index.html /var/www/html/
COPY boxofbowties*.jpg /var/www/html/
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80