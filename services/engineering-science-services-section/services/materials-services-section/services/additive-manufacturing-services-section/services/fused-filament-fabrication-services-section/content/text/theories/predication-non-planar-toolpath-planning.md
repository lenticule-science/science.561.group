---
type: question
status: open
depends-on: [non-planar-slicing]
title: "Open: When and how should toolpaths leave the plane?"
description: Non-planar slicing (see non-planar-slicing) is a 2017– research wave in FFF.
---

# Open: When and how should toolpaths leave the plane?

Non-planar slicing (see [non-planar-slicing](./predication-non-planar-slicing.md)) is a 2017– research wave in FFF. The capability is demonstrated; the engineering question is when it is worth deploying, and how to plan curved toolpaths automatically rather than by ad-hoc hand-tuning.

## The decision problem

Given a part geometry, load case, and material, decide:

1. *Should this part be sliced non-planar at all?* What threshold of expected benefit (surface finish, strength, support reduction) justifies the move from 3-axis to 5-axis hardware and a non-planar slicer?
2. *If yes, what kind of non-planar slicing?* Top-surface only, principal-stress-aligned, conical, or fully field-driven?
3. *What is the layer-curvature field?* How is the scalar field $\phi$ whose level sets are layers chosen, given the part geometry and load?

## Sub-questions

1. **Hardware return-on-investment.** 5-axis FFF systems cost 3–10× more than equivalent 3-axis. For what part classes does the surface-finish + strength gain outweigh hardware cost? Aerospace certified parts, dental aligners, and customized prosthetics are candidates.

2. **Stress-aligned slicing automation.** Tam & Mueller (2017) computed principal-stress fields and aligned slices to them by hand. Automating this — a pipeline from CAD + boundary conditions → curved toolpath — is partial in the research literature; not productized.

3. **Collision avoidance.** Curved toolpaths in 5-axis space can collide the nozzle with the in-progress part. Toolpath planning must integrate collision-aware motion-planning (a robotics-arm-control problem) with deposition-planning (an AM problem). The two communities have only recently started talking.

4. **Slicer architecture.** Current commercial slicers (PrusaSlicer, OrcaSlicer, Cura) are built on a strict planar-layer assumption. Re-architecting to support curved layers is a substantial rewrite; FullControl GCode, Compas FAB, and a few research projects (cura-NonPlanarSlicing, Xtra3D) are exploring it.

5. **Anisotropy gain quantification.** How much real-world anisotropy reduction does stress-aligned slicing deliver, on a part-class basis? Lab demos show 30–80% strength gains in chosen test cases; industrial-relevance studies are scarce.

## Adjacent technique: non-planar deposition without 5-axis

A simpler subclass: keep the deposition planar but tilt the *part* mid-build using a rotating build plate (RotBot, Open5x, AMBOTS robotic-arm cluster). Half the implementation complexity of full 5-axis nozzle tilt; achieves much of the benefit. Active commercial development.

## What success looks like

A button in the slicer: "optimize for surface finish" / "optimize for strength along load X" / "minimize supports" produces a feasible 5-axis or rotated-build-plate toolpath with predicted improvement. Currently each non-planar print is a research project.

## References

- **Etienne, J., et al. (2019).** "CurviSlicer." *ACM TOG.*
- **Fang, G., et al. (2020).** "Reinforced FDM: Multi-axis filament alignment with controlled anisotropic strength." *ACM TOG.*
- **Tam, K. M., Mueller, C. T. (2017).** "Additive manufacturing along principal stress lines." *3D Printing and AM* 4.
- **Mitropoulou, I., et al. (2020).** "Print Paths Key-framing." *SCF.*
- Open5x project, RotBot project — open-source 5-axis FFF.
