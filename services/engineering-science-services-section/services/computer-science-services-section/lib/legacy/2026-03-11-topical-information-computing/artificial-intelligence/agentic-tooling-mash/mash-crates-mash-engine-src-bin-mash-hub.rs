//! `mash-hub` — standalone MASH hub process.
//!
//! The hub owns the repository-local predication substrate, listens
//! on a Unix-domain socket, replays/appends the `.mash/` event log,
//! and accepts agent/port clients.
//!
//! # Configuration
//!
//! - `MASH_SOCKET` — socket path. Default `.mash/sock`.
//! - `MASH_ROOT` — runtime state directory. Default `.mash`.

use std::path::PathBuf;

use anyhow::{Context, Result};
use mash_engine::hub::{run, Config};
use tracing_subscriber::EnvFilter;

#[tokio::main]
async fn main() -> Result<()> {
    tracing_subscriber::fmt()
        .with_env_filter(
            EnvFilter::try_from_default_env().unwrap_or_else(|_| EnvFilter::new("info")),
        )
        .init();

    let mash_root =
        std::env::var_os("MASH_ROOT").map_or_else(|| PathBuf::from(".mash"), PathBuf::from);
    let socket_path =
        std::env::var_os("MASH_SOCKET").map_or_else(|| mash_root.join("sock"), PathBuf::from);

    run(Config {
        socket_path,
        mash_root,
    })
    .await
    .context("run mash hub")
}
