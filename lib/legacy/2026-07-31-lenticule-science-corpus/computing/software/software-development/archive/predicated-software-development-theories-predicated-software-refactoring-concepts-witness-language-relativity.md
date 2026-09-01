---
type: concept
class: parameter
status: draft
depends-on: [codebase-cell-system, settling-associated-sheaf]
---

# Witness-language relativity

Whether a transformation of a codebase is a refactoring depends on which cell positions are designated witness-bearing — equivalently, on which sub-sheaf of $\mathcal{F}^{\mathrm{code}}_U$ is in scope. The classification of automorphisms as invisible (in $N_W$) or visible is *relative to* this choice.

## Concrete instances

- **Test-only $W$.** Witness positions are `passes-on` cells of the project's test artifacts. Renaming a private variable, extracting a private method, inlining a non-test-observed function are all in $N_W$. Renaming a public function whose tests reference it by name is *not* in $N_W$ (the test cell at the old name moves; the test cell at the new name appears) — though many test runners rename-track, in which case the witness cell is `test-references-symbol-of-id-X` rather than `test-references-symbol-named-foo`, and the rename is back in $N_W$.
- **Public-API-aware $W$.** Witness positions include the project's exported symbols and the cells `is-imported-by` from downstream packages. Public renames, public signature changes, removal of public functions are all visible.
- **Source-text $W$.** Witness positions include the project's own source-text content. Whitespace formatting, identifier capitalization, comment text — all visible. This $W$ is too rich for any non-trivial refactoring; the project's automorphism group under it is essentially trivial.
- **Behavior-only $W$.** Witness positions are the runtime trajectories produced by some workload. This is the strongest reading of "behavior preserving"; it admits transformations no source-tracking witness language admits, including changes of algorithm that produce identical outputs.

## The relativity is structural

Different witness languages select different sub-sheaves $\mathcal{F}^{\mathrm{code}}_W \subseteq \mathcal{F}^{\mathrm{code}}_U$, and the invisible subgroup is the kernel of the action on the chosen sub-sheaf. The invisible subgroups are nested:

$$W \subseteq W' \implies N_{W'}(v^{\mathrm{code}}) \subseteq N_W(v^{\mathrm{code}}).$$

A richer witness language has a smaller invisible subgroup — fewer transformations are refactorings under it. The disciplinary intuition that "the more we test, the harder it is to refactor" is the substrate-algebraic fact that more witness positions yield a more restrictive invisible subgroup.

## Practical consequence

A project does not have *one* refactoring discipline; it has one per witness language it has chosen to honor. A transformation may simultaneously be a refactoring under the test-only language, a breaking change under the public-API language, and a substantive change under the source-text language. All three classifications are correct.

This is why honest engineering communication names the witness language: "this is a refactoring under our public API contract" is meaningful; "this is a refactoring" alone is not — it is structurally underdetermined.

## Where used

- [refactor-as-invisible-automorphism](../theorems/refactor-as-invisible-automorphism.md) — central theorem stated relative to $W$.
- [public-api-rename-is-substantive](../theorems/public-api-rename-is-substantive.md) — the public-API-aware $W$ classification.
