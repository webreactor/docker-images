IMAGE_NAME=webreactor/nginx-php
IMAGE_TAG=0.0.1
IMAGE=$(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE) .
	docker tag -f $(IMAGE) $(IMAGE_NAME):latest

push:
	docker push $(IMAGE)
	docker push $(IMAGE_NAME):latest
