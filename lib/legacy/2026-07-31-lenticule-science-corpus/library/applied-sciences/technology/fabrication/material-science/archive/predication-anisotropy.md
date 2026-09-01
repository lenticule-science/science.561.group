---
type: concept
class: mechanical-property
depends-on: []
see-also: []
---

# Anisotropy (in materials)

Direction-dependence of a material property. A property $P$ is **isotropic** if its measured value is independent of direction in the material; **anisotropic** if it varies. Anisotropy is rarely binary — most engineering materials are *transversely isotropic* (one weak direction, isotropic plane perpendicular) or *orthotropic* (three mutually perpendicular axes with distinct properties).

**Sources of anisotropy.**

- **Process geometry.** Additive manufacturing's [layer](../../additive-manufacturing/concepts/layer.md) discretization produces transverse isotropy aligned with the build axis. Roll-direction texture in sheet metal is similar in origin.
- **Crystallographic texture.** Cast or formed metals have grain orientations resulting from solidification or cold work. Single-crystal alloys are extreme cases.
- **Reinforcement orientation.** Fiber-reinforced composites (CF, GF, aramid) have very high anisotropy ratios — fiber-direction modulus may be $10$–$50\times$ transverse-direction modulus.
- **Polymer chain orientation.** Drawn or oriented polymers (fiber, biaxially-oriented film) have aligned chains and direction-dependent strength.

**Engineering consequence.** Specifying a material property without specifying direction is an error for any non-isotropic material. Common mistakes in published AM data: reporting "tensile strength of FDM-printed PLA = 50 MPa" without specifying build orientation. Without orientation, the number is meaningless — the same material printed in different orientations spans $25$–$60$ MPa.

**Anisotropy ratio.** $r = P_{\mathrm{weak}} / P_{\mathrm{strong}}$ summarizes the anisotropy. Engineering convention varies; for AM the common convention is $r = \sigma_Z / \sigma_{XY}$.

| Material / process | Anisotropy ratio (rough) |
|---|---|
| Cast aluminum, isotropic alloy | $r \approx 1.0$ |
| Forged steel, longitudinal vs transverse | $r \approx 0.85$–$0.95$ |
| FFF PLA | $r \approx 0.5$–$0.7$ |
| FFF PETG | $r \approx 0.6$–$0.8$ |
| FFF PA-CF, fiber-aligned printing | $r \approx 0.3$ in fiber-perpendicular direction |
| SLA, post-cured | $r \approx 0.9$–$0.98$ |
| SLS PA | $r \approx 0.85$–$0.95$ |
| Carbon-fiber prepreg laminate | $r \approx 0.05$–$0.10$ in transverse direction |

**Design implication.** Orient the part so that the dominant load is in the strong direction. For AM, this is the [build-orientation](../../additive-manufacturing/concepts/build-orientation.md) choice; for composites, this is the lay-up sequence; for forged parts, this is the orientation in the die.

**Anisotropy does not always shrink to zero.** Even ideally-isotropic processes (powder-bed fully fused, post-HIP DMLS) retain trace anisotropy from texture, residual stress, or solidification gradients. The engineering question is whether the residual anisotropy is small enough relative to design margins.
