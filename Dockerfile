FROM golang:1.20rc2-alpine3.17

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY app.env .
COPY Makefile .
COPY ci/certs/ certs
COPY src/ src/

RUN apk add --no-cache make

RUN go build -o main ./src/main.go

CMD ["./main"]
