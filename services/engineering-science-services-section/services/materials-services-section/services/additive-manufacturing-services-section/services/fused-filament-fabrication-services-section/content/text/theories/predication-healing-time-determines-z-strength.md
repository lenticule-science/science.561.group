---
type: theorem
status: established
class: empirical-law
depends-on: [layer-adhesion, melt-flow-rheology]
title: Healing time above $Tg$ determines Z-direction strength
description: Claim.
---

# Healing time above $T_g$ determines Z-direction strength

**Claim.** The strength of the inter-layer bond in FFF (the principal determinant of Z-direction tensile strength) is governed by the cumulative time the bond interface spends above the polymer's glass transition temperature $T_g$ during and after deposition. Specifically, the bond strength scales as the fraction of full polymer chain interdiffusion completed, which depends on the dimensionless healing time

$$
\theta \;=\; \frac{1}{t_{\rm reptation}(T_{\rm bond})} \int_0^\infty \mathbb{1}[T(t) > T_g] \, dt
$$

where $t_{\rm reptation}(T)$ is the polymer reptation time at temperature $T$ — the time for a chain to diffuse one chain-length across the interface.

## Mechanism (Yang–Pitchumani 2002, Bartolai et al. 2018)

When a hot bead is deposited on the layer below, the underlying surface re-warms above $T_g$. While both surfaces are above $T_g$, polymer chain segments diffuse across the bead/layer interface. The healing model (de Gennes reptation; Wool 1995) predicts bond strength as a function of $\theta$:

$$
\sigma_{\rm bond}(\theta) \;=\; \sigma_\infty \cdot \min(1, \theta^{1/4})
$$

where $\sigma_\infty$ is the bulk polymer strength.

For typical FFF with PLA at 215°C nozzle, 60°C bed: $\theta \sim 0.3$–$0.6$, giving $\sigma_{\rm bond}/\sigma_\infty \sim 0.7$–$0.9$. For ABS at 240°C nozzle in an open ambient: $\theta \sim 0.05$–$0.2$, giving $\sigma_{\rm bond}/\sigma_\infty \sim 0.5$–$0.7$. Heated chamber (60°C) raises $\theta$ for ABS to $\sim 0.5$, recovering most of the strength.

## Operational consequences

1. **Heated chamber dominates Z-strength for high-$T_g$ polymers.** ABS, ASA, PC, PEEK all have $T_g$ above typical ambient. Without a warm chamber the bond layer cools below $T_g$ within seconds of deposition, leaving $\theta$ tiny. With a chamber at $T_{\rm chamber} \sim T_g - 30$°C the cooling proceeds slowly; $\theta$ rises 3–10×.
2. **Layer time matters.** Tall thin parts spend long between layer revisits; the lower layer cools further before the upper bead arrives. Print multiple parts at once or use fillers to increase per-layer time only modestly — the effect is non-monotonic.
3. **Nozzle temperature has a strong effect, but bounded.** Hotter nozzle means hotter bead at deposition, longer time above $T_g$. But at the ceiling (filament discoloration, hot-end clogging, thermal degradation of polymer) further temperature increase is impossible without changing material.
4. **Annealing post-process recovers some strength.** Post-build oven anneal at $T_g + 20$°C extends $\theta$ by adding a long quasi-isothermal period. Documented strength recovery: 10–40% of the gap to $\sigma_\infty$ for PLA, PA. Trades off against dimensional change (annealing-induced shrinkage and warping).

## Caveat

The reptation model assumes amorphous polymer. For semi-crystalline polymers (PLA, PA, PEEK) the picture is more complicated: crystallization during cooling pins chains and can *prevent* further interdiffusion. PEEK in particular can be fully amorphous (slow-cooled, weak) or fully semi-crystalline (rapid below $T_m$, strong but anisotropic) depending on chamber thermal program; the bond mechanics differ in the two regimes.

## References

- **Yang, F., Pitchumani, R. (2002).** "Healing of thermoplastic polymers at an interface under non-isothermal conditions." *Macromolecules* 35.
- **Wool, R. P. (1995).** *Polymer Interfaces: Structure and Strength.* Hanser. The classical reference for chain-interdiffusion bond strength.
- **Bartolai, J., Simpson, T. W., Xie, R. (2018).** "Predicting strength of additively manufactured thermoplastic polymer parts produced using material extrusion." *Rapid Prototyping Journal* 24.
- **Spoerk, M., Gonzalez-Gutierrez, J., Sapkota, J., Schuschnigg, S., Holzer, C. (2018).** "Effect of the printing bed temperature on the adhesion of parts produced by fused filament fabrication." *Plastics, Rubber and Composites* 47.
