---
type: remark
discusses: [frobenius-for-knowledge-and-truth-meets, frobenius-absorber-alignment-criterion]
see-also: [frobenius-for-fusion-fails, bc-vs-frobenius-separation]
---

# Frobenius for $\wedge_k$ and $\wedge_t$ as the modular law

In the relational and allegorical traditions, *Frobenius reciprocity for conjunction* is the **modular law**: for composable relations $R : A \to B$ and $S : B \to C$ and a relation $T : A \to C$,

$$(R\,;\,S) \cap T \;\subseteq\; R\,;\,(S \cap R^\circ\,;\,T),$$

where $;$ is relational composition, $R^\circ : B \to A$ the converse, and $\cap$ pointwise intersection of relations of matching type. The law expresses that intersection with a relation distributes through composition along the converse-as-adjoint structure. It is one of the defining axioms of an *allegory* in [@freyd-scedrov1990] and of a *cartesian bicategory of relations* in [@carboni-walters1987].

The bilattice instance of [Frobenius for $\wedge_k$ and $\wedge_t$](../../../../../references/frobenius-for-knowledge-and-truth-meets.md) is the same law in spirit, transferred from $\mathbf{Set}$-valued relations to $\mathbf{L}^{\bowtie}$-valued relations and stated for each generator of the [predicate category](../../objects/predicate-category.md). When the existential quantifier $\exists_f$ is read as the relational image $f\,;(-)$, the [Frobenius absorber-alignment criterion](../../theorems/frobenius-absorber-alignment-criterion.md) is exactly the criterion under which the modular law transfers cleanly: the conjunction's absorber must coincide with the value the relational image extends by off-image cells.

In an allegory of $\mathbf{Set}$-valued relations the alignment is automatic. The empty relation is simultaneously the absorber of intersection and the value of "no image"; integrality bundles the two roles. In the bilattice setting the alignment is a constraint: $\wedge_k$ for the $\leq_k$-system (absorber $\bot$, aligned with the $\bot$-extension), $\wedge_t$ for the $\leq_t$-system (absorber $\mathbf{f}$, aligned with the $\mathbf{f}$-extension). The [twist-product fusion](../../morphisms/twist-product-fusion.md) $\odot$ has absorber $\mathbf{f}$, mismatched against the $\leq_k$-system's $\bot$-extension, and the modular law fails for $\odot$ exactly to the extent of the misalignment ([Frobenius for fusion fails](../../../../../references/frobenius-for-fusion-fails.md)).

The reading places the bilattice Frobenius theorem inside the allegorical lineage rather than the integral-hyperdoctrine lineage. Lawvere–Seely-style hyperdoctrines bundle the modular law into the integrality of the conjunction's monoid; allegories state it as a separate axiom. The bilattice setting cannot bundle — non-integrality of $\odot$ forbids it — and so reverts to the allegorical separation in which Beck–Chevalley is one axiom and the modular law is another. The [BC-vs-Frobenius separation](teaching/explanations/bc-vs-frobenius-separation.md) narrative reads the same observation from the bilattice side; this remark records its allegorical-tradition counterpart.
