//! 561 OS kernel port — hosts core in-substrate projection services.
//!
//! This process is not the hub and not an external effector. It is
//! the local agentic-orchestration kernel: it subscribes to settled
//! cells, runs the stateful projection ports that make governance,
//! dispatch, and storage close over time, and witnesses their output
//! back into the hub.
//!
//! # Configuration
//!
//! - `MASH_SOCKET` — hub socket path. Default `.mash/sock`.

use std::collections::BTreeSet;
use std::path::PathBuf;

use anyhow::{Context, Result};
use mash_engine::algebra::Value;
use mash_engine::sdk::agent::Projection;
use mash_engine::sdk::client::{ClientConfig, Connection, InboundEvent};
use tracing::{info, warn};
use tracing_subscriber::EnvFilter;

use mash_library::operation::capability::CapabilityResolverPort;
use mash_library::projection::dispatch_selector::SelectorPort;
use mash_library::projection::duty_bridge::DutyBridge;
use mash_library::projection::task_dispatch::TaskDispatchPort;
use mash_library::storage::{FileCounitPort, FileEnsemblePort};

struct HostedProjection {
    subscriptions: BTreeSet<String>,
    projection: Box<dyn Projection>,
}

impl HostedProjection {
    fn new<P: Projection + 'static>(projection: P) -> Self {
        Self {
            subscriptions: projection.subscriptions().into_iter().collect(),
            projection: Box::new(projection),
        }
    }

    fn subscribes_to(&self, predicate: &str) -> bool {
        self.subscriptions.contains(predicate)
    }
}

#[tokio::main]
async fn main() -> Result<()> {
    tracing_subscriber::fmt()
        .with_env_filter(
            EnvFilter::try_from_default_env().unwrap_or_else(|_| EnvFilter::new("info")),
        )
        .init();

    let mut projections = core_projections();
    let subscriptions = union_subscriptions(&projections);

    let socket_path =
        std::env::var_os("MASH_SOCKET").map_or_else(|| PathBuf::from(".mash/sock"), PathBuf::from);
    let client = ClientConfig {
        socket_path,
        identity: "mash-os-kernel".to_owned(),
        version: env!("CARGO_PKG_VERSION").to_owned(),
        subscriptions,
    };
    let mut connection = Connection::open(client)
        .await
        .context("open hub connection")?;
    let handle = connection.handle();
    handle.witness_port_ready("runtime-process:561-os-kernel");
    handle.witness_port_ready_at("runtime-process:561-os-kernel");
    info!(
        hub_session = connection.session(),
        projections = projections.len(),
        "mash-os-kernel ready"
    );

    while let Some(event) = connection.next_event_or_shutdown().await {
        match event {
            InboundEvent::Settled { claim, .. } => {
                let value = claim.value;
                if value == Value::None {
                    continue;
                }
                for hosted in &mut projections {
                    if !hosted.subscribes_to(&claim.predicate) {
                        continue;
                    }
                    for out in hosted.projection.ingest(
                        &claim.subject,
                        &claim.predicate,
                        &claim.object,
                        value,
                    ) {
                        if let Err(e) = handle.witness(out.subject, out.predicate, out.object) {
                            warn!(error = %e, "projection witness dropped");
                        }
                    }
                }
            }
            InboundEvent::HubError { code, message } => {
                handle.report_hub_error("runtime-process:561-os-kernel", &code, &message);
            }
            InboundEvent::Closed => break,
        }
    }

    handle.witness_port_stopped("runtime-process:561-os-kernel");
    handle.witness_port_stopped_at("runtime-process:561-os-kernel");
    Ok(())
}

fn core_projections() -> Vec<HostedProjection> {
    vec![
        HostedProjection::new(DutyBridge::new()),
        HostedProjection::new(TaskDispatchPort::new()),
        HostedProjection::new(CapabilityResolverPort::new()),
        HostedProjection::new(SelectorPort::new()),
        HostedProjection::new(FileEnsemblePort::new()),
        HostedProjection::new(FileCounitPort::new()),
    ]
}

fn union_subscriptions(projections: &[HostedProjection]) -> Vec<String> {
    let mut out = BTreeSet::new();
    for projection in projections {
        out.extend(projection.subscriptions.iter().cloned());
    }
    out.into_iter().collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use mash_library::governance::IS_DUTY_READY;
    use mash_library::operation::capability::REQUIRES_CAPABILITY;
    use mash_library::operation::dispatch::{CONSIDERS_OP, IS_ADMISSIBLE};
    use mash_library::operation::IS_INTENT_SET;
    use mash_library::storage::HAS_INTENDED_SHA256;

    #[test]
    fn core_kernel_subscribes_to_governance_dispatch_and_storage() {
        let projections = core_projections();
        let subscriptions = union_subscriptions(&projections);
        assert!(subscriptions.contains(&IS_DUTY_READY.to_owned()));
        assert!(subscriptions.contains(&IS_INTENT_SET.to_owned()));
        assert!(subscriptions.contains(&REQUIRES_CAPABILITY.to_owned()));
        assert!(subscriptions.contains(&CONSIDERS_OP.to_owned()));
        assert!(subscriptions.contains(&IS_ADMISSIBLE.to_owned()));
        assert!(subscriptions.contains(&HAS_INTENDED_SHA256.to_owned()));
    }
}
