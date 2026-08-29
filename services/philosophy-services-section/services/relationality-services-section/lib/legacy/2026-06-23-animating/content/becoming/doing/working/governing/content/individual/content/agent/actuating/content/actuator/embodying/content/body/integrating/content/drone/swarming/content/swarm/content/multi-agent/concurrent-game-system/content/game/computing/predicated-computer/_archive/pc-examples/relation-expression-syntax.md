---
type: example
status: documented
instantiates: [closure-rule, extend-restrict-adjoint, settling-as-computation]
---

# Relation Expression Syntax: an s-expression surface for closure-rule expressions

A worked surface language for writing closure-rule expressions over a fiber's value domain. The example documents *Relation Expression Syntax* (RES) — an s-expression DSL with seven term forms, a reduction system that produces a unique canonical normal form for every term, and an evaluation procedure that interprets a canonical term against a fiber to produce a value-domain element. The example illustrates how the substrate's algebraic primitives can be exposed as a small, mechanically-checkable surface language and how the math reformulation's reduction rules become operationally checkable rewrites.

The example's purpose is to make the substrate's [extend-restrict adjoint](teaching/explanations/extend-restrict-adjoint.md) and the [closure-rule](teaching/explanations/closure-rule.md) primitives concrete: instead of describing them abstractly, this example shows what a complete surface language for them looks like. RES is one realization; the substrate admits many surface languages with the same denotation.

## The seven term forms

RES is built from seven term forms. The math reformulation interprets each into the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) at the ambient predicate-history pair:

| Form | Meaning | Math reformulation |
|---|---|---|
| `true` | The fiber's [knowledge-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md) top | $\top \in A_p$ |
| `false` | The fiber's bottom | $\bot \in A_p$ |
| `<identifier>` | A named atomic predication | An element of $A_p$ named in the binding environment |
| `(and M N)` | Both predications hold (knowledge-meet) | $M \wedge_k N$ — knowledge-order meet in $A_p$ |
| `(or M N)` | At least one holds (knowledge-join) | $M \vee_k N$ — knowledge-order join in $A_p$ |
| `(=> M N)` | Restrict | $M \Rightarrow N$ — [twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md), the [extend-restrict adjoint](teaching/explanations/extend-restrict-adjoint.md)'s restrict operation |
| `(sat M)` | Saturate — apply the past-closure | $\sigma(M)$ — a [closure operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) on $A_p$ along the past direction |
| `(trans M)` | Transfer — apply the future-closure | $\Delta(M)$ — a [closure operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) on $A_p$ along the forward-extension direction |

Identifiers are non-empty strings of characters that are not reserved words (`true`, `false`, `and`, `or`, `=>`, `sat`, `trans`), do not begin with a digit, and contain no whitespace or parentheses.

A program is a sequence of declarations followed by a final term:

```
program     ::= declaration* term
declaration ::= "(" "def" identifier term ")"
```

The engine evaluates declarations in order, extending the binding environment, then evaluates the final term as the program's output predication.

## The reduction system: nineteen rules to a canonical normal form

Every RES term reduces to a unique canonical normal form by mechanically applying nineteen rewrite rules (R1–R19′ in the math reformulation). Five normal-form conditions characterize the canonical output:

1. No sub-term of the form `(sat (sat M))` or `(trans (trans M))` — the closures are idempotent.
2. No sub-term of the form `(sat true)` or `(trans true)` — closures fix the top element.
3. No sub-term of the form `(sat (and M N))` or `(trans (and M N))` — closures distribute over meet.
4. No sub-term of the form `(sat (trans M))` — must be rewritten to `(trans (sat M))`. The canonical nesting is *transfer outer, saturate inner*: settle against the past first, then find what the settled result stably carries forward.
5. No absorption redex of the forms covered by R8–R19′ — the standard absorption laws of the substrate's [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) algebra.

The reduction is *strongly normalizing*: every RES term reduces in finitely many steps to a unique canonical normal form. The proof uses a lexicographic weight on terms — formula-weight first, entropy second — that strictly decreases with every rewrite.

The canonical orientation `(trans (sat M))` encodes the substrate's temporal direction: past before future. Settle $M$ against what accumulated history forces ($\sigma_t$); then find what the settled result stably carries into all future extensions ($\Delta_t$). The math reformulation calls this the *Saturate-then-Transfer* convention; RES embeds it as a syntactic invariant of normal forms.

## Evaluation: from canonical term to fiber element

After normalization, the engine evaluates a canonical RES term against a fiber $H_t$:

