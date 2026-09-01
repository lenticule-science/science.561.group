---
type: morphism
class: refactor-generator
status: draft
depends-on: [codebase-cell-system, refactor, invisible-automorphism-subgroup]
realizes: [refactor]
---

# Rename

A refactor that permutes identifiers in the [codebase cell-system](../objects/codebase-cell-system.md) without changing any other cell. Formally, an entity-permutation $\pi_E \in \mathrm{Sym}(E_{\mathrm{code}})$ that is the identity on every entity that is not an identifier-class entity, restricted to identifier classes whose action on the settling-associated sheaf is trivial.

## Action

Given identifiers $a, b \in E_{\mathrm{code}}$, the rename $a \mapsto b$ is the entity-permutation $\pi_E = (a\;b)$ extended by the identity. It acts on the codebase settling cell-position-wise: every cell $(s, p, o)$ with $s = a$ or $o = a$ has its position rewritten to use $b$, and conversely.

## When it is a refactor

The rename is in $N_W(v^{\mathrm{code}})$ iff $\pi_E$ fixes every cell of $W$ that has been newly designated by the settling. Two cases:

- **Private rename.** If neither $a$ nor $b$ appears in any cell of $W$ — the identifier is invisible to the witness language — the rename trivially fixes $\mathcal{F}^{\mathrm{code}}_W$ and is in $N_W$. This is the canonical safe refactor.
- **Witness-tracked rename.** If $W$ tracks identifiers by *identity* rather than by *spelling* — i.e., if witness positions reference the identifier's substrate-entity rather than its spelling — the rename is again in $N_W$, because $\pi_E$ is an automorphism of the cell-system. This is the case for language-server-aware test infrastructure that re-indexes by symbol identity.
- **Spelling-tracked witness.** If $W$ tracks identifiers by spelling — `references-symbol-named-foo` is a different cell from `references-symbol-named-bar` — the rename is *not* in $N_W$. The witness cell at the old name disappears; the witness cell at the new name appears.

The disciplinary intuition that "renames are safe with good tooling" is the substrate-algebraic fact that good tooling produces *witness positions tracked by identity, not by spelling*. The relativity is built into the cell-system, not into the rename operation.

## Where used

- [refactor-as-invisible-automorphism](../theorems/refactor-as-invisible-automorphism.md) — rename is a generator of $N_W$ when $W$ is identity-tracking.
- [public-api-rename-is-substantive](../theorems/public-api-rename-is-substantive.md) — rename of an identifier referenced by *external* witnesses (downstream codebases that observe the spelling) is substantive.
- [private-rename-as-cosmetic](../examples/private-rename-as-cosmetic.md) — worked example.
