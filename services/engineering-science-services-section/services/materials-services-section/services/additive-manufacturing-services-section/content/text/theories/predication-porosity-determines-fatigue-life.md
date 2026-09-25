---
type: theorem
status: established
class: empirical-law
depends-on: [porosity, anisotropy]
title: Porosity determines fatigue life in AM parts
description: Claim.
---

# Porosity determines fatigue life in AM parts

**Claim.** For metal LPBF parts and for FFF polymer parts under cyclic loading, fatigue life is governed by the largest internal void in the high-stress region — not by the average porosity, average tensile strength, or other "bulk" property. The relationship is well-described by extreme-value statistics on the pore-size distribution.

**Quantitative statement.** For a part with a pore-size distribution $F(d)$ (CDF of pore equivalent diameters), the expected largest pore $d_{\max}(V)$ in the high-stress volume $V$ scales like

$$
d_{\max}(V) \;\approx\; F^{-1}\!\left(1 - \frac{1}{nV}\right)
$$

where $n$ is the pore number density. The fatigue life $N_f$ at applied stress amplitude $\sigma$ is then approximated by Murakami's $\sqrt{\text{area}}$ relation:

$$
\sigma_{\rm fatigue} \;\approx\; \frac{C(H_V + 120)}{\sqrt{\text{area}}^{1/6}}
$$

where $\sqrt{\text{area}}$ is the projected square root of the largest pore area onto the plane normal to maximum principal stress, $H_V$ is Vickers hardness, and $C$ is a material constant ($\approx 1.43$ for surface defects, $1.56$ for internal).

**Implications.**

- Tensile testing on small dogbone coupons systematically *over*-predicts fatigue performance of large parts: the large part has a higher chance of containing a critical pore.
- Statistical pedigree (sampling pore distribution by CT or in-situ monitoring) is more predictive than ensemble averaging.
- Reducing the number density $n$ of pores does not help much; reducing the *tail* of the pore-size distribution (the maximum pore, not the average) is what matters.
- A part with 0.5% porosity in clusters can be more dangerous than 2% porosity uniformly distributed.

**Mitigation in practice.**

- *HIP (Hot Isostatic Pressing).* Closes pores by creep at $\sim 0.7\,T_m$. Standard for safety-critical metal AM parts (Ti-6Al-4V aerospace, IN718 turbomachinery). Does not close pores connected to surface (must be truly internal).
- *Surface treatment.* Many AM fatigue failures initiate at *surface* roughness (acting as effective pores). Machining, polishing, peening of high-stress surfaces extends life by 5–20×.
- *Process-window control.* Stay in the dense region of the (laser power, scan speed) process map. Lack-of-fusion porosity is the dominant tail at low energy density; keyhole is the dominant tail at high.

**FFF analog.** Inter-bead voids (Tronvoll et al. 2018) play the role of pores in FFF fatigue. Porosity reduction by overlap and temperature directly maps to fatigue-life increase.

**Caveat.** The relation breaks down for parts with surface-initiated cracks (corrosion, fretting), and for environments where slow crack growth (SCC, hydrogen embrittlement) dominates. There the surface state, not the bulk porosity, controls life.

**References.**

- Murakami, Y. (2002). *Metal Fatigue: Effects of Small Defects and Nonmetallic Inclusions*. Elsevier.
- Sanaei, N., Fatemi, A. (2021). "Defects in additive manufactured metals and their effect on fatigue performance: A state-of-the-art review." *Progress in Materials Science* 117.
- Beretta, S., Romano, S. (2017). "A comparison of fatigue strength sensitivity to defects for materials manufactured by AM or traditional processes." *International Journal of Fatigue* 94.
