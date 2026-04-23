FROM alpine:latest

RUN apk update && apk upgrade && apk add --no-cache nginx

COPY default.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /usr/share/nginx/html
COPY index.html /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]