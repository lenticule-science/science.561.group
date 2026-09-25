---
kind: theorem
status: proved
depends-on: [priestley-dual-cover-topology, jung-rivieccio-duality, priestley-space, residuated-lattice]
---

# The Priestley-dual cover topology is subcanonical

For every $\mathbf{M} \in \mathrm{ResLat}_{\mathrm{dist}}$, the representable functor

$$\mathrm{Hom}_{\mathrm{ResLat}}(-, \mathbf{M}) \,:\, \mathrm{ResLat}_{\mathrm{dist}}^{\mathrm{op}} \to \mathbf{Set}$$

is a sheaf for the [Priestley-dual cover topology](../content/priestley-dual-cover-topology/priestley-dual-cover-topology.md) $J_{\mathrm{ResLat}}$.

## Proof

Apply [Jung–Rivieccio duality](../content/paired-priestley-space/references/jung-rivieccio-duality.md).
The duality gives the natural isomorphism

$$\mathrm{Hom}_{\mathrm{ResLat}}(\mathbf{L}, \mathbf{M}) \;\cong\; \mathrm{Hom}_{\mathrm{Pries}}(\mathrm{Spec}(\mathbf{M}),\, \mathrm{Spec}(\mathbf{L})).$$

Translating the sheaf condition for $\mathrm{Hom}(-, \mathbf{M})$ on a Priestley cover $\{\ell_i : \mathbf{L} \to \mathbf{L}_i\}$ via the duality, we need

$$\mathrm{Hom}_{\mathrm{Pries}}(\mathrm{Spec}(\mathbf{M}),\, \mathrm{Spec}(\mathbf{L})) \;\to\; \prod_i \mathrm{Hom}_{\mathrm{Pries}}(\mathrm{Spec}(\mathbf{M}),\, \mathrm{Spec}(\mathbf{L}_i)) \;\rightrightarrows\; \prod_{i, j} \mathrm{Hom}_{\mathrm{Pries}}(\mathrm{Spec}(\mathbf{M}),\, \mathrm{Spec}(\mathbf{L}_i \otimes_\mathbf{L} \mathbf{L}_j))$$

to be an equalizer.
Here $\mathbf{L}_i \otimes_\mathbf{L} \mathbf{L}_j$ is the pushout in $\mathrm{ResLat}$, dual to the *fibered product* $\mathrm{Spec}(\mathbf{L}_i) \times_{\mathrm{Spec}(\mathbf{L})} \mathrm{Spec}(\mathbf{L}_j)$ in [Priestley spaces](../priestley-space.md).

The condition becomes: a continuous order-preserving map $\mathrm{Spec}(\mathbf{M}) \to \mathrm{Spec}(\mathbf{L})$ is determined by, and freely glued from, compatible families of maps $\mathrm{Spec}(\mathbf{M}) \to \mathrm{Spec}(\mathbf{L}_i)$ that agree on fibered products.
This is the *standard topological gluing-of-continuous-maps condition* for jointly surjective covers — which is exactly the definition of "Priestley cover."

Hence the equalizer condition holds; representables are sheaves. $\square$

## Why this is the cleanest verification

Subcanonicality is verified by pulling the sheaf condition back to the dual Priestley side, where it becomes the standard topological gluing condition under jointly-surjective covers.
No ad-hoc "fpqc-style" or "faithful-flatness" notion for residuated lattices is required — Priestley duality reduces it to topology.

## Consequences

- The Priestley-dual cover topology is non-trivial enough to support genuine descent (see examples in [the topology note](../content/priestley-dual-cover-topology/priestley-dual-cover-topology.md)) — covers are not just isomorphisms.
- Representables on $\mathrm{ResLat}_{\mathrm{dist}}$ are sheaves, so the [parameter base topology](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/terms/parameter-base-topology.md) inherits subcanonicality componentwise.
- The [settling moduli prestack property](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-prestack-property.md) follows from this together with the cellwise structure of settling data.
