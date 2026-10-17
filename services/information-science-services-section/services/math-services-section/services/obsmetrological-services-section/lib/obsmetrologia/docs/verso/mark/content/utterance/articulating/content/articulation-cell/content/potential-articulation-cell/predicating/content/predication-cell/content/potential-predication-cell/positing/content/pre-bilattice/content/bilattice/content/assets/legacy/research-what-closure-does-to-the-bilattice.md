---

title: "What Closure Does to the Bilattice"
description: "When you close a bilattice-valued system under inference, the unknown state disappears, the truth ordering becomes a chain, and the adjunction survives. Here is why."
date-created: 2026-03-31
requires:
  - bilattice
  - closure
teaches:
  - fixpoint
  - epistemic-state
---

The four-valued [bilattice](../terms/bilattice.md) $\{\bot, t, f, \top\}$ has four [epistemic states](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/epistemic-state.md). When you [close](../terms/closure.md) a system of assertions under inference — apply all derivation rules until nothing new can be produced — one of these states disappears from the potential algebra.

## Why ⊥ disappears

$\bot$ means "no information." An assertion valued $\bot$ is one that no source has said anything about.

Inference rules push values upward in the knowledge ordering. If assertion $P$ is $\bot$ and there is an inference rule that can derive a value for $P$ from other assertions, the rule produces $t$, $f$, or $\top$ — never $\bot$, because the rule adds information.

At the [fixpoint](../../order/terms/fixpoint.md), every assertion within scope has been reached by some rule. No in-scope assertion remains at $\bot$. The effective algebra operates on $\{t, f, \top\}$.

This does not mean $\bot$ is gone from the system. Assertions outside scope — those no rule can reach — can still be $\bot$. But within the closed part of the system, every assertion has been resolved to affirmed, denied, or contested.

## What happens to the truth ordering

The truth ordering on the full bilattice is a diamond:

```
        t
       / \
      ⊥   ⊤
       \ /
        f
```

$f$ at the bottom, $t$ at the top, $\bot$ and $\top$ as incomparable middle elements.

Remove $\bot$. What remains?

```
    t
    |
    ⊤
    |
    f
```

A chain: $f <_t \top <_t t$. The diamond has collapsed to a [total order](../../order/terms/total-order.md). Every pair of remaining values is comparable. The [partial order](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/partial-order.md) has become total.

This is a qualitative change. In the diamond, $\bot$ and $\top$ were incomparable — "no information" and "contradictory information" could not be ranked against each other in truth. After closure removes $\bot$, $\top$ takes a definite position: it sits between $f$ and $t$. Contradiction is intermediate — more true than denial, less true than affirmation.

## What happens to the knowledge ordering

The knowledge ordering on the full bilattice is also a diamond:

```
        ⊤
       / \
      t   f
       \ /
        ⊥
```

Remove $\bot$:

```
        ⊤
       / \
      t   f
```

A V-shape: $\top$ above both $t$ and $f$, with $t$ and $f$ still incomparable. This is a [join-semilattice](../../order/terms/join.md) (the join $t \vee_k f = \top$ exists) but NOT a [lattice](../../order/terms/lattice.md) (the meet $t \wedge_k f$ would be $\bot$, which is absent).

## Why the adjunction survives

The [residuation](../terms/residuated-lattice.md) $a \odot p \leq_t q \iff p \leq_t (a \Rightarrow q)$ lives on the truth ordering, not the knowledge ordering. The truth ordering on $\{t, f, \top\}$ is a total order — a perfectly well-behaved chain. The adjunction has no reason to break.

Concretely: both $\odot$ and $\Rightarrow$ are closed on $\{t, f, \top\}$ (neither operation produces $\bot$ from inputs in $\{t, f, \top\}$). The identity element $\top$ is in the set. Exhaustive computation on all 27 triples shows zero violations.

The fact that $\{t, f, \top\}$ is not a lattice under the knowledge ordering is irrelevant to the adjunction, because the adjunction does not live on the knowledge ordering. The two orderings are independent; the adjunction only needs one of them.

## What this means

Closure does three things:

1. **Eliminates ignorance within scope.** Every reachable assertion gets resolved.
2. **Collapses the truth ordering.** The diamond becomes a chain. Contradiction ($\top$) gets a definite position between denial and affirmation.
3. **Preserves the adjunction.** Extending and restricting still work. The modal calculus remains [decidable](../../logic/terms/decidability.md). The [linear logic](../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/linear-logic.md) interpretation persists.

The system after closure is more structured than before: it has a total truth ordering instead of a partial one, and it has no unresolved assertions within scope. The algebraic operations that make reasoning possible are intact.
