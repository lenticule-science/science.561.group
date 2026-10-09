---
type: narrative
discusses: [beck-chevalley-commutation-on-predication-bilattices, frobenius-for-knowledge-and-truth-meets, frobenius-for-fusion-fails, twist-product-fusion]
kind: narrative
---

# Beck–Chevalley vs. Frobenius: a clean separation

In integral hyperdoctrines (Lawvere, Seely), Beck–Chevalley coherence and Frobenius reciprocity are entwined: BC for $\exists$-along-pullback combined with the integrality of the conjunction's monoidal structure implies Frobenius. The implications run together, and the two coherence conditions tend to be discussed jointly.

The bilattice setting separates them. The separation is structurally clean:

- **Beck–Chevalley is about pullback-coherence.** [Beck–Chevalley commutation on predication bilattices](../theorems/beck-chevalley-commutation-on-predication-bilattices.md) holds uniformly for every pullback square in $\mathcal{C}$, by reduction to cellwise base-change on the equivariant index-map category. The argument is independent of which conjunction is in play: it is a statement about how reindexing and existential quantification commute around squares in $\mathcal{C}$.

- **Frobenius additionally requires absorber-alignment.** [Frobenius for $\wedge_k$ and $\wedge_t$](../../../../../references/frobenius-for-knowledge-and-truth-meets.md) holds because the absorber of $\wedge_k$ is $\bot$ — exactly the value $\exists_f^k$ extends by — and the absorber of $\wedge_t$ is $\mathbf{f}$ — exactly the $\exists_f^t$-extension value. The conjunction's absorber must align with the $\exists$-extension value; otherwise Frobenius fails.

[Frobenius-for-fusion fails](../../../../../references/frobenius-for-fusion-fails.md) is exactly this misalignment in action: the [twist-product fusion](../morphisms/twist-product-fusion.md) $\odot$'s absorber is $\mathbf{f}$, not $\bot$, so the $\leq_k$-extension by $\bot$ produces values $\odot$ cannot collapse. BC still holds; Frobenius does not.

## The clean structural statement

> Beck–Chevalley says reindexing commutes with existential quantification across pullbacks. Frobenius says existential quantification distributes over conjunction. The two have separate inputs:
>
> - BC needs only pullback-coherence in the base.
> - Frobenius needs absorber-alignment between the conjunction and the extension value.

In integral hyperdoctrines the alignment is automatic — the conjunction's absorber is the $\bot$ of an integral monoidal unit, which agrees with the $\exists$-extension value by integrality. So the separation collapses, and Frobenius looks like "BC plus integrality." In the bilattice setting integrality fails for $\odot$, the alignment fails, and Frobenius-for-$\odot$ fails — while BC remains intact.

## Why this matters

The separation is not academic: it determines which connective Frobenius is stated for. Maruyama's substructural-hyperdoctrine convention takes Frobenius-for-$\otimes$ as primary; transferring that convention here would force the false $\odot$-Frobenius. Recognizing the separation lets the framework state Frobenius for $\wedge_k$ and $\wedge_t$ — connectives whose absorbers do align — and thereby preserve the Lawvere-style structural content with a bilattice-native conjunction.

The separation also sharpens what kind of obstruction non-integrality is: it is *not* an obstruction to BC, only to Frobenius-for-the-non-integral-connective. Anyone hoping to find $\odot$-Frobenius through cleverer pullback choices is barking up the wrong tree; the obstruction sits at the absorber, not the pullback.
