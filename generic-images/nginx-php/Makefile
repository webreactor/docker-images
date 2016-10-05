IMAGE_NAME=webreactor/nginx-php
IMAGE_TAG=v0.0.2
IMAGE=$(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(IMAGE_NAME):latest

push:
	docker push $(IMAGE)
	docker push $(IMAGE_NAME):latest
