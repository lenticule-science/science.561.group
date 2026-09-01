---
type: morphism
class: resolution
status: draft
symbol: "\\alpha"
depends-on: [operations-settling, witness-as-increment, repair-resolution-poset, inconsistency-sheaf]
realizes: [adjudication, finding, feedback]
see-also: [correlate-of, ratification, estoppel, restorative-accountability]
---

# Adjudicate witness conflict

The morphism that, given a $\top$-valued operational cell — a cell whose [increment sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) has accumulated mutually-contradictory witnesses — produces a *resolution-trajectory* in the [repair-resolution poset](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md) $W^{\flat}$ together with an authority-issued increment whose effect on the underlying $\top$-cell depends on the resolution-kind: an *affirm* or *retract* increment drives the cell off $\top$ at the next closure step, while an *acknowledge* increment leaves the $\top$-cell in place and records the contradiction as adjudicated-but-standing.

## Why this morphism is needed

The [operations settling](../objects/operations-settling.md) admits $\top$-valued cells whenever two witnesses on the same predication cell assert opposing values: a completion witness and a failure witness on the same task, two officers asserting and revoking the same incumbency, two replicas reporting conflicting capacity for the same agent. The [witness-as-increment correspondence](./witness-as-increment.md) records these as cells $\phi$ with $v^{\mathrm{op}}(\phi) = \top$. The truth-knowledge long exact sequence then carries a non-zero $H^0(\mathcal{F}_U^{(\top)})$ contribution; per [operations-settling §inconsistency-sheaf](../objects/operations-settling.md), each unresolved $\top$-cell is a cohomological obstruction to treating the operational state as classically consistent.

What the existing apparatus provides is the *site* of the conflict — which cells are at $\top$, when they arose, what their $H^1$-class is. What it does not provide is the *operation* by which a working community moves a $\top$-cell forward: who issues the resolving increment, what kind of resolution it is, and what the resolution costs cohomologically. The adjudicate-witness-conflict morphism is that operation.

## Definition

Let $\Phi^{\top}_\tau \subseteq \Phi_{\mathrm{op}}$ be the $\top$-valued cell set at stage $\tau$, and let $\mathrm{Wit}_\tau \subseteq \Phi^{\top}_\tau \times \mathrm{Agents}$ be the set of $\top$-cell witnesses (per the [repair-resolution poset](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md)) emitted by stage $\tau$. The resolution-state assignment is $\rho_\tau: \mathrm{Wit}_\tau \to W$.

Adjudication is a partial morphism

$$\alpha : \mathrm{Wit}_\tau \times \mathrm{Auth} \times \{\textsf{affirm}, \textsf{retract}, \textsf{acknowledge}\} \rightharpoonup u_{\tau+1}$$

taking a $\top$-cell witness $w = (\phi_w, A_w)$, an adjudicating authority $J$ (an agent or office holding the appropriate jural relation), and a resolution kind $\kappa$, and returning an [increment](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) $u_{\tau+1}$ that:

1. Asserts $\langle w, \texttt{resolved-by}, J\rangle = \mathbf{t}$ — recording the adjudication act in the substrate.
2. Asserts $\langle w, \texttt{resolution-kind}, \kappa\rangle = \mathbf{t}$ — labelling the arrow into $\textsf{resolved}$ in $W^{\flat}$.
3. Issues a kind-specific *substantive* sub-increment on $\phi_w$ itself, depending on $\kappa$ (the table below).
4. Updates $\rho_{\tau+1}(w)$ to $\textsf{resolved}$ along the appropriate $W^{\flat}$ arrow.

The morphism is *partial* because it is defined only when $J$ holds an authority adequate to adjudicate $\phi_w$ — when an [authority-gate](theories/predicated-governance/concepts/authority-gate.md) condition holds for $J$ over the predicate of $\phi_w$. Non-adjudicating-authority calls produce no increment.

## The three resolution kinds

The substantive sub-increment depends on the kind $\kappa$. The table records each:

