FROM golang:1.17.0

WORKDIR /usr/src/app
COPY go.mod .
COPY main.go .
RUN go mod tidy

RUN go build -o hello-app

ENV EXPORTER_ENDPOINT=fleet-server:8200

EXPOSE 8888

ENTRYPOINT [ "/usr/src/app/hello-app" ]
