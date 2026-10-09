---
type: concept
class: parameterized-discipline
parameters: [field, expertise-level, gutter-tolerances]
realizes: [accountable-closure]
see-also: [gutter, register]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/audience-relative-gap-acceptability.md"
date-created: 2026-05-02
title: Audience
description: Audience is the relative ground for gutter acceptability.
---

# Audience

*Audience* is the relative ground for [gutter](gutter.md) acceptability. A gap is not acceptable in the abstract. It is acceptable relative to a stated audience, medium, and purpose. The same omission can be elegant in a seminar, negligent in a paper, fatal in a proof assistant, and pedagogically useful in a classroom.

## Pattern

A practice declares the audience an artifact addresses (or the audience-type, when the artifact is general). The declaration specifies the field, expertise level, and gutter tolerances the audience is licensed to perform. A change of audience is a change of the artifact's gutter discipline; the practice must mark audience changes explicitly.

## Parameters

- **`field`** — the disciplinary background the audience is presumed to share (algebraic geometry, applied statistics, proof-assistant library development, undergraduate calculus instruction).
- **`expertise-level`** — the depth of background within the field (research peer, advanced student, motivated novice, lay reader).
- **`gutter-tolerances`** — for each gutter class the practice admits, the maximum magnitude this audience is licensed to close without further support.

## Conformance shape

The artifact states its audience explicitly. For each [gutter](gutter.md) the artifact contains, verify the closure-demand does not exceed the audience's stated tolerances. If the artifact addresses multiple audience strata in different regions, those strata are marked.

## Lineage

Zoe Ashton's "Audience role in mathematical proof development" (*Synthese* 198, 2021) is the central source for the claim that audience is constitutive of proof, not merely a pragmatic concern. The phenomenographic finding that mathematicians treat audience as part of mathematical communication appears in Murfett & Tran (2025) and in the broader mathematics-education literature (Planas & Pimm 2024).

## Instances in the corpus

- The [mathematical-communication audience-relative-gap-acceptability concept](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/communicating/content/communication/math/theories/mathematical-communication/concepts/audience-relative-gap-acceptability.md) instantiates audience with `field ∈ {algebraic geometry, combinatorics, formal mathematics, applied statistics, mathematics education, software-engineering}` and stratified tolerances for routine / productive / disciplinary gutter classes.