| $\kappa$ | Substantive sub-increment on $\phi_w$ | What the resolution claims |
|---|---|---|
| $\textsf{affirm}$ | $\langle \phi_w, \texttt{retracted-witness}, w_-\rangle = \mathbf{t}$ for the dissenting witness $w_-$ | The positive witness was correct; the negative witness is withdrawn. |
| $\textsf{retract}$ | $\langle \phi_w, \texttt{retracted-witness}, w_+\rangle = \mathbf{t}$ for the affirming witness $w_+$ | The negative witness was correct; the positive witness is withdrawn. |
| $\textsf{acknowledge}$ | No retraction increment; $\langle \phi_w, \texttt{acknowledged-conflict}, J\rangle = \mathbf{t}$ | Both witnesses are recognized as having been emitted in good faith; the contradiction is recorded as standing rather than cleared. |

The $\textsf{affirm}$ and $\textsf{retract}$ kinds together exhaust the *clearing* resolutions — the operational analogue of the $W^{\flat}$ chain through $\textsf{proposed}$. The $\textsf{acknowledge}$ kind is the operational analogue of the acknowledgement shortcut $\textsf{open} \to \textsf{resolved}$ in $W^{\flat}$: the $\top$-cell remains at $\top$ in the predication valuation, and only the recognition of the contradiction is recorded.

A retraction increment, when it lands, drives the cell off $\top$ at the next closure step: by [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md) the cell cannot lose its $\top$ classification by mere absence, but the substrate's *witness-retraction protocol* — which is the operational rendering of the $W^{\flat}$ affirm/retract arrows — issues a fresh increment whose effect under closure is to mark the retracted witness inactive, leaving only the surviving witness to determine the cell's next-stage value. The cell's *historical* $\top$ is preserved in the cohomology (it is a real event in the settling's history); its *current* value moves to $\mathbf{t}$ or $\mathbf{f}$.

## Why three kinds and not two

