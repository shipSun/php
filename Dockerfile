FROM centos:7
RUN yum -y install wget libxml2-devel openssl-devel bzip2-devel curl-devel libjpeg-devel libpng-devel libXpm-devel freetype-devel gmp-devel libmcrypt-devel mysql-devel aspell-devel recode-devel icu libicu-devel gcc gcc-c++ make automake autoconf libtool freetype \
&& yum clean all \
&& wget -P /root/ https://www.php.net/distributions/php-7.2.18.tar.gz \
&& cd /root && tar zxvf php-7.2.18.tar.gz && rm -rf php-7.2.18.tar.gz \
&& groupadd www && useradd -M -g www -s /bin/nologin www \
&& cd php-7.2.18/ \
&& ./configure \
--prefix=/usr/local/php7 \
--exec-prefix=/usr/local/php7 \
--bindir=/usr/local/php7/bin \
--sbindir=/usr/local/php7/sbin \
--includedir=/usr/local/php7/include \
--libdir=/usr/local/php7/lib/php \
--mandir=/usr/local/php7/php/man \
--with-config-file-path=/usr/local/php7/etc \
--with-config-file-scan-dir=/usr/local/php7/etc/php.d \
--with-mhash \
--with-openssl \
--with-mysqli=shared,mysqlnd \
--with-pdo-mysql=shared,mysqlnd \
--with-gd \
--with-iconv \
--with-zlib \
--enable-zip \
--enable-intl  \
--enable-inline-optimization \
--disable-debug \
--disable-rpath \
--enable-shared \
--enable-xml \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-mbregex \
--enable-mbstring \
--enable-ftp \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--enable-soap \
--without-pear \
--with-gettext \
--enable-session \
--with-curl \
--with-jpeg-dir \
--with-freetype-dir \
--enable-opcache \
--enable-fpm \
--with-fpm-user=www \
--with-fpm-group=www \
--without-gdbm \
&& make && make install \
&& ln -s /usr/local/php7/bin/php /usr/local/sbin/php