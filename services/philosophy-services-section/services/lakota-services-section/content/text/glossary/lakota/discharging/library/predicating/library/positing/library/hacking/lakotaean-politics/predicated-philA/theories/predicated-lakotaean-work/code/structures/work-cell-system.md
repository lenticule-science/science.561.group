---
type: definition
class: predication-sub-cell-system
status: draft
symbol: "(\\Phi_\\mathrm{lak}^\\mathrm{work},\\, \\Pi_\\mathrm{lak}^\\mathrm{work},\\, w_\\mathrm{lak})"
depends-on:
  - polity-cell-system
  - wolakhota-closure-system
realizes: [task-cell-system]
title: Work-cell-system
description: The work-cell-system is the sub-cell-system of $\Phi\mathrm{lak}$ on which the polity's operational-substrate fires.
---

# Work-cell-system

The work-cell-system is the sub-cell-system of $\Phi_\mathrm{lak}$ on which the polity's operational-substrate fires.
It is the Lakota analog of the predicated-work [task-cell-system](../../../../../../../../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md), but the work-cells are *not* organized around generic tasks: they are organized by work-class through the predicate-class structure of $\Pi_\mathrm{lak}$.

## The cell-set

$$\Phi_\mathrm{lak}^\mathrm{work} := E_\mathrm{lak} \times \Pi_\mathrm{lak}^\mathrm{work} \times E_\mathrm{lak}$$

where $\Pi_\mathrm{lak}^\mathrm{work}$ is the *work-predicate sub-set* — those predicates in $\Pi_\mathrm{lak}$ that participate in work-cell-firing.
The sub-set is the disjoint union of five work-class predicate-sub-classes:

$$\Pi_\mathrm{lak}^\mathrm{work} = \Pi^\mathrm{wówašake} \sqcup \Pi^\mathrm{wakȟáŋ\text{-}w} \sqcup \Pi^\mathrm{wótakuye\text{-}w} \sqcup \Pi^\mathrm{káğapi} \sqcup \Pi^\mathrm{wahúŋkpa}$$

The five sub-classes:

- **$\Pi^\mathrm{wówašake}$** — physical-skill predicates: *hunts*, *butchers*, *tans-hide-of*, *fights-in-zuya*, *rides*, *cares-for-horse*, *cuts-tipi-pole*, *constructs-tipi-frame*.
- **$\Pi^\mathrm{wakȟáŋ\text{-}w}$** — wakȟáŋ-bearing work-predicates: *makes-pipe*, *keeps-bundle*, *conducts-rite*, *heals*, *interprets-vision*, *names-child*.
  All cells in this sub-class are wakȟáŋ-marked by default; non-wakȟáŋ-marked firing in these predicates is a substrate-anomaly.
- **$\Pi^\mathrm{wótakuye\text{-}w}$** — kin-care work-predicates: *raises-child*, *cares-for-elder*, *cares-for-sick*, *prepares-food-for*, *feeds*, *teaches-language-to*, *sings-to-baby*, *grieves-with*.
- **$\Pi^\mathrm{káğapi}$** — making-predicates: *quills*, *beads*, *tans-and-finishes-hide*, *sews-clothes*, *makes-moccasins*, *makes-weapon*, *makes-cradleboard*, *makes-regalia*, *paints-tipi*.
- **$\Pi^\mathrm{wahúŋkpa}$** — collective-coordination predicates: *participates-in-camp-circle*, *coordinates-hunt*, *prepares-sun-dance*, *participates-in-migration*, *participates-in-giveaway*.

## Cells

A work-cell $\phi^w = (a, p, b)$ has:

- $a \in E^\mathrm{hum}_\mathrm{lak}$ — the agent doing the work.
- $p \in \Pi_\mathrm{lak}^\mathrm{work}$ — the work-predicate.
- $b$ — the *object* of the work: another agent (for wótakuye-cells, e.g., the child being raised); an entity (for wówašake-cells, e.g., the buffalo being hunted); an artifact (for káğapi-cells, e.g., the regalia being made); a collective-cell (for wahúŋkpa-cells, e.g., the camp-circle being formed); or a wakȟáŋ-bearing entity (for wakȟáŋ-w-cells, e.g., the bundle being kept).

The cell value $v(p)(a, b) \in \mathbf{FOUR}$ records the work-state on that cell: - $\bot$: no work yet on this cell. - $\mathbf{t}$: work is being done / has been done well. - $\mathbf{f}$: work has been refused or done badly. - $\top$: contested — multiple parties disagree on whether the work was done or done well.

## Gender-conditioning on rule-firing

