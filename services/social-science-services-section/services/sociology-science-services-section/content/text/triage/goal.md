---

title: "Goal"
description: "A directional ambition that orients work without being reducible to a single decidable target. Goals specify what success looks like in broad terms; objectives, projects, and plans translate that direction into decidable and actionable structure."
defines: goal
aliases: [goals]
related: [objective, project, plan, endeavor, campaign, milestone, horizon]
contrasts-with: [objective, task, mission, vision]
instance-of: work
traditions: [locke-latham-goal-setting, bratman-planning, carver-scheier-control-theory, macintyre-practice]
served-by: [objective, project, plan]
has: [direction, temporal-kind, owning-agent, success-conditions]
date-created: 2026-04-11
references:
  - id: locke1990
    type: document
    title: A Theory of Goal Setting and Task Performance
    author:
      - literal: E. A. Locke
      - literal: G. P. Latham
    container-title: Prentice Hall
    issued:
      - year: 1990
  - id: locke2002
    type: document
    title: Building a Practically Useful Theory of Goal Setting and Task Motivation: A 35-Year Odyssey
    author:
      - literal: E. A. Locke
      - literal: G. P. Latham
    container-title: American Psychologist, 57(9), 705-717
    issued:
      - year: 2002
  - id: miller1960
    type: document
    title: Plans and the Structure of Behavior
    author:
      - literal: George A. Miller
      - literal: Eugene Galanter
      - literal: Karl H. Pribram
    container-title: Holt, Rinehart and Winston
    issued:
      - year: 1960
  - id: carver1998
    type: document
    title: On the Self-Regulation of Behavior
    author:
      - literal: Charles S. Carver
      - literal: Michael F. Scheier
    container-title: Cambridge University Press
    issued:
      - year: 1998
  - id: bratman1987
    type: document
    title: Intention, Plans, and Practical Reason
    author:
      - literal: Michael E. Bratman
    container-title: Harvard University Press
    issued:
      - year: 1987
  - id: macintyre1981
    type: document
    title: After Virtue: A Study in Moral Theory
    author:
      - literal: Alasdair MacIntyre
    container-title: University of Notre Dame Press
    issued:
      - year: 1981
---

A goal is a directional ambition that orients work without being reducible to a single decidable target. It names what success looks like in broad terms and supplies the orientation that [objectives](./objective.md), [projects](./project.md), and [plans](./plan.md) translate into decidable and actionable structure. "Modernize the records management system," "pursue justice," "build a team that can sustain this work after us" — each names a direction that organizes effort but is not itself a yes/no question.

## What makes something a goal

Four properties distinguish a goal from the work-items that serve it:

1. **Direction, not target.** A goal specifies an orientation. It answers "toward what?" rather than "how far by when?" The answer to "how far by when?" is the work of an [objective](./objective.md). A goal without decidable objectives is still a goal; it is simply not yet operationalized. An objective without a goal is a task with no direction.

2. **Ambitional weight.** A goal is what an agent or ship is actually trying to bring about. It carries normative weight: abandoning it is not a scheduling choice but a revision of what the agent is committed to. This is what distinguishes a goal from a preference or a nice-to-have.

3. **Undetermined settlement shape.** A goal does not, on its own, specify what counts as "achieved." It may be satisfied by many configurations of the world, some of which only become visible as the work advances. Goals are where settlement paths remain open — and where [objectives](./objective.md) are the instruments by which specific paths are closed.

4. **Organizes work below it.** A goal sits above at least one [project](./project.md) or [campaign](./campaign.md) that exists in order to serve it. A direction with no work organized under it is an aspiration or a wish, not a goal in the operational sense. The test is whether the goal is actually doing coordinating work in the agent's planning.

## Goal vs. objective: directionality vs. decidability

The sharpest contrast in the work vocabulary is between goal and [objective](./objective.md). An objective is **decidable**: at the deadline, it is either achieved or not. A goal is **directional**: it may be better-served or worse-served, advanced or set back, but the question "is the goal achieved?" typically has no single, clean answer — and even when it does, the answer is derived from its objectives, not inspected in the goal itself.

This is the distinction the OKR framework preserves, even as its vocabulary runs opposite to the library's: what OKR calls an "Objective" (qualitative, aspirational, directional) corresponds to a **goal** in the work vocabulary; what OKR calls "Key Results" (specific, measurable, time-bounded) correspond to **objectives** (Locke and Latham 1990, 2002). Neither alone is sufficient. A goal without objectives floats free of operational traction; objectives without a goal are decidable targets whose relevance cannot be argued.

Locke and Latham's decades of empirical work establish that specificity and difficulty of goals predict performance — but crucially, the specificity that matters is not reducible to numeric thresholds. Goals specified clearly enough to guide choice, even without a crisp metric, outperform "do your best" instructions (Locke and Latham 2002). The goal carries the direction; the objective carries the verifiability.

## Temporal kinds: aim-terminated, indefinite, aim-open

