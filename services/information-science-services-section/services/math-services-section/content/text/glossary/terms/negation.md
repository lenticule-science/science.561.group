---
name: "Negation"
description: "The involution ~ that swaps the two sides of evidence: evidence for becomes evidence against and evidence against becomes evidence for, while how much is known stays the same. Antitone in the truth order, monotone in the knowledge order, self-inverse. On a twist product it is the coordinate swap; it is Nelson's strong negation, not the Heyting pseudocomplement."
aliases:
  - negating
  - negate
  - bilattice negation
  - strong negation
  - evidence swap
symbol: "\\sim"
contrasts-with: [complement, conflation]
date-created: 2026-04-29
references:
  - Ginsberg 1988, "Multivalued logics: A uniform approach to inference in artificial intelligence", Computational Intelligence 4(3), 265-316
  - Fitting 1991, "Bilattices and the semantics of logic programming", Journal of Logic Programming 11(2), 91-116
  - Nelson 1949, "Constructible falsity", Journal of Symbolic Logic 14(1), 16-26
  - Vakarelov 1977, "Notes on N-lattices and constructive logic with strong negation", Studia Logica 36, 109-125
  - Avron 1996, "The structure of interlaced bilattices", Mathematical Structures in Computer Science 6(3), 287-299
  - Odintsov 2008, Constructive Negations and Paraconsistency, Springer
---

**Negation** $\sim$ swaps the two sides of [evidence](evidence.md). Evidence for an assertion becomes evidence against it, and evidence against becomes evidence for. How much is known about the assertion does not change. This is the negation proved in the predication-categories theory and carried into Obsmetrologia's [bilattice negation](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/negation/negation.md). In this knowledge base, "negation", "negating" and $\sim$ mean this operation and nothing else.

## Definition

A unary operation $\sim$ on a [pre-bilattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/pre-bilattice.md) is a negation if it meets three requirements:

- **Truth-reversal (antitone in the [truth order](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/truth-order/truth-order.md)):** $a \leq_t b \Rightarrow \sim b \leq_t \sim a$. What was well supported as true becomes well supported as false.
- **Knowledge-preservation (monotone in the [knowledge order](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/knowledge-order/knowledge-order.md)):** $a \leq_k b \Rightarrow \sim a \leq_k \sim b$. A value that carries much information still carries as much after negation. Negation moves across the truth axis and along the knowledge axis.
- **Self-inverse ([involution](involution.md)):** $\sim\sim a = a$.

A pre-bilattice with a negation is a [bilattice](bilattice.md) (Ginsberg 1988; Fitting 1991).

Knowledge-monotonicity together with the involution makes $\sim$ an automorphism of $\leq_k$. It therefore sends each knowledge rank to itself and fixes every value that is alone in its rank. On $\mathbf{FOUR}$ this forces the whole table below. A classical "not" meets only the first requirement. It collapses not-knowing into denial and makes every contradiction explode.

## On twist products: the evidence swap

On a [twist product](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/residuated-lattice/content/twist-product/twist-product.md) $\mathbf{L}^\bowtie$, a value $\langle a_+, a_- \rangle$ records positive and negative evidence separately. Negation is literally the coordinate swap:

$$\sim \langle a_+, a_- \rangle = \langle a_-, a_+ \rangle.$$

The three requirements then read off directly:

- The truth order raises $a_+$ and lowers $a_-$, and swapping reverses both.
- The knowledge order raises both coordinates, and swapping keeps both.
- Swapping twice is the identity.

By Avron's representation theorem (1996), every interlaced bilattice is a twist product. The swap is therefore the general case, not one example among others.

## On FOUR

| Value | Evidence | Negated |
|---|---|---|
| $\bot$ | $\langle 0, 0 \rangle$ | $\bot$ (fixed) |
| $\mathbf{t}$ | $\langle 1, 0 \rangle$ | $\mathbf{f}$ |
| $\mathbf{f}$ | $\langle 0, 1 \rangle$ | $\mathbf{t}$ |
| $\top$ | $\langle 1, 1 \rangle$ | $\top$ (fixed) |

Negation fixes the two symmetric evidence states (none, and both) and swaps the two lopsided ones. The Boolean complement of the truth lattice would also exchange $\bot$ and $\top$. That map is not negation: it is negation composed with [conflation](conflation.md).

## Negation is not the pseudocomplement

The Heyting [pseudocomplement](complement.md) $\neg a = a \to \bot$ is a different operation. It gives the strongest element incompatible with $a$. It satisfies $a \leq \neg\neg a$ but in general not the converse, so it is not an involution. In the literature it is called intuitionistic or weak negation.

Nelson's constructive logic with strong negation (Nelson 1949) has both operations. Its algebras are twist structures (Vakarelov 1977; Odintsov 2008) in which:

- the strong negation $\sim$ is the coordinate swap;
- implication is computed coordinatewise from the base lattice, $\langle a_+, a_- \rangle \to \langle b_+, b_- \rangle = \langle a_+ \to b_+,\; a_+ \wedge b_- \rangle$;
- the pseudocomplement acts on the positive coordinate through that implication.

The framework's negation is the strong one.

Older notes gave the pseudocomplement other names. The acts derivation calls it *Negate* (act 131, "not a" as "a implies Ground Recognition"). Movement I calls it "negation as orthogonality": the largest disjoint subobject, with double negation. The early philosophy glossary asked whether negation is "exclusion of true in the result of a predicate". All three are the pseudocomplement, which relationality names [unrelating](../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/unrelating.md). None of them is negation. Contrariety (a value "opposed" to another without swapping evidence) is not negation either.

## Negation and conflation

A bilattice may also carry [conflation](conflation.md) $-$, which is antitone in knowledge and monotone in truth: the role-dual of negation. The two are independent. When both are present and commute, $\{\mathrm{id}, \sim, -, \sim\circ-\}$ is the [Klein four-group](klein-four-group.md) of bilattice symmetries (Obsmetrologia's [Klein-four symmetry](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/klein-four-symmetry/klein-four-symmetry.md)). Read the corners $\mathbf{t}, \mathbf{f}, \top, \bot$ as a square: negation reflects across the knowledge axis, conflation reflects across the truth axis, and their composite is the half-turn.

## Through the whole structure

Negation lifts cellwise:

- to each [predication fiber algebra](predication-fiber-algebra.md);
- from there to the whole [predication hyperdoctrine](predication-hyperdoctrine.md);
- to the hyperdoctrine's [Priestley dual](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/predication-hyperdoctrine/content/dual-predication-hyperdoctrine/dual-predication-hyperdoctrine.md), as the dualized swap.

Acting on the bilattice, it generates the internal $\mathbb{Z}/2$ gauge. That gauge is the symmetry group of [equivariant settling cohomology](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/equivariant-settling-cohomology.md). Negation is therefore both a connective on values and a symmetry of every layer at which evidence is recorded.

## See also

- [Evidence](evidence.md): what negation swaps.
- [Bilattice](bilattice.md), [conflation](conflation.md), [Klein four-group](klein-four-group.md).
- [Complement](complement.md): the pseudocomplement, which is not negation.
- [Nelson implication](nelson-implication.md): the implication that tests a statement and its contrapositive through $\sim$.
- [Four-bilattice](../../../../services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/four-bilattice/four-bilattice.md): the smallest example.
