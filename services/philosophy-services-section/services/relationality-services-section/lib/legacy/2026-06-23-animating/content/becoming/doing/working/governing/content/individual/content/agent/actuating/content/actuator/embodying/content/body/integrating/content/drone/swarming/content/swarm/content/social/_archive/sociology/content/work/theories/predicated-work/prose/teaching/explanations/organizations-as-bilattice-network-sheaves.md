---
type: narrative
status: draft
discusses:
  - operations-settling
  - multi-agent-work-as-crdt
  - agent-team-as-bilattice-network-sheaf
  - capability-grant-as-base-change-along-grant-inclusion
  - witness-network-propagation-as-fibration-comonad-descent
  - adjudication-modes-and-h1
  - three-formalisms-of-work
introduces:
  - organizations-as-bilattice-network-sheaves
  - organizational-consensus-as-global-section
  - disagreement-as-consistency-failure
  - coordination-cost-as-cohomological-obstruction
  - organizational-falsifiability-contract
---

# Organizations as bilattice network sheaves

This narrative states the organizational reading of the [bilattice-substrate](./three-formalisms-of-work.md) chart of work as a positive, testable model.

A working organization can be presented as a tuple

$$ \mathcal{O} = (B_{\mathrm{op}}, \mathcal{S}_{\mathrm{op}}, U, G, \chi, \mathcal{E}^c, \mathcal{W}, A) $$

where:

- $B_{\mathrm{op}}$ is the operations base;
- $\mathcal{S}_{\mathrm{op}}$ is the closure-rule system;
- $U = (u_\tau)$ is the event-log increment sequence;
- $G$ is the agent-or-office communication graph;
- $\chi$ assigns each channel its carried cell-types;
- $\mathcal{E}^c$ is the capability fiber bundle;
- $\mathcal{W}$ is the witness-network fibration;
- $A$ records the organization's adjudication operations and resolution kinds.

From these data, predicated-work constructs an [operations settling](../objects/operations-settling.md), a bilattice network sheaf over the incidence poset of $G$, capability base-change operations over $\mathcal{E}^c$, and witness-descent data over $\mathcal{W}$.
The construction produces observable outputs: consensus cells, disagreement cells, coordination-free work regions, capability-composition anomalies, witness-propagation failures, inconsistency latency, and adjudication signatures.

The model is falsifiable.
If the specified data are available, the model predicts definite cell-level outcomes.
A replayed event log under fixed closure rules must regenerate the same operational valuation.
A predicted consensus cell must restrict consistently along the relevant channels.
A predicted disagreement cell must be visible as a bilattice consistency failure among local valuations.
A work region predicted coordination-free must produce the same closed state under independent local execution and coordinated execution.
A predicted grant-composition anomaly must exhibit order dependence.
A predicted descent-clean witness propagation must glue across overlaps.
A predicted persistent contradiction must remain visible in the appropriate first cohomology class until an adjudication mode collapses it.

The claim is therefore not a metaphor about organizations.
It is a construction recipe with tests.

## Construction recipe

Given an organization $\mathcal{O}$, build its predicated-work presentation in seven steps.

First, replay the event log $U$ against the closure-rule system $\mathcal{S}_{\mathrm{op}}$.
At each stage, merge the increment into the current valuation by knowledge join and apply closure.
This yields the operations settling

$$ v^{\mathrm{op}} = (v^{\mathrm{op}}_\tau)_{\tau < \lambda}. $$

The resulting valuation is the organization's operational state at stage $\tau$.
The same initial state, same event log, and same closure rules must compute the same valuation.
Replay determinism is the first test of the model.

Second, assign each vertex $v \in G$ a local operations settling $V_G(v)$.
Vertices may be agents, offices, teams, or other operational observers, provided they carry local valuations over the operations base.

Third, assign each channel $e \in G$ a restricted channel valuation $V_G(e)$ by applying $\chi(e)$: the channel carries the cells its type permits.
Office-membership channels carry office and deontic-profile cells.
Paired-role channels carry correlative jural cells.
Session channels carry session-record cells.
Cadence channels carry recurrence and cycle-boundary cells.
Other channel types may be added by specifying their carried cell-types.

