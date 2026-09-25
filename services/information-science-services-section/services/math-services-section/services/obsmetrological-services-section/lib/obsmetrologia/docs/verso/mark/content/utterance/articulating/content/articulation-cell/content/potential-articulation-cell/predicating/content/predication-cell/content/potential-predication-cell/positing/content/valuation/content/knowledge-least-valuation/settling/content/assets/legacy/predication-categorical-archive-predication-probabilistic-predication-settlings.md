---
type: question
class: bridge
status: partial
explores: [bilattice, predication-settling, crdt-convergence, knowledge-order, truth-order, settling-merge-semilattice]
---

# Probabilistic predication settlings

> **Progress (point-probability case).** The [stochastic settling object](../../continuous-valued-settling/content/stochastic-settling/stochastic-settling.md) builds the framework over the standard probability semiring $([0,1], \cdot, +)$, with closure being Markov-chain transition. The [stochastic stationary-as-settling theorem](../../continuous-valued-settling/content/stochastic-settling/references/stochastic-stationary-as-settling.md) identifies the closure fixed point as the stationary distribution via Perron-Frobenius. The [probabilistic belief-propagation benchmark](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/benchmark-probabilistic-belief-propagation.md) verifies this empirically. **Still open**: the *imprecise-probability* candidate value types in this question — interval-valued lattices, Dempster-Shafer evidence-mass, credal sets. Those require non-idempotent merge semantics or different bilattice-replacement structures, which the stochastic-settling work does not address.

The corpus's value type is a [bilattice](../objects/bilattice.md) — a discrete four-state algebra ($\bot, \mathbf{f}, \mathbf{t}, \top$) on the canonical $\mathbf{FOUR}$ case. Probabilistic knowledge representation needs a different value type: probabilities, intervals of probabilities, or evidence-mass distributions. Open: replace the bilattice with a probability-flavored value type and re-derive the framework.

## Candidate value types

Three candidates with different structural commitments:

- **Interval-valued lattice $\{[a, b] : 0 \leq a \leq b \leq 1\}$.** Each cell carries a probability interval; $\leq_k$ is interval-inclusion (more knowledge = narrower interval), $\leq_t$ is the lower-endpoint order (more truth = higher probability). Maps cleanly to *imprecise probability* (Walley's *Statistical Reasoning with Imprecise Probabilities*).
- **Belnap-style probability bilattice.** A four-component value $(p_\mathbf{t}, p_\mathbf{f}, p_\bot, p_\top)$ summing to 1, recording probability mass on each Belnap state. Maps to *Dempster–Shafer evidence theory* (Shafer's *Mathematical Theory of Evidence*) where evidence on $\{\mathbf{t}, \mathbf{f}, \bot, \top\}$ is a basic probability assignment.
- **Credal set / P-box value type.** Each cell carries a *set* of probability distributions or a probability box (lower / upper distribution functions). Most expressive, structurally heaviest.

Each gives a probabilistic-predication settling candidate; the choice determines what merge structure and what closure operator make sense.

## What survives, what breaks

The structural feature that makes predication categories' CRDT story work is *idempotent merge* — $\vee_k$ on a bilattice is associative, commutative, *and* idempotent. Probability merges are different:

- **Idempotency.** Imprecise-probability intersection (interval intersection, credal-set intersection) IS idempotent, so the CRDT story may extend cleanly. But Dempster's rule of combination is *not* idempotent — combining $E$ with $E$ produces sharper evidence than $E$ alone — so a Dempster-Shafer-flavored merge breaks the [CRDT convergence](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence.md) theorem entirely.
- **Monotonicity.** Imprecise-probability intersection is $\leq_k$-monotone (more evidence narrows the interval), aligning with predication categories' [settling monotonicity](teaching/explanations/settling-monotonicity.md). Dempster's rule is also $\leq_k$-monotone in a sense but along a different order. The two probability frameworks have *different* settling-monotonicity stories.
- **Bilattice structure.** The interval lattice has $\leq_k$ (inclusion) and $\leq_t$ (lower-endpoint) but isn't obviously a *bilattice* — the four-corner structure ($\bot, \mathbf{t}, \mathbf{f}, \top$) doesn't have a clean interval analogue. Whether interval-valued knowledge fits the bilattice formalism, or needs a more general "ordered-pair-of-orders" structure, is itself open.

## Specific sub-questions

- Does interval-valued knowledge form a bilattice in any meaningful sense, or is the structure genuinely different (e.g., a *bi-ordered semilattice* lacking the bilattice's twelve distributive laws)?
- Does the [settling-merge semilattice](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-merge-semilattice.md) structure (which is what gives CRDT convergence) survive interval-valued / Dempster-Shafer / credal-set merges?
- Is there a probabilistic analogue of the [four-regime dichotomy](../../../references/four-regime-dichotomy.md)? Continuous-valued settlings might have a continuous-spectrum regime structure rather than predication categories' discrete four-regime one.
- Does the [Priestley dualization](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/references/priestley-dualizability.md) extend? Probability lattices are not in general Priestley-dualizable directly (most are not distributive), so the dualization apparatus may need to be replaced.

## Position in predication categories

This question is most likely a *parallel framework* rather than an extension — predication categories' bilattice apparatus is structurally specialized to discrete-Belnap settings, and probabilistic knowledge is too different in idempotency and bilattice structure to fit cleanly. The relationship would be that predication categories' framework and a probabilistic framework are both specializations of some more general "knowledge-evolution presheaf" abstraction. Identifying that abstraction is the substantive open question.

The connection to the [continuous-$\mathbf{L}$ predication settlings](continuous-L-predication-settlings.md) question is partial: continuous $\mathbf{L} = [0,1]$ gives one notion of probability-flavored value type (Łukasiewicz / MV-algebra), but doesn't subsume imprecise probability or evidence theory. The two questions overlap on the $[0,1]$-MV case and diverge elsewhere.
