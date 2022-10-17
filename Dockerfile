FROM nginx
COPY ./config/nginx.conf /etc/nginx/nginx.conf
RUN 'systemctl start nginx'
