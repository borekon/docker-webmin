FROM  ubuntu:latest

RUN     echo "Acquire::GzipIndexes \"false\"; Acquire::CompressionTypes::Order:: \"gz\";" >/etc/apt/apt.conf.d/docker-gzip-indexes && \
	apt-get update && \
	apt-get install -y \
	net-tools gnupg2 wget locales apache2 && \
	dpkg-reconfigure locales && \
	locale-gen C.UTF-8 && \
	/usr/sbin/update-locale LANG=C.UTF-8 && \
	wget http://www.webmin.com/jcameron-key.asc -O /etc/apt/trusted.gpg.d/jcameron-key.asc && \
	echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y webmin && \
	apt-get clean
RUN mkdir -p /run/secrets/
RUN touch /run/secrets/ROOT_PW
RUN echo "P@ssw0rd!" > /run/secrets/ROOT_PW

ENV LC_ALL C.UTF-8

EXPOSE 10000

CMD echo root:$(cat /run/secrets/ROOT_PW) | chpasswd &&  /usr/bin/touch /var/webmin/miniserv.log && /usr/sbin/service webmin restart && /usr/bin/tail -f /var/webmin/miniserv.log
