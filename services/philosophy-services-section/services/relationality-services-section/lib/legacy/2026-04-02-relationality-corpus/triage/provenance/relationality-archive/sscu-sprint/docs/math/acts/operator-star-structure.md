---

name: operator-star-structure
act: StarOperatorStructure
top: StarOperation
bottom: Spectrum
summary: Combine the star operation with the spectrum to obtain a C*-style algebra on fixed operators.
tags:
- act
layer: act
part-of: relational-computer
computer-system-type: primitive
---

To mimic a C*-algebra we combine operator multiplication, adjoints, and spectral
radius.  We package this by letting the star operation witness the spectrum:
`(StarOperation Spectrum)` earns ***StarOperatorStructure***.


{{ act_info(page.meta) }}

{{ act_nav(page.meta) }}
