IMAGE_NAME=webreactor/ubuntu
IMAGE_TAG=20.04.01
IMAGE=$(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(IMAGE_NAME):latest

push:
	docker push $(IMAGE)
	docker push $(IMAGE_NAME):latest
