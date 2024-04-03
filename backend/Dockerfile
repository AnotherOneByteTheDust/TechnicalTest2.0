FROM golang:1.22.1 as build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /bin/technicaltest_api ./main.go

FROM scratch
COPY --from=build /bin/technicaltest_api /bin/technicaltest_api

EXPOSE 8555
CMD ["/bin/technicaltest_api"]