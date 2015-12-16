FROM nginx:1.9

RUN addgroup protonet --gid 1000 && adduser --gecos "" --disabled-password --disabled-login protonet --uid 1000 --gid 1000
COPY nginx.conf /etc/nginx/nginx.conf