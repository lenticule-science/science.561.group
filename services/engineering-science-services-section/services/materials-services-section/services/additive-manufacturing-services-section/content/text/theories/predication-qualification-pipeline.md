---
type: morphism
class: organizational-process
depends-on: [in-process-monitoring, post-processing]
---

# Qualification pipeline (morphism)

The morphism that takes a finished AM build through the inspection, testing, and documentation chain that ends in regulatory acceptance for an end-use application. Conceptually orthogonal to the manufacturing morphisms ([slicing](./predication-slicing.md), [deposition](./predication-deposition.md), [post-processing](./predication-post-processing.md)) but inseparable from them in practice: the qualification pipeline determines what manufacturing parameters are even allowable.

**Type signature.**

$$
\text{Qualification} : \text{Part} \times \text{ProcessRecord} \times \text{Pedigree} \;\longrightarrow\; \text{AcceptanceCertificate}
$$

**Stages (canonical metal-AM aerospace flow).**

1. **De-powdering, support removal.** Remove the build from the plate; remove unmelted powder; cut supports.
2. **Stress-relief heat treatment.** Anneal at $\sim 600$°C for steel/Ti to relieve residual stress before the part is cut from the build plate (some shops do this in reverse order).
3. **Build-plate cut.** Wire EDM the part free.
4. **Hot Isostatic Pressing (HIP).** Close internal porosity. ~30% of part cost for aerospace.
5. **Solution heat treatment / aging.** Set final microstructure (Ti-6Al-4V STA, IN718 AMS 5662, etc.).
6. **Finish machining.** Critical surfaces, mating features, threaded holes.
7. **Surface finishing.** Bead blasting, peening, chemical polishing.
8. **NDE.** CT scan, FPI dye penetrant, ultrasonic, X-ray.
9. **Dimensional inspection.** CMM or structured-light scan; compare to STL.
10. **Mechanical sampling.** Coupons co-built with the part are tested to destruction.
11. **Documentation.** Pedigree (build log, in-situ data, powder lot, post-process records, NDE results, mechanical results) bound to the part serial number.

The pipeline is *the* dominant per-part cost in metal AM aerospace; build time itself is often less than a third of total per-part cost.

**FFF analog.** For consumer FFF the qualification pipeline collapses to "visual inspection" or to nothing. For end-use FFF parts (medical, aerospace cabin, automotive) the pipeline becomes recognizable: dimensional inspection, mechanical-coupon testing, environmental testing.

**Compression frontier.** The strategic opportunity is to compress this pipeline by using in-situ data (see [in-process-monitoring](./predication-in-process-monitoring.md)) to substitute for some downstream NDE — pedigree-based qualification, the unsolved problem of [qualification-and-certification](./predication-qualification-and-certification.md).
