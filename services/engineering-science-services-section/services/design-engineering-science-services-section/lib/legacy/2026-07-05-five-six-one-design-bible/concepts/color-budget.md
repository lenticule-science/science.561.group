---
type: concept
class: discipline
realizes: [felt-weight, peripheral-uptake]
instantiates: [closed-palette, salience-scarcity]
depends-on: [hazard-evidence-pair]
see-also: [hazard-evidence-pair, refusal-as-design-method]
---

# Color budget

Color in the bible is *rationed*, not styled.
Each functional color carries a maximum coverage stated as a percentage of the artifact's inked area; if the proof exceeds the budget, the color is reduced or removed.

Per page or per spread:

| Color                                 | Max coverage     | How to measure                                                              |
|---------------------------------------|------------------|-----------------------------------------------------------------------------|
| [alarm-red](../objects/alarm-red.md)  | ≤ 6 % inked area | Sum the bounding boxes of red marks; divide by trim area. If unsure, halve. |
| [witness-blue](../objects/witness-blue.md) | ≤ 3 % inked area | Same method. Captions and callouts only.                                |
| [ink](../objects/ink.md)              | no cap           | —                                                                           |
| [bone](../objects/bone.md)            | no cap (paper)   | Paper is the ground, not an ink.                                            |

The reason for the budget — and not a "use sparingly" prose hedge — is that *style guidance without measurement is unenforceable at proof time*.
A percentage is a check the layout artist or the editor can run with a calculator and a ruler before sending to plate.
The bible's [refusal-as-design-method](refusal-as-design-method.md) discipline requires every constraint be checkable.

The functional color pair (red and blue) carries two specific jobs given by [hazard-evidence-pair](hazard-evidence-pair.md): red flags hazard or urgency; blue flags evidence.
The structural color pair (ink and bone) is uncapped because ink and bone *are* the artifact's material — bone is the paper, ink is the mark.
Tinting either, or introducing a third neutral or a gray, is forbidden.
If recessive type is needed, use ink at 60 % (token `--ink-soft`); once.

Color budget is applied via the [color-budget-application morphism](../morphisms/color-budget-application.md).
The budget realizes the parent term [felt weight](../../../terms/felt-weight.md): functional color, used at a tiny fraction of the inked area, carries enormous attentional weight precisely because it is rare.
