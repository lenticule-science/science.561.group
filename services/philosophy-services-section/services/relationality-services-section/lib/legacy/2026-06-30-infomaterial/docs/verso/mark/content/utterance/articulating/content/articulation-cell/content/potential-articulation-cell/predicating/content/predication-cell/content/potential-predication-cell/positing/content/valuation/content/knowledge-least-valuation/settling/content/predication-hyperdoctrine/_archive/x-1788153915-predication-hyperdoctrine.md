---
name: predication-hyperdoctrine
description: A predication-fibration additionally satisfying quantifier adjoints in both the knowledge order and the truth order, Frobenius reciprocity for both meets, Beck–Chevalley coherence on pullbacks in the predicate category, and comprehension. The categorical logic structure on top of a predication-fibration that supplies its first-order quantifier theory.
extending: predication-fibration
having-knowledge-quantifier-adjoints: predication-hyperdoctrine
having-truth-quantifier-adjoints: predication-hyperdoctrine
having-frobenius-reciprocity: predication-hyperdoctrine
having-beck-chevalley: predication-hyperdoctrine
having-comprehension: predication-hyperdoctrine
closure-2-monad: predication-hyperdoctrine
---

A **predication hyperdoctrine** is a [predication-fibration](../predication-fibration/predication-fibration.md) additionally satisfying the conditions of Lawvere's hyperdoctrine notion (Lawvere 1969, Adjointness in foundations):

**(B1k) $\leq_k$-quantifier adjoints.** For every $f : q \to p$ in the predicate category $\mathcal{C}$, the reindexing $f^* : \mathcal{E}_p \to \mathcal{E}_q$ has both a left adjoint $\exists_f^k$ and a right adjoint $\forall_f^k$ in the knowledge-order enrichment:

$$\exists_f^k \dashv f^* \dashv \forall_f^k.$$

**(B1t) $\leq_t$-quantifier adjoints.** Dual adjoints in the truth-order enrichment:

$$\exists_f^t \dashv f^* \dashv \forall_f^t.$$

**(B2k) Frobenius reciprocity for $\sqcap_k$.** For every $f : q \to p$ and every $\alpha \in \mathcal{E}_p$, $\phi \in \mathcal{E}_q$:

$$\exists_f^k(f^*(\alpha) \sqcap_k \phi) \cong \alpha \sqcap_k \exists_f^k(\phi).$$

**(B2t) Frobenius reciprocity for $\sqcap_t$.** The same statement with $\sqcap_k$ replaced by $\sqcap_t$ and $\exists_f^k$ by $\exists_f^t$.

**(B3) Beck–Chevalley coherence.** For every pullback square in $\mathcal{C}$, the canonical natural transformation $\exists_{p_A}^{k/t}(p_B^*\phi) \to f^*(\exists_g^{k/t}\phi)$ is an isomorphism, for both the $\leq_k$- and $\leq_t$-adjoint systems. Dually for $\forall$.

**(B4) Comprehension.** For every $p \in \mathcal{C}$, the extension functor $\mathrm{Ext}^t : \mathcal{C}/p \to \mathcal{E}_p$, $(g : q \to p) \mapsto \exists_g^t(\mathbf{1}_q^t)$ has a right adjoint $\{p : -\}_\mathbf{t} : \mathcal{E}_p \to \mathcal{C}/p$. The analogous right adjoint $\{p : -\}_\top$ for the $\leq_k$-system also exists.

## Property-like

Conditions (B1)–(B4) are *properties* of the underlying predication-fibration, not additional structural data. A predication-fibration either verifies these properties (becoming a predication-hyperdoctrine) or fails to; no independent choice is made. The schema records the *witnesses* — the adjoint functors and comprehension data — so a runtime verifier can check the property holds against the underlying fibration.

## Two parallel adjoint systems

The presence of both $\leq_k$- and $\leq_t$-systems is structurally distinctive. The fiber algebra has two natural orders, and both support hyperdoctrinal adjoint structure. The two comprehension schemas yield two derived equality predicates (classical and paraconsistent).

## Frobenius for $\odot$ fails

The twist-product-fusion $\odot$ on $\mathbf{L}^\bowtie$ is non-integral: its monoidal unit $\langle 1, 1 \rangle = \top$ is not the $\leq_t$-top $\mathbf{t}$, and its absorber $\mathbf{f}$ is not the $\leq_k$-bottom $\bot$. Specialization's $\exists_f$ extends by $\bot$ (for $\leq_k$) or $\mathbf{f}$ (for $\leq_t$); Frobenius demands the connective's absorber align with the extension value. $\sqcap_k$'s absorber is $\bot$ (aligned); $\sqcap_t$'s absorber is $\mathbf{f}$ (aligned); $\odot$'s absorber is $\mathbf{f}$ — not aligned with $\bot$. Hence $\leq_k$-Frobenius-for-$\odot$ fails for three of the four generator classes.