Fourth, assemble the vertex and channel valuations into the bilattice network sheaf $\mathbb{F}_{V_G}$ on the incidence poset $\hat G$.
Restriction maps send vertex valuations to channel valuations by projecting to the channel's carried cells.

Fifth, compute consensus as

$$ \mathbb{F}_{V_G}^{\mathrm{cons}} = H^0(\hat G, \mathbb{F}_{V_G}). $$

A cell belongs to consensus exactly when it survives the relevant channel restrictions as a compatible global section.

Sixth, compute disagreement by taking the bilattice knowledge join of local valuations and reading the cells where the d-frame consistency relation fails.
These cells are the organization's open governance items for that communication topology.

Seventh, compute operational obligations from the additional structures.
Capability questions are evaluated in $\mathcal{E}^c$ by base change and adjoints.
Witness propagation questions are evaluated as descent data in $\mathcal{W}$.
Adjudication questions are evaluated by tracking whether resolution operations collapse, preserve, or leave open the corresponding first cohomology classes.

The output is an organizational profile:

$$ \mathrm{Profile}(\mathcal{O}) = (H^0, D_{\mathrm{con}}, K_{\mathrm{coord}}, BC_{\mathrm{cap}}, H^1_{\mathrm{wit}}, A_{\mathrm{sig}}) $$

where $H^0$ records consensus, $D_{\mathrm{con}}$ records consistency-failure cells, $K_{\mathrm{coord}}$ records coordination obstructions, $BC_{\mathrm{cap}}$ records capability base-change failures, $H^1_{\mathrm{wit}}$ records witness-descent failures, and $A_{\mathrm{sig}}$ records the adjudication signature.

## Prediction 1: event-log replay computes organizational state

The operations event log is an increment sequence.
A witnessed completion, dispatch claim, grant, revocation, adjudication, observation, or contradiction is an increment $u_\tau$.
The closure-rule system determines what follows from each increment.
Replaying the increment sequence from the same initial valuation computes the same operations settling.

This gives the first positive prediction:

> If two replicas share the same initial valuation, same event-log increments, and same closure-rule system, then after merge-and-close convergence they compute the same operations valuation.

A failure of this prediction has a small number of meanings: the replicas did not receive the same increments, the closure-rule systems differ, the merge operation is not the bilattice knowledge join, closure is not deterministic, or the claimed operations settling has been incorrectly specified.

This is the operational basis for auditability.
An audit is not only a retrospective report.
It is a recomputation of the organization's state from its recorded increments and declared closure rules.

## Prediction 2: consensus is computable as a global section

Consensus is the degree-zero cohomology of the team sheaf.
This gives a positive test:

> A cell is in organizational consensus exactly when its local values restrict compatibly through every channel that carries that cell.

This does not depend on subjective reports of agreement.
It depends on the gluing behavior of local valuations over the communication topology.

The test is concrete.
Choose a cell $\phi$.
Determine the vertices whose local valuations mention $\phi$.
Determine the channels that carry $\phi$.
Restrict the vertex valuations along those channels.
If the restrictions agree in the bilattice d-frame, $\phi$ contributes to $H^0$.
If they fail the consistency relation, $\phi$ is not consensus; it belongs to the disagreement locus.

This predicts that changing the communication topology can change consensus without changing any individual agent's local belief.
Adding, removing, or retyping a channel changes the cover on which $\phi$ must glue.
Therefore the model predicts cases where a team has the same agents and same local valuations but a different consensus state after a channel change.

## Prediction 3: disagreement localizes to consistency-failure cells

Disagreement is the locus where local valuations cannot be joined into a consistent d-frame value.
The positive prediction is:

> Each operational disagreement has a cell support: a finite or otherwise specified set of cells whose bilattice join fails consistency across the relevant agent-channel cover.

