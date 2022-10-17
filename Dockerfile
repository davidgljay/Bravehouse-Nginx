FROM nginx
COPY ./config/nginx.conf /etc/nginx/nginx.conf
VOLUME '/logs'
RUN 'systemctl start nginx'
