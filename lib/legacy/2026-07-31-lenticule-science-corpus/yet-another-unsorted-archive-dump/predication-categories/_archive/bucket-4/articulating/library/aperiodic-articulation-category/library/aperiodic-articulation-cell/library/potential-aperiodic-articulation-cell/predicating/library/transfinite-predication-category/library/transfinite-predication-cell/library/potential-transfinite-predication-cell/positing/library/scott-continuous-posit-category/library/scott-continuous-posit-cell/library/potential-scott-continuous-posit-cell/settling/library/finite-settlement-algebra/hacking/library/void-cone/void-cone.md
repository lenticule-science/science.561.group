---
name: void-cone
kind: filtration
description: "The descending family V_0 ⊇ V_1 ⊇ V_2 ⊇ ... of unfired cells across a settling's closure ordinals. The void at stage τ is the set of cells that have not yet fired by time τ. The associated graded gr(Void_v) = ⊕_μ Z is indexed by non-scott-continuous firing ordinals; Verdier duality identifies it with the apex cohomology H^1(F_v) of the settling-associated-sheaf."
symbol: "Void_v = (V_τ)_{τ < κ}"
underlying-data: "for each ordinal τ < κ, the subset V_τ ⊆ Σ_E of cells unfired by stage τ"
dual-object: "void cosheaf F̌_v, the Verdier dual of settling-associated-sheaf"
associated-graded: "gr(Void_v) = ⊕_{μ ∈ L_ns(κ)} Z, one generator per non-scott-continuous firing ordinal"
permanent-void: "V_∞ = ∩_τ V_τ, cells that never fire"
minted-from: theorem-context — referenced as the central object by void-cone-cohomology, void-cone-associated-graded-direct, void-cone-via-filtration-ss, value-agnostic-void-cone, lorentzian-apex-void-as-timelike-spacelike, with no own archive scrap. Reconstructed primarily from void-cone-cohomology's three-step proof structure.
---

# Void cone

The **descending filtration of unfired cells** across a settling's closure ordinals. The void at stage τ is the set of cells that have not yet fired by time τ.

## Definition

For a settling `v` over base `B` with closure ordinal `κ`, the **void cone** is the family

$$\mathrm{Void}_v \;=\; (V_\tau)_{\tau < \kappa}, \qquad V_\tau \;\subseteq\; \Sigma_E,$$

where:

- `V_0 = Σ_E` (initially every cell is in the void: nothing has fired yet).
- `V_τ` is the set of cells `(p, x) ∈ Σ_E` with `v_τ(p, x) = ⊥` (no evidence at stage τ).
- `V_{<τ} = ∩_{σ<τ} V_σ` at limit ordinals τ.

The family is **descending**: `V_0 ⊇ V_1 ⊇ V_2 ⊇ ⋯`. As the settling progresses, cells leave the void (acquire firings).

The name "cone" reflects the shape: at each stage τ, `V_τ` is a slice; the union over τ traces a downward-narrowing cone in `(Σ_E × ordinals)`-space.

## Associated graded

The set-theoretic differences `V_{<τ} \ V_τ` record cells that left the void at stage τ:

- **At successor τ = σ+1**: `V_{<τ} \ V_τ = V_σ \ V_{σ+1}` — cells that fired at σ.
- **At limit τ**: `V_{<τ} \ V_τ ≠ ∅` iff τ is a **non-Scott-continuous firing ordinal** (some cell first fires at the limit, not at any predecessor).

Summing over τ gives the **associated graded**:

$$\mathrm{gr}(\mathrm{Void}_v) \;=\; \bigoplus_{\tau < \kappa} \mathbb{Z}^{V_{<\tau} \setminus V_\tau} \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$

with one `Z`-generator per non-Scott-continuous firing ordinal `μ` (Scott-continuous firings contribute trivially because their `V_{<τ} \ V_τ` is captured at a successor predecessor).

## Verdier dual: the void cosheaf

The void cone has a natural **cosheaf** structure `F̌_v` on the bitopological-settling-site `(T*, J)`, defined cellwise:

$$\check{\mathcal{F}}_v(q, \tau, U) \;:=\; \mathbb{Z}^{(V_{<\tau} \setminus V_\tau) \cap U},$$