| Term form | Evaluation |
|---|---|
| `true` | $\top \in H_t$ |
| `false` | $\bot \in H_t$ |
| `x` | look up `x` in the binding environment |
| `(and M N)` | $\llbracket M \rrbracket_t \wedge \llbracket N \rrbracket_t$ |
| `(or M N)` | $\llbracket M \rrbracket_t \vee \llbracket N \rrbracket_t$ |
| `(=> M N)` | $\llbracket M \rrbracket_t \Rightarrow_t \llbracket N \rrbracket_t$ |
| `(sat M)` | $\sigma_t(\llbracket M \rrbracket_t)$ |
| `(trans M)` | $\Delta_t(\llbracket M \rrbracket_t)$ |

The denotation is *sound*: two terms provably equal in the substrate's underlying logic denote the same element of $H_t$. When the fiber is the full model, the denotation is also *complete* — every fiber element has at least one term denoting it.

## Worked examples

**Stable-proposition check.** The term `(trans (sat p))` denotes $\Delta_t(\sigma_t(p)) = \pi_t(p)$, the [joint projection](teaching/explanations/substrate-anatomy-as-four-components.md) onto the doubly-fixed subalgebra $H_t^*$. If this denotation equals $p$, then $p$ is doubly stable — settled against the past *and* preserved into every future extension. The substrate's [closure-conditions](teaching/explanations/closure-conditions.md) condition 7 (coherence closure) corresponds to: the global section that this stability gives in the substrate's locale.

**Idempotency illustration.** The term `(sat (sat p))` normalizes by rule R1 to `(sat p)`. The engine produces `(sat p)` regardless of how deep the saturation nesting was — the closure is idempotent, and the canonical form reflects this. An author who wrote `(sat (sat (sat p)))` is not penalized; the term is normalized before evaluation.

**Implication inside saturation.** `(sat (=> p q))` does not reduce further. No rule matches — `=>` is not `and` or `true`, and no absorption applies. This is a *genuine* normal form, not a stuck term. The substrate's saturation does not commute with implication in general; the canonical form preserves the asymmetry.

**Mixed-modal term.** `(sat (trans p))` normalizes by rule R7 to `(trans (sat p))`. The canonical orientation enforces temporal order in all output terms: an author who wrote `sat` outside of `trans` gets the substrate's correction to `trans` outside of `sat` automatically. The engine's normalizer is the substrate's enforcement of the temporal-direction convention.

## Design decisions

The example records why specific syntactic choices were made:

- **Why s-expressions.** S-expressions map term grammar directly onto the AST. Every RES term is syntactically a tree, making the nineteen reduction rules mechanically applicable without ambiguity. Operator precedence, infix resolution, and grouping ambiguities are all absent.
- **Why no n-ary connectives.** `and` and `or` are binary in the substrate's underlying algebra (the math defines binary $\wedge_k$ and $\vee_k$ on each [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)). N-ary forms are sugar; they are not in the term grammar. A reader macro layer may provide `(and M N P ...)` as syntactic sugar for left-associated binary trees, but this is outside the core spec.
- **Why history is implicit.** The typing judgment $\Gamma \vdash_t M : \mathsf{Prop}$ has $t$ as a context parameter, not a sub-expression of $M$. Making $t$ implicit in the syntax reflects the math directly. A RES term is a term *of the language*; the fiber it is evaluated in is supplied by the substrate's [engine](teaching/explanations/engine.md) at evaluation time.
- **Why `=>` is binary and not subscripted.** The [twist-product right residual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/twist-product-right-residual.md) $\Rightarrow_t$ is subscripted by $t$ in the math because different histories carry different fiber algebras. In RES, $t$ is ambient, so the subscript is dropped. The symbol `=>` is chosen to avoid collision with the metalevel arrow `→` used in the reduction rules.

Each decision is explicit so a reader designing a different surface language can decide where to follow RES and where to differ.

## What this example does not commit to

RES is *one* surface language for the substrate's closure-rule expressions; it is not the only one. Other surface languages can carry the same denotation:

- A pattern-matching surface (closer to Datalog or SWRL) where rules are written as `head :- body` clauses with explicit variables.
- A point-free surface (closer to combinator logic) where rules are compositions of named primitives without binding variables.
- A graphical surface (closer to Petri nets) where rules are visual patterns over the predication graph.

Each surface admits the same substrate denotation as RES; their differences are author-experience and tooling, not substrate-level. The substrate's [self-representation](teaching/explanations/self-representation.md) discipline says that whichever surface a substrate uses, the surface's parser and normalizer must themselves be substrate entities (per [closure-rule-record](../objects/closure-rule-record.md)) — and the surface's choice is therefore editable through the substrate's normal change discipline.
