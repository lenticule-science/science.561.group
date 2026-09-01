---
type: theorem
class: engineering-claim
status: proved
depends-on: [substrate-accessibility-relation, governance-as-modal-restriction, trust-boundary-modal-validity, federation-trust-bilattice-graded, capability-non-amplification, authentication-as-modal-restriction, agent-self-queueing-bounded-by-modal-restriction, modal-necessity-operator, modal-necessity-basic-properties, governance-decision-modal-decidability]
see-also: [substrate-runtime-as-closure-driven-settling, principal-session, substrate-operations-are-bigraded-modal]
---

# Modal restriction is the substrate's single authorization primitive, at multiple engineering surfaces

**Claim.** The substrate's authorization machinery — governance authority, trust-boundary admission, federation peer trust, call-graph capability, user-session capability, agent self-queueing capability — is *structurally one phenomenon*: the [modal necessity operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_R$ applied to the substrate's [predication fiber-algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), with $R$ being the substrate's single [bilattice accessibility relation](teaching/explanations/substrate-accessibility-relation.md). The six engineering surfaces — each with its own grounding theorem — apply $\Box_R$ to *different sub-regions of the same $R$* on *different fiber-algebras*, but the modal calculus, the structural properties (non-amplification, decidability, monotonicity), and the substrate-content discipline are uniform across all surfaces.

## Why this holds

Six PredComp theorems each apply $\Box_R$ to authorization:

1. **[governance-as-modal-restriction](theories/agential-orchestration-platform/theorems/governance-as-modal-restriction.md)** — $\Box_R$ on the agent's capability fiber, $R$ indexed by (office, agent) worlds.
2. **[trust-boundary-modal-validity](trust-boundary-modal-validity.md)** — $\Box_R$ on the substrate's content-admission fiber, $R$ indexed by (interior, exterior) worlds.
3. **[federation-trust-bilattice-graded](federation-trust-bilattice-graded.md)** — $\Box_R$ on the federation peer's capability fiber, $R$ indexed by (peer, peer) worlds.
4. **[capability-non-amplification](theories/functional-runtime-platform/theorems/capability-non-amplification.md)** — $\Box_R$ on the function call-graph's capability fiber, $R$ indexed by (caller, callee) worlds.
5. **[authentication-as-modal-restriction](theories/interactive-application-platform/theorems/authentication-as-modal-restriction.md)** — $\Box_R$ on the account's capability fiber, $R$ indexed by (account, user-agent) worlds.
6. **[agent-self-queueing-bounded-by-modal-restriction](agent-self-queueing-bounded-by-modal-restriction.md)** — $\Box_R$ on the agent's capability fiber, $R$ indexed by (agent, agent) worlds (self-edges).

Per [substrate-accessibility-relation](teaching/explanations/substrate-accessibility-relation.md), $R$ is *one substrate-content object* — six accessibility cells indexed by different world-pair types, all in the same relation. Per [modal-necessity-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md), $\Box_R$ is *one operator* — same definition, applied to whichever fiber the surface needs.

The structural properties of $\Box_R$ — established once per [modal-necessity-basic-properties](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/modal-necessity-basic-properties.md) — apply uniformly:

