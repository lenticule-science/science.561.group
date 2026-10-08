---
type: concept
class: substrate-operation-pattern
status: sketch
depends-on: [closure-rule-system, predication-cell, knowledge-order, event-log]
see-also: [non-monotonic-extensions, assertion-monotonicity, epistemic-closure]
title: Reified retraction
description: The substrate-level pattern by which a retraction of a prior assertion is itself recorded as a substrate cell — a meta-predication — and the substrate's effective state is derived by a closure rule that reads the history of assertions and…
---

# Reified retraction

The substrate-level pattern by which a *retraction* of a prior assertion is itself recorded as a substrate cell — a meta-predication — and the substrate's effective state is derived by a closure rule that reads the history of assertions and retractions together. This preserves [assertion monotonicity](assertion-monotonicity.md) at the cell level while admitting non-monotone behaviour at the derived effective-state level.

## The pattern

For a substrate cell $c = (s, p, o)$, an asserted value $\alpha \in \mathbf{L}^\bowtie$, a source $\sigma$, and a substrate timestamp $\tau$:

- **Assertion event** $\mathrm{asserted}(c, \alpha, \sigma, \tau)$ is a substrate cell that records the assertion as a fact (in a meta-scope governing the substrate's history).
- **Retraction event** $\mathrm{retracted}(c, \sigma, \tau)$ is a substrate cell that records the source's withdrawal of its assertion at time $\tau$.
- **Effective state** $\mathrm{effective}(c, v)$ is a derived cell whose value is the *closure* of all assertion-events on $c$ minus the closure of all retraction-events on $c$ from the same sources, where "minus" is value-domain-specific (subtraction in $\mathbf{2}$, partial-order-meet in lattice value-domains).

The closure rules driving the derivation:
$$\mathrm{asserted}(c, \alpha, \sigma, \tau_1) \;\wedge\; \neg \exists \tau_2 > \tau_1.\, \mathrm{retracted}(c, \sigma, \tau_2) \;\Rightarrow\; \mathrm{contributes}(c, \sigma, \alpha)$$
$$\mathrm{effective}(c, v) \;\equiv\; v = \bigvee_{\sigma}\, \{\alpha \mid \mathrm{contributes}(c, \sigma, \alpha)\}$$

## Properties

**(R1) Cell-level monotonicity preserved.** No substrate cell is ever deleted, modified, or backdated. Every assertion and retraction is a fresh cell appended to the substrate's increment sequence; the substrate's [event log](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/event-log.md) records all of them.

**(R2) Effective-state non-monotonicity admitted.** The derived `effective` predicate is not monotone in the substrate's history — adding a retraction-event after an assertion-event causes the derived `effective` to *decrease* in $\leq_k$. This is the non-monotone behaviour working knowledge systems need.

**(R3) Source-attributed.** Retraction is per-source: source $\sigma$ can retract its own assertion of $c$, but cannot retract another source's assertion. Cross-source contestation (one source asserts $c$ as $t$, another asserts $c$ as $f$) produces $\top$-on-effective by the bilattice's $\vee_k$ — preserving the contestation discipline.

**(R4) Replayable.** The substrate's event log fully determines the effective state at any past time. The pattern produces a *time-indexed* effective-state function, supporting "what did the system know at time $\tau$?" queries.

**(R5) Regime-stable.** The closure rules above are Scott-continuous — Datalog with negation-as-failure on the existence of a later retraction, which is a guarded universal quantification over a finite set of timestamps per cell. Adding the pattern to a Scott-continuous substrate keeps the substrate Scott-continuous. (Promotion to higher regimes only happens if defaults or paradigm-versioning are added on top; see [non-monotonic-extensions](../../documents/articles/learning-articles/questions/non-monotonic-extensions.md).)

**(R6) AGM-postulate-realising.** The AGM postulates for belief revision (success, inclusion, vacuity, consistency, extensionality, recovery) hold for the derived `effective` projection under standard interpretations. *Recovery* — "retracting and re-asserting a proposition equals just asserting it" — is automatic because the closure rules read only the latest event per source.

## Comparison to the upstream literature

The pattern corresponds structurally to:

- **AGM belief revision** (Alchourrón, Gärdenfors, Makinson 1985) — but reified, with the revision process itself recorded on the substrate rather than computed externally.
- **Datalog with stratified negation** (Apt, Blair, Walker 1988; Van Gelder et al. 1991) — but with negation expressed as the absence of a temporally-later retraction-event rather than the absence of a derivation.
- **Versioning systems** (Codd 1979; bitemporal databases) — but the version dimension is a substrate cell rather than an external schema.
- **Append-only event-sourced systems** (Fowler "Event Sourcing", Kafka log-compaction) — the engineering pattern reified-retraction implements on the substrate.

The pattern is the predicated framing's principled answer to the broader question, in [non-monotonic-extensions](../../documents/articles/learning-articles/questions/non-monotonic-extensions.md), of how to admit non-monotonicity without breaking substrate-level discipline. It is one of three candidate disciplines named there; this concept names the candidate as a substrate-level pattern worth its own atomic entry.

## Status: sketch

`status: sketch` because the pattern is the working hypothesis of the [non-monotonic-extensions](../../documents/articles/learning-articles/questions/non-monotonic-extensions.md) question; its full development as a substrate primitive (with corresponding theorems on AGM-conformance, regime-preservation under composition with defaults, and federation-of-effective-state across scopes with independent retraction-events) remains future work.
