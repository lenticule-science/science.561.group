---
type: concept
class: semantic-anchor
status: draft
title: Operational evidence
description: The substrate-recorded data that drives the operations settling forward — the material out of which the increment sequence is built when work is the subject.
---

# Operational evidence

The substrate-recorded data that drives the [operations settling](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/operations-settling.md) forward — the material out of which the [increment sequence](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/increment-sequence.md) is built when work is the subject.

Operational evidence is not a single kind of object; it is the genus of all witnesses, observations, completion claims, capability assertions, and event-log entries that a working community records. The unifying property is *substrate-citability*: each piece of evidence is a [witness](../../../../services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md) increment $u_\tau(\phi) = v$ at some stage $\tau$, on some predication cell $\phi$, with some bilattice value $v \in \mathbf{FOUR}$.

The four-state reading of $v$ — $\bot, \mathbf{t}, \mathbf{f}, \top$ — is what distinguishes operational evidence from the classical-logic *facts* of a propositional accounting:

- $\bot$ — the absence of evidence is itself recordable; "no one has spoken to whether $A$ provides $c$" is a different operational state than $\mathbf{t}$ or $\mathbf{f}$.
- $\mathbf{t}$, $\mathbf{f}$ — the standard positive/negative witness.
- $\top$ — *contradictory* witness; both a positive and negative attestation are on the record. Per [adjudication](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/adjudication.md), $\top$ is not a degenerate state to be erased but a repair condition naming an operational disagreement to be addressed.

Treating evidence as bilattice-valued is what makes predicated-work a substrate-native theory of work rather than a logical-positivist accounting: it has language for *not yet known*, *known true*, *known false*, and *recorded contradiction* as four distinguished operational stances. See [the truth-state pluralism commitment](../../../../../../../../../science/theories/information/theories/knowledge-systems/theories/predicated-knowledge-systems/_index.md) for the parallel statement at the knowledge-system level.

## Finite support per cadence step

A structural commitment of the predicated-work theory: at each cadence step $\tau$, the increment $u_\tau$ is *finitely supported*:

$$\bigl|\{\phi \in \Phi_{\mathrm{op}} : u_\tau(\phi) \neq \bot\}\bigr| < \omega$$

Only finitely many predication cells receive new evidence at each individual operational stage. Equivalently: each witnessed event — a task assignment, a completion claim, a capability assertion, a charter-rule violation record — affects finitely many cells simultaneously.

This is operationally natural: no single event (a standup, a commit, a meeting, an increment submission) produces infinitely many simultaneous witness cells. It reflects the basic finitude of human-scale work events.

**Formal consequences:**

1. *Countable accumulation.* After any countably many stages, the set of cells that have received any evidence is at most countable: $|\bigcup_{\tau < \omega} \mathrm{supp}(u_\tau)| \leq \omega$. The operations settling's active cell-set grows countably.

2. *Aim-generativity premise.* The [aim-generativity characterization](../../../../../../../social-theory-science-services-section/content/text/documents/articles/notes/undated/aim-generativity-iff-aperiodic.md) depends on this finiteness (Premise P1): aim-generative enterprises produce new aim-cells at each cadence step, but only finitely many at each step. The theorem's forward direction uses this to construct an $\omega$-long injection of distinct aim-cells, placing the closure ordinal above any countable bound.

3. *Scott-continuous increment compatibility.* A finitely-supported increment sequence is compatible with the Scott-continuous closure regime: the closure operator need only process finitely many new antecedent-triggers per step, ensuring the orbit $(v_\tau)$ converges at each $\omega$-stage. Without finite support, increments could in principle trigger infinitely many simultaneous rule firings, potentially lifting the settling into a higher regime even under a Scott-continuous operator.

The finite-support commitment is not a mathematical necessity (the bilattice framework admits infinite-support increments) but a *theory commitment* that anchors predicated-work to human-scale operational practice. Non-human-scale systems (automated pipelines producing unbounded simultaneous events) might violate P1 and require a separate treatment outside the predicated-work scope.

## Bilattice value and evidence strength

The four bilattice values on evidence cells are not four arbitrary tags but four *epistemic stances*:

