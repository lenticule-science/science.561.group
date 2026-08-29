---
type: narrative
introduces: [model-stl, slicer, gcode, slicing, deposition, solidification, post-processing]
discusses: [layer, build-orientation]
---

# The AM pipeline as a chain of morphisms

Every additive manufacturing process — FFF, SLA, SLS, MJF, DMLS, all of them — runs the same pipeline at the level that matters for design and failure analysis:

$$\text{CAD model} \xrightarrow{\text{tessellate}} \text{[STL mesh](../../objects/model-stl.md)} \xrightarrow{\text{[slice](../../morphisms/slicing.md)}} \text{[G-code](../../objects/gcode.md)} \xrightarrow{\text{[deposit](../../morphisms/deposition.md)}} \text{green part} \xrightarrow{\text{[solidify](../../morphisms/solidification.md)}} \text{solid part} \xrightarrow{\text{[post-process](../../morphisms/post-processing.md)}} \text{finished part}$$

Each arrow is a morphism in the engineering sense — a structure-preserving (and structure-losing) transformation between artifact types. Understanding AM is, in large part, understanding which morphism is the locus of which failure.

**The CAD-to-mesh morphism** discards parametric structure and replaces curved surfaces with their piecewise-linear approximation at a chosen tolerance. Over-tessellation produces large files but no further benefit; under-tessellation produces visible facets on curved surfaces of the printed part. Most failures here are "STL was exported wrong" failures — wrong units, wrong tolerance, wrong scale.

**The slice morphism** is the most parameter-heavy and most consequential. It folds a print profile (50–200 parameters) into a layer-by-layer toolpath. Slicing failures are everywhere: bad seam placement, poor support generation, wrong infill, bad first-layer setup. Slicer choice and slicer version matter; reproducibility lives or dies here. See [slicing](../../morphisms/slicing.md).

**The deposit morphism** is where the physical world enters. The slicer assumed an idealized machine; the actual machine has thermal drift, mechanical wear, calibration error, and stochastic effects from filament moisture and ambient temperature. Failures here include warping, layer shifts, under-extrusion, and the entire family of "the printer didn't do what the G-code said." Tuning the (machine, profile) pair is largely about closing the gap between idealized and actual deposition.

**The solidify morphism** is invisible and often neglected, yet it determines mechanical properties. The bond between the new bead and the previous layer forms here, the polymer crystallinity is determined here, residual stress accumulates here. Failures here are usually delayed: a part comes off the printer looking fine and fails the load test a week later because layer adhesion was marginal. See [cooling-warping-tradeoff](../../theorems/cooling-warping-tradeoff.md) and [build-orientation-aligns-load-with-xy](../../theorems/build-orientation-aligns-load-with-xy.md).

**The post-process morphism** absorbs everything from supports removal to annealing to insert installation. The fraction of total project labor in post-processing is wildly under-estimated by AM beginners — for a typical functional part it equals or exceeds print time.

The slicing ↔ deposition boundary deserves particular attention because it is the boundary across which the most expensive failure mode lives: the slicer thinks the print will succeed, the printer attempts and fails. Diagnosing such failures requires reasoning about both sides. The [why-this-print-warped](../../examples/why-this-print-warped.md) walkthrough is a worked example.

The pipeline view also explains why [build orientation](../../teaching/explanations/build-orientation.md) is so consequential: it is *the one decision that influences every downstream morphism simultaneously*. Orientation changes the mesh's relation to the slicing planes, the slicer's overhang and support decisions, the deposit's anisotropy axis, the solidify's residual stress field, and post-processing's support-removal labor. Get this one decision right and the rest of the pipeline mostly works; get it wrong and every subsequent stage compounds the error.
