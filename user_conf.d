
server {
    # Listen to port 443 on both IPv4 and IPv6.
    listen 443 ssl default_server reuseport;
    listen [::]:443 ssl default_server reuseport;

    # Domain names this server should respond to.
    server_name analytics.relationalitylab.org;

    # Load the ECDSA certificates.
    ssl_certificate     /etc/letsencrypt/live/test-ecc/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/test-ecc/privkey.pem;

    # Load the RSA certificates.
    ssl_certificate     /etc/letsencrypt/live/test-rsa/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/test-rsa/privkey.pem;

    # Load the Diffie-Hellman parameter.
    ssl_dhparam /etc/letsencrypt/dhparams/dhparam.pem;

    # Define the ciphers to use in the preferred order.
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers "EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH:DHE+AESGCM:DHE:!RSA!aNULL:!eNULL:!LOW:!RC4:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS:!CAMELLIA:!SEED";

    location / {
        proxy_pass http://172.18.0.2;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

}

server {
    # Listen to port 443 on both IPv4 and IPv6.
    listen 443 ssl default_server reuseport;
    listen [::]:443 ssl default_server reuseport;

    # Load the ECDSA certificates.
    ssl_certificate     /etc/letsencrypt/live/test-ecc/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/test-ecc/privkey.pem;

    # Load the RSA certificates.
    ssl_certificate     /etc/letsencrypt/live/test-rsa/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/test-rsa/privkey.pem;

    # Load the Diffie-Hellman parameter.
    ssl_dhparam /etc/letsencrypt/dhparams/dhparam.pem;

    # Define the ciphers to use in the preferred order.
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers "EECDH+ECDSA+AESGCM:EECDH+aRSA+AESGCM:EECDH+ECDSA+SHA384:EECDH+ECDSA+SHA256:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH:DHE+AESGCM:DHE:!RSA!aNULL:!eNULL:!LOW:!RC4:!3DES:!MD5:!EXP:!PSK:!SRP:!DSS:!CAMELLIA:!SEED";

    server_name docs.relationalitylab.org;

    location / {
     proxy_pass http://172.18.0.5;
    }

    error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

}
