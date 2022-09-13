FROM debian:11

# Base package & OS updates
RUN apt-get update && apt-get upgrade -y

# Install pre-reqs
RUN apt-get install -y --no-install-recommends ca-certificates gnupg2 wget

# Configure Zoneminder PPA
RUN echo "deb https://zmrepo.zoneminder.com/debian/release-1.36 bullseye/" >> /etc/apt/sources.list.d/zoneminder.list && \
  wget -O - https://zmrepo.zoneminder.com/debian/archive-keyring.gpg | apt-key add -

# Install Zoneminder
RUN apt-get update && apt-get install -y zoneminder=1.36.11-bullseye1 msmtp tzdata

# Clean apt
RUN apt-get -y clean && apt-get -y autoremove && \ 
  rm -rf /var/lib/apt/lists/* && \ 
  rm -rf /tmp/* && rm -rf /var/tmp/*

# Set permissions
RUN chmod 740 /etc/zm/zm.conf && \
  chown root:www-data /etc/zm/zm.conf && \
  adduser www-data video

# Configure Apache & MSMTP (for email alerts)
RUN a2enmod cgi && \
  a2enconf zoneminder && \
  a2enmod rewrite && \
  chown -R www-data:www-data /usr/share/zoneminder/ && \
  ln -sf /usr/bin/msmtp /usr/sbin/sendmail && \
  ln -sf /usr/bin/msmtp /usr/lib/sendmail

# Points to our database
RUN echo "ZM_DB_HOST=172.20.0.4" > /etc/zm/conf.d/03-me.conf

# Add and configure entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/entrypoint.sh

# Adds config file for mailing
COPY msmtprc /etc/msmtprc

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
