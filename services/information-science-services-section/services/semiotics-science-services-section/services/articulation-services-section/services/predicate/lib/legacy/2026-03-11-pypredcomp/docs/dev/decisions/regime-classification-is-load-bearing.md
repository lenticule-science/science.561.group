---
title: "Regime classification is load-bearing"
description: "Every closure-rule system declares its regime (strict / Scott-continuous / transfinite-bounded / aperiodic). The regime determines the engine's fuel envelope, the audit discipline, the federation discipline, and the snapshot discipline. Misdeclared regimes are non-conformant; mixed-regime federation must scope to a compatible prefix."
kind: decision
date: "2026-05-02"
status: committed
---

# Regime classification is load-bearing

## What

Every conformant predicated computer falls into exactly one of four *regimes*, classified by the closure ordinal of its closure-driven settling:

| Regime | Rule-language | Base | $\kappa$ | Engineering envelope |
|---|---|---|---|---|
| **Strict** | quantifier-free | finite | $< \omega$ | finite fuel, $H^1$-trivial, endpoint federation |
| **Scott-continuous** | quantifier-free | at least one infinite | $= \omega$ | finite-prefix fuel, $H^1$-trivial, prefix federation |
| **Transfinite-bounded** | with $\forall$-blocks | countable cofinality | $\omega < \kappa < \omega_1$ | transfinite fuel, $H^1$-firing-ordinal-indexed, trajectory federation |
| **Aperiodic** | with $\forall$-blocks | cofinality $\geq \omega_1$ | $\geq \omega_1$ | uncountable or scoped fuel, $H^1$-direct-limit, truncation-trajectory federation |

The classification is *exclusive* (no substrate falls into two) and *exhaustive* (every conformant substrate falls into one).
The OS declares its regime via a `regime-record` substrate cell and inherits the per-regime engineering envelope:

- **Engine fuel discipline.** Strict and Scott-continuous regimes bound per-cascade fuel finitely (or per finite prefix); transfinite-bounded regimes admit transfinite stage iteration with countable-cofinality termination; aperiodic regimes either admit uncountable stage iteration or scope to a transfinite-bounded prefix.
- **Audit discipline.** Strict and Scott-continuous regimes have $H^1 = 0$ on the inconsistency sheaf, so audit reduces to $H^0$-counts of $\top$-cells; transfinite-bounded regimes audit by enumerating $H^1$-class generators indexed by non-Scott-continuous firing ordinal; aperiodic regimes assemble $H^1$ via direct limit of countable-truncation $H^1$s.
- **Federation discipline.** Strict and Scott-continuous regimes ship endpoint state; transfinite-bounded and aperiodic regimes ship trajectory (the firing-ordinal pattern), or scope federation traffic to a Scott-continuous prefix.
- **Snapshot discipline.** Strict and Scott-continuous regimes use endpoint-only snapshots; transfinite-bounded regimes record the firing-ordinal pattern up to the snapshot ordinal; aperiodic regimes snapshot at countable truncations.

The v0.2 substrate is *strict* by default — finite value-domain ($\mathbf{L} = \{\bot, t, f, \top\}$), finite live entity set, quantifier-free closure rules.
The engine's fuel envelope is finite; audit reduces to $H^0$; federation between v0.2 substrates ships endpoint state; snapshots are endpoint-only.
Closure rules introducing $\forall$-blocks over infinite ranges, or rule systems whose entity set has unbounded growth, escalate the regime declaration and pull in the corresponding envelope.

Per [`predicated-computing/theorems/regime-classification-for-substrate`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/regime-classification-for-substrate.md).
The four per-regime engineering envelopes are theorems: [`strict-regime-engineering-envelope`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/strict-regime-engineering-envelope.md), [`scott-continuous-regime-engineering-envelope`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/scott-continuous-regime-engineering-envelope.md), [`transfinite-bounded-regime-engineering-envelope`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/transfinite-bounded-regime-engineering-envelope.md), [`aperiodic-regime-engineering-envelope`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/aperiodic-regime-engineering-envelope.md).

## Why

v0.2 currently treats fuel as a chosen number ("16 layers", "256 MB", "100 rps") and audit as an open-ended observability surface.
Both are choices the substrate can make freely *only* in the strict regime; in the other regimes the math forces structural commitments.
Without a regime declaration, the substrate cannot know what it is allowed to assume:

- A substrate with $\forall$-block rules but a finite-only fuel policy *aborts* at the first non-Scott-continuous firing ordinal, producing partial settlement that is silently incorrect — per the four-regime dichotomy, no countable-stage termination is admissible there.
- A transfinite-bounded substrate that ships endpoint state across federation silently *drops* $H^1$-classes — the federated substrate's audit cohomology has the wrong signature, and downstream attack-pattern detection is broken without warning.
- An aperiodic substrate with endpoint-only snapshots *cannot replay* — subsequent settle invocations may produce different $H^1$-classes than the original run, breaking [`snapshot-replay-fidelity`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/snapshot-replay-fidelity.md).

