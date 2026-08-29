---
type: question
status: open
depends-on: [topology-optimization, design-for-am]
---

# Open: When will ML-generated geometry reach engineering acceptability for AM?

Topology optimization (TO) classically produces an optimal material distribution given loads, supports, and a volume fraction; the result is then hand-cleaned by an engineer into a buildable, certifiable part. A 2022– research wave proposes to skip the hand-cleaning step using generative ML — train a neural network to produce design candidates directly, conditioned on boundary conditions and on AM manufacturability constraints. Examples: TopologyGAN (Nie et al. 2021), neural implicit fields (Chen et al. 2022), diffusion-model topology generation (Mazé & Ahmed 2023).

The open questions:

1. **Convergence to the global optimum.** Classical SIMP TO has known convergence behavior. Generative-ML approaches do not: the network may produce visually similar but mechanically inferior designs. The compliance gap to the SIMP optimum is the standard benchmark; current generative methods are within ~5–15%.

2. **Constraint satisfaction.** TO with constraints (overhang, minimum feature size, build orientation) has formal optimality conditions. Generative-ML enforces constraints by penalty terms or by post-hoc filtering; neither is provably correct.

3. **Generalization across load cases.** A trained model on one load class (e.g., cantilever bending) may not transfer to another (combined bending + torsion). Foundation-model-style training on multi-load datasets (Park et al. 2024) is the proposed solution.

4. **Certifiability.** A part designed by an ML model still must be qualified for the application. The pedigree question (see [qualification-and-certification](./predication-qualification-and-certification.md)) compounds: not only must the *part* be certified, but the *design tool* must be auditable.

## What would success look like

Engineers would describe a load case and constraints in natural language or sketch form, the tool would return a printable, near-optimal, manufacturability-respecting STL, and the FEA verification would close on the first try. Carbon's Design Engine, nTopology Implicit, and Autodesk Generative Design are all moving in this direction; none are yet at the level where the engineer's role drops below "checker."

## What might block it

The TO problem is mathematically well-defined and the ML formulation is largely a speedup, not a new capability. The blocking issue is more likely *engineering acceptance* than algorithmic: the regulatory, liability, and educational structures around mechanical design assume an engineer in the loop with an auditable design rationale. Until ML-generated designs come with audit trails as legible as classical TO sensitivity fields, adoption will be slow in safety-critical contexts.
