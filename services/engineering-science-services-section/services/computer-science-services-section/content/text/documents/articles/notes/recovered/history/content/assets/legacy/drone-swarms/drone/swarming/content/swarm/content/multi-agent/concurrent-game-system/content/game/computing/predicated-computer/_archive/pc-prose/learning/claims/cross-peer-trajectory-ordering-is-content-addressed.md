---
type: theorem
class: engineering-claim
status: proved
depends-on: [federation-convergence, hash-injectivity-under-canonical-form, monotonic-clock-discipline, regime-classification-for-substrate, time-and-event-ordinals]
see-also: [witness-lifecycle-trajectory-is-regime-conditional-federation-content, federation-trust-bilattice-graded, four-regime-dichotomy, regime-record]
---

# Cross-peer trajectory ordering is content-addressed

**Claim.** Let $S_1$ and $S_2$ be two predication substrates federating per [federation-convergence](federation-convergence.md), both operating in the *transfinite-bounded* or *aperiodic* regime per [regime-classification-for-substrate](regime-classification-for-substrate.md). Per [federation-convergence](federation-convergence.md) §"Regime hypotheses", these substrates must ship trajectory — the increment-sequence and firing-ordinal record — and not just endpoint state, on pain of losing the $H^1$ cohomological invariant that distinguishes [mutually-locally-derivable](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/mutually-locally-derivable.md) classes.

Trajectory shipping requires a total order on the cross-peer set of trajectory increments — without one, two substrates merging each other's trajectories cannot present a single sequenced settling family for replay. Call a cross-peer total order on trajectory increments **content-determined** when it extends the per-substrate substrate-ordinal order and is a function of substrate content alone (no host wall-clock, no host monotonic-clock, no external time source). Then:

1. **Existence of a canonical content-determined order.** The lexicographic order on the key
   $$\bigl(\text{peer-id},\; \text{substrate-ordinal},\; \text{canonical-form-hash of the increment record}\bigr)$$
   is a content-determined cross-peer total order on trajectory increments, computable from existing [witness](../objects/witness.md) fields alone.
2. **Outcome-uniqueness across content-determined orders.** Any two content-determined cross-peer total orders produce the same converged endpoint state and the same $H^1$ cohomological pattern at every federating substrate. The federated outcome is therefore a function of the trajectory-increment *set* together with its per-peer substrate-ordinal structure; no further cross-peer ordering choice is load-bearing.
3. **Refusal of non-content-determined orders.** Any cross-peer ordering that depends on host wall-clock, host monotonic-clock, or any external (non-substrate-content) source is non-conformant per [monotonic-clock-discipline](monotonic-clock-discipline.md): the substrate is then not a deterministic function of substrate content, in violation of the discipline's hypothesis.

In strict and Scott-continuous regimes, no cross-peer ordering on trajectory increments is required for federation convergence — endpoint-state shipping suffices per [federation-convergence](federation-convergence.md), and the claim is vacuous.

The claim is **not** uniqueness of the cross-peer total order itself — many content-determined orders exist (different lexicographic key tuples, different canonical orderings of peer-ids). The claim is uniqueness of the federated outcome under any such order, plus the existence of one canonical key the substrate can use without further negotiation.

## Why this holds

**Part 1 — the proposed key is content-determined and total.** Per [time-and-event-ordinals](teaching/explanations/time-and-event-ordinals.md), each substrate's local event ordinals are monotone non-decreasing across that substrate's lifetime; per [monotonic-clock-discipline](monotonic-clock-discipline.md), substrate ordinals are pure substrate content (no host-clock dependency). The first key component, `peer-id`, is the federating substrate's identity per [witness](../objects/witness.md)'s `signature` field; the second, `substrate-ordinal`, is per [witness](../objects/witness.md)'s `step-ordinal`; the third, `canonical-form-hash of the increment record`, is per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md) injective on the increment's content modulo canonicalization. Each component is read from substrate content alone, and the lexicographic combination is a total order: ties on `(peer-id, substrate-ordinal)` can only arise for distinct increments — different content — which the hash-component then separates by hash-injectivity. The order extends each per-peer substrate-ordinal order because increments from a single peer share `peer-id` and are then ordered by `substrate-ordinal`.

**Part 2 — content-determined orders agree on the federated outcome.** Per [federation-convergence](federation-convergence.md), the substrate's [merge](../morphisms/merge.md) is the cellwise $\vee_k$ on each [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), and the closure-merge commutation lemma

$$\mathrm{cl}_p\bigl(\mathrm{cl}_p(X) \vee_k Y\bigr) \;=\; \mathrm{cl}_p\bigl(X \vee_k Y\bigr)$$

makes the converged endpoint state $\mathrm{cl}_p(\bigvee_k U)$ depend only on the *set* $U$ of writes, not on any ordering. Two content-determined orders applied to the same federation produce the same set $U$ (the trajectory-increments are the same substrate content under either order), hence the same endpoint state at every substrate.

The $H^1$ pattern is also preserved across content-determined orders. Per [federation-convergence](federation-convergence.md) §"Regime hypotheses", each non-Scott-continuous firing ordinal contributes a $\mathbb{Z}$-generator to $H^1$ of the merged settling. The $H^1$ class is determined by the firing-ordinal pattern the trajectory carries — which firings happened at which substrate-ordinals at which peer — not by the chosen cross-peer total order. Both pieces of structure (per-peer substrate-ordinals and per-increment firing-ordinal records) are preserved under any content-determined order; the $H^1$ class is therefore independent of the choice.

