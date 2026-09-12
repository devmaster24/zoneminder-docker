FROM debian:trixie

# Skip interactive post-install scripts
ENV DEBIAN_FRONTEND=noninteractive

# Base package & OS updates
RUN apt-get update && apt-get upgrade -y

# Install
RUN apt-get install -y --no-install-recommends \
  apache2 libapache2-mod-php file \
  mariadb-server mariadb-client mariadb-client-compat \
  zoneminder

# Clean apt
RUN apt-get -y clean && apt-get -y autoremove && \ 
  rm -rf /var/lib/apt/lists/* && \ 
  rm -rf /tmp/* && rm -rf /var/tmp/*

# Set permissions
RUN chgrp -c www-data /etc/zm/zm.conf && \
  chown root:www-data /etc/zm/zm.conf && \
  adduser www-data video && \
  chown -R www-data:www-data /usr/share/zoneminder/

# Configure PHP
RUN ln -s "$(find /etc/php -name php.ini -path '*apache2*' | head -n1)" /etc/php.ini

# Configure Apache
RUN a2enconf zoneminder && \
  a2enmod rewrite && \
  a2enmod cgi

RUN echo "ServerName 0.0.0.0" >> /etc/apache2/apache2.conf

COPY ./entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]