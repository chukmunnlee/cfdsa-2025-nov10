FROM golang:1.25-bookworm AS builder

WORKDIR /src

COPY go.* .
COPY main.go .

RUN go get && go build -o main main.go

FROM debian:bookworm

WORKDIR /app

# instaLL curl
RUN apt update && apt install -y curl

COPY --from=builder /src/main .
COPY public public
COPY templates templates

ENV PORT=5000 INSTANCE_NAME="dov-bear"

HEALTHCHECK --interval=30s --timeout=3s --start-period=15s --retries=3 \
   CMD curl localhost:${PORT}/healthz || exit 1

EXPOSE ${PORT}

ENTRYPOINT /app/main