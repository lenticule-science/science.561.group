---
name: non-scott-continuous-firing-ordinal
kind: concept
description: "A limit ordinal μ at which a closure-rule-system's iteration adds content not derivable from any single earlier stage. The set L_ns(S, U) of such ordinals is the structural invariant distinguishing Scott-continuous closures (where L_ns is empty) from higher-regime closures (where L_ns is non-empty)."
symbol: "L_ns(S, U) ⊆ {countable limit ordinals}"
characterizes: "regime of the closure-rule-system's closure operator"
condition: "μ is a limit ordinal AND cl^S adds non-Scott-continuous content at μ"
minted-from: theorem-context — referenced by aperiodic-regime-realizability, aperiodic-regime-cohomology-via-direct-limit, aperiodic-regime-d-frame-cohomology, transfinite-bounded-regime-h1-generators, realizability-cardinality-bound, regime-stratification-non-semicontinuity, tangent-dimension-constructible-non-semicontinuous; no dedicated archive scrap. Content reconstructed from those references plus the closure-rule-system note's own discussion.
---

# Non-Scott-continuous firing ordinal

For a closure-rule-system `S` with increment-sequence `U` and generated closure operator `cl^S`, a limit ordinal `μ` is a **non-Scott-continuous firing ordinal** if `cl^S` adds content at `μ` that is **not derivable from any single earlier stage**.

The set

$$L_{\mathrm{ns}}(\mathcal{S}, U) \;:=\; \{\, \mu < \kappa(\mathcal{S}, U) \,:\, \mu \text{ a countable limit ordinal at which non-Scott-continuous firing occurs} \,\}$$

is the **realizability-determining invariant** of `S` (see `closure-rule-system` $thing for its general role).

## When `L_ns` is empty

`L_ns(S, U) = ∅` exactly when the closure is **Scott-continuous** — when

$$\mathrm{cl}^S\!\left(\bigvee_k S\right) \;=\; \bigvee_k \{\mathrm{cl}^S(s) : s \in S\}$$

for every directed `S`. In this case, the closure operator commutes with directed `∨_k`-joins, and all closure content at any limit ordinal is the join of content at preceding successors.

Scott-continuous closures live in the **Scott-continuous regime** with `κ ≤ ω`. Their `L_ns` is empty by definition.

## When `L_ns` is non-empty

A non-empty `μ ∈ L_ns(S, U)` records a step where the closure does something **transfinitely new** — adds a cell-update or value that no individual finite or successor stage contained. The directed-join at `μ` strictly under-counts what `cl^S` produces.

This is the structural signature of **non-Scott-continuous regimes**:

- **Transfinite-bounded** (`ω < κ < ω₁`): `L_ns(S, U) ≠ ∅` with all elements `< ω₁`.
- **Aperiodic** (`κ ≥ ω₁`): `L_ns(S, U)` includes ordinals `≥ ω₁`, OR the set is unbounded in `ω₁`.

## Cohomological consequence

The cohomological-framework theorems (aperiodic-regime-cohomology-via-direct-limit, transfinite-bounded-regime-h1-generators, etc.) use `L_ns(S, U)` directly as a **counting set for `H^1` generators**:

$$H^1(\mathbf{T}^*_{\leq \kappa},\, \mathcal{F}_U) \;\cong\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}.$$

Each non-Scott-continuous firing ordinal contributes one `Z`-generator to the cohomology. The `H^1` rank therefore equals `|L_ns(S, U)|`.

This is what makes `L_ns` a *cohomologically meaningful* invariant: it's not just a syntactic-flavor accident of how the rule-system is written; it controls the cohomological data of the orbit.

## Realizability question

The **realizability program** (archive narrative, not yet pulled) asks: which countable-ordinal subsets `L ⊆ {limit ordinals}` arise as `L_ns(S, U)` for some rule-system `S` and increment-sequence `U` in a given language fragment?

The answer stratifies by language fragment:

- **Bare Π_1 + < language**: `L_ns(S, U)` realizes exactly the **initial segments** of countable limit ordinals (aperiodic-regime-realizability theorem).
- **Π_2 schemas**: realizes more sets (rule-language-pi2-schemas-realizability theorem).
- **Second-order**: realizes still more (rule-language-second-order-realizability theorem).
- **Ordinal-arithmetic**: realizes everything definable in ordinal arithmetic.

The realizability stratification is the substrate's most direct connection between **syntactic rule-language complexity** and **cohomological/MLD-classification content**.

## Position

`scott-continuous-posit-category/hacking/library/closure-rule-system/docs/dev/concepts/`. The concept is structurally part of closure-rule-system's behavior — it characterizes when the rule-system's orbit is Scott-continuous vs not. Placed at positing tier under closure-rule-system's docs (rather than as a separate $thing) because it has no own substrate-object identity; it's an invariant.

## Derivation source

**Minted from theorem context**, not from a dedicated archive scrap. The concept is referenced by 7+ archive theorems and one narrative; content here is reconstructed from those references (with the closure-rule-system $thing's existing discussion as the primary anchor).
