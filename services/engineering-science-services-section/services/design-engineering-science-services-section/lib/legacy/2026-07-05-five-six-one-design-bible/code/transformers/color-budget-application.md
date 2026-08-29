---
type: morphism
class: check
status: current
realizes: [color-budget, hazard-evidence-pair]
depends-on: [alarm-red, witness-blue, ink, bone]
see-also: [color-budget, hazard-evidence-pair]
---

# Color-budget application

Verify a proof's [alarm-red](../objects/alarm-red.md) and [witness-blue](../objects/witness-blue.md) coverage against the [color-budget](teaching/explanations/color-budget.md).
If the proof exceeds the budget, reduce or remove color and re-test.

## Procedure

1. Print or render the artifact at 100 % scale.
2. Compute the trim area in mm² (or px²): width × height.
3. For [alarm-red](../objects/alarm-red.md):
   - Identify every red mark on the page (a word in the slogan, a step numeral, a date, a deadline marker).
   - For each mark, draw the bounding box (smallest axis-aligned rectangle containing the mark).
   - Sum the bounding-box areas.
   - Divide by trim area.
   - If the ratio exceeds **6 %**, reject the proof.
     If unsure, halve and re-measure.
4. For [witness-blue](../objects/witness-blue.md), repeat the procedure.
  If the ratio exceeds **3 %**, reject the proof.
5. [Ink](../objects/ink.md) and [bone](../objects/bone.md) have no caps and need not be measured.

## Why bounding boxes and not pixel-counted area

Bounding boxes are conservative — they over-count the colored area, so a proof that passes by bounding box passes by pixel-count too.
The bounding-box method is also fast: a layout artist can run it with a calculator and a printed proof in two minutes, where pixel-counting would require a script.
The bible's discipline is that color discipline must be *checkable at the layout table*, not only at the press.

## When the budget is exceeded

The fix is to *remove* color, not to reduce its saturation.
Alarm at 50 % saturation is a defect (the [alarm-red](../objects/alarm-red.md) spec admits only one value).
The alarm-rich element is reset to [ink](../objects/ink.md) or its emphasis is carried by weight or position instead.

## Failure modes

- **Alarm bleed in the slogan.** Two alarm words instead of one — see [slogan-setting](slogan-setting.md).
  Reset the second alarm word to ink.
- **Alarm-red used as a fill.** A page header set on an alarm ground over a long-form artifact — alarm coverage explodes.
  Reset the header to [ink](../objects/ink.md) on [bone](../objects/bone.md), or [bone](../objects/bone.md) on [ink](../objects/ink.md) for a dark section.
- **Witness-blue used for body links.** Every link in body copy set in witness — coverage exceeds 3 % within a few paragraphs.
  Reset link styling to [ink](../objects/ink.md) underline, weight 700.

## Check

The proof's alarm bounding-box sum ÷ trim area ≤ 0.06 *and* the witness bounding-box sum ÷ trim area ≤ 0.03.
Both checks must pass before the proof goes to plate.
