FROM golang:1.19-bullseye
 
WORKDIR /app
 
COPY go.mod ./
COPY main.go ./
 
RUN go build -o /hello-world
 
CMD ["/hello-world"]