---
name: necessary-possible
type: concept
status: sketch
---

Modal operators derived from [Close](close.md) and [Open](open.md) applied objectwise. **Necessary** ($\Box$) is what survives all closure — what must be. **Possible** ($\Diamond$) is what can be opened from within — what may be.

## What they are

- $\Box$ — the objectwise modality of Close: applying Close pointwise to recognitions.
- $\Diamond$ — the objectwise modality of Open: applying Open pointwise.

Together they sit inside the adjoint quadruple $\Pi^\to \dashv \Box \dashv \Diamond \dashv \nabla^\leftarrow$ (the [cohesive chain](cohesive-chain.md)), with $\Box$ as necessity and $\Diamond$ as possibility. They satisfy the S4 axioms — reflexive transitive modal logic:

- $\Box a \leq a$ and $a \leq \Diamond a$ (reflexivity)
- $\Box\Box a = \Box a$ and $\Diamond\Diamond a = \Diamond a$ (transitivity / idempotence)

## What they produce

- The composition $\Box\Diamond$ is the comonadic structure of [Flow](flow.md): $C = \Box\Diamond$.
- The ground for directed dynamics (Movement III).
- Internal modal logic within the relational field.
