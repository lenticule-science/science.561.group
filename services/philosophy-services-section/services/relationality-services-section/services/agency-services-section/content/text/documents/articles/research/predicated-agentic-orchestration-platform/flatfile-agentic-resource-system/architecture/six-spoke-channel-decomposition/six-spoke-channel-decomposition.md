---
name: six-spoke-channel-decomposition
description: "The framing that the substrate's event log is a sheaf of six sublocales, one per work-cycle spoke — plan, dispatch, execute, track, review, feedback."
type: concept
class: framing
depends-on: [channel, seven-channel-decomposition, fiber, predication-fiber]
see-also: [seven-channel-decomposition, ../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/assignment, ../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/execution-event, ../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/observation, ../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/finding, ../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/adjustment]
title: six-spoke-channel-decomposition
---

# Six-spoke channel decomposition

The framing that *the substrate's event log is a sheaf of six sublocales, one per work-cycle spoke* — `plan`, `dispatch`, `execute`, `track`, `review`, `feedback`.
Each sublocale carries the events whose work-spoke is its name; restriction maps between sublocales encode the dispatch-can-read-tracking, review-can-read-execution, feedback-can-read-review (and the other) cross-spoke walks the substrate algebra requires.

This is *not a runtime decision* and *not a layer over the existing channel scheme*.
It is the algebraic content of the work-cycle six-walks-of-one-adjunction structure (see [stages-as-readings](../../stages-as-readings/stages-as-readings.md) for the substrate-level commitment that the six work-cycle stages share one algebra), realized at the event-log layer as the open-set lattice of an Alexandrov locale on the six-stage poset.

## The six sublocales

Each sublocale is a substrate entity (a [`Channel`](../objects/channel.md) record):

1. **`plan`** — events that produce or modify [task-cell-system](../../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/task-cell-system.md), [plan](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/plan.md), [workflow](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/workflow.md) entities.
  Plans are $\odot$-fixpoints of task-assertion on goal fibers; planning events are the increments that drive a plan to its fixpoint.

2. **`dispatch`** — events that emit [assignment](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/assignment.md) entities and modify their cells (revocation, lapsing, discharge).
  Dispatch is `office ⊙ task-requirement` and the assignment is the witnessed product (see [dispatch](../morphisms/dispatch.md) and the [referencing-entity pattern](../../flatfile/referencing-entity-pattern/referencing-entity-pattern.md)).

3. **`execute`** — events that emit [execution-event](../../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/execution-event.md) entities.
  These report state-changes and artifact production against a task without mutating the task per [derived-state-via-walks](../../derived-state-via-walks/derived-state-via-walks.md).

4. **`track`** — events that emit [observation](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/observation.md) entities.
  Per [observation-fiber-isolation](../../observation-fiber-isolation/observation-fiber-isolation.md), observations live in their own fiber; the track sublocale is the carrier of that fiber.

5. **`review`** — events that emit [finding](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/finding.md) entities and the thin review entities that contain them.
  Findings are first-class entities; the review sublocale carries them.

6. **`feedback`** — events that emit [adjustment](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/adjustment.md) entities and apply them to their target entities.
  An adjustment's apply-step writes new cells against a target; both the adjustment-emission and the target-write are events on the feedback sublocale.

## Why a sheaf, not a partition

The six sublocales are not disjoint partitions of the event log.
Cross-spoke walks are the rule, not the exception:

- **Dispatch reads tracking.** A dispatch eligibility filter consults tracking-stage rate-limit-budget observations on candidate endpoints to filter out endpoints whose budgets are exhausted.
  The dispatch query reads from the `track` sublocale via a restriction map that lets dispatch-stage compositions walk to tracking-stage observations.
  See [rate-limit-as-time-windowed-availability-predication](../../rate-limit-as-time-windowed-availability-predication/rate-limit-as-time-windowed-availability-predication.md).

- **Review reads execution and tracking.** A finding's `observed` cell points at observation entities (track sublocale) and a finding's variance is computed from execution events (execute sublocale) compared against plan cells (plan sublocale).

- **Feedback reads review.** An adjustment's `responds-to` cell points at findings (review sublocale).

- **Track reads execute.** Tracking queries fold the most-recent execution events to derive task state.

- **Plan reads feedback.** Re-planning events are triggered by adjustments whose target is the plan; the plan sublocale is downstream of feedback in the operations loop.

