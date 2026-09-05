---
type: theorem
status: sketch
depends-on:
  - omniciye-council
  - omniciye-deliberation
  - iyuha-sni-withdrawal
  - wolakhota-closure-system
  - settling-quiescence
  - multi-observer-system
  - crdt-convergence-with-per-observer-rules
---

# Consensus-by-withdrawal yields quiescence

**Statement.** Let $K$ be an [omníčiye council](../objects/omniciye-council.md) on question $q$, operating by the [omniciye-deliberation](../morphisms/omniciye-deliberation.md) morphism.
Assume:

1. $\mathcal{S}_\mathrm{wolak}$ is firing on the question's sub-base (cf. [wolakhota-closure-system](../objects/wolakhota-closure-system.md)).
2. Each council member's individual settling under $\mathcal{S}_\mathrm{wolak}$ converges to a truth-class on $q$ ($\mathbf{t}$, $\mathbf{f}$, or $\bot$, but not $\top$ on the individual-member's substrate).
3. [Iyúhá-šni](../morphisms/iyuha-sni-withdrawal.md) is freely available to every member.

Then there exists a finite stage $\tau^*$ at which $K$'s merged settling reaches quiescence in one of the three quiescence-conditions of [omniciye-deliberation](../morphisms/omniciye-deliberation.md): consensus on the engaged remainder, escalation, or adjournment-without-resolution.

## Proof sketch

The deliberation morphism produces a settling on the question's sub-base.
The settling is governed by [predication-settling](../../../../../../../../math/theories/categories/theories/predication-categories/objects/predication-settling.md) (cf. §"Closure-driven" form): each step joins new posits with the closure of $\mathcal{S}_\mathrm{wolak}$.

By assumption (1) and the Scott-continuity of $\mathcal{S}_\mathrm{wolak}$ (cf. [wolakhota-closure-system](../objects/wolakhota-closure-system.md) §"Scott-continuity"), the closure operator is Scott-continuous on each member's sub-settling.
By the [four-regime dichotomy](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), each member's settling lives in the strict regime (for finite cell-sets, which deliberation always involves) or the Scott-continuous regime; in either case, closure terminates by $\omega$ at the latest.

By assumption (2), each member converges to a single truth-class on their individual settling.
The multi-observer-system merge (cf. [multi-observer-system](../../../../../../../../math/theories/categories/theories/predication-categories/objects/multi-observer-system.md)) produces a merged-settling whose value at any cell is the $\leq_k$-join of the per-member values.

Now consider the merged-settling's value on $q$.
Three cases:

**Case A: All engaged members converge to the same truth-class.** The merged-settling is at that truth-class.
This is the (Q1) consensus-on-engaged-remainder condition.
The question-cell settles to that truth-class and the deliberation moves on.

**Case B: Engaged members converge to different truth-classes (some at $\mathbf{t}$, some at $\mathbf{f}$).** The merged-settling is at $\top$ — contested.
By assumption (3), members who cannot align can withdraw via iyúhá-šni.
After withdrawal, the engaged-remainder shrinks.
If the remaining engaged-members are now all at the same truth-class, we are in Case A.
If not, the question either rises to higher scope (Q2 escalation) or the council adjourns without resolution (Q3) by deliberate council-choice.

**Case C: All members converge to $\bot$ — the question is under-determined for everyone.** No truth-class consensus is reachable from current evidence.
The council settles either to defer-pending-more-evidence (a form of Q3) or to convene the wičháša wakȟáŋ for substrate-investigation (a form of Q2 escalation).

In all three cases, the deliberation reaches a quiescence-condition in finitely many merge-closure-withdrawal cycles.

The finiteness argument: the engaged-member set is finite at every step; iyúhá-šni is monotone-decreasing on engaged-membership; the merged-cell takes finitely many values.
The deliberation cannot cycle indefinitely between non-quiescent states.

The CRDT convergence aspect — that distributed replicas of the deliberation-record converge under $\vee_k$-merge — follows directly from [crdt-convergence-with-per-observer-rules](../../../../../../../../math/theories/categories/theories/predication-categories/theorems/crdt-convergence-with-per-observer-rules.md): the council's substrate-record is replicable across members; merge-equivalence is preserved; the quiescence-cell is the same across replicas. $\square$

## Remark on why this is non-trivial

The standard worry with consensus-based decision is the *blocking-minority* problem: a single dissenter prevents the entire group from acting.
Voting solves this by majority-tally; the Lakota polity solves it differently — by *iyúhá-šni-availability*.
A non-consenting member is not coerced into voting against their conscience and is not blocking the group; they withdraw, the engaged-majority proceeds, the withdrawn-member's relations are preserved.

The structural mechanism only works if iyúhá-šni is *substrate-respected*: withdrawal is not penalty-cell-installing, withdrawal is not standing-erosive, withdrawal is reversible.
The polity's commitments to these structural-features are what make consensus-by-withdrawal a workable settlement-mechanism rather than a recipe for paralysis.

## Significance

The theorem is the structural-content of "the Lakota polity decides, even when no consensus exists."
The decision-mechanism is *non-coercive* (withdraw rather than override), *kin-preserving* (relation-cells not touched), and *convergent* (finite-step quiescence).
Western parliamentary procedure achieves convergence by coercion (majority-vote overrides minority); the Lakota mechanism achieves it by withdrawal (engaged-majority proceeds while preserving non-engagement of withdrawn members).
Both achieve quiescence; the kin-preservation property is specific to the Lakota form.

## Sources

- Ella Deloria, *Speaking of Indians* (1944) — sociological description of consensus-by-withdrawal as practiced.
- Walker 1982, *Lakota Society* — recorded council practice illustrating the convergence-via-withdrawal pattern.
- Audra Simpson, *Mohawk Interruptus* (2014) — the parallel mechanism in Haudenosaunee tradition.
- Vine Deloria Jr., *Custer Died for Your Sins* (1969) — critique of imposed parliamentary procedure on Indigenous polities.
