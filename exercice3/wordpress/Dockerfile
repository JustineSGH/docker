FROM debian:stretch
RUN apt-get update && apt-get install -y wget && apt-get install -y openssh-server
RUN wget http://wordpress.org/latest.tar.gz

RUN mkdir -p /var/www
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh

COPY id_rsa.pub /
RUN cat /id_rsa.pub >> /root/.ssh/authorized_keys

RUN tar xfz latest.tar.gz
RUN mv wordpress /var/www/html
#VOLUME /var/www/html

COPY script.sh /script.sh
RUN chmod 777 /script.sh

EXPOSE 80 22

ENTRYPOINT ["./script.sh"]
