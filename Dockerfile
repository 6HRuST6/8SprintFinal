FROM golang:1.24 

WORKDIR /app

COPY go.mod go.sum ./ 
RUN go mod download 

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app . 

CMD ["./app"]

# https://hub.docker.com/repository/docker/6hrust6/8sprintfinal/general