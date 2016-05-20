IMAGE_NAME=webreactor/ubuntu
IMAGE_TAG=14.04.03
IMAGE=$(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE) .
	docker tag -f $(IMAGE) $(IMAGE_NAME):latest

push:
	docker push $(IMAGE)
	docker push $(IMAGE_NAME):latest
