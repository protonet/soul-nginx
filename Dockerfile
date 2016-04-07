FROM experimentalplatform/ubuntu:latest

ENV NGINX_VERSION 1.9.14
COPY ./src /tmp/

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential zlib1g-dev libpcre3-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Configure options based on https://hub.docker.com/_/nginx/ 1.9 version
# output of `nginx -V` (configure opts) report. Commented lines mean
# modules that were in by default but were considered unneccessary
RUN cd /tmp/ && \
    tar xvfz nginx-$NGINX_VERSION.tar.gz && \
    cd nginx-$NGINX_VERSION && \
    ./configure \
      --prefix=/etc/nginx \
      --sbin-path=/usr/sbin/nginx \
      --modules-path=%{_libdir}/nginx/modules \
      --conf-path=/etc/nginx/nginx.conf \
      --error-log-path=/var/log/nginx/error.log \
      --http-log-path=/var/log/nginx/access.log \
      --pid-path=/var/run/nginx.pid \
      --lock-path=/var/run/nginx.lock \
      --http-client-body-temp-path=/var/cache/nginx/client_temp \
      --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
      --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
      --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
      --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
      --user=nginx \
      --group=nginx \
      #--with-http_ssl_module \
      --with-http_realip_module \
      #--with-http_addition_module \
      #--with-http_sub_module \
      #--with-http_dav_module \
      #--with-http_flv_module \
      #--with-http_mp4_module \
      #--with-http_gunzip_module \
      #--with-http_gzip_static_module \
      #--with-http_random_index_module \
      #--with-http_secure_link_module \
      #--with-http_stub_status_module \
      #--with-http_auth_request_module \
      --with-threads \
      #--with-stream \
      #--with-stream_ssl_module \
      #--with-http_slice_module \
      #--with-mail \
      #--with-mail_ssl_module \
      --with-file-aio \
      --with-http_v2_module \
      --with-cc-opt='-g -O2 -fstack-protector-strong -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2' \
      --with-ld-opt='-Wl,-z,relro -Wl,--as-needed' \
      --with-ipv6 \
      # ====================================================================================
      # CUSTOM exclusions here for soul-nginx - stuff included by default that we don't need
      # ====================================================================================
      --without-http_ssi_module \
      --without-http_userid_module \
      --without-http_access_module \
      --without-http_auth_basic_module \
      --without-http_autoindex_module \
      --without-http_geo_module \
      --without-http_map_module \
      --without-http_split_clients_module \
      --without-http_fastcgi_module \
      --without-http_uwsgi_module \
      --without-http_scgi_module \
      --without-http_memcached_module \
      --without-http_limit_req_module \
      --without-http_limit_conn_module \
      --without-http_empty_gif_module \
      --without-http_browser_module \
      --without-http_upstream_hash_module \
      --without-http_upstream_ip_hash_module \
      --without-http_upstream_least_conn_module \
      --without-http_upstream_keepalive_module \
      --without-http_upstream_zone_module && \
    make && make install && rm -rf /tmp/nginx*

RUN addgroup protonet --gid 1000 && adduser --gecos "" --disabled-password --disabled-login protonet --uid 1000 --gid 1000
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]