---
type: concept
class: algebra
depends-on: [substrate-value-domain, closure-rule]
see-also: [closure-rule-application, settle, settling-as-computation]
---

# Extend/restrict adjoint

The substrate's two fundamental binary operations on its value domain, paired by an adjoint relationship that fixes their behavior. Every closure-rule application, every settled-state derivation, every coherence-glue resolution is a composition of these two. Naming them once, here, lets the substrate's higher-level operators be specified as compositions instead of as ad-hoc procedures.

In the math reformulation, the pair is realized as [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) $\odot$ and [twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) $\Rightarrow$ on the [twist product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) $\mathbf{L}^\bowtie$ over a [residuated lattice](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/residuated-lattice.md) $\mathbf{L}$. The substrate's value-domain operations are the lifts of these to the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) at each predicate.

The two operations:

- **Extend (⊙).** Combine two value-domain elements into a single element representing *what holds when both hold*. For Boolean values, this is conjunction; for [evidence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/evidence.md)-valued elements (positive coordinate / negative coordinate), this is the [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md). The extend operation is the substrate's *evidence-fusion* primitive.
- **Restrict (⇒).** Given two value-domain elements `a` and `q`, return the largest element `p` such that extending `a` with `p` still yields at most `q`. This is the substrate's *conclusion-derivation* primitive — the [twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) — answering: "given that `a` holds and we want at most `q`, what is the strongest auxiliary claim we may admit?"

The adjoint condition pairs them:

`a ⊙ p ≤ q  iff  p ≤ a ⇒ q`

Reading: the elements `p` such that fusing them with `a` stays within `q` are exactly the elements below `a ⇒ q`. The condition is what makes `⇒` *the right* derivation operation given the choice of `⊙`; if it failed, every closure-rule application would be a separate special case.

## Why this pair is the substrate's primitive

Three engineering invariants follow from the adjoint condition:

- **Composition without information loss.** When a closure rule fuses an entity's existing predications with a newly admitted predication, it uses `⊙`. The adjoint condition guarantees the fused result is the join of evidence — not a lossy combination — and that any subsequent rule applying to the fused state derives the same conclusion as if it had been applied to the constituent evidence in either order. This is why the substrate's settlement is order-independent for confluent rule sets.
- **Conclusions are bounded.** When a closure rule derives a conclusion from premises, the derived conclusion is the largest element consistent with the premises and the substrate's value-domain structure (per `⇒`). The substrate cannot derive a *stronger* conclusion than `a ⇒ q` allows; any rule purporting to do so is violating the value-domain's algebra. This is what makes the substrate's settled state a deterministic function of the admitted content.
- **Disagreement is detected, not silenced.** When two extensions of the same predication disagree — `a ⊙ p` exceeds `q` for some `p` — the adjoint condition forbids the substrate to silently absorb the disagreement. The substrate's response is per [coherence-glue](../morphisms/coherence-glue.md): record the contested predication and surface it, rather than picking one side. This is why the substrate cannot accidentally lose contradicting evidence.

## How the higher-level operators decompose

The substrate's higher-level operators are compositions of `⊙` and `⇒`:

- **[Closure-rule application](../morphisms/closure-rule-application.md)** at one entity is: extend the entity's predications with the rule's premise pattern, restrict to derive the rule's conclusion, insert the conclusion. Two `⊙`s and one `⇒`.
- **[Settle](../morphisms/settle.md)** is: iterate closure-rule application across the wavefront until quiescence (per [settling-as-computation](settling-as-computation.md)). The transitive closure of closure-rule application, which is the transitive closure of `⊙`/`⇒` compositions.
- **[Coherence-glue](../morphisms/coherence-glue.md)** is: for two compatible predications about the same target, extend their values and check whether the result respects the substrate's shape commitments. If yes, glue; if no, surface contested. Pure `⊙` plus a shape-side `⇒`.
- **[Validate-against-shape](../morphisms/validate-against-shape.md)** is: extend the candidate predication with the shape's expected predication, restrict against the shape's admissible value set. If the result is below the shape's tolerance, accept; otherwise reject.

A reader familiar with the operators above can ask, of any new operator the substrate proposes: *what is its `⊙`/`⇒` decomposition?* If the operator cannot be decomposed cleanly, it is acting outside the substrate's algebra — typically a sign that runtime logic has been smuggled into substrate territory, in violation of [driver-substrate-split](driver-substrate-split.md).

## Adjoint structure across value-domain choices

Different predicated computers pick different value domains; the adjoint structure persists across the choices, even as the concrete operations differ. All the choices below are obtained by varying the [residuated lattice](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/residuated-lattice.md) $\mathbf{L}$ that the [twist product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) $\mathbf{L}^\bowtie$ is taken over:

| Value domain | $\mathbf{L}$ | `⊙` | `⇒` | Source |
|---|---|---|---|---|
| Boolean | $\mathbf{2}$ on its own (no twist) | logical AND | logical implication | Classical |
| [Four-valued bilattice](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md) | $\mathbf{2}^\bowtie$ | [twist-product fusion](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-fusion.md) | [twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) | [adjoint-structure-spo-bilattice](references/adjoint-structure-spo-bilattice.md) |
| Multi-valued bilattice | $\mathbf{L}^\bowtie$ for $\mathbf{L}$ a Heyting algebra | twist-product fusion | twist-product right residual | Standard |
| Quantale-weighted bilattice | $\mathbf{L}^\bowtie$ for $\mathbf{L}$ a commutative quantale | quantale-fused twist | quantale residuated twist | [@adjoint-structure-spo-bilattice] |
| Open sets in a topology | locale (no twist) | intersection | Heyting implication | Locale-theoretic |

In every case the adjoint condition `a ⊙ p ≤ q ⇔ p ≤ a ⇒ q` holds, with the order `≤` interpreted in the value domain. This is what makes the substrate's algebra value-domain-portable: a predicated computer can change its value domain without redesigning its closure-rule application, settlement, or coherence-glue logic — only the concrete `⊙` and `⇒` change. The math reformulation makes this portability visible at the level of the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md): every choice produces a fiber algebra of the same shape, with $\odot$ and $\Rightarrow$ inheriting from $\mathbf{L}^\bowtie$.

## Position in the substrate

The extend/restrict adjoint is the substrate's *fundamental binary algebra*. Without it explicitly named, every operator carries its own implicit understanding of how evidence combines and how conclusions are derived; with it named, every operator is an `⊙`/`⇒` composition over a chosen value domain. The substrate's portability across value domains, its determinism under canonical input, and its consistent handling of contested predications all derive from the adjoint condition holding uniformly.

The pattern composes with [substrate-value-domain](substrate-value-domain.md) (the value domain is the choice of carrier; the adjoint pair is what makes any carrier admissible as a value domain), with [closure-rule](closure-rule.md) (a closure rule is a `⊙`/`⇒` recipe expressed at the predication level), and with [coherence-glue](../morphisms/coherence-glue.md) (gluing two predications is `⊙`-ing their values and checking the result against the shape's `⇒`-bound).