The disagreement is therefore localizable.
For any claimed organizational conflict, the model asks for the cell or cell-family on which the conflict lives.
If no such cell support can be found, then the conflict is not represented in the current operations settling.
The model may be missing predicates, witnesses, channels, or closure rules.

When the cell support exists, the model predicts the available interventions.
The organization can change the local valuations by adding increments.
It can change channel restrictions by changing the topology or cell-carrying assignment.
It can adjudicate the contradiction.
It can preserve the contradiction as acknowledged.
Each intervention produces a different predicted change in the disagreement locus.

This makes disagreement diagnostic.
A persistent disagreement over the same cell after repeated communication indicates that communication volume is not the limiting factor.
The limiting factor is a non-gluing cell-pattern, a channel restriction, an unresolved witness conflict, or an adjudication choice.

## Prediction 4: coordination cost is a gluing obstruction

The [multi-agent-work-as-crdt](../theorems/multi-agent-work-as-crdt.md) theorem gives the convergence result for distributed work.
The positive organizational prediction is:

> A work region is coordination-free exactly when independent local execution and coordinated execution compute the same closed valuation on that region.

Equivalently, the connecting morphisms for the relevant restricted sheaf vanish.
When they do not vanish, the nonzero class identifies the cells that require coordination.

This is testable by replay.
Run the local increments independently, merge them, close, and compare the result to a coordinated execution order.
If the closed valuations agree on the region, the region is coordination-free under the given closure rules.
If they differ, the difference is the coordination obstruction.

This predicts that coordination requirements are not uniformly distributed across a plan.
A plan may contain a large coordination-free subregion and a small obstruction locus.
The model therefore recommends local coordination at obstruction cells, not global synchronization across the whole team.

It also predicts that some apparent process problems are topology problems.
If independent work repeatedly produces non-gluing states at the same cells, the team should inspect the cover and channel assignments for those cells.
More meetings may not change the obstruction.
A different channel, a different carried-cell assignment, or a changed closure rule may.

## Prediction 5: capability anomalies are base-change failures

A capability grant has a parameter stratum, an agent index, a capability type, and a bundle operation.
Grant, restrict, revoke, and delegate are different base-change-and-adjoint constructions on the capability fiber bundle.

The positive prediction is:

> Two capability operations commute exactly when the relevant Beck-Chevalley square satisfies the required commutation condition.

When the square commutes, applying the grants in either order produces the same capability cell-pattern.
When the square fails, order matters.
The observed practitioner phenomenon is a capability-composition anomaly: the same apparent set of grants yields different operational availability depending on the order, overlap, or parameter-stratum shape.

This is testable.
Specify two grant operations.
Construct their parameter strata and bundle restrictions.
Apply them in both orders to the same initial capability valuation.
If the results differ, the model predicts a Beck-Chevalley failure.
If the relevant square is claimed to commute and the results differ, the square or the capability presentation has been specified incorrectly.

The model also distinguishes deletion from revocation.
Deletion removes a grant cell.
Revocation asserts an absence pattern over a parameter stratum by the right adjoint.
Therefore deletion and revocation make different predictions about future attempts to reassert the capability.
A revoked capability should block conflicting reassertion in the stratum; a deleted capability supplies no such universal absence claim.

## Prediction 6: witness propagation is descent data

A witness statement enters a local witness cell-system and travels through the organization's communication topology.
The witness-network fibration records local witness stores over that topology.
A propagation protocol constructs descent data.

The positive prediction is:

> A propagated witness becomes a globally consistent operational cell-pattern exactly when its descent data satisfies the cocycle condition on overlaps.

If a witness travels along two paths and arrives with incompatible cell-patterns, the model records the failure as a first cohomology class of the witness-network sheaf.
The class is the substrate content of the propagation failure.

Different protocols make different predictions.
Broadcast should be descent-clean when its transition functions are identity-like and all required nodes are reached.
Gossip can produce path-dependent cocycle failure when different propagation paths compose differently.
Consensus forces a representative before incorporation.
Eventual consistency allows nontrivial classes to accumulate and later adjudicates them.

This gives a measurable inconsistency latency:

