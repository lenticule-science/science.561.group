//! Agent SDK for MASH.
//!
//! An **agent** is a translator: substrate events in, claims out.
//! Implement the [`Agent`] trait to add behavior; the trait's four
//! hooks ([`identity`](Agent::identity),
//! [`subscriptions`](Agent::subscriptions),
//! [`claims`](Agent::claims), [`translate`](Agent::translate)) cover
//! every agent the hub hosts — embedded owner-agents (vocabularies,
//! scenes) and subprocess ports alike.
//!
//! # Two deployment modes
//!
//! - **Embedded.** The hub constructs the agent in-process and drives
//!   it against the kernel command bus directly; `claims()` mounts
//!   before the event log replays, and `translate` runs on the hub's
//!   executor. This is how vocabulary and scene owner-agents run.
//!   Wiring lives in [`crate::hub::drive_embedded`].
//! - **Subprocess.** The agent connects to the hub over the Unix
//!   socket, handshakes, and loops. [`run_as_subprocess`] is the
//!   entry point; a typical port binary's `main` is four lines of
//!   config + `run_as_subprocess(agent, config).await`.
//!
//! # What agents must not do
//!
//! - **Hold state on `&self` beyond configuration.** If the agent
//!   "needs memory", it needs a fiber — subscribe and cache, don't
//!   mutate `self`. `&self` is `Send + Sync`; mutating it under the
//!   hub's concurrent dispatch is a hazard.
//! - **Block in `translate`.** Side-effecting ports (actuators,
//!   effectors, responders) spawn a task holding the [`Witness`]
//!   handle and return empty; the spawned task emits claims when
//!   its external work completes. Blocking in `translate` blocks
//!   the session's event stream.
//!
//! # See also
//!
//! - [`crate::sdk::client`] — the socket client: [`Witness`],
//!   [`Claim`], [`Connection`].
//! - [`crate::hub`] — how embedded agents are driven.
//! - The [agents-and-sessions chapter][manual] of the MASH manual —
//!   the concepts and rules this crate instantiates.
//!
//! [manual]: https://561.github.io/mash/explanation/architecture/agents-and-sessions.html

#![warn(missing_docs)]

use crate::algebra::Value;
use crate::inference::wire::{DerivationRecord, WireClaim};
use crate::sdk::client::{Claim, Handle, Witness};
use async_trait::async_trait;

/// A settled claim with its derivation chain.
#[derive(Debug, Clone)]
pub struct Event {
    /// The settled claim.
    pub claim: WireClaim,
    /// Derivation chain; empty for directly-witnessed claims.
    pub derivation: Vec<DerivationRecord>,
}

/// A projection-port: a stateful translator from settled cells to
/// emitted claims.
///
/// Projections differ from [`Agent`] in that they hold mutable state
/// across events — per-subject counters, cached relations, emission
/// guards — and cannot be driven from a `&self` reference. The
/// signature `ingest(&mut self, …) -> Vec<Claim>` separates decision
/// (pure, testable) from effect (witnessing back to the hub), so the
/// same type drives both subprocess production and in-process
/// [`mash_testkit`](../../mash_testkit) tests.
///
/// Implementors typically own a small state struct and pattern-match
/// on `predicate` to decide how the claim updates state and whether
/// to emit anything in response. Returning an empty vector is normal;
/// most settled cells only update caches.
pub trait Projection {
    /// The port's identity, used as the subscriptions' announce name
    /// and as the `port:<identity>` subject for in-band lifecycle
    /// cells.
    fn identity(&self) -> &str;

    /// The predicates this projection subscribes to. Called once at
    /// mount time in tests and once on connect in production.
    fn subscriptions(&self) -> Vec<String>;

    /// Ingest a settled cell on a subscribed predicate. Returns the
    /// claims to witness in response — possibly empty. Claims are
    /// always witnessed at `Value::True`; projections that need to
    /// drive other bilattice values should use [`Agent`] instead.
    fn ingest(&mut self, subject: &str, predicate: &str, object: &str, value: Value) -> Vec<Claim>;
}

/// An agent is a unit of enactment — a thing that witnesses claims
/// into the substrate. The [`enact`](Agent::enact) method is the
/// agent's act: what it does when hosted.
///
/// Every implementor acts. A closed-term agent (vocabulary, ontology,
/// theory, scene) witnesses a known set of claims and returns. An
/// open-term agent (projection in the mathematical sense — inbound
/// from external events, outbound to external media) subscribes,
/// loops on inbound events, and witnesses as events arrive. Both
/// share this trait; the difference is what `enact` does.
///
/// # Interior mutability
///
/// `&self` carries immutable configuration AND any transient I/O
/// state the agent needs (wrap mutable fields in `Arc<Mutex<_>>`).
/// The substrate is authoritative for knowledge; `&self` state
/// should be transient (sockets, tokio tasks) — never a mirror of
/// substrate cells.
#[async_trait]
pub trait Agent: Send + Sync + 'static {
    /// The agent's identifying name (e.g. `"shell-agent"`).
    fn identity(&self) -> &'static str {
        "agent"
    }

    /// Predicates to subscribe to on connect. Legacy surface retained
    /// while the trait is being unified; override [`enact`](Agent::enact)
    /// directly for new agents and call `handle.subscribe` inside.
    fn subscriptions(&self) -> &'static [&'static str] {
        &[]
    }

    /// Claims the agent declares when hosted. Legacy surface — new
    /// agents should witness directly in [`enact`](Agent::enact).
    /// Kept so existing owner-agents (vocabularies, scenes) continue
    /// to work unchanged through the default `enact` body.
    fn claims(&self) -> Vec<Claim> {
        Vec::new()
    }

    /// Claims to witness once after handshake. Legacy surface — use
    /// [`enact`](Agent::enact) directly for new agents.
    fn startup_claims(&self) -> Vec<Claim> {
        Vec::new()
    }

    /// Translate an event into claims. Legacy surface — new agents
    /// drive their event loops inside [`enact`](Agent::enact).
    async fn translate(&self, _event: Event, _witness: Witness) -> Vec<Claim> {
        Vec::new()
    }

    /// Enact the agent: the agent's act. Default body witnesses
    /// [`startup_claims`](Agent::startup_claims) through the handle
    /// and returns. Intentionally does NOT witness
    /// [`claims`](Agent::claims) — those are mounted into the
    /// substrate directly by the hub at boot (bypassing the event
    /// log) and re-witnessing them here would grow the log on every
    /// restart. This preserves the split the legacy hook set
    /// encoded.
    ///
    /// Override this for any agent whose act exceeds "declare a
    /// fixed claim-set." Projections subscribe via
    /// `handle.subscribe`, open their I/O, and loop until shutdown.
    async fn enact(&self, handle: Handle) {
        for claim in self.startup_claims() {
            let _ = handle.witness(claim.subject, claim.predicate, claim.object);
        }
    }
}
