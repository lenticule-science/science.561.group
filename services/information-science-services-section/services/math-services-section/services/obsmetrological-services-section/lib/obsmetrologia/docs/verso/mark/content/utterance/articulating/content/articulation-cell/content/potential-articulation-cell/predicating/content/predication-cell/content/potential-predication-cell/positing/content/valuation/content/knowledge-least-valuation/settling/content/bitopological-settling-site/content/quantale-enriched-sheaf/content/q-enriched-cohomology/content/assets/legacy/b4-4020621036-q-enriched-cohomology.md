---
name: q-enriched-cohomology
kind: cohomology-theory
description: "Cohomology of Q-enriched sheaves on a Grothendieck site, defined via three equivalent presentations (under appropriate hypotheses): cochain cohomology, fixed-point cohomology (Lawvere-Laplacian style), derived-functor cohomology. The three agree on Boolean d-frame stalks per q-enriched-derived-cohomology-boolean-d-frame theorem."
on-site: "Grothendieck site"
valued-in: "Q-Cat_cwl (complete weighted lattices)"
three-equivalent-presentations:
  cochain: "H^n_coch(F) — direct Čech cochain complex on the site"
  fixed-point: "H^n_fix(F) — Lawvere-Laplacian fixed-point cohomology"
  derived: "H^n_der(F) — right-derived functors of global sections"
agreement-scope: Boolean d-frame stalks (proven); non-Boolean cases (Heyting, MV, Lawvere-quantale) open
minted-from: theorem-context — referenced by q-enriched-derived-cohomology-boolean-d-frame, lawvere-laplacian-grothendieck-sites, q-enriched-cohomology-higher-degree-vanishing; no own archive scrap. Reconstructed from those theorem references.
---

# Q-enriched cohomology

The **cohomology of Q-enriched sheaves** on a Grothendieck site, defined via three presentations that agree (under appropriate hypotheses) on Boolean d-frame stalks:

| Presentation | Definition |
|---|---|
| Cochain `H^n_coch(F)` | direct Čech cochain complex on the site, with `δ^n` the alternating-sum coboundary |
| Fixed-point `H^n_fix(F)` | Lawvere-Laplacian fixed-point cohomology — kernel of the weighted-meet coboundary equals the unit |
| Derived `H^n_der(F)` | right-derived functors of bounded global sections in the Q-enriched sheaf category |

## Three-way agreement (Boolean d-frame case)

**Theorem (q-enriched-derived-cohomology-boolean-d-frame; status: proved, scope: Boolean d-frame stalks only):**

For a Q-enriched cellular sheaf `F` on a regular CW complex (or Grothendieck site with cellular fibers) with **stalks complete Boolean algebras** and frame morphisms as restrictions:

$$H^n_{\mathrm{coch}}(F) \;\cong\; H^n_{\mathrm{fix}}(F) \;\cong\; H^n_{\mathrm{der}}(F)$$

for all `n ≥ 0`, naturally in `F`.

This makes the chapter's cochain-level cohomology results genuine derived-functor cohomology in the typical setting.

## Why three definitions

Different presentations are useful for different purposes:

- **Cochain `H^n_coch`** — computational. Direct calculation on small sites; finite-dimensional linear algebra for small `n`.
- **Fixed-point `H^n_fix`** — Lawvere-Laplacian flavor. Naturally connects to fixed-point structures of cl operators and to the substrate's closure-2-monad apparatus.
- **Derived `H^n_der`** — homological-algebra standard. Connects to general categorical machinery (long exact sequences, spectral sequences, Ext groups).

Where the three agree (Boolean d-frame), any can be used; downstream theorems often cite whichever is most convenient.

## Where they don't (yet) agree

The Boolean d-frame restriction is essential. Non-Boolean cases have **structural reasons** for potential disagreement:

- **Heyting algebra stalks**: lacks complementation; fixed-point and cochain may differ when reflecting non-classical truth.
- **Lawvere-quantale stalks** (`Q = [0, ∞]`): metric-style values; weighted-meet coboundary has different fixed points than alternating-sum.
- **MV-algebra stalks**: continuous Łukasiewicz semantics; cochain alternation doesn't match fixed-point semantics.

These non-Boolean cases are genuinely open per the cohomological-framework note's framework-4 caveats.

## Position

`finite-settlement-algebra/hacking/library/quantale-enriched-sheaf/library/q-enriched-cohomology/`. Settling tier — the cohomology theory on Q-enriched sheaves, placed inside `quantale-enriched-sheaf/library/` as a derived structure (Q-enriched cohomology IS the cohomology of Q-enriched sheaves).

## Derivation source

**Minted from theorem context.** Referenced by `q-enriched-derived-cohomology-boolean-d-frame`, `lawvere-laplacian-grothendieck-sites`, `q-enriched-cohomology-higher-degree-vanishing`; no own archive scrap. Reconstructed from those theorem references.
