---
title: Admissible Morphism Structure
keywords:
  - admissibility
  - morphism
  - stratification
layer: internal-theorem
status: plan
depends_on:
  - theorem/internal/stratified-site-structure
  - compose-morph
  - identify-morph
  - compose-filter
---

Given a stratified ∞-site `(C, (tau), σ)` as in **Theorem (Stratified
Infinity-Site Structure)**, the acts governing morphism formation and
factorisation determine a distinguished class of **admissible morphisms**
`Adm ⊂ Mor(C)` with the following properties:

1. **Stratified polarity (A1).**
   Each morphism `f : X → Y` comes with a declared variance (co/contra), and
   admissibility requires that the stratification difference `σ(Y) − σ(X)` is
   either zero or a single signed step matching that variance. This records
   that admissible steps respect the layered structure of the site.

2. **Sheaf-sound locality (A2).**
   For every cover `{U_i → X}` in `(tau)` and admissible `f : X → Y`, pullbacks
   `U_i ×_X Y` exist and the induced matching-family/gluing conditions are
   satisfied. In particular, admissibility is local on the coverage: if all
   pullbacks of `f` along a cover are admissible and glue, then so is `f`.

3. **Factorable shape (A3).**
   Every admissible morphism admits a functorial factorisation
   `f = m ∘ e` with:
   - `e` in a generative class `Gen` (introductions/expansions), and
   - `m` in an observational class `Obs` (eliminations/quotients),
   such that `Gen` and `Obs` are stable under pullback and composition.

The triple `(Adm, Gen, Obs)` is part of the structure of the stratified
∞-site: admissible sequents are pasting diagrams whose 1-cells lie in `Adm`
and whose higher cells witness the locality and factorisation laws above.