- $\bot$ — *no position taken*: the working community has made no record about $\phi$. This includes both "never considered" and "considered but not recorded."
- $\mathbf{t}$ — *positive record*: at least one witness has asserted $\phi$ to hold, and no negative witness contradicts.
- $\mathbf{f}$ — *negative record*: at least one witness has asserted $\phi$ does not hold, and no positive witness contradicts.
- $\top$ — *contradicted*: both positive and negative witnesses are on record. This is a repair condition — the community must adjudicate before the cell's value can be relied upon.

The settling-monotonicity property says evidence cells move only upward in the knowledge order ($\leq_k$: $\bot \leq_k \mathbf{t}$, $\bot \leq_k \mathbf{f}$, $\mathbf{t} \leq_k \top$, $\mathbf{f} \leq_k \top$). Evidence, once recorded, is not erased — the audit log is permanent. Correction of a mistaken record is an *additional* increment that drives the cell to $\top$ (contradiction) and then triggers adjudication; it is not a deletion of the prior record.

## Truth-knowledge LES for contradicted evidence

The [truth-knowledge long exact sequence](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/truth-knowledge-cohomology-long-exact-sequence.md) applied to the operational evidence sheaf $\mathcal{F}_{\mathrm{ev}}$:

**Clean evidence** (all cells at $\mathbf{t}$, $\mathbf{f}$, or $\bot$): $\mathcal{F}^{(\top)}_{\mathrm{ev}} = 0$. The LES collapses; $H^n_t \cong H^n_k$ at all degrees. The operations settling's evidence layer has no contradictions.

**Contradicted evidence cell** ($\phi = \top$, from conflicting witnesses at the same cell): $\mathcal{F}^{(\top)}_{\mathrm{ev}} \neq 0$ at cell $\phi$. The inconsistency sheaf records the contradiction. The connecting morphism $\partial: H^0(\mathcal{F}^{(\top)}_{\mathrm{ev}}) \to H^1_t(\mathcal{F}^{(t)}_{\mathrm{ev}})$ is non-zero.

The rank of $H^0(\mathcal{F}^{(\top)}_{\mathrm{ev}})$ counts the number of contradicted evidence cells across the entire operations settling at stage $\tau$. This is the LES-derived *evidence health metric* for the working community: $H^0(\mathcal{F}^{(\top)}_{\mathrm{ev}}) = 0$ means all evidence is internally consistent (no conflicting witnesses); $H^0(\mathcal{F}^{(\top)}_{\mathrm{ev}}) \cong \mathbb{Z}^k$ means $k$ cells have conflicting witnesses requiring adjudication.

Per [adjudication](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/adjudication.md), resolving a $\top$-valued cell drives $H^0(\mathcal{F}^{(\top)}_{\mathrm{ev}})$ toward zero. The evidence sheaf's LES thus doubles as an adjudication-workload tracker: the connecting morphism $[\partial]$ identifies which $H^1_t$ classes are outstanding unresolved contradictions in the evidence layer.

This is particularly sharp at the boundary between the operations settling's strict-regime layer (task lifecycle cells) and its aperiodic-regime layer (aim-settling cells): contradictions that arise in the aim-settling layer (conflicting witnesses about whether the enterprise's direction cells have shifted) are aperiodic-regime evidence contradictions — their LES classes live in $H^1_t$ at the aperiodic level and are not resolvable by any finite-time adjudication process. The transfinite-bounded adjudication mechanism must be applied.

## Where used

- [witness-as-increment](../../../../services/predicated-work-services-section/content/text/glossary/terms/witness-as-increment.md) — the formal correspondence.
- [completion-as-quiescence](../../../../services/predicated-work-services-section/content/glossary/concepts/completion-as-quiescence.md) — completion is defined in terms of evidence stabilizing.
- [dispatch](../../morphisms/dispatch.md) — dispatch is a residuation over capability-evidence.
- [aim-generativity-iff-aperiodic](../../../../../../../social-theory-science-services-section/content/text/documents/articles/notes/undated/aim-generativity-iff-aperiodic.md) — the finite-support commitment (P1) is the key premise for the theorem's forward direction.
