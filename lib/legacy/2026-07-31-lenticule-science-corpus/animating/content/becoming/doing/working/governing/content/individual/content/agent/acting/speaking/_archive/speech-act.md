---
type: concept
depends-on: [adjudication, evidence, truth, knowledge, predication-cell, predication-valuation]
see-also: [positing-morphism, assertive-positing-morphism, denial-positing-morphism, contestation-positing-morphism, agentive-positing-morphism, entity-realization, temporally-bounded-positing, channel-theoretic-speech-acts]
---

# Speech act

The role borne by an illocutionary act — an act of injecting bilattice-valued evidence into a predication cell.
A framework realizes the speech-act role when it equips the producing side of [adjudication](adjudication.md) with a distinguished class of morphisms (positing morphisms) and a classification of those morphisms by their communicative force.

[Adjudication](adjudication.md) is the role of the *receiving* side: producing an epistemic state at every [predication cell](predication-cell.md) from accumulating, possibly conflicting, possibly partial sources.
The speech-act role is the *producing* side: each positing morphism is a communicative act that contributes [evidence](evidence.md) to the settling.
Together, the speech-act and adjudication roles frame the predication settling as a communicative process — agents make speech acts, the settling adjudicates them.

## The Austin-Searle structure in PredCat

Austin ([@austin1962]) distinguishes three analytically separable aspects of any utterance act:

- **Locution** — what was said: the selection of a predication cell $\phi = (s, p, o)$.
- **Illocution** — the communicative force: the [positing morphism](../morphisms/positing-morphism.md) $\mathrm{posit}_{(\phi, q)}$ — the act of assigning evidence-datum $q$ at cell $\phi$.
- **Perlocution** — the downstream effect: the [closure operator](../morphisms/closure-operator.md) $\mathrm{cl}$ — deriving consequences from the injected evidence.

The [locution/illocution/perlocution factorization theorem](../theorems/locution-illocution-perlocution-factorization.md) establishes that this tripartite structure is a canonical factorization of every operationally-realizable settling step in $\mathbf{PS}_\Phi$.

## The four illocutionary force classes

By the [Belnap speech-act partition theorem](../theorems/belnap-speech-act-partition.md), the truth-order class of the positing datum $q \in \mathbf{FOUR}$ determines the illocutionary force:

| Force | Datum | Morphism |
|---|---|---|
| Abstaining | $\bot$ | Identity (no positing morphism) |
| Asserting | $\mathbf{t}$ | [Assertive positing morphism](../morphisms/assertive-positing-morphism.md) |
| Denying | $\mathbf{f}$ | [Denial positing morphism](../morphisms/denial-positing-morphism.md) |
| Contesting | $\top$ | [Contestation positing morphism](../morphisms/contestation-positing-morphism.md) |

These four classes are pairwise disjoint and exhaustive on $\mathbf{FOUR}$, and the [Klein-four symmetry group](klein-four-symmetry.md) $\mathbb{Z}_2 \times \mathbb{Z}_2$ acts on them: negation $\sim$ swaps asserting $\leftrightarrow$ denying; conflation $-$ swaps abstaining $\leftrightarrow$ contesting.

## Agentive attribution

When a specific observer $a \in O$ in a [multi-observer system](../objects/multi-observer-system.md) performs a positing morphism, the result is an [agentive positing morphism](../morphisms/agentive-positing-morphism.md) $\mathrm{posit}^a_{(\phi, q)}$.
Agentive attribution is required to distinguish:

- **Asserting** (individual value agrees with globally-merged value) from **claiming** (individual value diverges from merged value, typically because another observer has posited incompatibly).
- **Institutional speech acts** (performed by designated authorities and self-validated by closure rules) from **ordinary speech acts** (performed by any observer, not self-validated).

The assert/claim distinction is a relational property of the agentive positing morphism with respect to the multi-observer system — it cannot be read from the morphism in isolation.

## The role's two pressures

A framework realizes the speech-act role when it sustains:

- **Illocutionary force tracking.** The framework must distinguish which positing morphism class was applied — asserting, denying, contesting — not merely what the resulting value is.
  On $\mathbf{FOUR}$, the value and the class coincide (the value $\mathbf{t}$ is exactly the asserting class), but on intermediate bilattices they can diverge.
- **Agentive attribution.** The framework must be able to attribute each positing morphism to an observer, enabling the assert/claim distinction and the institutional speech-act structure.

Both pressures are realized by the multi-observer system's structure: individual settlings carry the agentive attribution; the merged settling carries the adjudicated result.
The speech-act role is the interface between the two.

## Relation to adjudication

The speech-act role and the adjudication role are duals: speech acts produce evidence; adjudication processes it.
The [adjudication concept](adjudication.md) focuses on the output — what is settled — while the speech-act concept focuses on the input — who said what with what force.
The predication settling is the structure that relates the two: it is the sequence of speech acts (positing morphisms) interleaved with adjudication steps (closure morphisms), producing the epistemic state at each cell.
