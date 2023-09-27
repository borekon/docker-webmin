FROM  ubuntu:focal

RUN     echo "Acquire::GzipIndexes \"false\"; Acquire::CompressionTypes::Order:: \"gz\";" >/etc/apt/apt.conf.d/docker-gzip-indexes && \
	apt-get update && \
	apt-get install -y net-tools gnupg2 wget curl locales && \
	dpkg-reconfigure locales && \
	locale-gen es_ES.UTF-8 en_GB.UTF-8 && \
	/usr/sbin/update-locale LANG=C.UTF-8 && \
	curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh && \
	sh setup-repos.sh && \
	apt-get update && \
	apt-get install -y webmin --install-recommends && \
	apt-get clean
RUN mkdir -p /run/secrets/
RUN touch /run/secrets/ROOT_PW
RUN echo "P@ssw0rd!" > /run/secrets/ROOT_PW

ENV LC_ALL C.UTF-8

EXPOSE 10000

CMD echo root:$(cat /run/secrets/ROOT_PW) | chpasswd &&  /usr/bin/touch /var/webmin/miniserv.log && /usr/sbin/service webmin restart && /usr/bin/tail -f /var/webmin/miniserv.log
