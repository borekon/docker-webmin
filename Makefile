VERSION=1.941

build:
	docker build --tag ikaritw/webmin:${VERSION} .

run:
	docker run --name webmin --restart no -d -p 10000:10000 ikaritw/webmin:${VERSION}

