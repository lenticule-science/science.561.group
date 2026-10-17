---
type: remark
discusses: [frobenius-for-fusion-fails, twist-product-fusion]
see-also: [frobenius-absorber-alignment-criterion, bc-vs-frobenius-separation]
---

# Frobenius is stated for $\wedge$, not $\odot$ — and why

[Frobenius for fusion fails](../../../../../../valuation/content/knowledge-least-valuation/settling/references/frobenius-for-fusion-fails.md) forces the predication hyperdoctrine to state Frobenius reciprocity for the bilattice meets $\wedge_k$ and $\wedge_t$, not for the [twist-product fusion](../../morphisms/twist-product-fusion.md) $\odot$. This is a genuine departure from [@maruyama2021]'s substructural-hyperdoctrine convention, which takes Frobenius-for-$\otimes$ as primary.

The departure is forced, not chosen. Maruyama's setting is integral on $\otimes$: the substructural conjunction has $\bot$ as its absorber and the existential extension agrees with that absorber. The bilattice setting is non-integral on $\odot$ — its absorber sits at $\mathbf{f}$, away from the $\leq_k$-extension's $\bot$. The [Frobenius absorber-alignment criterion](../../theorems/frobenius-absorber-alignment-criterion.md) records the structural reason directly: Frobenius for a conjunction $\star$ along $\exists_f$-with-default-$d$ holds iff $d$ is an absorber of $\star$. The misalignment for $\odot$ in the $\leq_k$-system is the criterion's negation made visible.

The clean structural statement that survives — *Beck–Chevalley is about pullback-coherence; Frobenius additionally requires absorber-alignment* — is a separation that integral hyperdoctrines (Lawvere, Seely) conflate. The bilattice setting cannot conflate, so it exposes the separation. The narrative [BC-vs-Frobenius separation](teaching/explanations/bc-vs-frobenius-separation.md) discusses the principle in its general form; the [Frobenius-as-modular-law remark](frobenius-as-modular-law.md) places the surviving Frobenius identities inside the allegorical lineage where modular-law-style axioms are stated separately from BC.
