FROM golang:1-alpine AS builder

RUN mkdir /app

ADD . /app/

WORKDIR /app

RUN go build -o hello .

FROM alpine:latest

RUN mkdir /app

WORKDIR /app

COPY --from=builder /app/hello .

ENTRYPOINT ["/app/hello"]
