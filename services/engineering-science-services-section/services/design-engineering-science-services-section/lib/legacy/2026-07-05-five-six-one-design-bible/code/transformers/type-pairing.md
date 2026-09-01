---
type: morphism
class: assignment
status: current
realizes: [type-as-mass, type-scale]
depends-on: [type-stack, type-scale]
see-also: [slogan-setting, caption-setting]
---

# Type pairing

Assign each text run in an artifact to one of the three [type-stack](../objects/type-stack.md) families and to one of the nine [type-scale](teaching/explanations/type-scale.md) tokens.
The morphism is a discrete assignment, not a free choice.

## Procedure

1. Inventory the text runs in the artifact.
  Each run has a *role* (display title, section head, lede, body, sidebar, list item, caption, folio, table header, eyebrow, slogan, mark).
2. Map each role to a family by the table below.
3. Map each role to a [type-scale](teaching/explanations/type-scale.md) token by the same table.
4. Set each run at the family + size + leading + tracking specified by the token.

| Role                | Family                                          | Token        |
|---------------------|-------------------------------------------------|--------------|
| Mark                | [Space Grotesk 700](../objects/type-stack.md)   | (per [mark](../objects/five-six-one-mark.md) spec) |
| Slogan              | [Space Grotesk 700](../objects/type-stack.md)   | D1 (or D2 small) |
| Section head        | [Space Grotesk 700](../objects/type-stack.md)   | D2           |
| Poster title, sub-head | [Space Grotesk 700](../objects/type-stack.md) | D3           |
| Card title, eyebrow head | [Space Grotesk 700](../objects/type-stack.md) | D4           |
| Lede (opening paragraph) | [Roboto Slab 400](../objects/type-stack.md) | L1           |
| Body                | [Roboto Slab 400](../objects/type-stack.md)     | B1           |
| Sidebar, list item  | [Roboto Slab 400](../objects/type-stack.md)     | B2           |
| Body emphasis       | [Roboto Slab 400 italic](../objects/type-stack.md) | (inline; sparingly) |
| Caption, FIG label  | [JetBrains Mono 500](../objects/type-stack.md)  | M1           |
| Folio, table header, eyebrow | [JetBrains Mono 500 caps](../objects/type-stack.md) | M2 |

## Operative rules

1. **Never mix weights within a family on the same line.** A bold word in the middle of a B1 sentence is a smell; use the slab's italic for emphasis instead.
2. **Hyphenation off in display, on in body for justified columns only.** Display sizes that hyphenate read as fragments.
3. **No first-line indent.** Paragraphs are separated by 14 px (one space-step) or by an em-rule.
4. **Numerals in body: tabular figures, lining (not old-style).** The slab's tabular numerals are required for any number that may be compared against another (dates, quantities, percentages).
5. **Optical kerning on for display, metric for body and meta.** Display sizes need optical correction; body and meta do not.

## Failure modes

- **Lede set in the body token.** The opening paragraph is set at B1 instead of L1, and the section opens without a felt lift.
  Fix: set the first paragraph at L1 (22 px / 14 pt, leading 1.4).
- **Caption set in the body family.** A figure label set in slab instead of mono — captions then fail to scan as a separate register.
  Fix: reset to JetBrains Mono M1.
- **Section head set at D3 instead of D2.** The section opens without enough mass and reads as a sub-section.
  Fix: reset to D2 (76 px / 54 pt).
- **Body in a humanist serif.** The page reads as editorial, which is the wrong register.
  Reset to Roboto Slab.
- **Display hyphenated.** Display lines breaking mid-word.
  Turn hyphenation off in display.
