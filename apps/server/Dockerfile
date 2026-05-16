FROM rust:1.82-slim AS builder

WORKDIR /app
COPY Cargo.toml ./
COPY src ./src
RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /app
COPY --from=builder /app/target/release/ichi8-server /usr/local/bin/ichi8-server

EXPOSE 3000

CMD ["ichi8-server"]
