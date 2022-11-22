# docker-webmin
Minimum working version of Webmin in Docker

## Building & running the image
```
git clone https://github.com/The-Drobe/docker-webmin.git
cd docker-webmin
docker build -t webmin:1 .
docker run -p 10000:10000 webmin:1
```
Default Password is below I recommend changing it in the dockerfile
```
P@ssw0rd!
```

## Stopping the container
```
docker kill ContainerID
```

## Log into webmin and manage your server
```
http://hostname.or.ip:10000
```
