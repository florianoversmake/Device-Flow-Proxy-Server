FROM richarvey/nginx-php-fpm:1.10.3

ENV LIMIT_REQUESTS_PER_MINUTE 12

COPY conf/nginx-site.conf /etc/nginx/sites-available/default.conf
COPY src/ /var/www/html/

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"

RUN composer install

WORKDIR "/var/www/html"
CMD ["/start.sh"]
