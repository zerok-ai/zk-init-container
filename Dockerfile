FROM golang:1.19-alpine

WORKDIR /app
COPY cmd/main.go .

RUN go build -o app .

CMD ["./app"]
