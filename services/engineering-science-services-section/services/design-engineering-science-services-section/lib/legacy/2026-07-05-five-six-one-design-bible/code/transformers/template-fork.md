---
type: morphism
class: governance
status: current
realizes: [template-as-floor, bible-as-living-document]
depends-on: []
see-also: [template-as-floor, bible-as-living-document]
---

# Template fork

Copy a [template](../examples/), modify it, and (only after the council has approved a third use) propose a § 08.
N entry.
The morphism is how the bible's template inventory grows.

## When to fork

When the artifact you are making does not match any of the bible's existing templates ([slogan-poster](../examples/slogan-poster.md), [assembly-call](../examples/assembly-call.md), [numeral-banner](../examples/numeral-banner.md), [field-instruction-pamphlet](../examples/field-instruction-pamphlet.md), [web-static-site](../examples/web-static-site.md)) and the artifact form is one you expect to make again.

A one-off variant is *not* a candidate for a fork.
A template is a form the bible has watched survive three independent uses.
The discipline is what keeps the inventory honest — see [template-as-floor](teaching/explanations/template-as-floor.md).

## Procedure

1. **Copy the closest existing template.** Identify which of the five existing templates is closest to the artifact you are making.
  Copy its source file as the starting point.
2. **Modify what the artifact requires.** Change trim, fold, ink count, column count, type-scale tokens — whatever the artifact requires.
  Do not change the [grid](teaching/explanations/grid-system.md) discipline, the [color budget](teaching/explanations/color-budget.md), the [type stack](../objects/type-stack.md), or the [refusals](../theorems/) — these are bible-level invariants, not template-level choices.
3. **Document the fork in the artifact's [colophon](../objects/colophon-stamp.md).** Note: forked from § 08.
  N, modifications made.
4. **Hold the fork.** Do not propose the fork as a new § 08.
  N entry.
  The fork lives in the artifact's repository, not in the bible.
5. **Use the fork twice more on independent artifacts.** Each use must be on an artifact addressing a different occasion or audience; three uses for the same recurring artifact (e.g., a series of three pamphlets in the same series) does not count.
6. **Propose to the council.** After the third use, propose a § 08.
  N entry.
  The proposal includes the three artifact instances, the fork's spec table, the fork's checks, and a brief argument for why the form is durable.
7. **The council approves or rejects.** If approved, the fork is promoted to § 08.
  N (the next available number) and the corresponding [example file](../examples/) is added to this corpus.

## Bible invariants the fork cannot change

- The [grid system](teaching/explanations/grid-system.md) (12-col web, 14-col print).
- The [type stack](../objects/type-stack.md) (Space Grotesk, Roboto Slab, JetBrains Mono).
- The [type scale](teaching/explanations/type-scale.md)'s nine tokens.
- The [color budget](teaching/explanations/color-budget.md) (≤ 6 % alarm, ≤ 3 % witness).
- The [seven refusals](../theorems/) of § 09.
- The [primary mark](../objects/five-six-one-mark.md)'s clearspace, geometry, and minimum sizes.
- The [slogan](teaching/explanations/slogan-as-argument.md)'s word order, set rules, and forbidden variants.

A fork that violates any of these invariants is a malformed fork; reset to the bible's invariants and re-propose.

## Failure modes

- **Forking too early.** A template is proposed after one use.
  Hold; the form has not yet demonstrated durability.
- **Forking the invariants.** A template proposes a new color outside the four system inks, or a new type family.
  Reset.
- **Forking for series, not for form.** Three pamphlets in the same series propose a new pamphlet template.
  The form is the same as the existing [field-instruction-pamphlet](../examples/field-instruction-pamphlet.md); no new template is needed.
