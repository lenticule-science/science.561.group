---
type: concept
class: framework
depends-on: [layer, anisotropy]
realizes: []
---

# Process–structure–property (PSP) linkage

The unifying conceptual frame for AM (and for materials processing more generally), formalized for metal AM by [DebRoy et al. (2018)](./predication-debroy-et-al-2018.md). The claim is that AM is, in principle, a controllable process: the chain

$$
\text{process parameters} \;\longrightarrow\; \text{thermal/photochemical history} \;\longrightarrow\; \text{microstructure} \;\longrightarrow\; \text{properties}
$$

decomposes into three predictable links, each of which is a tractable physics or materials-science problem.

**Link 1 — Process → thermal history.** Heat-and-mass-transfer modeling. For metal LPBF the canonical starting point is the Rosenthal moving-point-source solution; modern codes (FLOW-3D AM, ExaAM) add fluid flow, surface tension, evaporation. For FFF the analog is non-isothermal melt extrusion (Bellini, Phan, Spoerk).

**Link 2 — Thermal history → microstructure.** Phase-transformation kinetics. Cooling rate determines cellular vs columnar vs equiaxed grains in metals; chain-interdiffusion time determines inter-bead bond strength in polymers; degree-of-cure determines crosslink density in photopolymers.

**Link 3 — Microstructure → properties.** Mechanical metallurgy / polymer mechanics. Anisotropy (see [anisotropy](./predication-anisotropy.md)), tensile properties, fatigue, fracture toughness, residual-stress-driven distortion.

**Why this matters.** A field is mature in proportion to how well it can predict end-to-end through this chain. Metal AM has working forward models on all three links; polymer AM (FFF in particular) has the framing but not yet the predictive accuracy on link 2 (cooling-history → bond strength). See the [predictive-warping-model](./predication-predictive-warping-model.md) open question.

**The PSP frame is also the basis of qualification.** A "qualified part / qualified process" framework certifies the part by certifying that the process parameters were inside an envelope known (from PSP modeling) to give properties inside spec. Pedigree-based qualification adds in-situ measurements at link 1 (thermal history) so that *each individual part* is certified.