Goals do not all have the same temporal structure. Following [the temporality of endeavors](../texts/temporality-of-endeavors.md), a goal can be:

- **Aim-terminated.** The goal has a recognizable end-state. "Ship the first public release of the records system" is aim-terminated: there is a moment at which the goal is met and nothing more is owed to it. Aim-terminated goals support backward planning from the endpoint, milestone-gated cadence, and straightforward coverage-based recognition.

- **Indefinite.** The goal addresses a condition that persists. "Keep the records library accurate and current" or "sustain the weekly review cadence" have no moment at which they are finished. Indefinite goals are not defective for lacking an endpoint; they are differently shaped. They cannot be recognized by coverage-counting and require artificial cadences — weekly, quarterly, generational — to impose horizons where the natural endpoint gives none.

- **Aim-open.** The goal itself transforms as the work advances. "Understand what healing means for this community" or "design a just governance structure" begin with one formulation and, through striving, discover a deeper or different formulation. Aim-open goals cannot be served by fixed objectives alone; they require reflective cadences whose function is aim-revision, not checkpointing.

A single goal can be all three at once. The 561 Group's core endeavor — Black Liberation and Indigenous Sovereignty — is simultaneously indefinite (the condition persists), aim-open (what liberation means concretely transforms with circumstances), and aim-terminated at specific scales (particular laws, particular institutional changes, particular organizing wins). This nesting is not a quirk; it is why the group's operational structure has to span multiple temporal scales simultaneously.

The practical consequence: the recognition shape appropriate to a goal depends on its temporal kind. Coverage of contributing projects is the right recognizer for aim-terminated goals but not for the other two.

## Goal and project

A [project](./project.md) is a named body of work toward a goal, containing plans. The relation is many-to-one in the pragmatic direction: a project serves at most one stated goal (that is what makes it a project rather than a campaign), while a single goal may be served by multiple projects, campaigns, and standing practices. The goal supplies the shared context that lets different plans inside a project compose without mutual interference — and lets multiple projects coordinate toward the same direction without being flattened into a single plan.

This is why project.md requires a stated goal as a defining property: without one, a project is a label on a pile of work, with no way to adjudicate scope, completion, or relevance of a proposed addition. The goal is what makes such adjudication possible. Conversely, a goal with no project or campaign under it is not yet part of the operational structure; it is a direction the agent has named but not yet committed work to.

## Goal hierarchies: terminal and instrumental

Goals stack. Within a single agent or ship, some goals are pursued **terminally** — for their own sake, as constituents of what the agent is trying to bring about — and others are pursued **instrumentally**, because achieving them advances a terminal goal. "Build a team that can sustain this work" may be an instrumental goal in service of the terminal goal of sustaining the endeavor across generations; or it may itself be terminal, valued as a practice-constitutive good in MacIntyre's sense (MacIntyre 1981), independently of whether the larger endeavor reaches any particular state.

MacIntyre's distinction between goods *internal* to a practice and goods *external* to it maps cleanly onto this: terminal goals are usually aligned with internal goods (goods that can only be achieved by doing the practice well), while instrumental goals often track external goods (resources, recognition, conditions) that the practice requires but does not itself constitute. A healthy endeavor holds both, and the hierarchy among its goals is part of what the endeavor's charter makes explicit.

Cognitive science gives a complementary picture. The TOTE unit of Miller, Galanter, and Pribram (1960) — Test, Operate, Test, Exit — models goal-directed behavior as a feedback loop in which a test compares the current state to a desired state (the goal), an operation reduces the discrepancy, and the cycle repeats until the test is satisfied. Nested TOTE units give hierarchical goal pursuit: a higher-level goal's "operate" step is itself a lower-level TOTE loop with its own subgoal. Carver and Scheier (1998) develop this into a systematic control-theory account in which behavior just *is* the reduction of discrepancy between a perceived state and a reference value, and self-regulation is the coordinated operation of such feedback loops at multiple levels of abstraction. Both accounts locate goals as reference values that organize action without themselves being actions.

Bratman's (1987) planning-theoretic account supplies the normative counterpart: goals (he would say "intended ends") anchor the plans that constrain future practical reasoning. A goal does not dictate the plan, but it determines which considerations count as reasons for or against revising it. Plans inherit the defeasible stability of the goals they serve, and revising a goal propagates downward — the plans built to serve it become candidates for reconsideration rather than standing commitments.

## Goal, mission, and vision

Strategic-planning vocabulary distinguishes goal from "mission" (what the organization exists to do) and "vision" (what the world looks like if the organization succeeds). In the work library, *mission* is specifically externally commissioned striving (see [endeavor](./endeavor.md)'s adjacent-concepts table), and *vision* is not reserved as a term of art. Goals, in this library, sit where informal usage places "strategic goals" and "north-star goals": below a chartered endeavor's overall aim but above the projects and campaigns that execute against it. A "north-star goal" in that informal sense is typically an indefinite or aim-open goal held by the whole ship, used as an orientation device when tradeoffs at lower levels are ambiguous.
