---
id: relation-expression-syntax
description: "A LISP-style s-expression syntax for writing and evaluating RelationalHistoryFiberDoctrineLanguage propositions; the surface language for the Relational Machine's Engine component."
defines: RelationExpressionSyntax
component-of: RelationalMachine
uses: RelationalHistoryFiberDoctrineLanguage
date-created: 2026-03-18
date-modified: 2026-03-18
params:
  term: relational-universe
  fiber-context: relational-history
output: relational-universe
ast:
  s-expression-prop-term:
    - term:
        - atomic-form
        - compound-form
    - fiber-context:
        - ambient-history-binding
---

# Relation Expression Syntax

## What it is

**Relation Expression Syntax** (RES) is an s-expression language for writing
[RelationalHistoryFiberDoctrineLanguage](../math/relational-history-fiber-doctrine-language.md) propositions.
A RES expression denotes a term of type `Prop` in the sense of
[RelationalFiberNuclearLanguage](../math/relational-history-fiber-doctrine-language-derivation.md).
The evaluating engine supplies the history context; the term itself carries no history index.

RES is a surface language, not an internal representation.
It is read, parsed, normalized (via the [ReductionSystem](../math/reduction-system.md)
R1–R19'), and evaluated against a fiber.
The result is an element of the fiber Heyting algebra $H_t$ at the ambient history $t$.

---

## Term grammar

A RES term is one of the following seven forms.

### Atomic

| Form | Meaning |
|------|---------|
| `true` | The top element $\top \in H_t$ |
| `false` | The bottom element $\bot \in H_t$ |
| `<identifier>` | An atomic proposition — a named element of $H_t$ |

An `<identifier>` is any non-empty string of characters that is not a reserved word,
does not begin with a digit, and contains no whitespace or parentheses.
Reserved words are: `true`, `false`, `and`, `or`, `=>`, `sat`, `trans`.

### Compound

| Form | Meaning |
|------|---------|
| `(and M N)` | Conjunction $M \wedge N$ |
| `(or M N)` | Disjunction $M \vee N$ |
| `(=> M N)` | Heyting implication $M \Rightarrow_t N$ |
| `(sat M)` | Saturate: applies the saturation nucleus $\sigma_t$ |
| `(trans M)` | Transfer: applies the transfer nucleus $\Delta_t$ |

`M` and `N` range over arbitrary RES terms.
All compound forms are prefix and fully parenthesized; there is no infix notation.

### Grammar summary

```
term ::= "true"
       | "false"
       | identifier
       | "(" "and"   term term ")"
       | "(" "or"    term term ")"
       | "(" "=>"    term term ")"
       | "(" "sat"   term ")"
       | "(" "trans" term ")"
```

---

## History context

A RES term has a single type `Prop` and carries no syntactic history index.
History context is ambient: the evaluating engine binds a current history $t \in T$
and evaluates the term against $H_t$.

A RES **program** is a sequence of declarations followed by a term.
Declarations bind atomic proposition names to elements of $H_t$.

```
program ::= declaration* term

declaration ::= "(" "def" identifier term ")"
```

The engine evaluates declarations in order, extending the binding environment.
The final term is the program's output proposition.

---

## Normalization

A RES term MUST be normalizable.
The engine applies the [ReductionSystem](../math/reduction-system.md) R1–R19' to
reduce any input term to its unique canonical normal form.

The canonical normal form satisfies five conditions (see
[normalization](../math/normalization.md)):

1. No sub-term of the form `(sat (sat M))` or `(trans (trans M))`.
2. No sub-term of the form `(sat true)` or `(trans true)`.
3. No sub-term of the form `(sat (and M N))` or `(trans (and M N))`.
4. No sub-term of the form `(sat (trans M))` — must be rewritten to `(trans (sat M))`.
5. No absorption redex of the forms covered by R8–R19'.

The canonical nesting order for mixed-modal terms is `(trans (sat M))` — Transfer outer,
Saturate inner — encoding "past before future": first settle $M$ against what accumulated
history forces ($\sigma_t$), then find what the settled result stably carries into all
future extensions ($\Delta_t$).

Strong normalization is guaranteed by the lexicographic weight
$(\mathsf{fmlW}, \mathsf{ent})$ proved in
[strong-normalization](../math/strong-normalization.md).
Every RES term reduces in finitely many steps.

---

## Evaluation

After normalization, the engine evaluates a canonical RES term against a fiber $H_t$:

| Term form | Evaluation |
|-----------|-----------|
| `true` | $\top \in H_t$ |
| `false` | $\bot \in H_t$ |
| `x` | look up $x$ in the binding environment |
| `(and M N)` | $\llbracket M \rrbracket_t \wedge \llbracket N \rrbracket_t$ |
| `(or M N)` | $\llbracket M \rrbracket_t \vee \llbracket N \rrbracket_t$ |
| `(=> M N)` | $\llbracket M \rrbracket_t \Rightarrow_t \llbracket N \rrbracket_t$ |
| `(sat M)` | $\sigma_t(\llbracket M \rrbracket_t)$ |
| `(trans M)` | $\Delta_t(\llbracket M \rrbracket_t)$ |

The denotation is sound: if two terms are provably equal in RelationalHistoryFiberDoctrineLanguage then
their denotations in $H_t$ are equal.
If the fiber $H_t$ is complete (the full model), the denotation is also complete.

---

## Examples

**Stable proposition check.**
The term `(trans (sat p))` denotes $\Delta_t(\sigma_t(p)) = \pi_t(p)$, the
[joint projection](../math/joint-projection.md) onto $H_t^*$.
If this equals $p$, then $p \in H_t^*$ — $p$ is doubly stable.

**Idempotency illustration.**
The term `(sat (sat p))` normalizes (by R1) to `(sat p)`.
The engine will produce `(sat p)` regardless of input nesting depth.

**Implication inside saturation.**
`(sat (=> p q))` does not reduce further (no rule matches — `=>` is not `and` or `true`).
This is a genuine normal form, not a stuck term.

**Mixed-modal term.**
`(sat (trans p))` normalizes (by R7) to `(trans (sat p))`.
The canonical orientation enforces temporal order in all output terms.

---

## Design decisions

### Why LISP-like

S-expressions map the term grammar directly onto the AST.
Every RES term is syntactically a tree, making the reduction rules mechanically applicable
without ambiguity.
Operator precedence, infix resolution, and grouping ambiguities are all absent.

### Why no n-ary connectives

`and` and `or` are binary.
The math defines binary meet ($\wedge$) and join ($\vee$) on each fiber $H_t$.
N-ary forms are sugar; they are not in the term grammar.
A reader macro layer may provide `(and M N P ...)` as syntactic sugar for left-associated binary trees, but this is outside the core spec.

### Why history is implicit

The typing judgment $\Gamma \vdash_t M : \mathsf{Prop}$ has $t$ as a context parameter,
not as a sub-expression of $M$.
Making $t$ implicit in the syntax reflects the math directly.
A RES term is a term of the language; the fiber it is evaluated in is supplied by the
[RelationalMachine](relational-machine.md)'s Engine component at evaluation time.

### Why `=>` is binary and not subscripted

The Heyting implication $\Rightarrow_t$ is subscripted by $t$ in the math because
different histories have different implication operations.
In RES, $t$ is ambient, so the subscript is dropped.
The symbol `=>` is chosen to avoid collision with the metalevel arrow `→` used in the reduction rules.

---

## Open questions

### Multi-level extension

This spec covers level-0 RelationalHistoryFiberDoctrineLanguage: propositions about $H_t$ at the base universe $R$.
The tower levels $R^{(n)}$ introduce new propositions not present at level 0.
A future extension of RES must accommodate tower-level terms.
The design question: does each level get its own term former (`sat-n`, `trans-n`),
or is the level a context parameter like history?
See [relational-universe-tower-language-constitution](../math/relational-universe-tower-language-constitution.md).

### History expressions

Histories are elements of $M(\Sigma, I)$, not propositions.
Some use cases require writing history terms: constructing test fibers, specifying
machine transitions, naming the ambient history in a program.
A separate history expression sublanguage is needed.
Minimal sketch: `<step>` for atomic steps, `(seq s t)` for concatenation, `(conc s t)`
for concurrent composition when $s \perp t$.
This is deferred; it is not part of the core RES proposition language.

### Reader macros and sugar

N-ary `and`/`or`, infix `=>`, named abbreviations for common normal forms
(`(stable p)` for `(trans (sat p))`).
These are quality-of-life additions, not core spec.
They must be specified as macro expansions into core RES before normalization is applied.

### Output format

Should the engine emit normalized RES (printable canonical form) or the evaluated
element of $H_t$ (an opaque algebra element)?
For human-readable output, normalized RES is preferred.
For machine integration, the algebra element is preferred.
Both output modes should be supported.

### Error handling

What happens when an identifier is unbound at evaluation time?
Option A: evaluation error (strict).
Option B: treat the identifier as a fresh atomic proposition (liberal).
Option A is correct for the math (every atomic proposition must be in scope);
Option B may be useful for exploratory use.
This is unresolved.
