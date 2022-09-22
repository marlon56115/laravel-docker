FROM php:8.1-apache-bullseye

USER root

WORKDIR /var/www/html

RUN apt-get update -y && apt-get install -y \
  nano \
  vim \
  python2  \
  software-properties-common \
  apt-utils \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libjpeg-dev \
  libpng-dev \
  libpq-dev \
  libicu-dev \
  libzip-dev \
  libxml2-dev \
  libbz2-dev \
  libmosquitto-dev \
  zlib1g-dev \
  zip \
  curl \
  unzip \
  openssl \
  git \
  supervisor \
  gnupg2 \
  build-essential \
  apt-transport-https \
  ca-certificates

# Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install intl pdo pdo_mysql mysqli pdo_pgsql zip soap opcache pcntl bz2 iconv gd 
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN pecl update-channels && pecl install redis 
RUN docker-php-ext-enable intl opcache mysqli pdo pdo_mysql redis zip gd  
RUN docker-php-source delete

RUN apt-get install -y libldb-dev libldap2-dev && docker-php-ext-install -j$(nproc) ldap
#node
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
RUN apt-get -y install nodejs

RUN mkdir /etc/apache2/ssl
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
# RUN chmod 600 /etc/apache2/ssl/*

COPY ./docker/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN chown -R www-data:www-data /var/www/html \
  && a2enmod ssl \
  # && a2ensite default-ssl \
  && a2enmod rewrite

COPY ./docker/entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80
CMD ["apache2-foreground"]
