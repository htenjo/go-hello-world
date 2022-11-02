DOCKER_USERNAME ?= htenjo
APP_NAME ?= go-hello-world
GIT_HASH ?= $(shell git log --format="%h" -n 1)

build:
	go build ./cmd/main.go
	mv main bin/
run:
	go run ./cmd/main.go

docker_build:
	docker build --tag ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH} --tag ${DOCKER_USERNAME}/${APP_NAME}:latest .

docker_run:
	docker run -p 8080:8080 ${DOCKER_USERNAME}/${APP_NAME}
	
docker_build_run: docker_build docker_run

docker_push:
	docker push ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH}

docker_release:
	docker pull ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH}
	docker tag  ${DOCKER_USERNAME}/${APP_NAME}:${GIT_HASH} ${DOCKER_USERNAME}/${APP_NAME}:latest
	docker push ${DOCKER_USERNAME}/${APP_NAME}:latest