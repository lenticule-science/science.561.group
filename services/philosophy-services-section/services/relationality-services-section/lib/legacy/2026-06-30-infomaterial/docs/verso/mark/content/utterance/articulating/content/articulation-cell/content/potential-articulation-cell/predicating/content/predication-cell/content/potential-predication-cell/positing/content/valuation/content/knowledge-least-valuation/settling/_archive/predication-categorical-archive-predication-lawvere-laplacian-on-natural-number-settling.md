---
type: example
status: verified
depends-on: [lawvere-laplacian-grothendieck-sites, q-enriched-cohomology, scott-continuous-d-frame-cohomology-on-naturals, natural-number-successor-settling, quantale-enriched-sheaf]
instantiates: [lawvere-laplacian-grothendieck-sites, q-enriched-cohomology]
lineage: 3
---

# Lawvere Laplacian on the natural-number successor settling

The corpus's first concrete computation of the Lawvere Laplacian framework. **Lineage 3** instance: the Q-enriched cellular sheaf framework (Ghrist-Lopez-North-Riess 2025) applied to the L3 successor settling.

## Setup

L3 base: $E = \mathbb{N}$, single $P$, finitary closure rule, settling at $\kappa = \omega$. View the bitopological settling site $(\mathbf{T}^*_{\leq \omega}, J)$ as a Grothendieck site with cellular fibers (paired Priestley spaces of finite distributive bilattices at each $\tau < \omega$, plus the limit at $\tau = \omega$).

## Q-enriched cellular sheaf

For the quantale $\mathsf{Q} = \mathbf{2}$ (Boolean), the Q-enriched sheaf on $\mathbf{T}^*_{\leq \omega}$ is the d-frame-valued sheaf $\mathbb{F}_v$ from [scott-continuous-d-frame-cohomology-on-naturals](scott-continuous-d-frame-cohomology-on-naturals.md), which is the same sheaf in different language.

## Lawvere Laplacian operator

The Lawvere Laplacian $\Delta_{\mathrm{LL}} : C^0 \to C^0$ on the cochain complex acts cellwise. For each cell $\sigma \in \mathbf{T}^*$ and a cochain $c \in C^0 F$:

$$\Delta_{\mathrm{LL}}(c)(\sigma) \;=\; \bigwedge_{\tau \succ \sigma} f_\sigma^\tau(c(\sigma)) \;\wedge\; \bigvee_{\tau' \prec \sigma} f_{\tau'}^\sigma{}^*(c(\tau'))$$

where $f_\sigma^\tau$ is the cellular restriction and $f_{\tau'}^\sigma{}^*$ is the fuzzy right adjoint.

For the L3 setting, the Lawvere Laplacian's action specializes via the directed-colimit structure: at each finite stage $\tau = n$, $\Delta_{\mathrm{LL}}$ acts as the standard Tarski Laplacian on the finite cellular site; the colimit at $\tau = \omega$ is the Lawvere Laplacian's image on the limit cohomology.

## Tarski–Lawvere Fixed Point at the limit

By the [Tarski-Lawvere fixed-point theorem](../theorems/lawvere-laplacian-grothendieck-sites.md), the Lawvere Laplacian's fixed points are exactly the global sections of the sheaf:

$$\mathrm{Fix}(\Delta_{\mathrm{LL}}) \;=\; H^0(\mathbf{T}^*_{\leq \omega}, F).$$

Iterate $\Delta_{\mathrm{LL}}$ from any starting cochain; convergence in countably many steps produces the global section. The Lawvere Laplacian's action mirrors the closure operator's Scott-continuous action on the underlying settling.

## What this exhibits

Three observations:

**1. The Lawvere Laplacian framework computes correctly in predication categories' setting.** The framework, originally developed for graph-indexed Q-enriched cellular sheaves, applies to the bitopological settling site at the Scott-continuous regime via predication categories' [Lawvere Laplacian on Grothendieck sites](../theorems/lawvere-laplacian-grothendieck-sites.md) extension.

**2. The Tarski-Lawvere fixed point matches the directed colimit.** The Q-enriched fixed-point analysis reproduces the cohomology that the abelian-side direct-limit construction also gives. The two routes — fixed-point iteration vs directed colimit — agree, as expected.

**3. L3 is the simplest setting where Lawvere Laplacian has substantive content.** L1 and L2 (strict regime, finite cells) collapse the Laplacian to identity; L4 and L5 (transfinite-bounded and aperiodic) require Layer 3 of the cellular extension plan to carry the Laplacian to transfinite-cellular fibers. L3 is the *natural* test bed: Scott-continuous, countably-cellular, where the framework's machinery exercises.

## Position in Lineage 3

The L3 instance for the Lawvere-Laplacian / Q-enriched cohomology chapter. With this in hand, L3 has been carried through predication categories' Scott-continuous-regime content end-to-end:

- Settling structure ([natural-number-successor-settling](natural-number-successor-settling.md))
- Moduli ([scott-continuous-natural-number-moduli](scott-continuous-natural-number-moduli.md))
- $H^1$ vanishing ([scott-continuous-h1-vanishing-on-naturals](scott-continuous-h1-vanishing-on-naturals.md))
- d-frame $H^0$ ([scott-continuous-d-frame-cohomology-on-naturals](scott-continuous-d-frame-cohomology-on-naturals.md))
- Lawvere Laplacian (this file)

L3 establishes the Scott-continuous-regime benchmark: countable cells, structurally-vanishing $H^1$, Lawvere-Laplacian-computable $H^0$ via directed-colimit fixed-point.
