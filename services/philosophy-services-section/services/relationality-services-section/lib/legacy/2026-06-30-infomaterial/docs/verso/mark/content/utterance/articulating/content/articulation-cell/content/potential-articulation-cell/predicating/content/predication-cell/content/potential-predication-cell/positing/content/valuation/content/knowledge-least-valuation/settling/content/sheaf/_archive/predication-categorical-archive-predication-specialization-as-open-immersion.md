---
type: remark
discusses: [specialization-hyperdoctrinal-adjoints, predicate-specialization]
see-also: [two-internal-logics, not-a-tripos]
---

# Specialization as an open immersion

The triple $\exists_f \dashv f^* \dashv \forall_f$ produced by [specialization](../../morphisms/predicate-specialization.md) — extension by $\bot$, restriction to $\mathrm{dom}(q)$, extension by $\top$ — is the bilattice-poset analogue of the open-immersion adjoint triple $j_! \dashv j^* \dashv j_*$ familiar from sheaves on a topological space.

The structural picture. Each fiber algebra $A_p = (\mathbf{L}^\bowtie)^{\mathrm{dom}(p)}$ is the poset (in either of $\mathbf{L}^\bowtie$'s order enrichments) of $\mathbf{L}^\bowtie$-valued functions on the underlying support $\mathrm{dom}(p) \subseteq E \times E$. A specialization $f : q \to p$ has $\mathrm{dom}(q) \subseteq \mathrm{dom}(p)$ as its data; the underlying inclusion $\iota_f : \mathrm{dom}(q) \hookrightarrow \mathrm{dom}(p)$ is, viewed in the discrete poset of subsets of $E \times E$, an open immersion of subterminals. The pullback functor along $\iota_f$ between function-posets is precisely $f^*$ (restriction).

For $\mathbf{Set}$-valued sheaves on a discrete site, the open immersion induces the triple $\iota_{f!} \dashv \iota_f^* \dashv \iota_{f*}$:

- $\iota_{f!}$ — extension by the *initial* value at off-image cells (namely $\emptyset$).
- $\iota_f^*$ — restriction.
- $\iota_{f*}$ — extension by the *terminal* value (namely $\{\ast\}$).

The bilattice case is the same shape with the value category $\mathbf{Set}$ replaced by the bilattice poset $\mathbf{L}^\bowtie$, taken with one of its two order enrichments. In the $\leq_k$-system the initial value of the value-poset is $\bot$ and the terminal is $\top$, recovering the corpus's $\exists_f$ and $\forall_f$. In the $\leq_t$-system the initial value is $\mathbf{f}$ and the terminal is $\mathbf{t}$, recovering $\exists_f^t$ and $\forall_f^t$.

The analogy is at the level of pointwise extension/restriction along a subset inclusion in a value-poset, not at the level of geometric morphisms of toposes. The standard $\mathbf{Set}$-valued open-immersion case ([@maclane-moerdijk1992], IV.7–IV.9) supplies the picture; the bilattice case substitutes a value-poset for a value-topos and runs the same pointwise arithmetic. The construction does *not* require — and the remark does *not* claim — a topos of $\mathbf{L}^\bowtie$-valued sheaves; the predication hyperdoctrine is not a topos (see [not a tripos](teaching/explanations/not-a-tripos.md)).

The two enrichments do not produce two distinct adjoint triples on different data: they produce two adjoint triples on the same underlying carrier, read through the two distinct order-enrichments the bilattice carries simultaneously. This is what the [two-system structure](../../theorems/two-internal-logics.md) reduces to in the specialization case.

The placement gives the corpus a clean external anchor for the specialization adjoints — extension-by-initial / restriction / extension-by-terminal is a recognizable adjoint-triple pattern across geometric and order-theoretic settings, and specialization is its bilattice-poset instance.
