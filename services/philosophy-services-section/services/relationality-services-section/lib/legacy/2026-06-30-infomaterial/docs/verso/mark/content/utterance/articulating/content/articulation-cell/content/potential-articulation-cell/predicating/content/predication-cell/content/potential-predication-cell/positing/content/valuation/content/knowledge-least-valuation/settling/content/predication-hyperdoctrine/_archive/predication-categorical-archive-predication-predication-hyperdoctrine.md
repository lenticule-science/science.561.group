---
type: definition
realizes: [predicate-category-naturality]
class: hyperdoctrine
depends-on: [predication-fibration, knowledge-order, truth-order, predicate-category, twist-product-fusion]
---

# Predication hyperdoctrine

A **predication hyperdoctrine** is a [predication fibration](predication-fibration.md) additionally satisfying:

**(B1k) $\leq_k$-quantifier adjoints.** For every $f : q \to p$ in the [predicate category](predicate-category.md) $\mathcal{C}$, the reindexing $f^* : \mathcal{E}_p \to \mathcal{E}_q$ has both a left adjoint $\exists_f^k$ and a right adjoint $\forall_f^k$ in the [knowledge-order](teaching/explanations/knowledge-order.md) enrichment:

$$\exists_f^k \dashv f^* \dashv \forall_f^k.$$

**(B1t) $\leq_t$-quantifier adjoints.** Dual adjoints in the [truth-order](teaching/explanations/truth-order.md) enrichment:

$$\exists_f^t \dashv f^* \dashv \forall_f^t.$$

**(B2k) Frobenius reciprocity for $\wedge_k$.** For every $f : q \to p$ and every $\alpha \in \mathcal{E}_p$, $\phi \in \mathcal{E}_q$:

$$\exists_f^k(f^*(\alpha) \wedge_k \phi) \cong \alpha \wedge_k \exists_f^k(\phi).$$

**(B2t) Frobenius reciprocity for $\wedge_t$.** The same statement with $\wedge_k$ replaced by $\wedge_t$ and $\exists_f^k$ by $\exists_f^t$.

**(B3) Beck–Chevalley coherence.** For every pullback square in $\mathcal{C}$

$$\begin{array}{ccc} P & \xrightarrow{p_A} & A \\ p_B \downarrow & & \downarrow f \\ B & \xrightarrow{g} & C \end{array}$$

and every $\phi \in \mathcal{E}_B$, the canonical natural transformation

$$\exists_{p_A}^{k/t}(p_B^*\phi) \to f^*(\exists_g^{k/t}\phi) \quad \in \mathcal{E}_A$$

is an isomorphism, for both the $\leq_k$- and $\leq_t$-adjoint systems. Dually for $\forall$.

**(B4) Comprehension.** For every $p \in \mathcal{C}$, the **extension functor**

$$\mathrm{Ext}^t : \mathcal{C}/p \to \mathcal{E}_p, \quad (g : q \to p) \mapsto \exists_g^t(\mathbf{1}_q^t)$$

has a right adjoint $\{p : -\}_\mathbf{t} : \mathcal{E}_p \to \mathcal{C}/p$, where $\mathbf{1}_q^t$ is the $\leq_t$-terminal of the fiber $\mathcal{E}_q$ (the constant-$\mathbf{t}$ valuation). The analogous right adjoint $\{p : -\}_\top$ for the $\leq_k$-system also exists.

## Property-like

By [@kelly-lack1997]'s property-like theorem, conditions (B1)–(B4) are *properties* of the underlying predication fibration, not additional structural data. A predication fibration either verifies these properties (becoming a predication hyperdoctrine) or fails to; no independent choice is made.

## Two parallel adjoint systems

The presence of both (B1k)/(B2k)/(B4k) and (B1t)/(B2t)/(B4t) is structurally distinctive. The fiber algebra has two natural orders ([knowledge order](teaching/explanations/knowledge-order.md) for knowledge, [truth order](teaching/explanations/truth-order.md) for truth), and both support hyperdoctrinal adjoint structure. The two comprehension schemas yield two derived equality predicates (classical and paraconsistent).

## Frobenius for $\odot$ fails

The [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ on $\mathbf{L}^\bowtie$ is non-integral: its monoidal unit $\langle 1, 1 \rangle = \top$ is not the $\leq_t$-top $\mathbf{t}$, and its absorber $\mathbf{f}$ is not the $\leq_k$-bottom $\bot$. Specialization's $\exists_f$ extends by $\bot$ (for $\leq_k$) or $\mathbf{f}$ (for $\leq_t$); Frobenius demands the connective's absorber align with the extension value. $\wedge_k$'s absorber is $\bot$ (aligned); $\wedge_t$'s absorber is $\mathbf{f}$ (aligned); $\odot$'s absorber is $\mathbf{f}$ — not aligned with $\bot$. Hence $\leq_k$-Frobenius-for-$\odot$ fails for three of the four generator classes.
