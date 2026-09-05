---
kind: theorem
status: proved
depends-on: [settling-moduli-prestack, parameter-base-topology, priestley-cover-topology-subcanonical, predication-fiber-algebra, mutually-locally-derivable]
---

# The settling moduli prestack is a prestack

$\mathscr{M}^{\mathrm{pre}}$ is a prestack on $(\mathbf{B}, J_\mathbf{B})$ — equivalently: for every $B \in \mathbf{B}$ and every pair $v, v' \in \mathrm{KP}^{\mathrm{vis}}(B)$, the Hom-functor

$$\mathrm{Hom}_B(v, v') \,:\, (\mathbf{B}/B)^{\mathrm{op}} \to \mathbf{Set}$$

is a sheaf in the comma topology induced by the [parameter base topology](../objects/parameter-base-topology.md).

## Proof

By Vistoli Proposition 4.7, being a prestack is equivalent to the Hom-sheaf condition on every pair of objects in every fiber.

Unfolded: given $v, v'$ over $B$ and a cover $\{B_i \to B\}_i$ in $J_\mathbf{B}$, suppose we have [settling-morphism](../morphisms/settling-morphism.md) pieces $\phi_i : (B_i \to B)^* v \to (B_i \to B)^* v'$ that agree on pairwise pullbacks $B_i \times_B B_j$. The claim is that there exists a unique $\phi : v \to v'$ whose pullback to each $B_i$ agrees with $\phi_i$.

A settling-morphism is a family $(\phi_{q, \tau})$ of [bilattice homomorphisms](../morphisms/bilattice-homomorphism.md) on the [predication fiber algebras](../objects/predication-fiber-algebra.md). Each $\phi_{q, \tau}$ acts cellwise: a fiber-algebra element at $(s, o) \in E \times E$ is sent to a fiber-algebra element at the corresponding cell.

By the [parameter base topology](../objects/parameter-base-topology.md)'s structure — the only non-trivial component is $\mathrm{ResLat}_{\mathrm{dist}}$ via the [Priestley-dual cover topology](../objects/priestley-dual-cover-topology.md) — the fiber algebra $\mathbf{L}^\bowtie$ descends as a sheaf by [Priestley-cover subcanonicality](priestley-cover-topology-subcanonical.md). The cell-by-cell descent of settling-morphism components is exactly the sheaf condition for $\mathrm{Hom}(-, \mathbf{M})$ where $\mathbf{M}$ is the codomain bilattice — which is a sheaf.

The remaining components ($\mathcal{C}$, $E$, $\lambda$) are fixed across the cover by the trivial topology, so they introduce no descent conditions on settling-morphism data.

Combining: the cellwise descent of $\phi_{q, \tau, (s, o)} \in \mathrm{Hom}(\mathbf{L}^\bowtie, \mathbf{L}^\bowtie)$ for each $(q, \tau, s, o)$ produces the unique $\phi : v \to v'$. $\square$

## Reading

The prestack property is the *Hom-sheaf* condition: settling-morphisms glue. This is the easier half of the stack property (cf. effective descent for objects, which is harder). The prestack property reduces to subcanonicality of the Priestley-dual cover topology, which is established by Priestley-side gluing of continuous maps.

The full [settling moduli stack theorem](settling-moduli-stack-theorem.md) takes the prestack property as input and adds effective descent — the harder claim that *objects* (settlings themselves, not just morphisms between them) glue from local pieces.
