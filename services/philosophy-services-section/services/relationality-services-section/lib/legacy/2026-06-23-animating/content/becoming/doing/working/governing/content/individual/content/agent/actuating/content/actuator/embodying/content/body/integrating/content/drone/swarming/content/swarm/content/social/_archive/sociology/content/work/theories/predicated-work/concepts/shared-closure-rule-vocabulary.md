---
type: concept
class: collective-substrate-property
depends-on: [operations-settling, closure-rule-system, witness-as-increment, operations-base]
realizes: [general-intellect, immaterial-labor]
see-also: [normative-operational-layering, closure-driven-coordination]
---

# Shared closure-rule vocabulary

The **shared closure-rule vocabulary** is the closure-rule subsystem $\mathcal{S}_{\mathrm{shared}} \subseteq \mathcal{S}_{\mathrm{op}}$ that is accumulated over time from the collective history of past work — rules that emerged from prior task completions, documented procedures, and encoded practices, and have become part of the operational substrate available to all agents.

It is the substrate formalization of two interrelated concepts from the critical theory of work: *general intellect* (Marx: the accumulated social knowledge embedded in the means of production) and *immaterial labor* (Lazzarato/Hardt-Negri: labor whose output is itself knowledge, affect, or structure — including the rules and procedures that future work depends on).

## Definition

$\mathcal{S}_{\mathrm{shared}}$ is the subset of the operations settling's closure-rule system $\mathcal{S}_{\mathrm{op}}$ consisting of rules that:

1. Were *produced by past work* — they entered $\mathcal{S}_{\mathrm{op}}$ as the consequence of prior task completions, finding-events, or adjustment-events, not by external installation.
2. Are *available to all agents* — they fire on cells that any agent in $E_{\mathrm{op}}$ can produce or reference, not only on cells private to a specific agent's local subsystem $\mathcal{S}_{A_i}$.
3. Have *settled into the substrate* — they are not pending or provisional; the cells that record their installation have reached $\mathbf{t}$-valued quiescence.

The accumulation of $\mathcal{S}_{\mathrm{shared}}$ over the settling's history is the substrate's *institutional memory* — the rules the substrate embodies because of how previous work was done.

## General intellect as $\mathcal{S}_{\mathrm{shared}}$

Marx's *Grundrisse* fragment on the "fragment on machines" introduces *general intellect* — the knowledge, science, and technique accumulated in society and crystallized into the means of production.
In the substrate: $\mathcal{S}_{\mathrm{shared}}$ is general intellect.
It is not any individual agent's knowledge; it is the rule structure that the entire operational settling inherits from its history.
Agents who join the settling find $\mathcal{S}_{\mathrm{shared}}$ already operational — they are trained by, and their work is shaped by, rules they did not produce.

The formal relationship: $\mathcal{S}_{\mathrm{op}} = \mathcal{S}_{\mathrm{shared}} \cup \bigcup_{A_i} \mathcal{S}_{A_i} \cup \mathcal{S}_{\mathrm{charter}}$.
The shared vocabulary is the collective-historical stratum; the per-agent subsystems are the individual-practice stratum; the charter subsystem is the normative-governance stratum. $\mathcal{S}_{\mathrm{shared}}$ is the portion of $\mathcal{S}_{\mathrm{op}}$ that belongs to neither individual agents nor the governance apparatus, but to the history of the work itself.

## Immaterial labor as rule-producing work

*Immaterial labor* is work whose output is itself knowledge, procedure, or structure — work that produces rules rather than material goods.
In the substrate: immaterial labor is the work whose [adjustment](../objects/adjustment.md) or [finding](../objects/finding.md) output is a new rule in $\mathcal{S}_{\mathrm{op}}$.

The [witness-as-increment morphism](../morphisms/witness-as-increment.md) tracks evidence production; the accumulation of sufficient evidence about a practice can trigger a rule-installation closure rule that adds a new member to $\mathcal{S}_{\mathrm{shared}}$.
A researcher who documents a new procedure, an agent who encodes a recurring task pattern, a practitioner whose work produces reusable method artifacts — all are performing immaterial labor in this sense: their output joins $\mathcal{S}_{\mathrm{shared}}$.

Formally: immaterial labor is the work whose task-cell-system's target valuation includes a cell of the form $\langle r, \texttt{installed-in}, \mathcal{S}_{\mathrm{op}}\rangle = \mathbf{t}$ for some new rule $r$ — completion of the task installs a new rule.

## Temporal dynamics of $\mathcal{S}_{\mathrm{shared}}$

$\mathcal{S}_{\mathrm{shared}}$ grows monotonically: by settling-monotonicity, rules installed into $\mathcal{S}_{\mathrm{op}}$ are not retracted.
This gives $\mathcal{S}_{\mathrm{shared}}$ the iron-cage property (see [closure-rules-and-the-iron-cage](teaching/explanations/closure-rules-and-the-iron-cage.md)): past work shapes future work permanently.
The shared vocabulary of a mature operational settling reflects every significant past task, encoding the sedimented practices of prior generations of workers.

The capacity for change: structural change to $\mathcal{S}_{\mathrm{shared}}$ (removing an outdated rule) requires a [visible automorphism](../theorems/restructure-as-visible-automorphism.md) — a community-recognized restructuring that explicitly displaces old rules.
This is the substrate's equivalent of institutional reform: not incrementally changing behavior (which cannot retract settled rules) but explicitly restructuring the rule system via a collectively recognized governance act.

## Relation to normative-operational layering

The [normative-operational-layering concept](normative-operational-layering.md) distinguishes the normative substructure (what agents are required and permitted to do) from the operational layer (what agents actually do). $\mathcal{S}_{\mathrm{shared}}$ spans both: some shared vocabulary rules are operational (encoding proven work methods), some are normative (encoding recognized standards), and some are both (encoding practices that have achieved normative standing through their operational history).
The boundary between normative and operational in $\mathcal{S}_{\mathrm{shared}}$ is itself a substrate question — it tracks which cells the rules fire on (task-execution cells vs. governance cells).
