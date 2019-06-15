# docker-webmin
dockerfile for webmin

## Building the image
```
git clone https://github.com/ikaritw/docker-webmin.git
cd docker-webmin
docker build -t ikaritw/webmin .
```

## Running the container
```
docker run -d -p 10000:10000 ikaritw/webmin
```

Log into webmin and manage your server
```
http://hostname.or.ip:10000
(root:P@ssw0rd)
```
