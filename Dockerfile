#FROM resin/rpi-raspbian:latest
#FROM balenalib/rpi-raspbian:latest
FROM  balenalib/raspberrypi3:buster

RUN 	echo "Acquire::GzipIndexes \"false\"; Acquire::CompressionTypes::Order:: \"gz\";" >/etc/apt/apt.conf.d/docker-gzip-indexes && \
	apt-get update && \
	apt-get install -y \
	wget \
	locales && \
	dpkg-reconfigure locales && \
	locale-gen C.UTF-8 && \
	/usr/sbin/update-locale LANG=C.UTF-8 && \
	wget http://www.webmin.com/jcameron-key.asc && \
	apt-key add jcameron-key.asc && \
	echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y webmin && \
	apt-get clean

ENV LC_ALL C.UTF-8

ARG ROOT_PW

RUN  echo root:$ROOT_PW | chpasswd

EXPOSE 10000

VOLUME ["/etc/webmin"]

CMD /usr/bin/touch /var/webmin/miniserv.log && /usr/sbin/service webmin restart && /usr/bin/tail -f /var/webmin/miniserv.log

LABEL version="webmin:1.970"