The conjunction of Parts 1 and 2 establishes claims (1) and (2): the stated key is one content-determined order, and any other content-determined order produces the same federated state and the same $H^1$ pattern.

**Part 3 — non-content-determined orders are refused.** A federation discipline that orders trajectory-increments by host wall-clock or host monotonic-clock readings is not content-determined: the same federated content produces different orderings on different hosts. Per [monotonic-clock-discipline](monotonic-clock-discipline.md), reducers do not consult host wall-clock, and the substrate's behavior is a deterministic function of substrate content alone. A wall-clock-dependent ordering breaks this hypothesis and is non-conformant.

## Engineering consequence

- **No new substrate primitive is introduced.** The cross-peer trajectory ordering uses [witness](../objects/witness.md)'s existing `signature` (peer-id), `step-ordinal` (substrate-ordinal), and `id` (canonical-form hash of the witness's content) fields. No new federation-protocol field, no new witness sub-record, no new clock primitive.
- **No cross-peer ordering negotiation is required.** Outcome-uniqueness across content-determined orders means two federating substrates need not negotiate or ratify a shared ordering rule beyond agreeing that orders are content-determined. Each peer can use the canonical key locally and reach the same federated state.
- **Per-substrate ordinals stay parochial.** No "global ordinal" or "cross-peer ordinal-meet" is introduced. Each substrate's substrate-ordinal continues to refer to its own event log; the cross-peer ordering composes substrate-ordinals with peer-ids and hashes, rather than reconciling them into a shared timeline.
- **Tie-break is structural, not policy.** The third tier of the key — canonical-form hash of the increment record — is the hash-injectivity tie-break per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md). It is fully determined by content; no peer chooses. Two substrates that agree on substrate content agree on the trajectory order without further negotiation.
- **Non-content-determined orderings are detectable.** An auditor replaying a federation handshake can verify that the order used matches the content-determined key. A federation peer that orders by an undeclared external source produces orderings the auditor cannot replay, and the federation is non-conformant per [federation-convergence](federation-convergence.md).

## What the theorem rules out

- **Wall-clock-bounded-drift federation.** A federation discipline that admits trajectory-increments based on wall-clock proximity (within a bounded drift envelope) is not content-determined and violates [monotonic-clock-discipline](monotonic-clock-discipline.md). The substrate refuses; admissible cross-peer orderings on trajectory-increments are content-determined.
- **Cross-peer ordering on a per-substrate ordinal-domain meet without specification.** A federation discipline proposing to "meet substrates on a shared ordinal-domain" without naming the meet operation, the carrier, or the relation to the per-peer ordinal structure conflates two distinct constructions. Per-substrate ordinal-domain types are not a published theory primitive and a hypothetical meet on them would constitute new structural commitment, not the minimal extension this theorem provides.
- **Cross-peer total order on substrate outcomes.** The theorem orders trajectory-increments (the substrate-content steps the federation must ship), not substrate-outcomes (the converged endpoint states). A federation discipline imposing a cross-peer total order on outcomes — claiming, e.g., that one peer's converged state is "earlier" than another's — is over-constrained and not required by [federation-convergence](federation-convergence.md).
- **Two content-determined orders disagreeing on $H^1$.** Per Part 2, any two content-determined orders agree on both endpoint state and $H^1$ pattern. A federation implementation that uses the same trajectory-set under two content-determined orderings and produces different $H^1$ classes has an implementation bug, not a theory question.

## What the theorem requires

- Both substrates are in the transfinite-bounded or aperiodic regime per [regime-record](../objects/regime-record.md). In strict or Scott-continuous regimes, the theorem's hypotheses are vacuously satisfied (no trajectory shipping is required) and federation proceeds via endpoint-state exchange per [federation-convergence](federation-convergence.md).
- Both substrates' [witness](../objects/witness.md) records carry `signature` (peer-id), `step-ordinal` (substrate-ordinal), and `id` (canonical-form hash) fields populated per the witness invariants.
- Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), the canonical-form serialisation of trajectory-increments is deterministic and the hash is collision-resistant.
- Per [monotonic-clock-discipline](monotonic-clock-discipline.md), the substrate ordinals are pure substrate content and reducers do not consult host clocks.

## Position

This theorem closes the cross-peer ordering question for transfinite-bounded and aperiodic federation: the federated outcome is structurally determined by the existing substrate-content fields, and the substrate exhibits one canonical content-determined order on the existing [witness](../objects/witness.md) fields without introducing a new substrate primitive or a new clock layer. Together with [federation-convergence](federation-convergence.md) (federation correctness), [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md) (content-as-identity), and [monotonic-clock-discipline](monotonic-clock-discipline.md) (no host-clock reads), this theorem completes the federation-ordering corner of the substrate's federation algebra. It is paired with [witness-lifecycle-trajectory-is-regime-conditional-federation-content](witness-lifecycle-trajectory-is-regime-conditional-federation-content.md), which establishes the dual claim that the trajectory itself (not just its ordering) is regime-conditional federation content.
