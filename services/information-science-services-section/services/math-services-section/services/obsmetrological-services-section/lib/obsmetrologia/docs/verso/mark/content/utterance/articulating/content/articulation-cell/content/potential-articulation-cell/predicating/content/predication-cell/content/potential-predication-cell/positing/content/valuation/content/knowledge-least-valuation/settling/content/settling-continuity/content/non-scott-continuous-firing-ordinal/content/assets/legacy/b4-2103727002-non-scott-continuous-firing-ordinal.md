---
name: non-scott-continuous-firing-ordinal
kind: ordinal-class
description: "The set L_ns(κ) of limit ordinals μ ≤ κ where the settling sequence first fires a cell at μ — not at any predecessor. These are the firings invisible to Scott-continuous approximation. The set L_ns(κ) indexes the generators of H^1(F_v) and of gr(Void_v); its cardinality is the rank of the substrate's aperiodic invariant."
symbol: "L_ns(κ)"
domain: "limit ordinals μ ≤ κ where κ is the settling closure ordinal"
characterizes: "firings that survive the Scott-continuous regime collapse"
indexes:
  - "generators of apex cohomology H^1(F_v)"
  - "generators of the void's associated graded gr(Void_v)"
  - "generators of cosheaf homology H_1(F̌_v)"
zero-for-regimes: ["strict (κ<ω)", "Scott-continuous (κ=ω)"]
nonzero-for-regimes: ["transfinite-bounded (ω<κ<ω_1)", "aperiodic (κ≥ω_1)"]
minted-from: theorem-context — referenced by void-cone-cohomology, void-cone-associated-graded-direct, void-cone-via-filtration-ss, regime-stratification-non-semicontinuity, combinatorial-classification-across-regimes, lorentzian-apex-void-as-timelike-spacelike, with no own archive scrap. Reconstructed from the void-cone-cohomology theorem's discussion of NSC firings.
---

# Non-Scott-continuous firing ordinal

The set of limit ordinals where the settling first fires a cell **at the limit** — without that firing being capturable at any predecessor.

## Definition

For a settling `v` with closure ordinal `κ`, the **non-Scott-continuous firing ordinal set** is

$$L_{\mathrm{ns}}(\kappa) \;:=\; \{ \mu \leq \kappa \mid \mu \text{ is a limit ordinal and } V_{<\mu} \setminus V_\mu \neq \emptyset \},$$

where `V_τ` is the void at stage τ and `V_{<μ} = ∩_{σ<μ} V_σ`. A limit ordinal `μ` is in `L_ns(κ)` iff there is at least one cell that **first leaves the void at μ** — invisible to any approximation by predecessors.

## Why "non-Scott-continuous"

A function `f: Ord → X` is **Scott-continuous** at limit ordinal `μ` if `f(μ) = lim_{σ<μ} f(σ)`. The void function `τ ↦ V_τ` is Scott-continuous at `μ` iff `V_μ = V_{<μ}` (no cell first-fires at the limit).

`L_ns(κ)` is the set of limit ordinals where this fails: where a cell first-fires at the limit, contributing a new event that the predecessors couldn't see.

The substrate's regime classification (per `four-regime-dichotomy`) is structured around `L_ns(κ)`:

| Regime | `κ` range | `L_ns(κ)` |
|---|---|---|
| **Strict-finite** | `κ < ω` | `∅` (no limit ordinals at all) |
| **Scott-continuous** | `κ = ω` | `∅` (settling continuous at `ω`) |
| **Transfinite-bounded** | `ω < κ < ω_1` | non-empty, countable |
| **Aperiodic** | `κ ≥ ω_1` | non-empty, can be uncountable |

The strict and Scott-continuous regimes are precisely the regimes where `L_ns(κ) = ∅` — all firings are Scott-continuous. The transfinite-bounded and aperiodic regimes are where NSC firings appear, providing the structural source of non-trivial `H^1` invariants.

## Cardinality as rank

For aperiodic substitution settlings with substitution matrix `M` of size `n`, the cardinality `|L_ns(κ)|` controls the rank of the apex cohomology:

$$\mathrm{rank}_{\mathbb{Z}} \, H^1(\mathcal{F}_v) \;=\; |L_{\mathrm{ns}}(\kappa)|.$$

For primitive substitutions, `|L_ns(κ)|` equals the matrix size `n` (post-quotient by units). Per the canonical-substitution-per-regime mapping:

- **Fibonacci** (`n = 2`, Scott-continuous regime base): the substrate's Scott-continuous extension yields `|L_ns(κ)| = 2`.
- **Padovan** (`n = 3`, strict-finite regime base): the substrate's transfinite extension yields `|L_ns(κ)| = 3`.
- **Tribonacci** (`n = 3`, transfinite-bounded regime base): `|L_ns(κ)| = 3`.

## Substrate uses

`L_ns(κ)` is the **central indexing set** for several substrate invariants:

| Invariant | What `L_ns(κ)` indexes |
|---|---|
| `H^1(F_v) ≅ ⊕_μ Z` | one apex generator per μ ∈ L_ns(κ) |
| `H_1(F̌_v) ≅ ⊕_μ Z` | one void generator per μ ∈ L_ns(κ) |
| `gr(Void_v) ≅ ⊕_μ Z` | one associated-graded generator per μ |
| `cl-inv(v)` | rank determined by |L_ns(κ)| |
| Anderson-Putnam direct limit | filtration indexed by L_ns(κ) |

## How `L_ns(κ)` is computed

For a settling `v = (v_τ)_{τ<κ}`:

1. Compute the void family `(V_τ)_{τ<κ}` directly: `V_τ = {cells c : v_τ(c) = ⊥}`.
2. For each limit ordinal `τ < κ`, check `V_{<τ} \ V_τ`: if non-empty, `τ ∈ L_ns(κ)`.
3. The set `L_ns(κ)` accumulates over all such τ.

In practice, `L_ns(κ)` is bounded above by the size of the closure-rule-system (each NSC firing corresponds to a closure-rule firing at a limit step that wasn't pre-fireable at any predecessor).

## Position

`finite-settlement-algebra/library/non-scott-continuous-firing-ordinal/`. Settling tier — direct `library/` (derived term of the finite-settlement-algebra: the NSC firings are a property of settling sequences derivable from the closure-rule structure). Not `hacking/library/` because the derivation from settling primitives is direct.

## Derivation source

**Minted from theorem context.** Referenced by `void-cone-cohomology` (the most explicit characterization source), `void-cone-associated-graded-direct`, `void-cone-via-filtration-ss`, `regime-stratification-non-semicontinuity`, `combinatorial-classification-across-regimes`, `lorentzian-apex-void-as-timelike-spacelike`, with no own archive scrap. Reconstructed from the void-cone-cohomology theorem's discussion plus the four-regime dichotomy's interaction with limit-step firings.
