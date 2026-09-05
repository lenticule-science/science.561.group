---

name: irrational-commutation
act: IrrationalCommutation
top: IrrationalModality
bottom: CollapseShuffle
summary: Ensure irrational modalities commute with shuffle collapse by composing them with `CollapseShuffle`.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

For a modality indexed by an irrational (alpha) to behave coherently, it must commute
with the nucleus under admissible reordering collapse.  We enforce this via
`(IrrationalModality CollapseShuffle)`, earning
***IrrationalCommutation***.

`CollapseShuffle` identifies recognitions that differ only by reorderings, and
`IrrationalModality` scales the space of reorderings while preserving
their structure.  The composition asserts that irrational scaling preserves
collapse-equivalence.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
