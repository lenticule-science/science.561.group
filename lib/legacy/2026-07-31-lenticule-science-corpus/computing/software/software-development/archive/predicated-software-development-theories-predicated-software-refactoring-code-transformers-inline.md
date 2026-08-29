---
type: morphism
class: refactor-generator
status: draft
depends-on: [codebase-cell-system, refactor, extract]
realizes: [refactor]
---

# Inline

The inverse of [extract](extract.md): given an extracted definition $d'$ that is referenced only from $d$, fold $d'$'s cells back into $d$ and remove the `references` edge. Formally, the entity-permutation that returns $d'$ to permanent-$\bot$ status while restoring the cells of $d$ to the pre-extract configuration.

In $N_W$ exactly when extract was. The pair (extract, inline) is the canonical $\mathbb{Z}$-action on the codebase settling along an extractable region; conjugacy classes of inlines correspond to conjugacy classes of extracts.

## Where used

- [refactor-as-invisible-automorphism](../theorems/refactor-as-invisible-automorphism.md).
- [extract](extract.md) — the inverse pair.
