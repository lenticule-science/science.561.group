---
type: concept
class: defect
depends-on: [bead, layer-adhesion]
realizes: []
---

# Inter-bead voids

Triangular or rounded voids at the contact line between adjacent extruded beads in an FFF part. The dominant porosity contribution in FFF — typical FFF parts are 5–15% porous by volume in the perimeters/infill, far higher than for any other AM modality.

## Geometry

Two adjacent beads of cross-section approximately rectangular (width $w$, height $h$) cannot tile space perfectly: the rounded shoulders leave gaps at the bead-to-bead and bead-to-layer contact lines. Standard formulation (Tronvoll et al. 2018):

- *Inter-bead voids (in-plane).* Gaps between adjacent beads in the same layer.
- *Inter-layer voids.* Gaps at the corner where two beads in layer $n$ meet a bead in layer $n+1$.
- *Sharp-corner voids.* Inside concave perimeters (acute internal angles), the toolpath cannot lay beads tight to the corner without overlap; voids accumulate.

The void fraction depends on the bead aspect ratio (typically $w/h \approx 1.5$–$2.5$ for production FFF) and on the prescribed *flow ratio* (also called extrusion multiplier, see [extrusion-multiplier](./predication-extrusion-multiplier.md)). Higher flow → more spreading → smaller voids, but excess flow → over-extrusion artifacts.

## Why they matter

- *Mechanical strength.* Voids are stress concentrators. FFF Z-strength ratios of 0.4–0.8 (vs XY) are partly explained by the void distribution, not only by inter-layer bond energy.
- *Fluid permeability.* Inter-bead and inter-layer voids form a percolating network. FFF parts are not gas-tight without coating or annealing; this disqualifies them for vacuum and pressure-vessel applications without post-treatment.
- *Fatigue.* The voids act as built-in microcracks. FFF fatigue life is much shorter than predicted by tensile strength alone; the porosity-determines-fatigue-life rule (see [porosity-determines-fatigue-life](../../../../../content/text/theories/predication-porosity-determines-fatigue-life.md)) applies fully.

## Mitigations

- **Increase flow ratio (extrusion multiplier).** Push beads to overlap more. Standard tuning: flow calibration prints (single-wall-cube weight method, OrcaSlicer's flow calibration). Typical optimum is 102–105% of geometric prediction.
- **Increase nozzle temperature.** Hotter melt spreads more under nozzle pressure. Trades off against stringing and overhang quality.
- **Reduce print speed.** Slower prints give the melt more time to spread under the nozzle. Costs build time.
- **Ironing.** A second pass at very low flow rate, very high temperature, no extrusion, smoothing the top surface. Closes top-surface voids; does not help bulk porosity.
- **Annealing post-process.** For semi-crystalline polymers (PLA, PA), oven-anneal at $T_g + 20$°C closes some voids by polymer chain mobility. Trades off against dimensional change.
- **Non-planar slicing.** Curved layers eliminate stair-stepping voids on sloped surfaces. Active research; see open question.

## Measurement

- *Density method.* Weigh part, divide by geometric volume. Cheap, gives bulk porosity only.
- *μ-CT.* Maps the 3D void distribution. Standard in research; reveals that voids are highly anisotropic and clustered.
- *Cross-section microscopy.* Cut, polish, image. Gives 2D distribution; biased by section choice.

## References

- **Tronvoll, S. A., Welo, T., Elverum, C. W. (2018).** "The effects of voids on structural properties of fused deposition modelled parts: a probabilistic approach." *International Journal of Advanced Manufacturing Technology* 97. The canonical paper on FFF void geometry and its statistical effect on tensile strength.
- **Spoerk, M., Holzer, C., Gonzalez-Gutierrez, J. (2020).** "Material extrusion-based additive manufacturing of polypropylene: A review on how to improve dimensional inaccuracy and warpage." *Journal of Applied Polymer Science* 137. Includes thorough void-characterization methodology.
- **Forster, A. M. (2015).** "Materials Testing Standards for Additive Manufacturing of Polymer Materials: State of the Art and Standards Applicability." *NISTIR 8059*. The standards-side perspective on FFF porosity reporting.
