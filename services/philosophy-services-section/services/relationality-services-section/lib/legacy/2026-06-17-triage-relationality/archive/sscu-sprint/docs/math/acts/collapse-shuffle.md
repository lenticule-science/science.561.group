---

title: Collapsing Trace Shuffle
act: CollapseShuffle
slug: collapse-shuffle
top: ShuffleTrace
bottom: Nucleate
summary: Admissible shuffle reorderings leave a trace unchanged up to the nucleus, so composing `ShuffleTrace` with `Nucleate` records that such permutations are identified in the nucleus closure.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

[Nucleate](nucleate.md) collapses stabilized recognitions that differ only by
eventual equivalence, but no recognition yet states that shuffle-reordered
traces are eventually equivalent.  We therefore let the shuffle act witness the
nucleus closure: `(ShuffleTrace Nucleate)` earns ***CollapseShuffle***.

By construction, [ShuffleTrace](shuffle-trace.md) enumerates the admissible
reorders of progress steps that do not alter the underlying trace shape.
`Nucleate` collapses recognitions that differ only by stabilized equivalence.
Since admissible reorderings leave head/tail structure and iterative progression
intact, the composite `(ShuffleTrace Nucleate)` records that all such
reorderings lie in the kernel of the nucleus.  Nucleate therefore identifies
precisely those recognitions differing only by free shuffle of progress steps.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
