---
name: twist-product
description: For lattices L_1 and L_2, the twist product L_1 ⋈ L_2 is the pre-bilattice on the carrier L_1 × L_2 whose four operations interleave the two lattices' meets and joins as described in twist-product.md. When L_1 = L_2 = L the twist product L ⋈ L, equipped with the swap-negation ~⟨a,b⟩ = ⟨b,a⟩, is a bilattice denoted L^⋈; specializing to L = 2 gives FOUR. Avron's representation theorem says every interlaced bounded bilattice is isomorphic to some L^⋈.
constructing-from-lattice: pre-bilattice
constructing-with-swap-negation: bilattice
having-canonical-specialization: four-bilattice
representing-interlaced-bounded-bilattice: bilattice
---

For lattices $\mathbf{L}_1 = \langle L_1, \sqcap_1, \sqcup_1 \rangle$ and $\mathbf{L}_2 = \langle L_2, \sqcap_2, \sqcup_2 \rangle$, the **twist product** $\mathbf{L}_1 \bowtie \mathbf{L}_2$ is the pre-bilattice with carrier $L_1 \times L_2$ and operations

$$\langle a_1, a_2 \rangle \wedge_t \langle b_1, b_2 \rangle = \langle a_1 \sqcap_1 b_1,\, a_2 \sqcup_2 b_2 \rangle, \qquad \langle a_1, a_2 \rangle \vee_t \langle b_1, b_2 \rangle = \langle a_1 \sqcup_1 b_1,\, a_2 \sqcap_2 b_2 \rangle,$$

$$\langle a_1, a_2 \rangle \wedge_k \langle b_1, b_2 \rangle = \langle a_1 \sqcap_1 b_1,\, a_2 \sqcap_2 b_2 \rangle, \qquad \langle a_1, a_2 \rangle \vee_k \langle b_1, b_2 \rangle = \langle a_1 \sqcup_1 b_1,\, a_2 \sqcup_2 b_2 \rangle.$$

The induced orders are $\langle a_1, a_2 \rangle \leq_t \langle b_1, b_2 \rangle \iff a_1 \leq_1 b_1 \wedge b_2 \leq_2 a_2$ and $\langle a_1, a_2 \rangle \leq_k \langle b_1, b_2 \rangle \iff a_1 \leq_1 b_1 \wedge a_2 \leq_2 b_2$. The truth order raises the first coordinate and lowers the second; the knowledge order raises both.

When $\mathbf{L}_1 = \mathbf{L}_2 = \mathbf{L}$, the twist product is denoted $\mathbf{L}^\bowtie$ and equipped with the swap-negation $\sim\langle a, b \rangle = \langle b, a \rangle$, making it a bilattice. If $\mathbf{L}$ is distributive so is $\mathbf{L}^\bowtie$. Specializing to $\mathbf{L} = \mathbf{2}$ yields $\mathbf{2}^\bowtie \cong \mathbf{FOUR}$ with $\mathbf{f} = \langle 0, 1 \rangle$, $\bot = \langle 0, 0 \rangle$, $\top = \langle 1, 1 \rangle$, $\mathbf{t} = \langle 1, 0 \rangle$.

Avron's representation theorem: every interlaced bounded bilattice is isomorphic to $\mathbf{L}^\bowtie$ for some bounded lattice $\mathbf{L}$. The twist product is therefore the universal construction producing interlaced bounded bilattices from lattices.
