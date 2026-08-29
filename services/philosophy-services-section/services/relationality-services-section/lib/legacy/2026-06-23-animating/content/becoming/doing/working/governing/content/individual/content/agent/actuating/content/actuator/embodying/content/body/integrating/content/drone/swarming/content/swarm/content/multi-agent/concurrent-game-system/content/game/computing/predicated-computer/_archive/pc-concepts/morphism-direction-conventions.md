---
type: concept
class: convention
depends-on: [stepping, substrate-state]
see-also: [predicated-computer, time-and-event-ordinals]
---

# Morphism direction conventions

The substrate has *two* different categorical levels at which morphisms are directed, and they go in *opposite* directions. The substrate's history category $T$ and the substrate's fiber doctrine $H : T^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ are connected by *contravariance* — the doctrine functor reverses arrows. The reversal is structurally load-bearing (it is what makes restriction maps go from later fibers to earlier ones, which is what makes replay work) and operationally treacherous (an engineer reading "source" or "target" without checking which level they refer to will get the direction wrong).

This concept names the four terms that arise from the two-level structure — *source*, *target*, *domain*, *codomain* — and fixes which level each lives at. Without the convention, the four terms collide into a single word "where the morphism goes," and the substrate's algebra silently breaks for anyone who confuses the levels.

## The two levels

The substrate's structure has two categorical levels:

- **The history category $T$.** Objects are *histories* — equivalence classes of admitted message sequences modulo the [port](port.md)'s independence relation. Morphisms are *prefix extensions*: there is a morphism $f : t \to t'$ when $t$ is a prefix of $t'$ (when admitting more messages to $t$ produces $t'$). The history category is the substrate's *time line* up to independence.
- **The fiber doctrine.** A *contravariant* functor whose target at each history $t$ is the substrate's content there — realized as the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p$ at each [predicate](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/predicate.md), in the math reformulation. The doctrine assembles into a [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md) with the [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) as base; the substrate's history-indexed fibers are the time-extension of this. Each prefix extension $f : t \to t'$ in $T$ induces a *restriction map* $H_{t'} \to H_t$ — direction reversed. The induced map asks "what did this fiber's content look like *before* the extension?"

The contravariance is what makes the substrate's audit and replay work. Forgetting later content to recover earlier content is structurally backward — restriction goes from longer history to shorter. The fiber doctrine encodes the backward direction directly.

## The four terms

Four terms arise from the two levels, and the substrate's discipline keeps them strictly named:

- **Source** (T-level). The history $t$ from which a prefix extension $f : t \to t'$ *departs*. The shorter history. The earlier point in the history line.
- **Target** (T-level). The history $t'$ at which $f$ *arrives*. The longer history. The later point.
- **Domain** (R-level). The fiber the induced map $H(f)$ *departs from*. For $f : t \to t'$ in $T$, the induced map is $H(f) : H_{t'} \to H_t$, so the domain of $H(f)$ is $H_{t'}$ — the fiber at the *target* of $f$ in $T$.
- **Codomain** (R-level). The fiber the induced map $H(f)$ *arrives at*. The codomain of $H(f)$ is $H_t$ — the fiber at the *source* of $f$ in $T$.

The reversal is the load-bearing fact: source and target are at the T-level (history category); domain and codomain are at the R-level (fiber doctrine); contravariance makes them collide at opposite endpoints.

## A worked example

Take a substrate with history $t$ and an admission that produces history $t' = t \cdot s$ (admitting message $s$ extends $t$ to $t'$). The prefix-extension morphism is $f : t \to t'$:

- **Source of $f$:** $t$. The history at which $f$ starts in $T$.
- **Target of $f$:** $t'$. The history at which $f$ ends in $T$.

The fiber doctrine induces the restriction map $H(f)$ between the [predication fiber algebras](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $H_{t'} \to H_t$:

- **Domain of $H(f)$:** $H_{t'}$. The fiber at $t'$ — at the *target* of $f$.
- **Codomain of $H(f)$:** $H_t$. The fiber at $t$ — at the *source* of $f$.

Reading "the morphism's domain is at the target" sounds wrong until the contravariance is explicit. With it explicit: the restriction map runs *backward* — it takes a predication recorded at the longer history $t'$ and returns the corresponding predication at the shorter $t$, "what did this content look like before the extension?"

## Why the convention matters

Three engineering invariants depend on keeping the four terms straight:

- **Restriction maps preserve algebra in the right direction.** A restriction map $H(f) : H_{t'} \to H_t$ is a [bilattice homomorphism](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/bilattice-homomorphism.md) — it preserves $\wedge_t, \vee_t, \wedge_k, \vee_k$, and $\sim$ on the [twist product](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/twist-product.md) *in that direction*. Mixing up which side is the domain produces a homomorphism in the wrong direction, which silently fails the substrate's algebra.
- **Stepping maps go forward; restriction maps go backward.** Per [stepping](stepping.md), the substrate advances forward by stepping maps $\gamma : X(t) \to X(t \cdot s)$. The stepping map and the restriction map are duals — under contravariance, they are inverse-paired by the counit law. Confusing them produces broken replay (because replay applies restrictions backward to recover earlier state).
- **Federation alignment is direction-sensitive.** When two substrates federate, peer messages flow *forward* in the receiver's history (the receiver advances by stepping); the receiver's restriction maps from its later fibers to its earlier fibers are what allow the federation to audit what the receiver knew at each prior point. A federation protocol that confuses source/target with domain/codomain produces non-replayable audit chains.

## Frontmatter usage

The substrate's predication frontmatter uses the four terms with strict discipline:

| Frontmatter key | Level | Names |
|---|---|---|
| `source:` | T | The history at which the operation departs |
| `target:` | T | The history at which the operation arrives |
| `domain:` | R | The fiber sort the operation reads from |
| `codomain:` | R | The fiber sort the operation writes to |

Operations and skills typically use `takes:` and `produces:` (or `returns:`) for input and output sorts — these are practical-engineering predicates. The categorical concepts of domain and codomain *underlie* the practical-engineering predicates but are not the same: `takes:` is more specific and may name structural input requirements beyond just the categorical domain.

The substrate's discipline is to refuse operations whose declared `source:` and `target:` are not consistent with the history category structure (a target before its source in $T$ is a substrate violation), and to refuse operations whose declared `domain:` and `codomain:` are inconsistent with the contravariance (a domain at the source's fiber rather than the target's is a substrate violation).

## Position in the substrate

The morphism-direction convention is the substrate's *small but load-bearing precision* about its two-level categorical structure. Without the convention, the four terms collapse into a single ambiguous "where the morphism goes," and the substrate's [stepping](stepping.md), restriction, and replay disciplines break silently. With the convention, the four terms are distinct, the contravariance is visible at the term level, and the substrate's algebra is checkable.

The convention composes with [time-and-event-ordinals](time-and-event-ordinals.md) (which orders T-level histories), with [substrate-state](substrate-state.md) (which is the indexed family the fiber doctrine produces over T), and with [stepping](stepping.md) (whose counit law is exactly the inverse-pairing of the forward stepping map and the backward restriction map).
