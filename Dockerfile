FROM golang:1.17.6-alpine3.15 as builder

# add git
RUN apk update && apk add --no-cache git

WORKDIR /app

COPY .   .

RUN go mod tidy

# build build
RUN go build -o binary

ENTRYPOINT ["/app/binary"]