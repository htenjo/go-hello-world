# A common hello-world in Golang

## Go commands
``` bash
# Create a module to work
$ go mod init <your_project_path_to_be_imported>

# Run the program 
$ go run main.go

# Build a binary
$ go build main.go -o <bin/fileName>

# Install a Program
# Similar to build but moving the file to $GOPATH/bin
$ go install
```

## Docker commands
``` bash
# Building the golang docker image
$ docker build --tag <your_image_tag> .

# docker run <your_image_tag>
```

## Make commands
``` bash
# Building the project
$ make build

# Pushing the docker image to the registry
$ make push
```


## References
- [Docker & Makefiles](https://earthly.dev/blog/docker-and-makefiles/)
