---
type: object
class: governance-pattern
status: draft
depends-on: [jural-relation, operations-settling, rotational-authority, consensus-closure, novation]
realizes: [andean-ayllu-governance, ayni-reciprocal-exchange, minka-collective-labor]
---

# Ayni Reciprocity

A governance-pattern object modeling the *reciprocal-labor-exchange* substrate of the Andean ayllu — the indigenous communal organizing form found across Quechua, Aymara, and related communities in the Andes. The ayllu's [rotational-authority](rotational-authority.md) object covers leadership rotation; this object covers the *exchange and obligation* substrate that makes the ayllu's work life possible.

The predicated-governance program treats this as a distinct governance-pattern fragment: the ayni reciprocity pattern defines a specific closure-rule subsystem, a specific cell vocabulary, and a structural logic that differs measurably from the Hohfeldian claim/duty pattern.

## Two components: ayni and minka

The ayllu operates two reciprocal-labor forms:

**Ayni** (*ayni* in Quechua): bilateral labor exchange between households or individuals. When A provides labor to B, an ayni-debt cell is created:

$$\langle B, \texttt{owes-ayni-to}, A\rangle = \mathbf{t}.$$

The debt is discharged when B provides equivalent labor to A, creating the return-witness cell:

$$\langle B, \texttt{ayni-discharged-to}, A, \tau\rangle = \mathbf{t}.$$

The discharge retires the debt cell by installation of the discharge-witness, not by retraction of the debt cell (settling-monotonicity holds throughout). The historical record shows the debt existed and was discharged.

**Minka** (*minka* in Quechua): collective labor obligation for community projects — roads, terraces, ceremonial work, mutual aid. The ayllu's governance layer asserts a minka-obligation cell over the polity:

$$\langle \mathrm{Pop}, \texttt{owes-minka-for}, \mathrm{Project}\rangle = \mathbf{t}.$$

Individual contribution is allocated by a distribution rule within the polity's closure-rule subsystem. Unlike ayni (bilateral, between individuals), minka obligation is asserted by collective governance and discharged by collective participation. The [novation](../morphisms/novation.md) object formalizes the three-party structure by which the polity collectively takes on obligation that would otherwise fall on individual members.

The work-type implications of minka — whether it constitutes a distinct category of obligation on the operations-settling — are examined in the predicated-work open question [minka-collective-labor-as-work-type](../questions/minka-collective-labor-as-work-type.md).

## Structural contrast with Hohfeldian claim/duty

The Hohfeldian claim/duty pair (from [jural-relation](../objects/jural-relation.md)) is *asymmetric*: $Q$ holds the claim; $P$ bears the duty; the structure is directional and unequal in standing. Enforcement of the duty is exercised by $Q$'s power.

Ayni is *symmetric* and *relational*: both A and B accumulate and discharge debts; the substrate tracks mutual obligation history, not a hierarchy of holder and obligor. The enforcement mechanism is not a power-exercise by one party but a community-held record of reciprocal standing. A household with persistent unpaid ayni-debts loses *community standing* — a governance-pattern consequence distinct from Hohfeldian enforcement (which activates the claim-holder's power).

The bilattice treatment: ayni debts are cells over the `owes-ayni-to` predicate on the agent pair. Multiple debts between A and B accumulate as a *debt-graph* over the pair; discharges settle discharge-witness cells. The net reciprocal standing of A with respect to B is a derived cell — computable from the debt graph but not a primitive — subject to dispute.

## Complementarity as authorization condition

The ayllu makes decisions through a *complementarity* principle: decisions emerge from the balance of complementary positions (commonly organized by complementary opposites such as high-altitude and low-altitude community representatives, or gendered complementary roles — the specific structure varies by community). A decision $\phi$ is authorized for settlement only when:

$$\langle \phi, \texttt{complementary-perspectives-present}\rangle = \mathbf{t}.$$

This authorization condition is distinct from [consensus-closure](consensus-closure.md) (which requires universal alignment) and from majority dispatch (which requires a count above threshold). Complementarity requires the *kinds* of perspectives present, not merely the *number*.

The governance-pattern parameter is the complementarity-structure $\mathcal{K}$: a partition of the polity into complementary pairs or groups, with the authorization condition requiring at least one representative from each group to have participated. The predication-settling treatment: $\langle \phi, \texttt{complementary-perspectives-present}\rangle = \mathbf{t}$ is a derived cell settled by a closure rule that checks participation-record cells against $\mathcal{K}$. Decisions reached without required complementary perspectives receive $\bot$ on this cell, blocking the settlement closure rule.

## Interaction with rotational authority

The ayllu combines ayni/minka with [rotational-authority](rotational-authority.md): leadership rotates while reciprocal obligations persist across rotation cycles. An important structural consequence: a rotating leader's minka decisions bind the polity's reciprocal-debt structure independently of who holds leadership at any given time. Obligation cells are on the polity, not on the incumbent.

This distinguishes the ayllu's governance from systems where the leader's personal relationships constitute the obligation network (a failure mode where leadership change invalidates prior obligations). In the ayllu's substrate: obligations are cells on the polity-as-entity, not on the incumbent-as-person; rotation does not extinguish them.

## Cohomological signature

The ayni-pattern's cohomology differs from the Hohfeldian pattern. Persistent unresolved ayni debts — neither discharged nor explicitly contested — accumulate as $\top$-valued debt cells (both debt and discharge asserted, or both debt and denial asserted). The $H^1$ of the reciprocal-exchange settling measures the obstruction to consistent community standing: zero $H^1$ means all reciprocal obligations are consistently recorded; non-trivial $H^1$ means there are circular or contradictory debt relations that cannot be globally resolved.

## Status and sourcing

This object is constructed from general secondary accounts. The specific complementarity structures $\mathcal{K}$, the debt-discharge protocols, and the dispute-resolution mechanisms vary significantly across Andean communities and require community-authorized sources for accurate substrate parameterization. Formalization of ayni debt dispute resolution — what happens when communities disagree about whether a debt was incurred or discharged — is an open area requiring grounded sourcing.
