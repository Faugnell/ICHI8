use std::{env, net::SocketAddr};

use axum::{routing::get, Json, Router};
use serde::Serialize;

mod models;

#[tokio::main]
async fn main() {
    tracing_subscriber::fmt()
        .with_env_filter(
            tracing_subscriber::EnvFilter::try_from_default_env()
                .unwrap_or_else(|_| "ichi8_server=info,tower_http=info".into()),
        )
        .init();

    let host = env::var("SERVER_HOST").unwrap_or_else(|_| "127.0.0.1".to_string());
    let port = env::var("SERVER_PORT")
        .ok()
        .and_then(|value| value.parse::<u16>().ok())
        .unwrap_or(3000);

    let app = Router::new().route("/health", get(health));
    let addr: SocketAddr = format!("{host}:{port}")
        .parse()
        .expect("SERVER_HOST and SERVER_PORT must form a valid socket address");

    let listener = tokio::net::TcpListener::bind(addr)
        .await
        .expect("failed to bind HTTP listener");

    tracing::info!("ICHI8 server listening on {addr}");

    axum::serve(listener, app)
        .await
        .expect("server stopped unexpectedly");
}

async fn health() -> Json<HealthResponse> {
    Json(HealthResponse { status: "ok" })
}

#[derive(Serialize)]
struct HealthResponse {
    status: &'static str,
}
