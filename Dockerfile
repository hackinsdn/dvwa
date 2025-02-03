FROM ghcr.io/digininja/dvwa:latest

RUN apt update \
 && apt install -y --no-install-recommends mariadb-server socat \
 && rm -rf /var/lib/apt/lists/*

RUN service mariadb start \
 && mariadb -uroot -e "CREATE DATABASE dvwa;" \
 && mariadb -uroot -e "GRANT ALL ON *.* TO 'dvwa'@'%' IDENTIFIED BY 'p@ssw0rd' WITH GRANT OPTION;"

EXPOSE 80 3306

COPY start.sh /start.sh

CMD ["/start.sh"]