These are not theoretical concerns. v0.2's plan touches drivers, federation, multi-user, scheduling, packaging, and observability — every one of which depends on the engine's settlement envelope being correct.
By making regime declaration substrate content (per the `regime-record` object), every subsystem can query the regime and configure its discipline accordingly: the heartbeat picks its fuel envelope, the audit panel picks its cohomology routine, the federation handshake picks endpoint-vs-trajectory shipping, the snapshot policy picks endpoint-vs-firing-ordinal-pattern recording.

The strict-regime default for v0.2 is a *deliberate* simplification, not a default-by-omission.
The substrate's content is currently finite ($\mathbf{L}$ finite, live entity set bounded by the captain's universe of interest); rules are quantifier-free; the closure ordinal is finite.
The strict envelope applies — the engine is $\omega$-bounded, audit is polynomial, federation is endpoint-shipped, snapshots are endpoint-only.
Most relational databases, finite TBoxes, finite Kripke frames live here.
The OS's classical-computing comfort zone is exactly this regime, and saying so explicitly lets v0.2's implementation skip the trajectory machinery without it being a hidden assumption.

The escalation path is explicit.
If a future v0.x deployment introduces $\forall$-block rules (e.g., "for all peers, a quorum agreement is required" as a single rule rather than as a conjunction over named peers), the regime escalates to transfinite-bounded; the rule-language fragment field on the rule system fires the regime change, and dependent subsystems pick up trajectory-aware discipline.
The escalation is content, not code rewrite.

This decision also coheres with [decisions/cost-is-lawvere-quantale.md](cost-is-lawvere-quantale.md): the cost forecasting bound depends on the closure ordinal, which depends on the regime.
Strict-regime substrates have polynomial cost in finite-base size; Scott-continuous substrates have polynomial cost per finite prefix; transfinite-bounded substrates have transfinite-firing-ordinal-indexed cost.
The cost discipline is *complete* only when the regime is declared.

Source: `predicated-computing/theorems/regime-classification-for-substrate` (proved); the four per-regime engineering envelope theorems (proved); `predicated-computing/objects/regime-record`; `predication-categories/theorems/four-regime-dichotomy` (the underlying math result).

## What it rules out

- **Misdeclared regimes.** A substrate with $\forall$-block rules declaring `regime: strict` is non-conformant — its rule language doesn't match its declaration.
  Per `rule-language-realizability-determines-regime`, the rule-language fragment forces the regime; misdeclaration is a substrate error caught at boot.
- **Implicit fuel ceilings disagreeing with the regime.** A regime-strict substrate may have any finite fuel budget; a regime-scott-continuous substrate must budget per finite prefix; a regime-transfinite-bounded substrate must admit transfinite stages or refuse such respond invocations explicitly.
- **Cross-regime federation without prefix scoping.** A transfinite-bounded substrate cannot ship endpoint state to a strict peer that expects to consume it as endpoint state — the receiver loses $H^1$-content.
  Either the transfinite peer scopes to a Scott-continuous prefix or both peers ship trajectory.
- **Audit machinery that ignores the regime.** A strict-regime substrate's audit panel does not enumerate $H^1$-classes (always empty); a transfinite-bounded substrate's audit panel must.
  The audit code path is regime-determined, not free-form.
- **Snapshot policies inconsistent with the regime.** Endpoint-only snapshots are correct only for strict / Scott-continuous regimes; for transfinite regimes they violate replay fidelity.
- **Promoting a substrate's regime without re-deriving content.** Going from strict to transfinite-bounded by adding $\forall$-block rules requires the substrate to honestly run the new rules, possibly producing additional $H^1$-classes that must be audited; the promotion is not a frontmatter edit.

## What it does not constrain

- **The wire shape of `regime-record`.** This decision asserts the regime is substrate content; the wire shape (predicates, value encoding, location under `boot/`) is v0.2 *implementation* work and is not specified here.
- **The default regime for v0.2.** The default is strict per the rationale above; deployments may declare a different regime as content.
  This is not a structural commitment to strict-only.
- **Whether to surface the regime to the user.** v0.2 may expose it in the admin dashboard, in `regime` shell commands, or only in the substrate's content; this is implementation choice.
- **The audit-cohomology-bound for aperiodic substrates.** Aperiodic substrates declare an audit-cohomology-bound at deployment; the bound choice is not specified here.
- **Mixed-regime federation policy details.** This decision says mixed-regime federation must scope to a compatible prefix; the specific scoping mechanism (predicate filters, scope cells, federation-handshake negotiation) is implementation work.
- **Future regime refinements.** The four-regime classification is exhaustive over the closure ordinal; future refinements within a regime (e.g., distinguishing "strict with $|\mathbf{L}| \le 4$" for the bilattice case from "strict with arbitrary finite $\mathbf{L}$") are sub-regime structure, not new regimes.
