---
kind: definition
type: predicate-section
symbol: "=_E"
depends-on: [predication-hyperdoctrine, predicate-specialization, equality-via-equalizer, truth-order, specialization-hyperdoctrinal-adjoints, entity-set]
---

# Classical equality (derived)

Fix a [predicate specialization](../morphisms/predicate-specialization.md) $g : q \to p$ with $\mathrm{dom}(q) = \Delta_E := \{(s, s) : s \in E\}$ — the diagonal sub-support of the [entity set](entity-set.md) $E$. The **classical equality** on an [predication hyperdoctrine](predication-hyperdoctrine.md) is the $\leq_t$-Lawvere image

$$=_E \;:=\; \exists_g^t(\mathbf{1}_q^t) \in \mathcal{E}_p,$$

where $\mathbf{1}_q^t$ is the $\leq_t$-terminal of $\mathcal{E}_q$ — the constant-$\mathbf{t}$ valuation on $\Delta_E$.

By the [specialization hyperdoctrinal adjoints](../theorems/specialization-hyperdoctrinal-adjoints.md) extension formulas (the $\leq_t$-system extends by $\mathbf{f}$),

$$=_E(s, o) = \begin{cases} \mathbf{t} & s = o, \\ \mathbf{f} & s \neq o. \end{cases}$$

This is classical two-valued equality, *derived* from the [truth-order](../concepts/truth-order.md) adjoint system via Lawvere's diagonal-$\Sigma$ construction — not postulated. Bilattice first-order logics in the literature (BD∆, Kamide–Zohar, Běhounek–Daňková–Dvořák) postulate classical equality as a primitive; the construction here shows the postulate is unnecessary, falling out of the dual adjoint triple.
