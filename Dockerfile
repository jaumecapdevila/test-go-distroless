FROM golang:alpine as build
WORKDIR /go/src/app
COPY . .
RUN go get -d -v ./...
RUN go build -o /go/bin/app main.go

FROM gcr.io/distroless/base
COPY --from=build /go/bin/app /
CMD ["/app"]
