---
type: example
status: verified
depends-on: [aperiodic-settling, four-regime-dichotomy, closure-rule, anderson-putnam-direct-limit, transfinite-induction-settling, aperiodic-settling-sketch]
instantiates: [aperiodic-settling, four-regime-dichotomy]
lineage: 5
---

# Fibonacci substitution settling

The anchor of **sub-lineage 5a** — the simplest aperiodic-regime substitution-dynamics encoding in the corpus. The Fibonacci substitution $\sigma : a \mapsto ab, b \mapsto a$ is encoded as a closure rule producing an aperiodic settling at $E = \omega_1$.

## Setup

- $\mathbf{L} = \mathbf{2}$.
- [Entity set](../objects/entity-set.md) $E = \omega_1$ (the first uncountable ordinal).
- [Predicate set](../objects/predicate-set.md) $\Pi = \{P_a, P_b\}$ — two unary-on-diagonal predicates encoding "tile $a$ at this position" and "tile $b$ at this position." Equivalently, a single binary predicate with restricted codomain.
- [Predicate category](../objects/predicate-category.md) $\mathcal{C}$: discrete two-object on $\{P_a, P_b\}$.
- [Settling bound](../objects/settling-bound.md) $\lambda = \omega_1 + 1$.

## Closure rule encoding the Fibonacci substitution

The substitution $\sigma$ acts on a sequence of $\{a, b\}$-tiles by replacing each $a$-tile with $ab$ (two tiles) and each $b$-tile with $a$ (one tile). At each substitution step, the sequence's length grows. The Fibonacci tiling space is the inverse limit of substitutions $\sigma : \Sigma_n \to \Sigma_{n+1}$ on bi-infinite sequences.

To encode this as a closure rule on a settling: cells of $\Delta_E$ correspond to *positions* in the substitution sequence. The closure rule advances the substitution stage:

$$\text{Rule } \sigma : (v(P_a)(\alpha, \alpha) = \mathbf{t}) \implies v(P_a)(2\alpha, 2\alpha) \geq_k \mathbf{t} \;\wedge\; v(P_b)(2\alpha + 1, 2\alpha + 1) \geq_k \mathbf{t}$$

$$\wedge \quad (v(P_b)(\alpha, \alpha) = \mathbf{t}) \implies v(P_a)(2\alpha, 2\alpha) \geq_k \mathbf{t}$$

(The factor of 2 reflects the substitution producing 1 or 2 new positions; the actual encoding for a transfinite settling needs careful ordinal-arithmetic handling, omitted here.)

## Settling stages

Starting with $u_0(P_a)(0, 0) = \mathbf{t}$ — a single $a$-tile at the origin. Each closure step extends the substitution one stage:

- $\tau = 0$: just the seed $a$.
- $\tau = 1$: the seed plus one substitution: $ab$ at positions $\{0, 1\}$.
- $\tau = 2$: $aba$ at positions $\{0, 1, 2\}$.
- $\tau = 3$: $abaab$ at positions $\{0, 1, 2, 3, 4\}$.
- ... lengths follow the Fibonacci sequence.

At $\tau < \omega$: finite substitution sequences.
At $\tau = \omega$: directed-colimit tiling — the *infinite Fibonacci sequence*.
At $\tau = \omega_1$: full transfinite Fibonacci tiling, with positions in $\omega_1$.

## Closure ordinal

$\kappa = \omega_1$. The substitution doesn't stabilize at any countable ordinal because new positions are introduced at every substitution step. The settling is **aperiodic**.

## Position in the step-$n$ family

Fibonacci is the **$n = 2$** instance of the [step-$n$ substitution-recurrence](teaching/explanations/step-n-substitution-recurrence.md) framework. Its 2-letter alphabet, recurrence depth 2, $\mathbb{Z}^2$ classifying invariant, and degree-2 minimal polynomial $x^2 - x - 1$ all instantiate the step-$n$ co-incrementing pattern at $n = 2$. The bilattice correspondence at $n = 2$ aligns the alphabet with the bilattice's two *partial-order axes* (knowledge, truth) — see [step-n-bilattice-alignment-table](step-n-bilattice-alignment-table.md).

Padovan ($n = 3$) and Tetranacci ($n = 4$) are the family's higher-step instances. The [step-shift morphism](../morphisms/step-shift-morphism.md) connects Fibonacci to step-3 rules — see [fibonacci-to-padovan-step-shift](fibonacci-to-padovan-step-shift.md).

## Position in Lineage 5

The sub-lineage 5a anchor. With this in hand, subsequent L5a examples compute concrete invariants:

- [fibonacci-classifying-invariant](fibonacci-classifying-invariant.md) — predication categories' $\mathrm{cl}\text{-}\mathrm{inv}$.
- [fibonacci-anderson-putnam-comparison](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/fibonacci-anderson-putnam-comparison.md) — comparison with literature.
- ...

The Fibonacci sub-lineage is the simplest aperiodic-substitution-dynamics example; complex sub-lineages (Thue-Morse, Penrose) build on the same encoding template.
