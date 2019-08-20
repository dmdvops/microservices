# microservices

gcloud init

base=https://github.com/docker/machine/releases/download/v0.16.0 &&   curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&   sudo mv /tmp/docker-machine /usr/local/bin/docker-machine
chmod +x  /usr/local/bin/docker-machine

docker-machine create --driver google \
--google-project docker-250418 \
--google-zone europe-west1-b \
--google-machine-type f1-micro \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
docker-host

eval `docker-machine env docker-host`