A two-kind apparatus — affirm and retract, no acknowledgement — would force every adjudication to claim that one witness was wrong and the other right. Operational reality is not always this clean. A team running concurrent replicas of a task may have both completed it (each side's completion witness is genuine; there is no error to retract); two officers may have validly issued conflicting jurisdictional commands under different charters that both held authority at the time. The $\textsf{acknowledge}$ kind is the substrate's recognition that *some contradictions are real features of the operational history and should be recorded as such, not erased by adjudicative fiat*. Per the math-side [repair-resolution-poset](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md): the acknowledge arrow is structurally distinguished from the affirm/retract arrows because its underlying $\top$-cell *persists* in $\mathcal{F}_U^{(\top)}$, contributing to the inconsistency sheaf even after the witness has reached $\textsf{resolved}$. Acknowledged contradictions remain visible to cohomological audit; cleared contradictions become coboundaries.

This is the substrate-algebraic content of the [restorative-accountability](theories/predicated-governance/objects/restorative-accountability.md) family of governance patterns: those patterns prefer acknowledgement over erasure precisely because preserving the record of the contradiction is more important than producing a unanimous trace.

## Authority and the adjudication-as-jural-act reading

Adjudication is a [jural act](theories/predicated-governance/objects/jural-relation.md): it requires the adjudicator $J$ to hold a power-relation $R^A$ with $\langle R^A, \texttt{kind}, \texttt{power}\rangle = \mathbf{t}$, $\langle R^A, \texttt{active-holder}, J\rangle = \mathbf{t}$, $\langle R^A, \texttt{scope-action}, \texttt{adjudicate-}\phi_w\rangle = \mathbf{t}$. By [correlate-of](theories/predicated-governance/morphisms/correlate-of.md) the adjudication act creates correlative liabilities in the parties whose witnesses are retracted. By [estoppel](theories/predicated-governance/morphisms/estoppel.md) the parties cannot subsequently re-emit the retracted witness without re-opening the adjudication via a fresh dispute (a new $\top$-cell on a successor predicate, not a re-firing of the same one).

This is the connection between the operational morphism (move a $\top$-cell off $\top$) and the governance morphism (exercise an adjudicative power and generate the correlative jural state). The two morphisms compose: the adjudicate-witness-conflict morphism is the operational *content* of an adjudicative authority's exercise; the [installation](theories/predicated-governance/morphisms/installation.md) and [delegation](theories/predicated-governance/morphisms/delegation.md) morphisms govern *who* may invoke it.

## Composition with review and feedback

The work vocabulary's [review](../../../terms/review.md) stage is where adjudication is typically performed. A review's [findings](../../../terms/finding.md) include identification of $\top$-cells in the prior cycle's settling; the [feedback](../../../terms/feedback.md) stage's adjustments are, in part, increments adjudicating those $\top$-cells. The adjudicate-witness-conflict morphism is the substrate-algebraic content of "the review surfaced a contradiction and the feedback resolved it": review enumerates $\rho_\tau^{-1}(\textsf{open})$ on the cycle's witnesses, feedback issues the $\alpha$-increments that move them to $\textsf{resolved}$.

A review whose findings include only single-loop variances (per [Argyris-Schön](../../../terms/finding.md)) typically produces affirm/retract resolutions: one side's claim was correct, the other side's was procedural error. A review whose findings include double-loop variances often produces acknowledge resolutions: both sides were right under their respective premises, and the contradiction names the structural disagreement that the next cycle's planning must address. The kind distribution of an organization's adjudications — what fraction land on affirm/retract vs. acknowledge — is therefore an observable signature of how single-loop or double-loop its review practice actually runs.

## Regime and CALM

Adjudication increments are themselves $\leq_k$-monotone witnesses (they only add evidence; they never retract derived values, only re-classify witnesses as inactive). By [settling-monotonicity](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), an adjudication issued at stage $\tau$ remains in force at all stages $\tau' > \tau$; a later contradicting adjudication produces its own $\top$-cell on the meta-predicate $\langle \phi_w, \texttt{resolution-kind}, \cdot\rangle$, requiring its own higher-order adjudication. This is the substrate's encoding of *appeal*: a higher authority adjudicating a lower authority's adjudication is a fresh $\alpha$-application on the meta-cell, not a retraction of the lower act.

By the [CALM corollary](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-calm-corollary.md), positive queries about adjudication state — "has this dispute been resolved?", "what kind of resolution did it receive?", "who adjudicated it?" — are coordination-free across replicas of the operations settling. The query "is this dispute *unresolved*?" requires coordination, since it asserts the absence of an $\alpha$-increment across all replicas.

## What this morphism formalizes that the work vocabulary leaves implicit

The work vocabulary's [audit-trail](../../../terms/audit-trail.md), [finding](../../../terms/finding.md), [review](../../../terms/review.md), and [feedback](../../../terms/feedback.md) terms describe the *containers* and *acts* of operational learning, but they do not specify the substrate-algebraic event that drives a contradicted cell off $\top$. The adjudicate-witness-conflict morphism is that specification: it names the operation, types its three kinds, locates it in the predicated-governance authority structure, and ties it to the [repair-resolution poset](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/repair-resolution-poset.md)'s lifecycle so that the [adjudication-modes-and-h1](../theorems/adjudication-modes-and-h1.md) theorem can compute its cohomological consequences.

## Where used

- [adjudication-modes-and-h1](../theorems/adjudication-modes-and-h1.md) — the cohomological consequence of each kind.
- [operations-settling](../objects/operations-settling.md) — the carrier-settling on which adjudication operates.
- [restorative-accountability](theories/predicated-governance/objects/restorative-accountability.md) — the governance pattern that preferentially uses $\textsf{acknowledge}$.
- [estoppel](theories/predicated-governance/morphisms/estoppel.md) — the jural rule preventing re-emission of retracted witnesses.
- [ratification](theories/predicated-governance/morphisms/ratification.md) — the special case of $\alpha$ where the adjudicator affirms a prior unauthorized act.
