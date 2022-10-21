DOCKER_USERNAME ?= htenjo
APP_NAME ?= go-hello-world
GIT_HASH ?= $(shell git log --format="%h" -n 1)

build:
	docker build --tag ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH} .

push:
	docker push ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH}

release:
	docker pull ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH}
	docker tag  ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH} ${DOCKER_USERNAME}/${APP_NAME}:latest
	docker push ${DOCKER_USERNAME}/${APP_NAME}:latest