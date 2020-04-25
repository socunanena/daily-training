FROM nginx:alpine

COPY ./docker/nginx/daily-training.conf /etc/nginx/conf.d

COPY ./public /var/www

