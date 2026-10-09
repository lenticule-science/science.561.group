---
type: question
status: open
explores: [predicated-computer, predication-substrate, closure-kind]
see-also: [what-are-the-predicated-subtheories-of-computing]
---

# What is the predication theory of computing?

A predication theory is a quadruple $T = (\mathbf{L}, \mathcal{C}, E, \mathrm{Cl})$. The question is which quadruple constitutes $T_{\text{comp}}$ — the host theory against which computing sub-disciplines can be formally placed as subtheories or resources. Without it, no sub-discipline has a host theory; none are resources or subtheories in the formal sense.

## Concrete cases

**$\mathbf{L}$: the value lattice.** Rice's theorem forces $\bot$ (genuinely unknowable) into the settled state of any theory that includes behavioral predicates of programs: `terminates(p, i)` cannot be settled to $\{\mathbf{t}, \mathbf{f}\}$ for all $(p, i)$ by any finite process. $\mathbf{2}$ is insufficient. $\mathbf{FOUR}$ is the minimum integral commutative residuated lattice admitting $\bot$, and it admits the full four-valued structure via the bilattice construction $\mathbf{FOUR} \cong \mathbf{2} \times \mathbf{2}$: the truth dimension (does the predicate hold?) and the decidability dimension (can a Turing machine stably determine the truth value?) are independent. The candidate is $\mathbf{L} = \mathbf{FOUR}$. Whether a richer lattice is needed for probabilistic or continuous computation is open.

**$E^{\text{comp}}$: the entity set.** Programs and data are both encoded as strings: $E^{\text{comp}} = \{0,1\}^*$. Predication cells are $(s, p, o)$ with $s, o \in \{0,1\}^*$.

**$\mathcal{C}^{\text{comp}}$: the predicate category.** Objects are computational predicates ordered by implication under Turing reduction and specialization. Core objects: `computes-f` (for each partial recursive $f$), `terminates-on-i` (for each input $i$), `reduces-to` (Turing reducibility as a binary predicate between programs), `simulates` (binary, between machines). Morphisms: specialization (`terminates-in-O(n) → terminates`), Turing-reduction ordering, converse of `simulates`, subject/object projections. Whether interactive, distributed, and approximate computation require extending this predicate set is open; the realizability tripos over $\mathcal{K}_1$ supplies the predicates of $\mathbf{Eff}$ as an external anchor for what is derivable.

**$\mathrm{Cl}^{\text{comp}}$: the closure operator.** Three candidate rules: (1) simulation transitivity: $\text{simulates}(m_1, m_2) \wedge \text{computes}(m_2, f) \to \text{computes}(m_1, f)$; (2) Turing reduction downward: $\text{reduces-to}(A, B) \wedge \text{computable}(B) \to \text{computable}(A)$; (3) composition: $\text{computes}(p, f) \wedge \text{computes}(q, g) \to \text{computes}(p \circ q, f \circ g)$. Formal constraint from Rice: $\mathrm{Cl}^{\text{comp}}$ cannot derive `computes(p, f)` from finitely many observations of $p$'s behavior — this is a constraint on the closure rule language, not a practical limitation.

## Relevance

The subtheory existence theorem guarantees that once $T_{\text{comp}}$ is stated, every type embedding $\pi: \mathcal{C}^S \hookrightarrow \mathcal{C}^{\text{comp}}$ uniquely determines a subtheory $S = (\mathbf{L}, \mathcal{C}^S, E, \pi^*(\mathrm{Cl}^{\text{comp}}))$. The rederivation of computing sub-disciplines as proper subtheories becomes a program of exhibiting type embeddings rather than an open mathematical project. Resolving this question also determines which sub-disciplines can be resources versus subtheories — the distinction is formal: a resource requires only a type embedding; a subtheory additionally requires that its closure is the pullback of $\mathrm{Cl}^{\text{comp}}$.
