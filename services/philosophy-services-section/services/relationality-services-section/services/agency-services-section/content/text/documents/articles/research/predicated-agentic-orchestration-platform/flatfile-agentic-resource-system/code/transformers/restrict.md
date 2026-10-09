---
source: [a, q]
target: [r]
name: restrict
description: "The morphism that lifts the substrate value-domain's residuating operation $\Rightarrow$ to fibers, pointwise on cells."
type: morphism
class: operator
depends-on: [fiber, substrate-value-domain]
see-also: [compose, respond, settle]
---

# restrict

The morphism that lifts the [substrate value-domain](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/substrate-value-domain.md)'s residuating operation $\Rightarrow$ to [fibers](../structures/fiber.md), pointwise on cells.
`restrict(A, Q)` produces the fiber whose value at each cell is the value-domain's $\Rightarrow$-restriction of `A`'s value against `Q`'s value at that cell — operationally, "what must `P` carry at this cell so that `A ⊙ P` agrees with `Q` on this cell?"
`restrict` is the residual partner of [`compose`](compose.md); together they realize the Lambek adjunction $\odot \dashv \Rightarrow$.

## Signature

```
restrict(A, Q) → R
```

Inputs are two fibers — typically the entity's fiber `A` (what is asserted) and the test fiber `Q` (what is being asked of it).
Output is the fiber whose cells record what would have to hold for `Q` to be supported under composition with `A`.

## Operational semantics

The cell domain of the output is the union of `A.cells` and `Q.cells`.
For each cell `c`:

- if `c` is in both fibers: the output value is `A[c] ⇒ Q[c]`, computed from the value-domain's $\Rightarrow$ table;
- if `c` is in only `A`: the output value is `A[c] ⇒ ⊥` — typically $\bot$ for $A[c] \in \{\bot, t, f\}$ and $\bot$ for $A[c] = \top$;
- if `c` is in only `Q`: the output value is `⊥ ⇒ Q[c]` — by the bilattice's table, this is $Q[c]$ itself (the residual against no-information is the queried value).

The bilattice $\{\bot, t, f, \top\}$'s $\Rightarrow$ table (per [@adjoint-structure-spo-bilattice]):

| $a \Rightarrow b$ | $\bot$ | $t$ | $f$ | $\top$ |
|---|---|---|---|---|
| $\bot$ | $\bot$ | $t$ | $f$ | $\top$ |
| $t$ | $\bot$ | $t$ | $f$ | $\top$ |
| $f$ | $\bot$ | $\top$ | $\top$ | $\top$ |
| $\top$ | $\bot$ | $\top$ | $\top$ | $\top$ |

The output fiber's `provenance` mapping records `A`'s and `Q`'s sources for each cell, so the [`Witness`](../objects/witness.md) chain can cite both as upstream.

## Normative invariants

- **Pure.** A conformant realization SHALL have no I/O and no shared state in `restrict`.
  The output depends only on the bytes of `A` and `Q`.
- **Adjoint to [`compose`](compose.md).** For fibers $A, P, Q$: $\textsf{compose}(A, P) \leq_t Q \iff P \leq_t \textsf{restrict}(A, Q)$, where $\leq_t$ is the truth-order's pointwise extension to fibers.
  The adjunction is what makes [`respond`](respond.md) coherent and what underwrites the verification in [@adjoint-structure-spo-bilattice].
- **Not commutative.** $a \Rightarrow b$ is not generally equal to $b \Rightarrow a$; the same holds for fibers.
  Order matters: `restrict(A, Q)` answers "what would `P` need to be for `A ⊙ P ≤ Q`," not the reverse.
- **Not associative in the same sense as [`compose`](compose.md).** Right-associativity ($A \Rightarrow (B \Rightarrow C)$) admits curry-style decompositions; left-associativity does not generalize.
  This matches the asymmetry of residuation.

## Position

`restrict` is the algebraic primitive that handles the *test* side of inference: composing tells you what is added; restricting tells you what is implied.
[`respond`](respond.md) uses [`compose`](compose.md) in its first phase (admitting the message's commitments) and may invoke `restrict` inside closure-rule applications during the settle phase (when a rule's premise tests an entity's fiber against a pattern).
Operators that ask "does this entity satisfy this requirement?"
(capability matching, shape validation, dispatch ranking) read the result of a `restrict` call and look at its $t$/$f$/$\top$/$\bot$ counts for an interpretable answer.

## What `restrict` is not

- **Not a Boolean test.** A test that returns $\bot$ at a cell is not "false" — it is "the entity says nothing about this requirement."
  Operators that need a Boolean must project the restriction's cells to a Boolean (typically: any non-$t$ value is treated as failure for strict tests, or any non-$f$ value is treated as success for permissive tests).
  The choice of projection is an operator-level concern; the algebra preserves the four-valued resolution.
- **Not the same as [`compose`](compose.md).** Composing two assertions adds them; restricting one against another tests them.
  The residuated pair makes both directions algebraically tractable; using one where the other is meant is an inference error.
