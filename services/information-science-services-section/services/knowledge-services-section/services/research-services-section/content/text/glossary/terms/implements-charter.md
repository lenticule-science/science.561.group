---
specialization: part-of
inversion: implemented-by
---

# implements-charter

`implements-charter` names a rule (or other charter-element) as implementing a specific charter. Specialization of `part-of` — every implements-charter claim is also a part-of claim in the parent fiber, with restriction to directive-implementing subjects. Inversion populates `implemented-by` at the charter subject so walking the charter's fiber returns the rules (and other elements) that implement it, without anyone authoring the reverse claim by hand.

A future fusion function — not yet written — is expected to combine `implements-charter` with `specialization: rule` (or specialization to another directive type) into a witness that traces "this rule implements this charter" as a single chartered-element record. The exact witness shape is a design decision pending a concrete use.
