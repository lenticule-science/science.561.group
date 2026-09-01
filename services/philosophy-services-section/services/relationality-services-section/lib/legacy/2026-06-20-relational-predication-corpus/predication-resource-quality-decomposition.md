---
type: theorem
status: proved
depends-on: [theory-relative-ideal, resource-deficit, knowledge-order, predication-settling-category]
see-also: [idealization-morphism, idealization-morphism-existence, improvement-automorphism-distinction, settling-automorphism-decomposition]
---

# Resource quality decomposition

Let $v^R$ be a resource settling and $v^R_{T,\infty}$ its [theory-relative ideal](teaching/explanations/theory-relative-ideal.md). The four sets

$$\mathrm{Al}(v^R, T),\quad \mathrm{De}(v^R, T),\quad \mathrm{Ex}(v^R, T),\quad \mathrm{Co}(v^R, T)$$

defined in [resource-deficit](teaching/explanations/resource-deficit.md) partition the cell set $E \times \mathcal{C}^R \times E$ exactly:

$$E \times \mathcal{C}^R \times E \;=\; \mathrm{Al} \;\sqcup\; \mathrm{De} \;\sqcup\; \mathrm{Ex} \;\sqcup\; \mathrm{Co}.$$

## Proof

For any cell $c$, the comparison $v^R(c)$ vs $v^R_{T,\infty}(c)$ in the [knowledge order](teaching/explanations/knowledge-order.md) $(\mathbf{L}^\bowtie, \leq_k)$ falls into exactly one case: equal ($\mathrm{Al}$), strictly $<_k$ ($\mathrm{De}$), strictly $>_k$ ($\mathrm{Ex}$), or $\leq_k$-incomparable ($\mathrm{Co}$). That any two elements of a partial order satisfy exactly one of these four relations follows from the definition of partial order: any two elements are either equal, or comparable in one direction, or incomparable — and "comparable in one direction" is strict $<$ or strict $>$ (strict because incomparability is exhausted in the fourth case). These four cases are mutually exclusive by antisymmetry ($a \leq_k b$ and $b \leq_k a$ implies $a = b$) and disjointness of strict and reflexive parts. Every cell falls into exactly one case by the totality of the case analysis. Hence the four sets partition $E \times \mathcal{C}^R \times E$. $\square$

## The rubric

The partition $(\mathrm{Al}, \mathrm{De}, \mathrm{Ex}, \mathrm{Co})$ is the **theory-rubric** for resources of scope $\mathcal{C}^R$ in host theory $T$. It is not a score but a categorical decomposition: each cell is classified, not measured on a scale.

Applied to a concrete resource, the rubric gives:
- A complete list of what is correct ($\mathrm{Al}$)
- A complete list of what is missing ($\mathrm{De}$)
- A complete list of what exceeds the theory ($\mathrm{Ex}$)
- A complete list of what conflicts with the theory ($\mathrm{Co}$)

The [idealization morphism](../morphisms/idealization-morphism.md) toward $v^R_{T,\infty}$ exists when $\mathrm{Ex} = \mathrm{Co} = \emptyset$. When it does, it fills every deficient cell: $\mathrm{De}$ goes to $\emptyset$ and $\mathrm{Al}$ becomes the full cell set.

## Functoriality

The rubric changes when the host theory changes. If $T \hookrightarrow T'$ (the theory is extended), then $v^{R}_{T',\infty} \geq_k v^R_{T,\infty}$ (the extended theory's ideal is at least as informed). Consequently $\mathrm{De}(v^R, T') \supseteq \mathrm{De}(v^R, T)$: a more settled theory has more to demand of the resource.

This monotonicity of the deficiency set under theory extension means that improving a theory always reveals new deficiencies in its resources. The rubric is not a fixed target but co-evolves with the theory.

## Remark on "form"

The "form" of a resource, in the operational sense the theory was developed to handle, is the structured realization of the resource's predication cells — frontmatter structure, content organization, dependency chains, symbol assignments. The theory-rubric applied to form says: a resource's form is deficient at cell $c$ if the theory says cell $c$ should be filled but it isn't; excessive at $c$ if the resource fills it beyond what the theory supports; contradicted at $c$ if what the resource says conflicts with what the theory derives.

"Best possible form" is the theory-ideal: $\mathrm{De} = \mathrm{Ex} = \mathrm{Co} = \emptyset$.