$$ \ell_{\mathrm{inc}}(w) = \min \{ \tau' > \tau : [w]_{H^1}(\tau') = 0 \} $$

when the class eventually trivializes.
If it never trivializes, the organization is operating with a standing witness-propagation class.
That may be an intended pluralist design or a governance failure, depending on the adjudication signature and the organization's function.

## Prediction 7: adjudication signature classifies contradiction practice

Contradicted cells have resolution trajectories.
The [adjudication-modes-and-h1](../theorems/adjudication-modes-and-h1.md) theorem distinguishes affirm, retract, and acknowledge.

The positive prediction is:

> Affirm and retract resolutions collapse the relevant first cohomology class; acknowledge resolutions preserve it as adjudicated-standing; unadjudicated contradictions remain open.

This yields an adjudication signature

$$ A_{\mathrm{sig}} = |K_{\mathrm{cleared}}| : |K_{\mathrm{ack}}| : |K_{\mathrm{open}}|. $$

The signature classifies how the organization handles contradiction in practice.
A high cleared fraction indicates a practice oriented toward classical decidability.
A high acknowledged fraction indicates a practice that preserves standing contradiction as part of its operational substrate.
A high open fraction indicates accumulation without resolution trajectory.

The signature is falsifiable against the event log.
Each adjudication increment declares or implies a resolution kind.
Each resolution kind predicts a cohomological effect.
If an affirm or retract event leaves the class nontrivial without a later superseding contradiction, either the adjudication was not actually an affirm/retract in the substrate sense, the cell support was misidentified, or the theorem's hypotheses fail in that case.
If an acknowledge event collapses the class, the acknowledge operation was implemented as a clearing operation, not an acknowledgement.

## Prediction 8: organizational form has a computable signature

A communication topology and channel-typing determine which local valuations can glue, which witness paths can fail descent, and which cells are exposed to which agents or offices.
Organizational form therefore has a computable signature.

The positive prediction is:

> Changing the topology or channel cell-type assignment changes at least one of: consensus reachability, disagreement localization, coordination obstruction, witness-propagation latency, or capability transport behavior, unless the change is invisible to the cells carried by the affected channels.

This gives a concrete test for restructures.
A claimed restructure should specify what changed in $G$, $\chi$, $\mathcal{S}_{\mathrm{op}}$, $\mathcal{E}^c$, $\mathcal{W}$, or $A$.
If none of these change, the restructure is substrate-invisible.
If some change, the model predicts the affected observables.

For example, turning a star topology into a mesh should change the path structure for witness propagation.
It may reduce central bottlenecks while creating more overlap conditions.
Splitting an office should change capability propagation and channel restrictions.
Adding a cadence channel should introduce recurrence cells and cycle-boundary witnesses.
Merging two offices should change authority/capability fibers and may create Beck-Chevalley obligations for the merged parameter strata.

The organization can then compare prediction to observed replay.
If the new topology predicts lower inconsistency latency for a witness class but the latency does not change, the model is missing a channel restriction, a closure rule, or an actual operational dependency.

## Falsification contract

The model should be treated as wrong, underspecified, or inapplicable when its predictions fail under declared data.
The following failures are especially important.

| Prediction | Falsifier | Likely diagnosis |
|---|---|---|
| Replay determinism | Same initial state, same increments, same closure rules produce different valuations | merge/closure implementation is nondeterministic, increments differ, or the structure is not an operations settling |
| Consensus as $H^0$ | A predicted consensus cell fails restriction compatibility on a carrying channel | channel assignment, local valuation, or sheaf construction is wrong |
| Disagreement localization | A claimed disagreement has no cell support in the operations settling | missing predicate, missing witness, missing channel, or conflict outside this model |
| Coordination-free region | Independent and coordinated execution produce different closed valuations | nonzero obstruction was missed or closure rules were underspecified |
| Coordination obstruction | A predicted obstruction never affects execution under any replay or cover refinement | obstruction class is spurious or not operationally coupled |
| Capability commutation | Predicted commuting grants are order-dependent | Beck-Chevalley hypotheses fail or capability strata were misdrawn |
| Capability anomaly | Predicted noncommuting grants commute across all relevant states | square may commute after all, or anomaly predicate is too coarse |
| Descent-clean witness propagation | Cocycle holds but propagated local cells disagree | witness fibration or transition maps are wrong |
| Descent failure | Cocycle fails but no inconsistency class appears | inconsistency sheaf is missing cells or propagation did not enter the operations settling |
| Acknowledged contradiction | Acknowledge collapses the class | implementation used affirm/retract semantics |
| Cleared contradiction | Affirm/retract preserves the class without supersession | cell support or resolution kind was misidentified |
| Restructure prediction | Claimed topology/channel change produces no observable shift | change was substrate-invisible or observables were incomplete |