- **Truth-meet preservation** ($\Box_R(u \wedge_t u') = \Box_R u \wedge_t \Box_R u'$) — composing authorization checks via $\wedge_t$ commutes with the modal restriction.
- **Constant-true preservation** ($\Box_R \mathbf{t} = \mathbf{t}$) — full authority survives modal restriction along trivial accessibility.
- **Implication preservation** — strong-implication composition with $R$ is the structural admission rule.

These hold at every surface — they're properties of $\Box_R$ as a mathematical operator, not facts re-derived per surface.

## Engineering consequence

- **One authorization machinery.** A substrate that implements $\Box_R$ once *gets all six surfaces*. Implementations don't write six authorization checkers (governance-checker, federation-checker, auth-checker, etc.); they write one $\Box_R$ evaluator and parameterize it by which sub-region of $R$ each surface needs.
- **Authorization composes structurally.** A user authenticates (surface 5) producing a session-capability that bounds the agent the user runs (surface 6) which spawns a function call (surface 4) that crosses a federation boundary (surface 3) into a region governed by an authority (surface 1) over a trust-boundary (surface 2). The composed authorization is the composition of six $\Box_R$ applications — and per [capability-non-amplification](theories/functional-runtime-platform/theorems/capability-non-amplification.md), the composition is non-amplifying. The end-of-chain capability is bounded by the weakest grade in the chain.
- **Authorization is decidable end-to-end.** Per [governance-decision-modal-decidability](governance-decision-modal-decidability.md), every $\Box_R$ evaluation terminates in PSPACE. Per the theorem, the composed authorization across six surfaces is a finite chain of $\Box_R$ evaluations — also decidable in PSPACE (with the bound depending on chain length).
- **Federation extends each surface.** Per [federation-trust-bilattice-graded](federation-trust-bilattice-graded.md), federation contributes its own $R$ sub-region; per the theorem, federation's $R$ composes with the local $R$ at every other surface. Cross-substrate authorization is structurally well-defined at each surface.
- **Audit captures authorization at every surface.** Per [witness-chain-as-proof-object](witness-chain-as-proof-object.md), every $\Box_R$ evaluation produces a witness; the audit chain records authorization decisions at every surface uniformly.

## Implementation simplification

This theorem dissolves what looks like a complex authorization architecture into one mechanism:

- One accessibility relation $R$ (per [substrate-accessibility-relation](teaching/explanations/substrate-accessibility-relation.md)).
- One modal operator $\Box_R$.
- One PSPACE-decidable evaluation procedure (per [governance-decision-modal-decidability](governance-decision-modal-decidability.md)).
- Six surface-specific applications, each just a "which sub-region of $R$, which fiber-algebra" parameterization.

An implementer building a substrate doesn't need separate IAM (identity and access management), governance, federation-trust, capability-passing, and authentication systems. They need one modal-restriction implementation, used at each surface with appropriate parameters. The complexity that traditional systems handle with multiple specialized subsystems is, in the substrate's framing, structurally one mechanism.

## What the theorem rules out

- **Per-surface authorization implementations.** A substrate with separate authorization machinery per surface is doing the same work many times. Per the theorem, one $\Box_R$ implementation covers all surfaces.
- **Authorization that bypasses modal restriction.** A "fast path" authorization that skips the $\Box_R$ check (e.g., "if the request comes from localhost, allow") breaks the substrate's structural authorization discipline. Per [substrate-accessibility-relation](teaching/explanations/substrate-accessibility-relation.md), authorization decisions consult $R$; bypasses are non-conformant.
- **Inconsistent authorization across surfaces.** If governance authorizes an action but the trust-boundary doesn't admit the actor, or federation trusts the peer but the authentication doesn't, the substrate's discipline is to surface the conflict (per [audit-content-via-inconsistency-sheaf-cohomology](audit-content-via-inconsistency-sheaf-cohomology.md), as a $\top$-cell in the inconsistency sheaf), not silently resolve it.
- **Authorization caching that doesn't track $R$ changes.** Per [cache-coherence-via-functorial-projection](cache-coherence-via-functorial-projection.md), authorization caches are content-addressed by the relevant sub-region of $R$; if $R$ changes, the relevant cache entries reflect the change. A cache that ignores $R$ updates produces stale authorization decisions.

## What the theorem requires

- The substrate maintains one accessibility relation $R$ (per [substrate-accessibility-relation](teaching/explanations/substrate-accessibility-relation.md)).
- The substrate implements $\Box_R$ per [modal-necessity-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md).
- Each surface's authorization theorem holds (the six grounding theorems individually).
- The substrate's evaluation of $\Box_R$ is decidable per [governance-decision-modal-decidability](governance-decision-modal-decidability.md).

## Position

This theorem completes the substrate's *structural unification of authorization*. Together with [substrate-runtime-as-closure-driven-settling](substrate-runtime-as-closure-driven-settling.md) (one runtime, multiple surfaces) and [recovery-via-event-log-replay-determinism](recovery-via-event-log-replay-determinism.md) (one recovery primitive), the substrate's architecture has *one* of each fundamental machinery — one runtime, one authorization, one recovery, one event-log — projected to multiple engineering surfaces.

This is the substrate's structural answer to the typical complexity of "modern computer system" — every distinct surface (auth, governance, trust, capability, federation, authentication) is the same modal calculus on the same accessibility relation, parameterized differently. The substrate's claim to *be simpler than what it does* is a structural theorem about its modal-restriction primitive.

## Distinction from the bigraded closure-kind modal

The substrate hosts *two* modal calculi addressing different content. This theorem's authorization modal is $\Box_R$ on the [substrate-accessibility-relation](teaching/explanations/substrate-accessibility-relation.md) $R$ — modal over *worlds* in the accessibility-relation graph, restricting which actions are admissible across world transitions. The companion modal calculus per [substrate-operations-are-bigraded-modal](substrate-operations-are-bigraded-modal.md) is the bigraded $(\sigma, \Delta)$ modal on the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)'s truth + knowledge axes, classifying *operations* by their modal-position (the four [closure-kinds](teaching/explanations/closure-kind.md)). The two are structurally distinct: authorization modal is on *what is allowed*; closure-kind modal is on *what kind of operation this is*. Conflating them is a category error — the substrate has two modal calculi and they address different content.
