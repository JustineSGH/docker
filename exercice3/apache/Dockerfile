FROM exercice1
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y apache2 && apt-get install -y php7.0 && apt-get install -y php7.0-mysql
RUN rm /var/www/html/index.html
COPY index.php /var/www/html/
#VOLUME /var/www/html
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
