NAME = zk-init-container
IMAGE_PREFIX = us-west1-docker.pkg.dev/zerok-dev/stage
IMAGE_NAME = zk-init-container
IMAGE_VERSION = dev

export GO111MODULE=on

buildAndPush: docker-build docker-push

.PHONY: build
build:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o zk-init cmd/main.go

.PHONY: docker-build
docker-build: build
	docker build --no-cache -t $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_VERSION) . --build-arg APP_FILE=zk-init

.PHONY: docker-push
docker-push:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_VERSION)