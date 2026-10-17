---
type: question
class: internal
status: open
explores: [n-ary-predication, higher-arity-cohomological-rank, predication-settling, predicate-category]
---

# Variable-arity settlings

The [n-ary predication object](../objects/n-ary-predication.md) generalizes binary predication to fixed arbitrary arity $n$ — every cell in the predicate-cell space has the same $n$-tuple structure. **Open**: predications whose arity *varies across cells*.

Natural-language reasoning is the motivating example. Most predicates have a context-dependent arity:
- "Sleeps" — unary (one argument) in "Alice sleeps."
- "Loves" — binary in "Alice loves Bob."
- "Gives" — ternary in "Alice gives Bob a book."
- "Promises" — varies between binary and quaternary depending on argument structure.

A natural-language settling would have predicates of *mixed* arity in a single corpus — and the closure rules might compose predicates of different arities (e.g., joining a binary "loves" with a unary "sleeps" via shared arguments).

## The structural challenge

The corpus's existing predicate-category $\mathcal{C}$ has objects that are predicates with *fixed* arity. Cells $(s, o, q)$ for a predicate $q \in \mathcal{C}$ have a specific arity determined by $q$. Composition of cells across predicates of *different* arities isn't directly handled.

What's needed: an *arity-fibered* predicate category where each predicate $q$ has its own arity $n(q)$, with morphisms between predicates of different arities encoding *projection* or *extension* operations on argument structure.

## Concrete sub-questions

1. **Arity-fibered presheaves.** Define a predicate category $\mathcal{C}$ as a *fibered category* over $\mathbb{N}$ (the arity index), with $\mathcal{C}_n$ the sub-category of arity-$n$ predicates. Inter-arity morphisms encode projections ($\mathcal{C}_n \to \mathcal{C}_k$ for $k < n$) and extensions ($\mathcal{C}_k \to \mathcal{C}_n$ for $n > k$). Settlings would be fibered presheaves with appropriate inter-arity coherence.

2. **Closure operators on variable arity.** A closure rule like "if $x$ loves $y$, and $y$ sleeps, then $x$ is concerned" is a *variable-arity* rule combining binary and unary predicates. The closure operator joins these via shared arguments. What's the closure-2-monad structure on variable-arity presheaves?

3. **Cohomology in variable arity.** Per [higher-arity-cohomological-rank theorem](../../sheaf/content/settling-cohomology/references/higher-arity-cohomological-rank.md), arity scales the upper bound on $H^1$ rank. For variable arity, the rank bound depends on the *distribution* of arities in the predicate set. Open: explicit formula.

4. **Klein-four / $G_8$ on variable arity.** The bilattice's Klein-four group acts on each arity slice independently. Whether this lifts to a coherent action on the whole variable-arity presheaf depends on inter-arity morphism structure.

## Why it matters for predication categories

Variable arity is the bottleneck for:

- **Natural-language settlings.** Sentence-meaning involves predicates of arbitrary arity composed via coreference. Without variable arity, the framework's natural-language applications are fragmentary.
- **Higher-order predication settlings.** Per the [higher-order predication settlings question](higher-order-predication-settlings.md), order-$k$ predicates take other predicates as arguments. This implicitly requires variable-arity machinery.
- **General relational data.** Database tables can have varying schema (different relations have different attribute counts). The framework's reach to general relational systems requires arity flexibility.

The fixed-arity work establishes the base; variable-arity extends it to the natural setting for actual knowledge-representation applications.

## What a partial answer looks like

A small concrete construction: a predicate category with three predicates of arity 1, 2, 3 (say "sleeps", "loves", "gives"), with inter-arity morphisms (e.g., loves projects to sleeps on the lover-argument), and a closure rule mixing them. Compute the settling on a small entity set and verify the cohomology behaves coherently.

If the construction works: stating the structural theorem becomes immediate. If it fails: identifies which axioms (closure-2-monad, four-regime, MLD-classification) are arity-rigid.

## Connection to existing structure

- [n-ary predication object](../objects/n-ary-predication.md): the fixed-arity predecessor.
- [Higher-arity cohomological rank theorem](../../sheaf/content/settling-cohomology/references/higher-arity-cohomological-rank.md): cohomology scaling with fixed arity.
- [Higher-order predication settlings question](higher-order-predication-settlings.md): the orthogonal generalization (predicates-of-predicates) that this question complements.
- [Predicate-category](../objects/predicate-category.md): the fixed-structure version that needs arity-fibered extension.

This is structurally a step *deeper* than the n-ary work — it requires fibered-category infrastructure that the corpus hasn't yet built.
