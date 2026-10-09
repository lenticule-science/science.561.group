---
name: "Nelson Implication"
description: "A bilattice implication that tests direct implication and contrapositive implication together."
aliases:
  - "Nelson implication"
  - "strong implication"
date-created: 2026-03-30
specialization: residual-implication
introduced-by: chajda-langer-2021
generalized-by:
  - busaniche-galatos-marcos-2022
  - rivieccio-busaniche-2024
source-variants:
  - nelson-implication/flowif-nelson-implication.md
  - nelson-implication/predication-nelson-implication.md
  - nelson-implication/research-nelson-implication.md
---

On a bilattice or twist product, Nelson implication combines a weak implication $\supset$ with negation $\mathord{\sim}$:

$$x \Rightarrow_N y = (x \supset y) \wedge (\mathord{\sim}y \supset \mathord{\sim}x).$$

It therefore checks both the direct direction and its contrapositive. Chajda and Langer (2021) established it as a second adjoint pair on twist products alongside the Busaniche–Cignoli residuation. It satisfies the Nelson identity

$$
(x \Rightarrow (x \Rightarrow y)) \wedge_k
(\mathord{\sim}y \Rightarrow (\mathord{\sim}y \Rightarrow \mathord{\sim}x))
= x \Rightarrow y.
$$

The implication and the identity are related but distinct: the former is an operation; the latter is a theorem about its iteration. On $\mathbf{FOUR}$, the identity is verified by enumeration. Its extension to arbitrary non-idempotent residuated lattices is not assumed here.

On the four-valued bilattice, naive contrapositive reasoning can fail: $\mathord{\sim}(a \odot b)$ need not equal $\mathord{\sim}b \Rightarrow \mathord{\sim}a$. Nelson implication retains the direct and contrapositive tests without silently identifying them.
