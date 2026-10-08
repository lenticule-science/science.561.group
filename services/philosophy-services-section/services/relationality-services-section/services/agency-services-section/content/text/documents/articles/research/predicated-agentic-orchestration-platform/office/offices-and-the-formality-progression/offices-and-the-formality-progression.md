---
type: narrative
status: current
recaps: [office, formality-layer, settlement-path, authorization]
introduces: []
title: Offices, fuzzy cells, and the formality progression
description: "An office on the substrate looks at first glance like a role specification: a named agent with a job description, a list of duties, an authority statement."
---

# Offices, fuzzy cells, and the formality progression

An office on the substrate looks at first glance like a role specification: a named agent with a job description, a list of duties, an authority statement.
Read structurally, this is a category of entity — and the substrate has a position on category-shaped entities (per [dispatch from properties](../../dispatch/dispatch-from-properties/dispatch-from-properties.md)).
What makes an office not-just-a-category is that its content has *the shape of a fuzzy cell*: a set of predications carrying both algebraic content (what tools the office can invoke, what scope it operates in, what predicates it admits) and prose content (what judgment the office is expected to exercise, what its purpose is, what edge cases it should escalate).
The cell is fuzzy because its content is partial, partly settled, partly still expressed in prose that a human reader can interpret but a closure rule cannot.

The fuzzy-cell shape is not a deficiency.
It is the engineering acknowledgment that real offices — the human positions that organizational charts have been describing for centuries — carry a mix of structural authority and judgment.
A planning office has procedures (structural) but also exercises taste (judgmental).
A research office has methods (structural) but also chooses what to study (judgmental).
A reviewing office has checks (structural) but also weighs trade-offs (judgmental).
Forcing all of this content into algebraic predications at office-creation time would produce thin, brittle offices that miss what the office is actually for.
The substrate's response is to admit prose content and treat it as an explicit *formality state* — partly settled, settling further over time.

The settlement target is the [formality-layer](../../scope/formality-layer/formality-layer.md) discipline.
Office content has a formality dimension along which it can mature:

- **F0 (implicit)** — content the office's behavior depends on but that has not been written down.
  The office "knows" how to do the thing because the human or model carrying the office knows; the substrate does not.
- **F1 (narrative)** — prose descriptions of duties, mandates, escalation rules.
  The substrate carries the prose but cannot reason about it; a human or a frontier model interprets the prose at invocation time.
- **F2 (structured)** — checklists, decision trees, named procedures with named steps.
  The substrate can match against the structure (can I invoke step 3? what does step 5 require?), but the steps' content is still prose.
- **F3 (algebraic)** — closure-rule applications, graph queries, deterministic checks.
  The substrate's algebra evaluates the content directly; no inference is required.

An office settled at F3 is an office the substrate can invoke as a deterministic operation.
An office settled at F1 is an office that needs a frontier model to interpret.
The cost-per-invocation gap between these is large — large enough that the substrate's overall cost behavior is dominated by where its offices sit on this scale.

*Sharpening* is the substrate operation that moves office content from a lower formality layer to a higher one.
F1 → F2 turns prose duties into structured checklists.
F2 → F3 turns structured checklists into deterministic checks.
At F3, a piece of office content can be demoted to a tool — the office is no longer required to perform the operation; the substrate's algebra handles it.
Per the [settlement-path](../teaching/explanations/settlement-path.md), sharpening is the maturation arc applied to office content specifically: an observation about how the office handled a case becomes an instinct about when that handling applies, becomes a procedure-bearing skill, becomes a deterministic tool.
Each step is substrate content; each step lowers the cost of the next invocation.

Several engineering consequences follow from treating offices as fuzzy cells with formality progression:

- **Office quality is measurable.** An office's *formality distribution* — what proportion of its content is at each layer — is a substrate-readable signal.
  An office with mostly F1 content is doing high-cost work; an office with mostly F3 content is doing low-cost work.
  The substrate can rank offices by formality distribution and direct sharpening attention to the offices that would benefit most.
