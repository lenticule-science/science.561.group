---
kind: question
status: open
explores: [lawvere-comprehension-classical, lawvere-comprehension-paraconsistent, classical-equality, paraconsistent-equality, four-bilattice]
---

# Belnap-designated comprehension

The two [comprehension schemas](../theorems/lawvere-comprehension-classical.md) on the predication hyperdoctrine — classical $\{p : -\}_\mathbf{t}$ and [paraconsistent](../theorems/lawvere-comprehension-paraconsistent.md) $\{p : -\}_\top$ — correspond to designated values $\{\mathbf{t}\}$ and $\{\top\}$ separately. Open: develop a third comprehension schema on the *full Belnap-designated set* $\{\mathbf{t}, \top\}$.

For $p \in \mathcal{C}$ and $\psi \in \mathcal{E}_p$, define

$$\{p : \psi\}_{\mathrm{des}} \;:=\; \psi^{-1}(\{\mathbf{t}, \top\}) \;\subseteq\; E \times E,$$

the sub-support where $\psi$ takes designated values. The natural question: is there an extension functor whose right adjoint is $\{p : -\}_{\mathrm{des}}$?

## Why it's not immediate

The classical schema's extension functor is $\mathrm{Ext}^t(g) = \exists_g^t(\mathbf{1}_q^t)$ — $\Sigma$-image of the truth-side terminal. The paraconsistent schema's is $\mathrm{Ext}^k(g) = \exists_g^k(\mathbf{1}_q^k)$ — $\Sigma$-image of the knowledge-side terminal. Each adjoint system supplies its own extension functor; the corresponding comprehension is the right adjoint.

For the Belnap-designated case, a "designated terminal" mediating between $\mathbf{t}$ and $\top$ is needed. In [$\mathbf{FOUR}$](../objects/four-bilattice.md), neither $\mathbf{t}$ nor $\top$ is the join of the other in any relevant order, so there is no immediate two-element terminal. A modified extension functor must be constructed — possibly as $\exists^t \oplus \exists^k$ on a sub-fibration restricted to designated values, or via a different adjoint mechanism specific to the designated subset.

## Why it matters

The Belnap-designated set $\{\mathbf{t}, \top\}$ is the natural choice for paraconsistent reasoning where inconsistencies $\top$ are treated as informative-but-non-trivial (rather than excluding them as in classical, or treating them as the terminal as in the $\leq_k$-system). A working comprehension schema in this setting would correspond to the Pitts-style designated topos construction beyond the existing two adjoint systems.

[@pitts2002] §4 identifies a comprehension property weaker than Lawvere's that still supports topos construction; the Belnap-designated analogue is its bilattice variant. The full development requires either a non-Lawvere-style extension functor or a refinement of the [bigraded settling cohomology](../objects/bigraded-settling-cohomology.md) framework to track designated-value comprehension separately.

Related: [SKH-FOL ↔ BD∆ correspondence](bd-delta-correspondence.md) — Omori–Wansing's BD∆ logic uses a designated-truth modality $\Delta$ that picks out exactly the Belnap-designated set; the two questions are about the same underlying designated-value structure, viewed through internal-logic and comprehension lenses respectively. The [bigraded realizability refinement](../theorems/bigraded-realizability-refinement.md) provides a third lens — the bigraded $(c_t, c_\top)$-decomposition is the cohomological shadow of the truth-side / inconsistency-side split that designated-comprehension needs to mediate.
