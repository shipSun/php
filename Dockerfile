FROM shipsun/php:7.2.18.2
WORKDIR /var/local/
CMD ["/usr/local/php7/sbin/php-fpm","-c","/usr/local/php7/php.ini","-y","/usr/local/php7/etc/php-fpm.conf","-F","-O"]