This table is part of the narrative's content.
Predicated-work is strongest when it makes failure informative.
A failed prediction should force one of four responses: add missing predicates, correct the topology, revise closure rules, or restrict the theorem's domain.

## Operational use

To apply the model to a concrete working community, construct the following record set:

1. the operations base and predicate vocabulary;
2. the closure-rule system;
3. the event-log increment schema;
4. the current event log;
5. the agent/office graph;
6. the channel-type assignment $\chi$;
7. the capability bundle and grant/revoke/delegate records;
8. the witness-network fibration and propagation protocol;
9. the adjudication modes and their event-log representation;
10. the target observables: consensus cells, disagreement cells, coordination-free regions, grant anomalies, witness latency, adjudication signature.

Then run the construction.
The output should not be a prose diagnosis first.
It should be a profile of cells, classes, and predicted behaviors.
Prose interpretation comes after the profile.

The practical payoff is that organizational problems become typed.
A failure of agreement may be a consensus-gluing failure.
A recurring coordination tax may be a nonzero connecting morphism.
A permission bug may be a Beck-Chevalley failure.
A rumor spiral may be descent failure in the witness network.
A persistent dispute may be an acknowledged first cohomology class.
A failed restructure may be substrate-invisible.

Each diagnosis suggests a different intervention.
Add an increment.
Change a closure rule.
Retype a channel.
Add or remove a witness path.
Split a parameter stratum.
Replace deletion with revocation.
Move a contradiction from open to acknowledged.
Collapse a class by affirming or retracting.
The theory is useful when it predicts which intervention changes which observable.

## Position in the program

This narrative extends [three formalisms of work, one structure](./three-formalisms-of-work.md) by giving the bilattice-substrate chart a positive organizational model.
The earlier narrative explains why predicated-work keeps multiple presentations.
This narrative specifies what the bilattice network-sheaf presentation computes.

It also fixes the relation to predicated-governance.
Predicated-governance supplies the normative substructure: offices, jural relations, authority, delegation, succession, revocation, waiver, ratification, and related operations.
The present narrative uses that substructure where it appears in channels, capability fibers, and adjudication, but its object is the broader organization as an operations settling over a communication topology.

The next step is implementation-facing: define a minimal record schema that can instantiate $\mathcal{O}$ for a real repository, team, or agentic orchestration system; compute $H^0$, disagreement loci, coordination obstructions, capability base-change failures, witness first cohomology classes, and adjudication signatures; then compare those predictions against replayed operational records.

## Status

Draft narrative.
The load-bearing formal statements remain in [multi-agent-work-as-crdt](../theorems/multi-agent-work-as-crdt.md), [agent-team-as-bilattice-network-sheaf](../theorems/agent-team-as-bilattice-network-sheaf.md), [capability-grant-as-base-change-along-grant-inclusion](../theorems/capability-grant-as-base-change-along-grant-inclusion.md), [witness-network-propagation-as-fibration-comonad-descent](../theorems/witness-network-propagation-as-fibration-comonad-descent.md), and [adjudication-modes-and-h1](../theorems/adjudication-modes-and-h1.md).
The narrative should be revised as those theorem files are tightened, especially around descent-cleanliness hypotheses, higher cohomology vanishing, and witness-generated first cohomology independence.
