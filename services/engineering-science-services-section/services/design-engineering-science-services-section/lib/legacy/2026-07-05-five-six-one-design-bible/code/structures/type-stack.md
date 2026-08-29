---
type: definition
class: type-family
status: current
realizes: [type-as-mass, type-scale]
depends-on: []
see-also: [type-scale, type-as-mass]
---

# Type stack

Three families, each with one job.

| Family          | Role                | Weights              | Fallback stack                          |
|-----------------|---------------------|----------------------|------------------------------------------|
| Space Grotesk   | Display, mark, UI   | 500, 700             | "Helvetica Neue", Arial, sans-serif      |
| Roboto Slab     | Body, slogan        | 400, 700, 400 italic | Georgia, "Times New Roman", serif        |
| JetBrains Mono  | Meta, captions      | 400, 500, 700        | "SF Mono", Menlo, Consolas, monospace    |

## Why these three

- **Space Grotesk** sets all display, the [mark](five-six-one-mark.md), and UI labels.
  Tight counters and squared apertures hold geometry at any size, including the 280-px numeral on the [numeral banner](../examples/numeral-banner.md).
- **Roboto Slab** sets all body copy and the [slogan](teaching/explanations/slogan-as-argument.md).
  The body of the work should read with weight, not flow.
  Slab feet brake the eye — useful when sentences are short and you want each one to land.
  Do not substitute a humanist serif; the page reads as editorial, which is the wrong register.
- **JetBrains Mono** sets all metadata — folios, captions, dates, filenames, tabular numerics.
  Mono caps with positive tracking (+18 % at M2) read as labels, not as serial numbers.

## How to use

The family-pairing morphism is [type-pairing](../morphisms/type-pairing.md).
The size assignments for each role are in the [type-scale concept](teaching/explanations/type-scale.md).
Two operative rules cross all three families:

1. **Never mix weights within a family on the same line.** Use weight to mark hierarchy, not emphasis.
  For emphasis inside body, use the slab's italic — sparingly.
  Bold inside body is a smell.
2. **Display gets tighter leading; body gets looser leading.** Display sizes lock to a single block (Land. / Water. / Language. / Culture.); body sizes need room because the slab's x-height runs hot.

## Hosting

The fonts are self-hosted in the [561 web origin](../examples/web-static-site.md)'s static directory.
No third-party font CDNs — see [no-third-party-on-web](teaching/explanations/no-third-party-on-web.md) and the [no-third-party-requests-on-web-surfaces theorem](../theorems/no-third-party-requests-on-web-surfaces.md).
The fallback stack is what loads if the self-hosted font fails.
