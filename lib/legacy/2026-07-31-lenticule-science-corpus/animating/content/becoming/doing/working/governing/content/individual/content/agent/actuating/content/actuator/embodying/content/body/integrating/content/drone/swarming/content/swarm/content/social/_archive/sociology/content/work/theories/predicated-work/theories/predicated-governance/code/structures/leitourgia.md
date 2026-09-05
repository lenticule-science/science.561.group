---
type: definition
class: substrate-entity
status: draft
symbol: "Λ"
depends-on: [jural-relation, office-as-double-settlement, normative-system, operations-settling, bigraded-settling-cohomology]
realizes: [leitourgia]
see-also: [leitourgia-discharge-as-bigraded-settlement, community-constitution-as-sheaf-descent, recognition-as-bigraded-common-knowledge]
---

# Leitourgia

The mathematical realization of the [leitourgia](../../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/leitourgia.md) — a public service obligation imposed by position rather than chosen, discharged by correct enactment before a constituted witnessing community, at irreversible personal cost.
Formalizes the two-stage discharge structure (form-enactment + forward-stability) as a bigraded settlement condition on the operations settling.

## Data

A leitourgia $\Lambda$ is a quadruple

$$\Lambda = (\lambda, \varphi, C, \iota)$$

where:

- $\lambda \in E_{\mathrm{op}}$ — the **leitourgos**: an agent entity in Hohfeldian liability position with respect to a designating authority.
  The liability-relation cell $\langle \lambda, \texttt{in-liability-to}, A_{\mathrm{des}}\rangle$ carries $\mathbf{t}$; the designating authority $A_{\mathrm{des}}$ holds the correlative Hohfeldian power.
  Designation is by position — the leitourgos does not self-select; the appointing authority's power cell fires the designation rule.

- $\varphi$ — the **prescribed form**: a finite closure-rule subsystem $\mathcal{S}_\varphi \subset \mathcal{S}_{\mathrm{op}}$ specifying what correct enactment consists in.
  The prescribed form is a standing normative specification — it exists in the operations settling regardless of whether any leitourgos has yet acted. $\varphi$ is *not* a general contribution to a common fund; it is a definite specification with a binary satisfaction condition (the form-enactment predicate, below).

- $C$ — the **witnessing community**: not a pre-existing assembly but the entity constituted by a coherent family of witnessing observations. $C$ exists as a unified entity at history $\tau$ iff the witnessing increments produced by local observers form a compatible family in the [d-frame-valued-sheaf](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/d-frame-valued-sheaf.md) structure on the operations settling — i.e., the local witnesses agree on their overlapping domains and gather into a global witnessing record.
  Before the compatible family gathers, there are local observers but no community.

- $\iota$ — the **discharge proposition**: the predication cell $\langle \lambda, \texttt{discharged}, \Lambda\rangle$ whose settlement determines whether the leitourgia has been fulfilled. $\iota$ is distinct from $\varphi$: the prescribed form $\varphi$ specifies what correct enactment consists in; $\iota$ is the contingent record that $\lambda$ has actually enacted $\varphi$ before $C$.

## The two required predicates

Full discharge is the joint affirming settlement of two predicates over the discharge proposition $\iota$:

- **Form-enactment predicate** $\mathrm{fe}(\Lambda)$: the cell $\langle \iota, \texttt{form-enacted}\rangle$.
  Settles when accumulated witnessing records establish that $\lambda$ performed $\varphi$ correctly before a gathered community $C$.
  This is the *backward* predicate — past-sensitive, evidence-accumulating.
  It corresponds to the bigraded common-knowledge dimension tracking past-shared belief: the community's accumulated witnessing is the formal analog of past-settled common knowledge.

- **Forward-stability predicate** $\mathrm{fs}(\Lambda)$: the cell $\langle \iota, \texttt{forward-active}\rangle$.
  Settles when the discharge carries forward into all continuations of the settling — no successor history will call on $\lambda$ to discharge what is already discharged.
  This is the *forward* predicate — future-reaching, once established never retracted by settling-monotonicity.

The two predicates are the leitourgia's realization of the [office-as-double-settlement](office-as-double-settlement.md) structure: recognition (backward) and induction (forward) are the office's required predicates; form-enactment and forward-stability are the leitourgia's.
The structural parallel is exact: both require a bigraded settlement of two independent predicates, each on a different cohomological axis.

## Incumbency states of the leitourgia

| $v(\mathrm{fe}(\Lambda))$ | $v(\mathrm{fs}(\Lambda))$ | Discharge state |
|---|---|---|
| $\bot$ | $\bot$ | **Designated / pending** — obligation exists, service not yet rendered |
| $\mathbf{t}$ | $\bot$ | **Form-enacted only** — past community has recognized correct enactment; not yet forward-active; the discharge has not propagated into continuations |
| $\bot$ | $\mathbf{t}$ | **Forward-active only** — all continuations carry the discharge; anomalous, as form-enactment must ordinarily precede forward-stability |
| $\mathbf{t}$ | $\mathbf{t}$ | **Fully discharged** — past-recognized and future-inherited; the service is permanently complete |
| $\mathbf{f}$ in either | — | **Failed enactment** or **stability-denied** — normative repair condition |
| $\top$ in either | — | **Contested** — conflicting witnesses; adjudication required |

## Personal cost as irreversibility

The enactment step that settles $\langle \iota, \texttt{form-enacted}\rangle$ from $\bot$ to $\mathbf{t}$ is *structurally irreversible*: by [settling-monotonicity](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), cells only move upward in the knowledge order; the form-enactment cell, once at $\mathbf{t}$, cannot return to $\bot$.
The witnessings $\lambda$ produces are committed; the resources expended to perform $\varphi$ correctly are spent.
This irreversibility is the formal correlate of the leitourgos's personal cost: not a contingent expenditure but a structural consequence of the step.

## Connection to the non-Hohfeldian governance traditions

The leitourgia is one of the non-Hohfeldian governance patterns catalogued in [non-hohfeldian-governance-traditions](teaching/explanations/non-hohfeldian-governance-traditions.md).
It differs from Hohfeldian governance in that the obligation arises from positional designation rather than from explicit normative imposition on an individual, and discharge is constituted by communal witnessing rather than by bilateral acknowledgment.
The leitourgia's community-constitution mechanism (compatible witnessing family → gathered community) has no direct Hohfeldian analog but maps onto the [bigraded-common-knowledge](../../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bigraded-common-knowledge.md) structure — see [community-constitution-as-sheaf-descent](../theorems/community-constitution-as-sheaf-descent.md).
