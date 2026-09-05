---
type: morphism
class: deliberative-settling
status: draft
symbol: "\\mathrm{delib}_K"
depends-on:
  - omniciye-council
  - iyuha-sni-withdrawal
  - wolakhota-closure-system
  - multi-observer-system
realizes: [adjudication]
---

# Omníčiye deliberation

The omníčiye deliberation morphism is the predication-settling that runs while an [omníčiye council](../objects/omniciye-council.md) $K$ is active on a question $q$.
It implements consensus-by-withdrawal as a [multi-observer-system](../../../../../../../../math/theories/categories/theories/predication-categories/objects/multi-observer-system.md) settling.

## The setup

While $\langle K, \texttt{potential}\rangle$ is at $\mathbf{t}$ and the council is on question $q$, the council operates as a multi-observer system $V_K : O_K \to \mathrm{Settlings}_q$ on the question's sub-base:

- $O_K$ is the (discrete) category of council-members on the question.
- Each member $a \in O_K$ has their individual settling $V_K(a) = v^a$ of the question's cells.
- The merged settling is $\bar v = \bigvee_k^{a \in O_K} v^a$.

## The deliberation steps

The deliberation is a sequence of substrate-operations interleaved over the council's session:

**Speech step (positing).** A council member $a$ takes the floor and speaks on the question.
Their speech-content is recorded as one or more agentive positing morphisms $\mathrm{posit}^a_{(\phi_i, q_i)}$ on the cells over the question.
The truth-class of the data records the speaker's position: $\mathbf{t}$-class data for an affirming speaker, $\mathbf{f}$-class for a denying speaker, $\top$-class for an explicitly-contesting speaker.

**Merge step (multi-observer settling).** After each speech, the merged-settling $\bar v$ is updated as $\bar v \mapsto \bar v \vee_k \delta_{\phi, q}$ for each posit.
Two-speaker disagreement on the same cell produces $\top$ at that cell in the merged-settling (cf. [contestation-positing-morphism](../../../../../../../../math/theories/categories/theories/predication-categories/morphisms/contestation-positing-morphism.md)).

**Closure step.** $\mathcal{S}_\mathrm{wolak}$ fires on the merged-settling, deriving consequences.
The Scott-continuity of the wolakȟota rules makes this step terminate at $\omega$ in the worst case (in practice, far earlier — the rule-set is small and the cell-set under deliberation is finite).

**Withdrawal step (iyúhá-šni).** A council member who cannot consent to an emerging direction exercises [iyúhá-šni](iyuha-sni-withdrawal.md) from the question-engagement.
Their participation-cell drops to $\bot$; subsequent merge steps operate over the *engaged remainder* $O_K^\mathrm{eng} = O_K \setminus \mathrm{withdrawn}(K, q)$.

**Continuing-deliberation step.** Speech-merge-closure-withdrawal cycles continue until one of three quiescence-conditions is met (next section).

## Quiescence conditions

The deliberation reaches quiescence when one of three conditions holds:

**(Q1) Consensus on the engaged remainder.** The merged-settling restricted to $O_K^\mathrm{eng}$ has $\bar v(q) \in \{\mathbf{t}, \mathbf{f}\}$ — truth-class designated and stable across one or more merge-closure cycles without further iyúhá-šni.
The council-cell at $\langle K, \texttt{settled}, q\rangle$ is set at $\bar v(q)$ and the council moves to the next question or adjourns.

**(Q2) Escalation.** The merged-settling cannot reach truth-class quiescence at council-scope; the council settles instead a *referral* cell — the question is carried to a higher scope (oyate $\to$ confederacy; council $\to$ next sun-dance convocation) or to a different settling-procedure (ceremonial restorative work; wičháša-wakȟáŋ consultation).
The council-cell $\langle K, \texttt{settled}, q\rangle$ records the referral.

**(Q3) Adjournment-without-resolution.** The council adjourns with the question's cell still at $\top$ or $\bot$.
This is the polity's *non-decision* — neither resolved nor referred.
The question persists in the substrate; the next convocation (or further substrate-events) may re-activate it.
The Lakota polity has no procedural pressure to force resolution; non-resolution is an acceptable substrate-state.

## Why consensus-by-withdrawal converges

The standard worry with consensus-based deliberation is non-convergence: speakers continue to contribute without converging.
The polity-scale answer is structural:

- **Speech-cost.** Speaking-in-council is substrate-effortful; the speaker invests virtue-standing in their posits.
  Continued contestation costs continuing virtue-investment.
- **Iyúhá-šni-availability.** A speaker who cannot align with the emerging consensus can withdraw at any time.
  This is structurally preferable to continued speech-against without alignment, because withdrawal is wakȟáŋ-respected while bad-faith contestation degrades the speaker's standing-as-wolakhota.
- **Engaged-majority floor.** When most of the council has converged and a small minority continues to contest, the structural pressure on the minority is to either align (and stop contesting), withdraw (and let the majority proceed), or escalate (carry the question to higher scope).
  All three move the council out of $\top$.

Formally: the merge-closure dynamics on a discrete observer category with $\leq_k$-monotone settling are CRDT-convergent by [crdt-convergence-with-per-observer-rules](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/crdt-convergence-with-per-observer-rules.md).
The consensus-by-withdrawal mechanism is the substrate-level mechanism by which the observer-category effectively shrinks during contestation, removing contesting cells from the merge and allowing the engaged-remainder to converge.

## The wakȟáŋ-witnessing position

For questions in the wakȟáŋ-witnessing-required classes (treaty, ceremony, office-installation at confederacy scope, Pȟahá Sápa), a wičháša wakȟáŋ is present and their witness-cell records the deliberation.
The wakȟáŋ-witness does not vote (the wičháša wakȟáŋ is not typically a member of the council qua council); rather, they bear-witness in the yuhá sense — keeping the substrate-record of the deliberation as wakȟáŋ-marked.

When the council settles a wakȟáŋ-witness-required question, the resulting cell is wakȟáŋ-marked iff the witnessing was conducted properly.
A council that settles such a question *without* wakȟáŋ-witness produces a non-wakȟáŋ-marked cell, which fails the rule-class conditioning on wakȟáŋ-marking — the decision is *made* but does not propagate through the wakȟáŋ-conditioned rules.

## Sources

- Walker 1982, *Lakota Society* — recorded deliberation practice in the nineteenth-century oyate councils.
- Ella Deloria, *Speaking of Indians* (1944) — the structural form of Dakota/Lakota deliberation, with attention to the unhurried pace.
- DeMallie 2001 in *Handbook of North American Indians* vol.
  13 — confederacy-scope deliberation and the seven-divisions great-council.
- Estes, *Our History is the Future* (2019) — contemporary deliberation practice at Standing Rock and in other twenty-first-century convocations.
- White Hat, *Life's Journey — Zuya* (2012) — contemporary Sicangu council practice and partial reconstitution under tribal-government overlay.