The cross-spoke pointer structure forms a *site* in Grothendieck's sense (events with restriction maps between channels), and the sheaf-of-sublocales structure on the event log is the substrate-algebraic content of the six-walks-of-one-adjunction reading.
A naive partition would force each event to live in exactly one channel; the sheaf lets a dispatch query walk into a tracking observation without copying the observation into the dispatch sublocale.

## The Alexandrov locale on the six-stage poset

The six work-spokes carry a partial order in the operations loop:

$$\texttt{plan} \to \texttt{dispatch} \to \texttt{execute} \to \texttt{track} \to \texttt{review} \to \texttt{feedback} \to \texttt{plan} \to \cdots$$

The arrows are causal, not strict (every spoke can be entered from any prior spoke whose output it requires), and the loop closes via feedback-induced re-planning.
The Alexandrov topology on this poset has open sets = upper sets (sets closed under "is downstream of"), and the corresponding locale's points are the six spokes.
Each `Channel` record exposes one of these points; cross-spoke restrictions are the locale's restriction maps.

This is the algebraic content of the channel decomposition.
The captain's correction — "channels are not runtime decisions" — names this: the six channels are the points of a locale derived from the work-cycle's causal poset, not a routing convention chosen at driver startup.

## Relationship to the seven-channel behavioral decomposition

The [seven-channel decomposition](../seven-channel-decomposition/seven-channel-decomposition.md) is *behavioral*: it categorizes what an event does (observe, guard, account, query, mutate, analyze, learn).
The six-spoke decomposition is *structural*: it categorizes which work-cycle stage an event participates in.
These are *orthogonal axes* on every event:

| Event | Behavioral channel | Work-spoke channel |
|---|---|---|
| Emit an assignment | mutation | dispatch |
| Block a dispatch lacking authority | guard | dispatch |
| Compute a tracking-status query | analysis | track |
| Read an endpoint's rate-limit budget | query | track |
| Apply an adjustment to a plan | mutation | feedback (writes plan sublocale) |
| Emit a cost-witness | accounting | execute (the dispatch settle-action) |

Events carry both channel-coordinates.
Substrate consumers filter by either or both depending on the question they're asking ("show me all guard rejections in the last hour" vs. "show me all dispatch events for this task" vs. "show me all guard rejections during dispatch").

Neither decomposition replaces the other.
They are dual readings: behavioral asks "what kind of substrate operation is this?", structural asks "which spoke of the work-cycle did this happen in?".
A complete channel coordinate on an event is the pair `(behavioral-channel, work-spoke-channel)`.

## Implementation

In a flatfile substrate, the six sublocales are realized as six event-log directories under `.fars/event-log/<spoke>/`.
Restriction maps are reverse-edge walks in the predication graph: a dispatch-stage query for endpoint availability follows `observes` reverse-edges from the candidate endpoint into observation entities on the `track` sublocale and folds the most-recent budget value.

The six event-log directories are *naming* sublocales, not isolating them.
A consumer that wants all events for a task walks all six directories and folds.
The directory split is for filter-efficiency; the algebraic discipline is the sheaf structure, which holds regardless of how the events are stored.

## What this is not

- **Not seven plus six = thirteen channels.** The orthogonal axes give 7 × 6 = 42 cells; in practice only a fraction are populated (a "learn" event in the "dispatch" cell is unusual).
  Both decompositions remain low-dimensional.
- **Not a refinement of one into the other.** Neither projects onto neither; they are independent.
- **Not load-bearing on first-day implementation.** A FARS realization that lumps all work-cycle events into a single event log and filters by `kind` (assignment, execution-event, observation, finding, adjustment) carries the same algebraic content.
  The sublocale split is for query efficiency and audit clarity, not algebraic correctness.

## Position

The six-spoke channel decomposition is the *structural* axis on the event log; the [seven-channel decomposition](../seven-channel-decomposition/seven-channel-decomposition.md) is the *behavioral* axis.
Together the two axes give the event log's full channel coordinate.
Both are present in the substrate's algebra; both are content, not kernel; both are derivable from the work-cycle terms (six-spoke from the work-cycle stage decomposition formalized in [predicated-work](../../../../../../../../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/content/text/documents/articles/notes/undated/predicated-work.md), seven-channel from the empirical hook/tool inventory).
