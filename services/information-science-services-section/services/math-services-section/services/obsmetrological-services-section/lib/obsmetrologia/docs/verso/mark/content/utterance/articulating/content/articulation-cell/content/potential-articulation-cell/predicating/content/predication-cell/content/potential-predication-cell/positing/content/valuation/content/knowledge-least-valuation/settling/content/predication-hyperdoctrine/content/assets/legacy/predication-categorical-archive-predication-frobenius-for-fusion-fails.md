---
type: theorem
status: proved
depends-on: [predicate-specialization, twist-product-fusion, knowledge-order, four-bilattice]
---

# Frobenius for fusion fails

Frobenius reciprocity for the [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$ does *not* hold for [specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md), [subject-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-subject-projection.md), or [object-projection](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-object-projection.md). It holds for [converse](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md) only.

## Proof

**Counterexample for specialization.** Let $E = \{a, b\}$, $\mathrm{dom}(q) = \{(a, a)\}$, $\mathrm{dom}(p) = E \times E$. Take $\alpha$ at $p$ with $\alpha(a, b) = \mathbf{f}$ (else arbitrary). Take $\phi$ at $q$ with $\phi(a, a) = \bot$.

- LHS at $(a, b)$: $\exists_f^k$ extends by $\bot$, so $\exists_f^k(f^*\alpha \odot \phi)(a, b) = \bot$.
- RHS at $(a, b)$: $\alpha(a, b) \odot \exists_f^k(\phi)(a, b) = \mathbf{f} \odot \bot$. Computing in [$\mathbf{FOUR}$](../objects/four-bilattice.md): $\mathbf{f} = \langle 0, 1 \rangle$, $\bot = \langle 0, 0 \rangle$; $\mathbf{f} \odot \bot = \langle 0 \cdot 0,\ (0 \to 0) \wedge (0 \to 1) \rangle = \langle 0, 1 \rangle = \mathbf{f}$.

LHS $= \bot \neq \mathbf{f} =$ RHS. ✗

**Structural cause.** Frobenius-for-$\otimes$ requires the conjunction's absorber to equal the $\exists_f$-extension value. For specialization's $\exists_f^k$, the extension is $\bot$; the [knowledge-order](teaching/explanations/knowledge-order.md) meet $\wedge_k$'s absorber is $\bot$ (aligned), but $\odot$'s absorber is $\mathbf{f}$ (not aligned). The non-integrality of $\odot$ on $\mathbf{L}^\bowtie$ is the fundamental obstruction.

**Where $\odot$-Frobenius succeeds.** [Converse](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md)'s $\exists_f^k = f^*$ is the swap — no $\bot$-extension, so no absorber-alignment issue. For converse, Frobenius-for-$\odot$ holds by the same computation as Frobenius-for-$\wedge_k$ with $\odot$ in place of $\wedge_k$:

$$\exists_f^k(f^*\alpha \odot \phi)(s, o) = (f^*\alpha \odot \phi)(o, s) = \alpha(s, o) \odot \phi(o, s) = \alpha(s, o) \odot \exists_f^k(\phi)(s, o). \checkmark$$

$\square$

This is the misaligned instance of the [Frobenius absorber-alignment criterion](frobenius-absorber-alignment-criterion.md): $\odot$'s absorber $\mathbf{f}$ does not match the $\leq_k$-extension default $\bot$. The departure from [@maruyama2021]'s substructural-hyperdoctrine convention ($\otimes$-Frobenius) is discussed in the [bilattice-departure remark](prose/remarks/frobenius-fusion-fails-bilattice-departure.md); the structural reading — *Beck–Chevalley is about pullback-coherence; Frobenius additionally requires absorber-alignment* — is the subject of the [BC-vs-Frobenius separation](prose/teaching/explanations/bc-vs-frobenius-separation.md) narrative.
