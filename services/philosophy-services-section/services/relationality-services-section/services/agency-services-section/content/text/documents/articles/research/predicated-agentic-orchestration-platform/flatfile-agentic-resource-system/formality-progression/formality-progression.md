---
name: formality-progression
description: "The discipline that substrate work moves from low formality to high formality over time, and that this movement IS the substrate's settlement path applied to itself."
type: concept
class: framing
depends-on: [office-as-fuzzy-cell, settling-as-computation, fiber, closure-rule-record]
see-also: [office-record, skill-record, runbook-record]
title: formality-progression
---

# Formality progression

The discipline that *substrate work moves from low formality to high formality over time*, and that this movement IS the substrate's settlement path applied to itself.
FARS commits to a four-level formality scale (F0–F3) and to the discipline that the substrate's content, including the substrate's own offices and skills, progresses up the scale as agents do work and as closure rules fire.

The four levels:

- **F0 — implicit.** Knowledge that exists but isn't expressed at all.
  The agent or the substrate "knows" something only in the sense that it acts in a way consistent with the knowledge; nothing in substrate content captures it.
  F0 is the unsettled limit; it produces the most uncertainty per substrate-operation and (under the cost-settlement-path framing of [interfacers](../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/interfacer.md)) the highest LLM cost.
- **F1 — narrative.** Knowledge expressed as prose.
  A note's body explains the knowledge; the substrate's interpretation rules don't yet extract structured predicates from it.
  F1 content is human-readable and partially LLM-parseable; agents reading F1 content do so by language-model summarization, with characteristic cost.
- **F2 — structured.** Knowledge expressed as structured predicates.
  Frontmatter keys with controlled-vocabulary values; checklists with named items; tables with typed columns.
  F2 content is mechanically parseable and supports both LLM and deterministic operators; agents reading F2 content do so with mid-tier model cost or deterministic computation.
- **F3 — algebraic.** Knowledge expressed as predicates with bilattice-valued cells and closure rules connecting them.
  F3 content is the substrate's algebra acting on itself: predicates compose under [`compose`](../../../../../../../../../../../../content/text/glossary/terms/compose.md) and [`restrict`](../code/transformers/restrict.md); rules fire under [`settle`](../code/transformers/settle.md); the substrate's behavior is determined without LLM invocation.
  F3 content runs at $0 LLM cost.

## Sharpening as the settlement path

Work moves up the scale through *sharpening* — the substrate-level operation of replacing lower-formality content with higher-formality content.
The discipline holds that sharpening IS the settlement path: a piece of content reaches F3 when no further closure rule applies to it, when all its component predicates are typed and value-domain-bounded, and when downstream operators can act on it without LLM invocation.

The progression at each step:

- **F0 → F1.** Express the implicit as prose.
  An agent observes a pattern that previously was just "how things work"; the agent writes a note describing the pattern.
  The pattern is now substrate-visible.
- **F1 → F2.** Replace prose with structured predicates.
  A checklist that was prose paragraphs becomes frontmatter keys with controlled values.
  The substrate's interpretation rules now extract the predicates; downstream operators read the structure, not the prose.
- **F2 → F3.** Replace structured predicates with closure rules.
  A check that was "look at the structured predicate X and decide" becomes a closure rule whose premise matches X and whose conclusion fires the decision.
  The substrate's algebra now performs the check; the agent's role narrows.

At F3, an office (or a skill, or a runbook) can be *demoted to a deterministic tool*: the substrate-level closure rules carry all its behavior, and the realization can implement the office as code that runs at $0 LLM cost per invocation.

## What progresses and what doesn't

- **Operational content (offices, skills, runbooks, dispatch rules).** SHALL progress over time.
  An office at F1 is a candidate for sharpening; after enough operational use, the patterns it follows become structured (F2), then algebraic (F3).
  The substrate tracks formality-progression on operational entities.
- **Domain content (research notes, analyses, narratives).** Need not progress uniformly.
  A research narrative at F1 is *intentionally* prose; sharpening it to F3 would lose content that's load-bearing in narrative form.
  The discipline is per-entity, not substrate-wide.
- **Identity-bearing content (personnel records, mission statements, charter).** Typically remains at F1–F2.
  The substrate's coherence does not depend on these reaching F3; they are the *expressive content* the algebra serves, not the algebra itself.

## What formality progression is not

- **Not "more formal is better."** A research narrative at F3 (an algebraic specification of a research finding) and at F1 (a prose explanation) serve different audiences and different purposes.
  The discipline is *not* that everything wants to be F3; the discipline is that *operational* content benefits from progression because it lowers cost and increases substrate-determinism.
- **Not LLM-elimination.** F3 content runs at $0 LLM cost; the substrate's overall LLM budget shrinks as operational content sharpens.
  But novel research, ambiguous queries, narrative synthesis remain LLM-cost work.
  The substrate is mixed-formality permanently.
- **Not version-numbering.** Formality is per-component, not per-entity-overall.
  An office's *constructors* (skill list) may be F3 while its *site* (action domain prose) is still F1.
  The substrate's view of an entity is a fiber whose cells can have varying formality.

## Composition with the substrate's cost path

The cost-settlement-path framing from the [interfacers](../../../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/interfacer.md) analysis pairs with the formality scale:

| Formality | Cost surface | Mechanism |
|---|---|---|
| F0 (implicit) | Heaviest LLM (~$0.10 per call) | Frontier model reads context, produces output |
| F1 (narrative) | Medium LLM (~$0.03 per call) | Smaller model reads narrative, produces structured output |
| F2 (structured) | Tiny ($0–\$0.01 per call) | Deterministic tool computes; LLM formats |
| F3 (algebraic) | $0 per call | Substrate's algebra; no LLM in path |

A FARS realization's *operating cost over time* is determined by how much of its operational content has reached F3.
Realizations that maintain F0/F1 content for operational concerns have higher per-tick cost; realizations that sharpen aggressively reach a regime where the substrate runs deterministically.

## Position

Formality progression is the framing under which FARS's operational content has *direction* — toward higher formality, lower cost, more substrate-determinism.
The framing depends on [office-as-fuzzy-cell](../office-as-fuzzy-cell/office-as-fuzzy-cell.md) (which gives the per-component formality view) and on [settling-as-computation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settling-as-computation.md) (which says progression IS settlement).
It informs every operational entity record's *formality predicates* — fields each entity declares about its own components' formality levels.
