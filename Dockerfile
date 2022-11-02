# Building the application
# IT'S IMPORTANT THAT BUILDER AND PROD SHARE SAME BASE OS/ARCH
FROM golang:1.19rc2-alpine AS builder
WORKDIR /app/
COPY . ./
RUN go build -o /hello-world cmd/main.go
# RUN CGO_ENABLED=0 go build -a -installsuffix cgo -o /hello-world cmd/main.go

# Creating the deployment image from the building
FROM alpine:latest AS prod
WORKDIR /app/
COPY --from=builder /hello-world ./
ENTRYPOINT ["./hello-world"]
EXPOSE 8080/tcp