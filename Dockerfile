FROM ghcr.io/digininja/dvwa:latest

RUN apt update \
 && apt install -y --no-install-recommends \
                mariadb-server socat net-tools iproute2 \
 && rm -rf /var/lib/apt/lists/*

RUN service mariadb start \
 && mariadb -uroot -e "CREATE DATABASE dvwa;" \
 && mariadb -uroot -e "GRANT ALL ON *.* TO 'dvwa'@'%' IDENTIFIED BY 'p@ssw0rd' WITH GRANT OPTION;"

EXPOSE 80 3306

COPY docker-entrypoint.sh /docker-entrypoint.sh

CMD ["/docker-entrypoint.sh"]
