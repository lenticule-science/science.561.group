---
type: morphism
status: sketch
depends-on: [jurisdiction, authority, jural-relation, operations-settling]
realizes: [jurisdictional-excess]
see-also: [jurisdictional-vires, jurisdictional-invocation, jurisdictional-declination, jurisdiction-as-base-change]
---

# Jurisdictional excess (ultra vires)

An act taken outside the operative scope of any jurisdiction that would give it normative validity — an act at $(t, a)$ such that the authority's nucleus $\sigma^A_t$ is not operative on $(t, a)$, so the act fails to propagate through the normative system.

## Definition

An act $\alpha$ by authority $A$ at $(t, a)$ is **ultra vires** (in excess of jurisdiction) iff:

$$v(\langle (t, a), \texttt{within-jurisdiction-of}, A\rangle) \neq \mathbf{t}$$

at the time of the act — the validity-condition cell is not at $\mathbf{t}$ (it is at $\bot$, $\mathbf{f}$, or $\top$).
Equivalently: $A$'s nucleus $\sigma^A_t$ is not operative on acts at $(t, a)$.

**Ultra-vires act as a dead increment.** The act $\alpha$ produces a normative increment — a cell asserting what $A$ directs within $(t, a)$ — but this increment does not propagate through the closure rules that would make it normatively binding.
The closing rules have the validity-condition cell as an antecedent; without it at $\mathbf{t}$, the rules do not fire.
The increment lands in $H_t \setminus H^{*A}_t$ — in the operations settling but outside the part that the normative system propagates.

## The excess morphism

Ultra vires is not a morphism that *performs* an act; it is the *characteristic* of an act.
The "excess morphism" is the composite:

$$\mathrm{excess}(\alpha) : \alpha \;\to\; \langle \alpha, \texttt{ultra-vires}\rangle = \mathbf{t}$$

a closure-rule firing that detects the absence of the validity-condition cell and asserts the ultra-vires flag cell.
This flag cell is itself a knowledge-order increment — audit evidence that a jurisdictional excess has occurred.

## Distinction from insubordination

An **insubordinate act** is $\alpha \in \mathcal{J}$ but $\alpha \notin Z$ — the act is within the authority's jurisdiction but outside the officer's personal scope (zone $Z$).
The act is valid within $\mathcal{J}$; the insubordination is against the officer's superiors, not against the normative system.
An **ultra-vires act** is $\alpha \notin \mathcal{J}$ entirely — it is not valid even within the authority's own jurisdiction.
The distinction tracks the level of violation: insubordination is a governance violation within a valid scope; ultra vires is a fundamental legitimacy failure.

## Paraconsistency of contested ultra-vires findings

If two governance parties disagree about whether $\alpha$ is ultra vires — one asserting the validity-condition was met, one asserting it was not — both assertions settle in the operations settling at $\mathbf{t}$ on their respective cells, producing a $\top$-state in the ultra-vires/intra-vires aggregate.
This is a [conflict-of-laws-as-beck-chevalley-failure](../theorems/conflict-of-laws-as-beck-chevalley-failure.md) condition at the jurisdictional level: two governance systems with overlapping jurisdictions disagree about the validity of an act within the overlap.
Resolution requires adjudication of the conflict; the repair-resolution poset governs the trajectory to consistency.
