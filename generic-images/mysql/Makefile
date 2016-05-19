IMAGE_NAME=webreactor/mysql
IMAGE_TAG=5.5
IMAGE_FULL_NAME=$(IMAGE_NAME):$(IMAGE_TAG)
#=========================================================

build-image:
	docker build -t $(IMAGE_FULL_NAME) .
	docker tag -f $(IMAGE_FULL_NAME) $(IMAGE_NAME):latest

push:
	docker push $(IMAGE_FULL_NAME)
	docker push $(IMAGE_NAME):latest

#deploy:
#	marathon-deploy $(IMAGE_TAG)
