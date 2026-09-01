---
type: concept
class: discipline
realizes: [felt-weight]
instantiates: [type-role-discipline]
depends-on: [type-scale]
see-also: [mark-as-numeral, slogan-as-argument]
---

# Type as mass

Typography in the bible is treated as *mass*, not as flow.
The slab body — [Roboto Slab 400](../objects/type-stack.md) at B1 16/24 — was chosen because slab feet brake the eye, and a braked eye reads each sentence as a unit instead of skimming through.
The display sans — [Space Grotesk 700](../objects/type-stack.md) — was chosen because its tight counters and squared apertures hold their geometry at any size, including the 280-px numeral of the [numeral banner](../examples/numeral-banner.md).

Two operative rules follow.

**Never mix weights within a family on the same line.** Use weight to mark hierarchy across the page, not emphasis within a line.
A bold word in the middle of a body sentence is a smell — the bible's recommendation is to set the emphasized phrase as a [Roboto Slab italic](../objects/type-stack.md), and to use it sparingly.

**Tighter leading at display, looser at body.** Display lines (D1–D4) get leading 0.85–1.05 so stacked words (Land. / Water. / Language. / Culture.) lock to a single perceptual block.
Body sizes (B1–B2) get leading 1.45–1.5 because the slab's x-height runs hot and the eye needs interlinear room to find the next line.

The page reads as a *block diagram* of typographic mass at a glance — the masthead is the heaviest, the section heads the next, the body the next, the captions the lightest — and the eye sorts the page by size before reading any of it.
This realizes the parent visual-engineering term [felt weight](../../../terms/felt-weight.md): the artifact's perceptual mass is structural, not decorative.

The morphism that operationalizes this concept is [type-pairing](../morphisms/type-pairing.md): assign each text run to one family by role, set it at the corresponding [type-scale](type-scale.md) token, and never weight-mix on a line.
