---
type: concept
class: agent
status: sketch
depends-on: [agent, session, scope, runbook, bratman1987, rao-georgeff1995]
see-also: [practical-reasoning-as-runbook-execution, belief-base-as-fiber-restriction, plan-body-as-runbook, intention-is-session-fiber-commitment]
title: Intention as scope-bounded commitment
description: "The platform's reformulation of the intention construct from Bratman (1987) and the BDI architecture (Rao–Georgeff (1995)): an agent's intention is realized as a substrate predication recording a scope-bounded commitment — a commitment to…"
---

# Intention as scope-bounded commitment

The platform's reformulation of the *intention* construct from [Bratman (1987)](../bratman1987/bratman1987.md) and the BDI architecture ([Rao–Georgeff (1995)](../rao-georgeff1995/rao-georgeff1995.md)): an agent's intention is realized as a substrate predication recording a *scope-bounded commitment* — a commitment to execute a particular [runbook](runbook.md) within the lifetime of a particular [session](session.md) or [scope](../../scope/scope.md), with the commitment's persistence determined by the substrate's session and scope discipline.

The classical view (per Bratman): an intention is a distinct mental state with four functional roles — (1) *settles* what the agent is committed to doing, foreclosing further deliberation about alternatives; (2) is *partial* — leaves means and timing open for further planning; (3) is *conduct-controlling* — directs further reasoning and action toward the intention's realization; (4) is subject to *consistency and coherence norms* that beliefs and desires alone are not.
BDI architectures realize intentions as a separate data structure (the intention set), updated through deliberation (adopt new intentions, drop achieved or impossible ones), with an explicit *commitment policy* (blind, single-minded, open-minded) governing intention persistence.

The platform's reformulation: an intention is a substrate predication on the agent's session, with the four functional roles realized through substrate operators rather than through a separate intention-set data structure.

- **Settles deliberation** ↔ the runbook commitment forecloses dispatch's reconsideration of alternative runbooks within the session's scope.
  While the runbook is in progress, the agent's tick advances the runbook rather than re-running unconstrained dispatch from scratch.
  Re-deliberation requires an explicit substrate event admitting a new intention or retracting the current one.
- **Partial** ↔ runbook structure: the intention commits to the runbook's overall procedure but leaves per-step parameters and intermediate decisions open for runtime resolution by substrate-content rules and by the agent's tick-time dispatch.
- **Conduct-controlling** ↔ dispatch's ranking is biased toward the runbook in progress.
  Skills relevant to the active runbook step are ranked higher; substrate state changes are interpreted with the runbook's continuation as the deliberation context.
- **Consistency norms** ↔ substrate-level [governance](governance.md) and [authorization](../../governance/authorization/authorization.md) checks.
  An intention that would violate substrate-recorded governance is filtered out at dispatch time, before adoption.
  The substrate enforces consistency between intentions and the agent's authorization fiber rather than between intentions through a separately-implemented coherence procedure.

The *scope-bounded* qualifier names the platform-specific commitment-persistence discipline: an intention's persistence is bounded by the session or scope to which it is attached.
A session-bounded intention persists until the session closes; a scope-bounded intention persists until the scope closes; an agent-bounded intention (one attached to the agent rather than a session) persists across sessions until explicitly retracted.
The commitment-policy choice (blind / single-minded / open-minded) becomes the choice of which substrate scope the intention is attached to:

- *Blind commitment* ≈ session-bounded intention with no retraction allowed during the session — the agent pursues the intention until the session closes regardless of belief change.
- *Single-minded commitment* ≈ session-bounded intention with retraction allowed only on belief that the goal is achieved or impossible (a substrate-content condition checked at each tick).
- *Open-minded commitment* ≈ session-bounded intention with retraction allowed on belief that the *motivating reasons* still hold (a substrate-content reason-tracking discipline).

Three engineering consequences:

- **Intentions are auditable.** Each intention adoption, retraction, and execution step produces witnesses.
  An auditor reading the witness chain reconstructs the agent's intention history.
- **Intentions compose with federation.** A federated agent's intentions are visible across substrates that share the agent's session scope.
  Distributed agent coordination through shared intentions is substrate-content rather than separate-protocol.
- **Intentions integrate with governance.** A governance rule that prohibits a runbook becomes an authorization filter at dispatch; intentions are checkable against governance at adoption time.

The concept is *sketch* status: it names the relationship between Bratman's intention-as-distinct-mental-state and the substrate's session/scope/runbook discipline so the [upstream-synthesis-bridges](../../upstream-synthesis-bridges/upstream-synthesis-bridges.md) and [upstream-classical-mas](../../upstream-classical-mas/upstream-classical-mas.md) narratives have an atomized referent.
The platform does not commit to a metaphysics of mental states; it commits only to a substrate-content vocabulary that gives intentions Bratman's four functional roles through substrate operators.
