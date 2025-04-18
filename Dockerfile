FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY go/ .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=builder /app/main .
CMD ["./main"] 