counting cell-loss-from-void events within `U` up to stage τ. This is a cosheaf because the transitions for `τ' ≥ τ` are **inclusions** of cell-loss data, contravariant to the natural settling direction (the cosheaf direction).

By **Verdier duality on the bitopological settling site**, `F̌_v` is the Verdier dual of the settling-associated-sheaf `F_v`. The cosheaf homology computes:

$$H_1(\check{\mathcal{F}}_v) \;\cong\; \mathrm{gr}(\mathrm{Void}_v) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

## Apex-void Verdier pairing

By Verdier duality applied in degree 1:

$$H^1(\mathcal{F}_v) \;\cong\; H_1(\check{\mathcal{F}}_v) \;\cong\; \mathrm{gr}(\mathrm{Void}_v).$$

The apex cohomology of the settling-associated-sheaf — which classifies aperiodic settlings as `cl-inv(v) ∈ H^1` — is canonically isomorphic to the associated graded of the void filtration. The pairing is:

- **Apex generator** `e_μ^apex`: "cell acquired bilattice value `v(μ)` at firing `μ`."
- **Void generator** `ē_μ^void`: "cell at position `cell(μ)` left the void at firing `μ`."

These are the same firing event, viewed from the sheaf (apex) side vs. the cosheaf (void) side. Verdier duality realizes this as a literal isomorphism, not just an indexing coincidence.

## Permanent void

Cells that never fire form a separate invariant:

$$V_\infty \;:=\; \bigcap_{\tau < \kappa} V_\tau, \qquad H_0^{\mathrm{apex\ of\ Void}}(v) \;:=\; \mathbb{Z}^{V_\infty}.$$

This is **orthogonal to the firing-counting graded**: it measures cells that stay permanently unfired, complementary to the firing data.

For **aperiodic substitution settlings** on `E = ω_1`: `V_∞ = ∅` (every cell eventually fires).

For **non-aperiodic settlings** (strict, Scott-continuous, transfinite-bounded with stuck cells): `V_∞ ≠ ∅` can hold.

This gives a discrete invariant **orthogonal** to the firing-ordinal-indexed `H_1`.

## Concrete examples (per the canonical-substitution-per-regime mapping)

For primitive non-singular substitution settlings on `E = ω_1`:

| Substitution | Regime | `n` | `det(M)` | `H_1(F̌_v)` |
|---|---|---|---|---|
| **Padovan** | strict-finite | 3 | unimodular | `Z^3` |
| **Fibonacci** | Scott-continuous | 2 | -1 (unimodular) | `Z^2` |
| **Tribonacci** | transfinite-bounded | 3 | unimodular | `Z^3` |
| **Thue-Morse** | aperiodic (non-unimodular) | 2 | 0 | `Z[1/2]` (or profinite completion) |

For non-unimodular substitutions, the apex `Z`-localizes while the void `Z`-profinitely-completes — they're related by a `(limit, colimit)` duality.

## Connection to no-tunneling

By the no-tunneling theorem (`cl-inv-locally-constant-on-paths`), `cl-inv(v) = `H^1` is locally constant on settling paths. By the void-cone-cohomology theorem's Verdier pairing, `gr(Void_v)` is also locally constant. Together:

**The pair `(cl-inv(v), gr(Void_v)) ∈ H^1 × H_1(F̌_v)` is locally constant on settling paths.**

Smooth deformations preserve both apex content and the void's associated graded jointly.

## Position

`finite-settlement-algebra/hacking/library/void-cone/`. Settling tier — sibling of settling-associated-sheaf and distributed-settlement-system, since it's a fundamental settling-derived object that the cohomological framework computes on directly. `hacking/library/` because the void-cone is a structural construct derived from settling-cohomology but admitted at this position (the full derivation from settling primitives is downstream work).

## Derivation source

**Minted from theorem context.** Referenced as the central object by `void-cone-cohomology` (the most explicit definition source), `void-cone-associated-graded-direct`, `void-cone-via-filtration-ss`, `value-agnostic-void-cone`, `lorentzian-apex-void-as-timelike-spacelike`, with no own archive scrap. Reconstructed primarily from the void-cone-cohomology theorem's three-step proof structure.
