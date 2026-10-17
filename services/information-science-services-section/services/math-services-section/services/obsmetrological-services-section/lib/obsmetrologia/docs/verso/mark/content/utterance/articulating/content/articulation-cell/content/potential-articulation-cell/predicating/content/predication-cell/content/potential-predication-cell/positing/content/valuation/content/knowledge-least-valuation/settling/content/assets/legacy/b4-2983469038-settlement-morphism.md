---
name: settlement-morphism
description: "A morphism φ: v → v' between settlements over a common base (L, C, E, λ). Consists of an ordinal shift δ and a family of bilattice-homomorphisms φ_{q,τ}: A_q → A_q satisfying state-compatibility (φ_{q,τ}(v_τ(q)) = v'_{τ+δ}(q)) and settling-endofunctor commutation (φ ∘ F_U = F_{U'} ∘ φ). The strongest of three same-base settlement-morphism notions; the 1-cell of the moduli 2-category whose biequivalences are MLD."
depends-on: [settlement, settling-endofunctor, settling-bound, predication-fiber-algebra, bilattice-homomorphism]
derives-from: docs/dev/scraps/settling-morphism.md
---

# Settlement-morphism

A **settlement-morphism** `φ : v → v'` between settlements over a common base `(L, C, E, λ)` respects both the orbit's state at each ordinal step AND the structural action of the settling-endofunctor.

Concretely, `φ` consists of:

1. An **ordinal shift** `δ ∈ λ`.
2. A family `φ = (φ_{q, τ})` of bilattice-homomorphisms `φ_{q, τ}: A_q → A_q` on each predication-fiber-algebra,

satisfying, for every `q ∈ C` and every `τ < λ − δ`:

**(A) State compatibility.**
$$\phi_{q, \tau}\bigl(v_\tau(q)\bigr) \;=\; v'_{\tau + \delta}(q).$$

**(B) Settling-endofunctor commutation.**
$$\phi_{q, \tau + 1} \circ (F_U)_q \;=\; (F_{U'})_q \circ \phi_{q, \tau},$$
up to canonical 2-isomorphism.

A settlement-morphism is **invertible** iff there exists `ψ : v' → v` with `ψ ∘ φ` and `φ ∘ ψ` equal to identity up to ordinal shifts `δ` and `−δ`.

## The two structural conditions, separated

**State compatibility (A)** pins down what each `φ_{q, τ}` does on values. Reading `φ_{q, τ}` as a bilattice-homomorphism, condition (A) says: applying `φ_{q, τ}` to `v`'s state at step `τ`, predicate `q` recovers `v'`'s state at step `τ + δ`, predicate `q`. This is "the morphism matches the static state shifted by `δ`."

**Settling-endofunctor commutation (B)** pins down that `φ` respects the **structural closure pattern**, not just static values. The settling-endofunctor `F_U` (driven by the first orbit's closure-rule-system and increment-sequence) and `F_{U'}` (driven by the second orbit's) may differ. The commutation says: stepping forward via `F_U` and then applying `φ` equals applying `φ` and then stepping forward via `F_{U'}`. The two orbits are not just statically related; their **inferential dynamics** match under `φ`.

This is the structural payoff. Condition (A) alone would allow any pointwise matching, even if the orbits' rule systems diverge. Condition (B) forces inferential coherence: the rule systems must be related by `φ` so that "closure then morphism" agrees with "morphism then closure" up to 2-isomorphism.

## Composition

Settlement-morphisms compose, with ordinal shifts adding:

$$(\phi_1 : v_1 \to v_2) \circ (\phi_2 : v_2 \to v_3) \;=\; (\phi_2 \circ \phi_1 : v_1 \to v_3, \;\; \delta_2 + \delta_1).$$

This makes settlements over a fixed base into a 2-category with settlement-morphisms as 1-cells.

## Three settlement-morphism notions, distinguished

Same-base relations between settlements come in **three strengths**:

| Notion | What's required | What it tracks |
|---|---|---|
| **settlement-preorder-morphism** | `v ≤_k v'` pointwise stepwise | only static `≤_k`-ordering |
| **settlement-morphism** (this $thing) | ordinal shift + bilattice-hom family + (A) + (B) | static state AND inferential dynamics |
| **settlement-base-morphism** | varies the base parameters `(L, C, E, λ)` | cross-base content |

The first is the morphism class of `settlement-category` (a thin preorder). The second is this $thing — the 1-cell of the **moduli 2-category** whose biequivalences are `mutually-locally-derivable` equivalence. The third varies the base and is the morphism class of the total category over the parameter-base-category.

Every invertible settlement-morphism induces a settlement-preorder-morphism (taking `δ = 0` and reading the state-compatibility as `≤_k`-equality). The reverse does NOT hold: a preorder morphism is just a `≤_k`-witness; it need not extend to a settlement-morphism because (B) might fail (rule systems may diverge).

## Use: MLD equivalence

Two **aperiodic-regime** settlements `v, v'` are mutually locally derivable iff there exists an **invertible** settlement-morphism `φ: v → v'`. This is what makes MLD the right equivalence for the aperiodic regime: the invertibility plus (A) plus (B) ensures the two orbits are dynamically identical up to ordinal shift, even though their literal closure-rule-systems may differ.

The aperiodic-regime classification theorem (archive theorem, not yet pulled) extracts a complete invariant for MLD-classes — the `aperiodic-classifying-invariant` — separating two aperiodic settlements iff no invertible settlement-morphism connects them.

## Why this is settling-tier specifically

The notion presupposes:

- A **settling-bound** `λ` (for the ordinal shift `δ ∈ λ`).
- The **settling-endofunctor** `F_U` (for condition B).
- The **predication-fiber-algebra** family `{A_q}` (for the homomorphisms).
- Two **settlements** as endpoints.

All four ingredients live at settling tier (the homomorphisms work pointwise on the value-algebra carrier but the *whole structure* is settling-tier). Placement is therefore at `settling/hacking/library/`.

## Worked example: identity settlement-morphism

For `v = v'` (same settlement on both sides), `δ = 0`, `φ_{q, τ} = id_{A_q}`:

- (A) `id(v_τ(q)) = v_τ(q)` ✓ (state-compatibility holds trivially).
- (B) `id ∘ F_U = F_U ∘ id` ✓ (commutation holds trivially).

This is the identity 1-cell of `v` in the moduli 2-category. Every settlement has one.

## Worked example: an ordinal-shift settlement-morphism

Take `v = (⊥, t, t, t, ...)` (a settlement that quiesces at `τ = 1` with value `t`) and `v' = (⊥, ⊥, t, t, ...)` (the same orbit shifted by one ordinal step). With `δ = 1` and `φ_{q, τ} = id`:

- (A) `id(v_τ(q)) = v_τ(q) = v'_{τ + 1}(q)` ✓ — the shift compensates.
- (B) commutation requires the rule system of `v` and `v'` agree under the shift. If `v` and `v'` are produced by the same closure-rules but the second's increment-sequence starts one step later, (B) holds.

This is a typical invertible settlement-morphism — the inverse is the `δ = −1` shift.

## Derivation source

Adapted from `predication-categories/morphisms/settling-morphism.md`, preserved verbatim at `docs/dev/scraps/`. The archive's name "settling-morphism" is translated to `settlement-morphism` per the four-object grammar: this is a morphism of `settlement`s (not a thing called "settling-something").
