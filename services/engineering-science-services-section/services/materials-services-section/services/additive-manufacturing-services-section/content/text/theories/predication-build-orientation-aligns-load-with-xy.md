---
type: theorem
status: established
class: design-rule
depends-on: [anisotropy, build-orientation]
title: Build orientation should align primary load with XY plane
description: Claim.
---

# Build orientation should align primary load with XY plane

**Claim.** For a part with a known dominant tensile or shear load $\mathbf{F}$, the build orientation should be chosen such that $\mathbf{F}$ lies in the XY (build-plane) direction rather than along build-Z. The expected ultimate strength along this orientation is $1/r$ times the expected strength along the alternative orientation, where $r = \sigma_Z / \sigma_{XY}$ is the [anisotropy](./predication-anisotropy.md) ratio for the (process, material) pair — typically $r \in [0.4, 0.8]$ for FFF thermoplastics.

**Mechanism.** Tensile load along build-Z is resisted by the inter-layer bond — a bond formed during the brief window when both adjacent layers were above $T_g$. This bond is weaker than bulk material strength because (a) interfacial chain interdiffusion is incomplete, (b) the bond plane is geometrically continuous and acts as a built-in crack-initiation surface, (c) any localized cooling-induced void on the layer interface concentrates stress. Tensile load in the XY plane is resisted by the bead's own polymer chain network plus bead-to-bead bonds within a layer (which, being deposited contiguously while still molten, are much stronger than inter-layer bonds).

**Worked illustration.** A cantilever bracket loaded vertically should be printed with the cantilever extending in the XY direction (length lies in the build plane), not vertically (length lies along Z). The flexural stress at the fixed end is in-plane in the first orientation and inter-layer in the second; same part geometry, $\sim 2\times$ load capacity in the better orientation.

**Scope conditions.**
- "Known dominant load" — the rule decomposes to multi-load scenarios by orienting against the worst-case direction.
- Applies to FFF and (with smaller $r$, hence smaller penalty) to SLA pre-post-cure. For SLS, MJF, and post-HIP DMLS the anisotropy is small enough that the rule is a tiebreaker, not a determinant.
- Does not apply when other constraints (build-volume fit, surface-finish requirement, support-minimization) override.

**Conflicts with other rules.**
The orientation that aligns load with XY may simultaneously:
- Increase support requirements (more overhang surface)
- Place a critical surface on the build plate (poorer first-layer surface finish)
- Increase print time (taller build)

These conflicts are the substance of design-for-AM optimization. The general priority order, when conflicts arise:
1. Mechanical performance (this rule)
2. Critical-surface finish
3. Support minimization
4. Print time

— but priority order is part-dependent and a designer choice.

**Quantitative version (FFF, PLA).** For a $0.4$ mm nozzle, $0.20$ mm layer, $215$°C, well-cooled: $\sigma_{XY} \approx 50$–$60$ MPa, $\sigma_Z \approx 25$–$40$ MPa, hence $r \approx 0.5$–$0.7$. Annealed PLA shows reduced anisotropy ($r \to 0.8$+). Reported in Wittbrodt & Pearce (2015) and replicated widely.