- **Sharpening is the office's settlement.** When office work is invoked, the resulting [witnesses](../../../teaching/explanations/witness.md) record what the office did.
  Repeated patterns in the witnesses are candidate sharpening targets: a prose duty that has been invoked the same way for a year is ready to be structured into a checklist; a checklist that has been completed identically across many invocations is ready to be reduced to a deterministic check.
  The platform's progressive automation is precisely this sharpening, applied at office scale.
- **Offices have authority and identity, not just procedure.** Per [authorization](../../governance/authorization/authorization.md), an office carries a Hohfeldian deontic profile — powers (what it can command), duties (what it must do), privileges (what it may do without asking), immunities (what it cannot be forced to do).
  These are predications on the office entity, composing with the personnel entity that holds the office.
  Formality applies to authority as much as to procedure: a duty stated as prose is F1 authority, a duty enforced by a substrate constraint is F3 authority.
  Sharpening applies in both directions.
- **Offices and personnel compose additively.** When a person holds an office, the effective capability is the join of the office's defaults and the person's individual predications.
  This is the same composition that adjacent multi-actor systems converge on: a player's effective abilities are guild defaults plus character-specific abilities, additively composed.
  The substrate's join operator handles this directly; there is no separate authorization machinery.
- **Some content is irreducibly fuzzy.** Not every office's content can be sharpened to F3.
  An office whose work is fundamentally judgmental — a research synthesis, a strategic decision, a triage classification of unstructured incoming content — has F1 content that resists sharpening because the work itself is not algebraic.
  The substrate's discipline is to recognize this honestly: irreducibly fuzzy content stays at F1, and the office accepts the higher cost-per-invocation as the real engineering cost of the work it does.
  Sharpening is a tool, not a mandate.
- **Off-fitting offices surface as vocabulary debt.** When an office's procedures cannot be expressed in the substrate's available vocabulary, the office's content stays at F1 not because the work is judgmental but because the *predicates needed to structure it have not been declared*.
  Per [vocabulary-completeness](../../../teaching/explanations/vocabulary-completeness.md), this is vocabulary debt: the substrate is signaling that the relevant scope's vocabulary is incomplete.
  The engineering response is to declare the missing predicates, which then admits structuring the office's content at F2 or F3.

Software prior art that handles organizational structure well makes the same architectural moves the substrate makes here.
Multi-actor simulation games where positions in a hierarchy carry mandates and demands that affect downstream entities — the position is a property-bearing entity, not a label.
Multiplayer text-based worlds where guild membership confers default abilities that are then specialized by individual character development — additive composition.
Workplace simulation games where work assignments compute from per-actor priority and currently-active skills — dispatch from properties.
Each of these confirms the substrate's commitments at its specific layer.
The substrate's contribution is making the same commitments uniformly across the entire platform, so that office content, personnel content, work content, and substrate content all participate in one algebra.

The discipline's hard edge is the refusal to *bypass* the formality stack.
An engineer who codes an office's behavior directly into the runtime — hardcoded checks, magic-number thresholds, special-case dispatch — has produced an office whose content is *inaccessible to the substrate*.
The substrate cannot reason about the office, cannot witness its work properly, cannot sharpen its content over time.
The engineering cost of bypass is structural: the runtime accumulates office logic the substrate cannot see, and the platform's improvability is bounded by that accumulated runtime.

The pattern composes with [governance](../teaching/explanations/governance.md) (governance decisions are office-content edits, witnessed and auditable), with [federation](../teaching/explanations/federation.md) (offices that span federated substrates carry their authority predications across, with bridges translating where vocabularies differ), and with [agential-self-generation](../../agent/agential-self-generation/agential-self-generation.md) (an office that audits offices is an office; sharpening applied to the auditor sharpens the platform's self-improvement capacity).
None of these requires additional infrastructure; each is the same substrate composition discipline applied at a different boundary.
