build:
	docker build . -t ikaritw/webmin

run:
	docker run --name webmin --restart no -d -p 10000:10000 ikaritw/webmin

