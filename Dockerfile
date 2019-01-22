FROM golang:1.9.2
WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build .

FROM scratch
COPY --from=0 /app/app .
ENTRYPOINT ["/app"]
