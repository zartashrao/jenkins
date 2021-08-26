
FROM ubuntu:20.04

RUN  apt update
RUN  apt install nginx -y;

RUN  apt install ufw -y
RUN  ufw allow 'Nginx HTTP' 
RUN  apt install mysql-server -y
RUN  apt install php7.4 php7.4-fpm php-mysql -y

RUN  apt install nano

COPY index.php /var/www/


CMD service mysql start && service php7.4-fpm start && nginx -g 'daemon off;'

RUN rm -rf /etc/nginx/sites-available/default
COPY default /etc/nginx/sites-available/

EXPOSE 40






