---

name: shuffle-geometry
act: ShuffleGeometry
slug: shuffle-geometry
top: StructureSemantics
bottom: CommuteShuffleFlowAndNucleus
summary: Specialize the geometric structure to the shuffle trace dynamics by letting the semantic package witness the compatibility between `ShuffleFlow` and the nucleus.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

A geometry is the semantic structure equipped with compatible nuclei and flow.
We already formed [FormGeometry](form-geometry.md) by letting
[StructureSemantics](structure-semantics.md) witness `CommuteFlowAndNucleus`.
To specialize this to the shuffle trace dynamics, we let the same semantic
structure witness the derived compatibility of
[ShuffleFlow](shuffle-flow.md) with [Nucleate](nucleate.md):
`(StructureSemantics CommuteShuffleFlowAndNucleus)` earns
***ShuffleGeometry***.

`StructureSemantics` packages the full algebraic behavior of recognitions,
meets, joins, implication, and nuclei.
[CommuteShuffleFlowAndNucleus](commute-shuffle-flow-and-nucleus.md) shows
that the induced flow on admissible trace-shuffle classes respects the same
nucleus.  The composition therefore records a semantic calculus whose “motion”
is given by `ShuffleFlow` and whose closure is given by `Nucleate`, yielding the
shuffle geometry.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
