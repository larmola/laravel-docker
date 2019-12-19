FROM nginx:1.10

ADD development/vhost.conf /etc/nginx/conf.d/default.conf
