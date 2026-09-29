---
type: question
status: open
explores: [predicated-computer, predication-substrate]
see-also: [what-is-the-predication-theory-of-computing]
---

# What are the proper subtheories of $T_{\text{comp}}$?

A proper subtheory of $T_{\text{comp}} = (\mathbf{L}, \mathcal{C}^{\text{comp}}, E, \mathrm{Cl}^{\text{comp}})$ is a pair $(\mathcal{C}^S, \pi)$ where $\pi: \mathcal{C}^S \hookrightarrow \mathcal{C}^{\text{comp}}$ is a type embedding and the induced theory $S = (\mathbf{L}, \mathcal{C}^S, E, \pi^*(\mathrm{Cl}^{\text{comp}}))$ is well-formed. The question is which sub-disciplines of computing admit such embeddings, and what partial order they form. Blocked on [what-is-the-predication-theory-of-computing](what-is-the-predication-theory-of-computing.md).

## Concrete cases

**Complexity theory.** $\pi_{\text{cx}}: \mathcal{C}^{\text{cx}} \hookrightarrow \mathcal{C}^{\text{comp}}$ restricts to resource-bounded predicates: `terminates-in-poly-time`, `computable-in-space-g`. The pullback closure $\pi_{\text{cx}}^*(\mathrm{Cl}^{\text{comp}})$ replaces Turing reduction with polynomial-time reduction; the result is the P/NP/PSPACE hierarchy as a subtheory of computability. Whether `terminates-in-poly-time` faithfully embeds — i.e., whether polynomial-time reduction is the right closure, not a coarsening — must be verified.

**Type theory.** $\pi_{\text{tt}}: \mathcal{C}^{\text{tt}} \hookrightarrow \mathcal{C}^{\text{comp}}$ selects type-theoretic predicates (`has-type-A`, `inhabits`, `well-typed`) via the Curry-Howard correspondence. The closure rule `well-typed(p) → terminates-on-all-inputs(p)` (typed programs normalize) connects the type-theory predicate scope back into $\mathrm{Cl}^{\text{comp}}$ via the `terminates` predicate. This is the structurally most natural candidate: the Curry-Howard-Lambek correspondence makes the embedding categorical rather than ad hoc.

**Probabilistic and continuous computing.** Whether this is a subtheory (restriction of $\mathcal{C}^{\text{comp}}$), a super-theory (extension requiring new predicates like `achieves-accuracy-ε`), or a sibling theory has a candidate resolution from the PCA structure: Topological Domain Theory lives in $RT(\mathcal{K}_2)$, not in $\mathbf{Eff} = RT(\mathcal{K}_1)$. Morphisms between PCAs induce geometric morphisms between realizability toposes (van Oosten), not type embeddings. If this holds, probabilistic computing admits a researching morphism into a richer theory rather than a type embedding into $T_{\text{comp}}$ — making it a sibling theory rather than a subtheory or resource.

**The subtopos lattice of $\mathbf{Eff}$.** The Lee-van Oosten (2012, arXiv:1201.2571) classification of subtoposes of $\mathbf{Eff}$ is the realizability-theoretic counterpart of the subtheory partial order: each subtopos corresponds to a type embedding preserving realizability structure. The classical subtopos of $\mathbf{Eff}$ — where the internal logic becomes Boolean — corresponds to the decidable-predicate restriction ($\Delta^0_1$). The full subtopos lattice would resolve the subtheory partial order for $T_{\text{comp}}$.

## Relevance

Theorems proved at the level of $T_{\text{comp}}$ restrict to theorems in each proper subtheory by the closure-restriction construction. The partial order among subtheories is formally checkable once type embeddings are exhibited. Sub-disciplines that fail to produce type embeddings are identified as requiring either extension of $T_{\text{comp}}$ or relocation to a sibling theory — a mathematical verdict, not an organizational one.
