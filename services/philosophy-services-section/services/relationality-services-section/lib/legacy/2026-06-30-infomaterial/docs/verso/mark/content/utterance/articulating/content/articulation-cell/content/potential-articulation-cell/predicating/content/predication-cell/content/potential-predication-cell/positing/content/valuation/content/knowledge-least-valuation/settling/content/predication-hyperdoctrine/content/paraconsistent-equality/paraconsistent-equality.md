---
kind: definition
type: predicate-section
symbol: "\\Delta_E^k"
depends-on: [predication-hyperdoctrine, predicate-specialization, equality-via-equalizer, knowledge-order, specialization-hyperdoctrinal-adjoints, entity-set]
---

# Paraconsistent equality

Fix a [predicate specialization](../morphisms/predicate-specialization.md) $g : q \to p$ with $\mathrm{dom}(q) = \Delta_E := \{(s, s) : s \in E\}$ — the diagonal sub-support of the [entity set](entity-set.md) $E$, derived from the [equality-via-equalizer](../theorems/equality-via-equalizer.md) corollary.
The **paraconsistent equality** on an [predication hyperdoctrine](predication-hyperdoctrine.md) is the $\leq_k$-Lawvere image

$$\Delta_E^k := \exists_g^k(\mathbf{1}_q^k) \in \mathcal{E}_p,$$

where $\mathbf{1}_q^k$ is the $\leq_k$-terminal of $\mathcal{E}_q$ — the constant-$\top$ valuation on $\Delta_E$.

By the [specialization hyperdoctrinal adjoints](../theorems/specialization-hyperdoctrinal-adjoints.md) extension formulas, $\Delta_E^k$ takes the values

$$\Delta_E^k(s, o) = \begin{cases} \top & s = o, \\ \bot & s \neq o. \end{cases}$$

The diagonal carries $\top$ (information-maximal); off-diagonal carries $\bot$ (no claim).
Stable under $\vee_k$-merge in the [knowledge order](../concepts/knowledge-order.md), suitable for distributed and paraconsistent reasoning.
