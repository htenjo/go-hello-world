DOCKER_USERNAME ?= htenjo
APP_NAME ?= go-hello-world
GIT_HASH ?= $(shell git log --format="%h" -n 1)

docker_build:
	docker build --tag ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH} .

docker_push:
	docker push ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH}

docker_release:
	docker pull ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH}
	docker tag  ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH} ${DOCKER_USERNAME}/${APP_NAME}:latest
	docker push ${DOCKER_USERNAME}/${APP_NAME}:latest

build:
	go build -o main .
	mv main bin/