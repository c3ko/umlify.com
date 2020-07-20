#!/bin/bash

server {
        listen 80;
        listen [::]:80;

        server_name umlify.com;

        location / {
            root /var/www/frontend;
            try_files $uri $uri/ /index.html;
        }

        location /api {
             proxy_pass http://localhost:8080/;
             proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
             proxy_set_header X-Forwarded-Proto $scheme;
             proxy_set_header X-Forwarded-Port $server_port;
        }
}