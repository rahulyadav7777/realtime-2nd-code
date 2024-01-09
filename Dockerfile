FROM   php:7.4-fpm

RUN apt-get update && \
    apt-get install -y \
    curl \
    vim \
    sudo \
    supervisor \
    nginx

WORKDIR /var/www/html
COPY RealTime-NewYear-Countdown /var/www/html/RealTime-NewYear-Countdown
COPY  dockerwithk8s/default.conf /etc/nginx/sites-enabled/default
COPY dockerwithk8s/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]