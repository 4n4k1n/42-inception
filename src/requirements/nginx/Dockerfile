FROM alpine:3.20

RUN apk update && apk upgrade && apk add --no-cache nginx

COPY default.conf /etc/nginx/http.d/.

RUN mkdir -p /usr/share/nginx/html
COPY index.html /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]