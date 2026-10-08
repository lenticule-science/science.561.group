---
name: q-fuzzy-equivalence
kind: relation
description: "A Q-valued equivalence relation between cellular sections of a Q-enriched sheaf — generalizes strict equality to Q-degree-of-equivalence. Accumulates as the fuzziness budget threaded through Curry-equivalence proofs; bounds quasi-isomorphism degrees on the cohomology side."
symbol: "≈_Q"
between: "sections F(σ_1), F(σ_2) of a Q-enriched sheaf F"
valued-in: "Q (the quantale)"
laws: "reflexive (s ≈_Q^1 s, top in Q), symmetric (s ≈_Q^q t ⟺ t ≈_Q^q s), transitive-via-quantale-multiplication (s ≈_Q^q t ∧ t ≈_Q^r u ⟹ s ≈_Q^{q·r} u)"
minted-from: theorem-context — referenced as the "fuzziness budget" parameter in q-enriched-curry-finite-graph, q-enriched-curry-cw-complex, q-enriched-curry-grothendieck-site, q-enriched-curry-transfinite-cw, and Q-enriched derived cohomology theorems; never given its own archive scrap.
title: q-fuzzy-equivalence
---

# Q-fuzzy equivalence

A **Q-valued equivalence relation** between cellular sections of a Q-enriched sheaf. Generalizes strict equality (`=`) to **degree-of-equivalence** drawn from the quantale `Q`.

## Definition

For a quantale `Q = (Q, ≤, ⊗, 1)` (integral commutative when used here) and sections `s, t` of a Q-enriched sheaf `F`, a **Q-fuzzy equivalence** between `s` and `t` is a quantale element

$$q \in Q, \qquad s \approx_Q^q t,$$

satisfying:

1. **Reflexivity**: `s ≈_Q^1 s` (the quantale's top is full equivalence).
2. **Symmetry**: `s ≈_Q^q t ⟺ t ≈_Q^q s`.
3. **Transitivity via quantale multiplication**: if `s ≈_Q^q t` and `t ≈_Q^r u`, then `s ≈_Q^{q⊗r} u`. The quantale multiplication accumulates fuzziness budget along a chain of equivalences.
4. **Substitution under sheaf operations**: if `s ≈_Q^q t` in `F(σ)`, then for any restriction `ρ: F(σ) → F(σ')`, `ρ(s) ≈_Q^q ρ(t)` — restrictions preserve fuzziness budget.

The classical Boolean case `Q = 2 = {0, 1}` recovers ordinary equivalence: `q = 1` is "equal" and `q = 0` is "not equal."

## Why the quantale-multiplication is key

The fuzziness accumulates along chains via `⊗`, not via `∧` or some other operation. This is structurally significant for several reasons:

**1. Loop-around-a-cycle holonomy.** When restrictions compose around a graph cycle, the fuzziness budget at the loop's start vs end is

$$s \;\approx_Q^{q_1 \otimes q_2 \otimes \ldots \otimes q_n} \rho(s)$$

The product over the cycle is what Q-enriched cellular sheaf cohomology computes in `H^1`. If `Q` is non-idempotent (typical case), longer cycles accumulate more fuzziness.

**2. Curry equivalence threading.** In the Q-enriched Curry chain (theorems at this object's `docs/dev/theorems/`), the equivalence sheaf-side ↔ cosheaf-side is itself Q-fuzzy: not "strictly equal as categories" but "equivalent up to Q-fuzziness `q`." The fuzziness budget `q` is a parameter of the Curry equivalence; the theorems track how `q` grows with cell-count, cycle-count, or transfinite-step-count.

**3. Cohomology comparison bounds.** When comparing Q-enriched cohomology classes across regimes (`q-enriched-derived-cohomology-boolean-d-frame`), the fuzziness-budget `q` controls the comparison degree: `H^n(F) ≅_Q^q H^n(F')` is a quasi-isomorphism in degree `q`.

## Substrate role: the fuzziness budget threaded through Curry chain

Each theorem in the Q-enriched Curry chain references `q-fuzzy-equivalence` in a controlled way:

| Theorem | How fuzziness accumulates |
|---|---|
| `q-enriched-curry-2-cell` | Single 2-cell: `q` is constant from `Q`. |
| `q-enriched-curry-2-cell-fuzzy` | Fuzzy 2-cell: `q` is given as input parameter. |
| `q-enriched-curry-finite-graph` | Graph with `E` edges: `q = q_1 ⊗ ⋯ ⊗ q_{|E|}`. |
| `q-enriched-curry-2-dim-degree-0` | Degree-0 sections on 2-dim complex: `q = ⊗_σ q_σ`. |
| `q-enriched-curry-cw-complex` | General CW complex: `q` is a per-cell tensor product. |
| `q-enriched-curry-transfinite-cw` | Transfinite cell complex: `q` is a transfinite quantale-product (well-defined via Scott-continuity assumption on `Q`). |
| `q-enriched-curry-grothendieck-site` | Grothendieck site: `q` accumulates base-fuzziness ⊗ fiber-fuzziness. |

The substrate's fuzziness-accumulation IS the quantale-product over the site's cell structure.

## Worked example: triangle holonomy

A triangle `Δ = σ_1 ∪ σ_2 ∪ σ_3` (three edges, one face) carrying a Q-enriched sheaf with edge-restrictions `ρ_1, ρ_2, ρ_3`. A section `s` at a chosen vertex transports around the triangle as

$$s \;\to\; \rho_1(s) \;\to\; \rho_2 \rho_1(s) \;\to\; \rho_3 \rho_2 \rho_1(s).$$

If `ρ_i` is `q_i`-fuzzy (the restriction is fuzzy in degree `q_i`), then

$$s \;\approx_Q^{q_1 \otimes q_2 \otimes q_3} \; \rho_3 \rho_2 \rho_1(s).$$

If the sheaf is **trivial-holonomy** (the round-trip is strict-equal), this forces `q_1 ⊗ q_2 ⊗ q_3 = 1`. If `Q` is non-trivial, this is a genuine constraint on the per-edge fuzziness — exactly the constraint that lives in `H^1` of the Q-enriched cellular sheaf.

## Why this is a "concept" not an "object"

A specific `s ≈_Q^q t` is an instance, not a self-standing object. The `q-fuzzy-equivalence` $thing organizes the family of such instances and their laws — a relation-kind rather than a set-kind. It sits at the same conceptual layer as "C-naturality" (per `predicate-category-naturality`): a property a piece of data may or may not satisfy.

## Position

`finite-settlement-algebra/hacking/library/quantale-enriched-sheaf/library/q-fuzzy-equivalence/`. Settling tier — fuzziness budget is what Q-enriched sheaves *are* (a sheaf valued in `Q-Cat_cwl` thereby carrying Q-fuzzy structure). Placed inside `quantale-enriched-sheaf/library/` because the equivalence is structurally a sub-component of the sheaf's enrichment data.

## Derivation source

**Minted from theorem context.** Referenced repeatedly as the fuzziness budget parameter in the Q-enriched Curry chain theorems (every one of them tracks `q`) and in `q-enriched-derived-cohomology-boolean-d-frame`. No own archive scrap. Reconstructed from how those theorems track `q`, plus standard quantale-enriched-category-theory definitions of Q-valued equivalences (the Lawvere-Bénabou-Walters generalized-metric-space formulation specialized to symmetric Q-equivalences).
