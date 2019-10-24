FROM golang:alpine as build
WORKDIR /go/src/app
COPY . .
RUN go build -o /go/bin/app main.go

FROM gcr.io/distroless/base-debian10
COPY --from=build /go/bin/app /
CMD ["/app"]
