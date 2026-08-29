---
type: morphism
class: substitution
status: current
realizes: [voice-as-specificity, the-three-rules]
depends-on: []
see-also: [voice-as-specificity, the-three-rules, no-philanthropic-visual-language]
---

# Voice substitution

Replace nonprofit phrases with specific concrete substitutes at the proof reading.
The morphism is run on the artifact's body copy and on its display copy alike.

## Canonical pairs

| Don't                              | Instead                                  |
|------------------------------------|------------------------------------------|
| empowering communities             | name who, doing what                     |
| our impact this year               | a number, a date, a place                |
| stakeholders, beneficiaries        | people. by name when you can.            |
| we are committed to                | we did. we will. we won't.               |
| solutions, ecosystems, journeys    | use the actual word                      |

These are the bible's seed pairs.
Add to the table when a new phrase has been caught in proof twice; the [bible-as-living-document](teaching/explanations/bible-as-living-document.md) discipline requires that the table grows from observed drift, not from speculation.

## Procedure

1. Read every line of body and display copy.
2. For every line, ask: does this line make a specific claim — a name, a number, a date, a place, a verb attached to a subject — or does it gesture at a feeling?
3. If the line gestures at a feeling, find the underlying claim and substitute.
  If the underlying claim is not yet known, leave the slot empty rather than fill it with mood.
4. Re-read after substitution.
  The substituted line should be *shorter* and *more specific* than the original.

## The three rules at proof time

The three rules of [voice-as-specificity](teaching/explanations/voice-as-specificity.md) are operationalized here.

- **Be specific.** "Three acres" replaces "our region."
  A name replaces "kin."
  A date replaces "soon."
- **Use verbs.** "We grow" replaces "we are growers."
  "We did.
  We will.
  We won't." replaces "we are committed to."
- **Refuse the philanthropic register.** No *impact*, no *mission*, no *stakeholders*, no *community*.

## Empty slots

When the underlying claim is not yet known, the bible's discipline is to *leave the slot empty* — set the line as `[name pending]` or `[date pending]` and ship the artifact only when the slot fills.
A sentence padded with mood to fill an empty slot is a defect that survives every subsequent edit cycle.

## Visual reinforcement

The [strikethrough display](../objects/alarm-red.md) the bible uses in § 06 ("DON'T `empowering communities`" with the don't phrase struck through in alarm) is the visual analogue of this morphism.
The strike is set in [alarm-red](../objects/alarm-red.md), text-decoration thickness 2 px.
The "INSTEAD" column is set in [Roboto Slab 700](../objects/type-stack.md) at the same size.
See § 06 of the [source bible](../tools/bible-source/index.html).

## Check

After substitution, every line should:

- Be set in [Roboto Slab](../objects/type-stack.md) at B1 or larger.
- Carry at least one verb, one specific noun, and (where appropriate) at least one number, name, or date.
- Read shorter than the original.
- Not contain *impact*, *mission*, *stakeholder*, *community*, *empower*, *commit*, *solution*, *ecosystem*, *journey*.