Many rules in $\mathcal{S}_\mathrm{wolak}$ that operate on work-cells condition on the agent's gender-cell.
The substrate-content:

$$\langle a, \texttt{gender-class}, g\rangle \geq_k \mathbf{t} \;\wedge\; \langle a, p, b\rangle \;\Longrightarrow\; \cdots$$

where the consequent fires only for certain $(g, p)$ pairs.
For example, the rule installing *standing-as-good-tanner* on a tanning-cell-firing is gender-conditioned (historically, tanning is women's work in the wówašake/káğapi crossover; a male tanner is *not* substrate-prohibited but is unusual).

The gender-conditioning is *complementary*: for each work-class, *each gender has a primary set of predicates* and a *secondary set*.
The structural arrangement is that no work-class is monopolized by one gender, but each work-class has gender-typical primary firing.
The wíŋkte gender-position has its own primary predicates (especially in $\Pi^\mathrm{wakȟáŋ\text{-}w}$: name-giving, certain healing roles).

## The owes-cells: where work originates

Work-cells fire because the substrate has installed *owes-cells* on the agent.
The (W3) kin-obligation rule of $\mathcal{S}_\mathrm{wolak}$:

$$\langle a, \texttt{kin-of}, b\rangle \geq_k \mathbf{t} \;\Longrightarrow\; \langle a, \texttt{owes-virtue-to}, b\rangle \geq_k \mathbf{t}$$

installs *owes-virtue-to* cells on every kin-pair.
These are the *origination-cells* of work: a kin-pair generates ongoing-obligation cells that the agent's wótakuye-w-work, wówašake-w-work (sometimes), and wakȟáŋ-w-work (sometimes) discharge.

The work-cell *discharges* an owes-cell when firing.
The owes-cell pattern:

- Before work: $\langle a, \texttt{owes-virtue-to}, b\rangle = \mathbf{t}$ — the obligation is in force.
- During work: the work-cell fires at $\mathbf{t}$ — wótakuye-cell *raises-child*(a, b), or wówašake-cell *hunts-for*(a, b's-tiyóšpaye), etc.
- After work: the owes-cell drops to $\bot$ for that specific instance; new instances install new owes-cells.
  The obligation is *continuing*; specific discharges accumulate the agent's wówačhantognaka-standing.

This is the substrate-content of "Lakota work is not dispatched; it flows from kin-obligation."
There is *no* dispatch-cell that fires before work; the owes-cell *is* the work-origination, and the kin-relation is the owes-cell's source.

## Comparison to predicated-work's task-cell-system

The predicated-work [task-cell-system](../../../../../../../../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md) is a generic cell-system over an *operations-base* of generic tasks.
Tasks are the primary entities; agents are assigned to tasks; capability-cells determine which agents can be assigned.
The structural-shape:

- Task entity → has properties (skills-needed, deadline, dependencies) → agent-assignment-cells → completion-cells.

The Lakota work-cell-system is structurally different:

- *Agent-position* (kin and gender) → owes-cells (W3-installed) → work-cells (fired on discharge) → standing-cells (W2-evaluated).

In the Western form, the *task* is the primary entity and the agent is assigned to it.
In the Lakota form, the *agent's kin-position* is the primary entity and the work flows from it.
The two systems answer "who does what" through different morphism-chains.

Both can be re-expressed in the other's vocabulary at the cost of unnatural mapping: a Lakota work-cell can be re-described as "agent a is assigned to the task of caring for b" but the assignment-cell is not in $\mathcal{S}_\mathrm{wolak}$'s firing-scope (no one assigned it; the kin-relation installed it).
A Western task can be re-described as "agent has obligation to discharge" but the obligation typically comes from contract or employment, not from kin.

The substrate-algebraic distinction is *which closure-rule subsystem fires on the work-cells*.
For predicated-work: a $\mathcal{S}_\mathrm{dispatch}$ subsystem that fires assignment-cells from authority-cells.
For predicated-lakotaean-work: the (W3) kin-obligation rule-class of $\mathcal{S}_\mathrm{wolak}$ that fires owes-cells from kin-cells.

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — work as kinship-embedded.
- Marla N.
  Powers, *Oglala Women* (1986) — women's work and gender-conditioning.
- Beatrice Medicine, *Learning to Be an Anthropologist* (2001) — work-positions in Lakota life.
- Walker 1982, *Lakota Society* — pre-reservation work-division.
- Lance Morgan and Bonnie M.
  Sands, *Indigenous Knowledge in the Wild* (forthcoming/contemporary) — wíŋkte position-work in contemporary practice.
