# claims/

Proved claims about the category of computing — theorems and their proofs derived from the formal mathematical development in `questions/`.

## Frontmatter

```yaml
---
type: claim
status: proved | proved-with-conditions
depends-on: [...]
see-also: [...]
references: [...]
---
```

## Body shape

1. **Statement.** The precise formal claim.
2. **Proof.** The derivation, with cited sources.
3. **Significance.** What the claim licenses or settles downstream.

## Claims in this directory

- [eff-is-minimum-level](eff-is-minimum-level.md) — Eff = RT(K₁) is the minimum categorical level for the theory of computing
- [k1-is-initial-turing-complete-pca](k1-is-initial-turing-complete-pca.md) — K₁ is the initial Turing-complete PCA; Church-Turing is its uniqueness
- [four-is-image-of-omega-under-double-negation](four-is-image-of-omega-under-double-negation.md) — FOUR = 2×2 is the image of Ω_Eff under the ¬¬-nucleus, internal to Eff
- [opca-equivalent-to-reat](opca-equivalent-to-reat.md) — oPCA ≃ ReaT: geometric morphisms between realizability toposes are ordered applicative morphisms
- [complexity-excludes-from-subtopos-lattice](complexity-excludes-from-subtopos-lattice.md) — Complexity theory cannot be a subtopos of Eff; Cartesian axioms are the obstruction
- [arithmetical-hierarchy-excludes-from-subtopos-lattice](arithmetical-hierarchy-excludes-from-subtopos-lattice.md) — Oracle levels are outward geometric morphisms, not subtoposes
- [modified-realizability-is-a-sibling-topos](modified-realizability-is-a-sibling-topos.md) — Modified realizability changes the tripos; it is a sibling of Eff, not a subtopos
- [typed-subtheory-lattice-is-linear-logic-fragment-lattice](typed-subtheory-lattice-is-linear-logic-fragment-lattice.md) — The typed subtheory lattice is MLL ⊂ MALL ⊂ {ILL, CLL} ⊂ LL
- [f-dial-eff-to-cgs-exists](f-dial-eff-to-cgs-exists.md) — A *-autonomous functor F: Dial(Eff) → CGS exists, resolving the typed/untyped split
