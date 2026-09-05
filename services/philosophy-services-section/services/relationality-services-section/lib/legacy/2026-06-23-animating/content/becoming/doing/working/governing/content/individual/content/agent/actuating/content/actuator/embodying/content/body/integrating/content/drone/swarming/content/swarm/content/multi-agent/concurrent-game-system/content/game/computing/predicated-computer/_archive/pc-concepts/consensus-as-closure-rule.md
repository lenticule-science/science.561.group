---
type: concept
class: substrate
status: sketch
depends-on: [closure-rule, federation, witness, lamport1998, ongaro-ousterhout2014]
see-also: [federation-as-substrate-join, federation-convergence, causal-history-as-witness-chain]
---

# Consensus as closure rule

The platform's reformulation of *distributed-systems consensus* (Paxos at [lamport1998](references/lamport1998.md), Raft at [ongaro-ousterhout2014](references/ongaro-ousterhout2014.md)): a consensus protocol that selects a single agreed value among a quorum of substrate participants is realized as a substrate-content runbook whose validity is enforced by closure rules over the substrate's predication graph.

The classical view: a consensus protocol is a separate state machine running over a network of process replicas, with its own message format (prepare / accept / commit, request-vote / append-entries / heartbeat), its own internal state (proposal numbers, ballot history, leader / follower role), and its own crash-recovery procedure. The protocol's correctness rests on a state-machine invariant (any value committed in a higher round is consistent with values committed in lower rounds; the leader has all previously-committed entries) maintained by the protocol's transition rules.

The platform's reformulation: consensus is a *substrate-content runbook* whose steps are skill invocations producing substrate predications, with closure rules over the substrate enforcing the consensus invariant. Three structural identifications:

- **Proposer / acceptor / leader / follower** ↔ substrate agents carrying *role* predications. The role predications make the agent's consensus participation visible to dispatch (an agent without a current `acceptor-role` predication will not be dispatched as an acceptor).
- **Proposal / vote / commit message** ↔ substrate predications on message entities, witnessed in the event log per the substrate's normal admission discipline. The "prepare" step of a Paxos round is a skill invocation that admits a `prepare-proposal` predication; acceptors observe the predication through dispatch and emit `vote` predications.
- **Consensus invariant** ↔ a closure rule over the substrate's predication graph. The Paxos invariant ("any value chosen in a higher round is consistent with values chosen in lower rounds") becomes a closure rule that fires when conflicting `chosen-value` predications would be admitted, producing $\top$ at the contested cell — a substrate-level signal that the protocol's invariant has been violated and that subsequent runbook steps must repair.
- **Quorum** ↔ a count predication over the substrate's `vote` predications: a `chosen-value` predication is admittable iff the substrate's count of compatible `vote` predications meets the quorum threshold. The threshold check is itself a substrate-content closure rule, editable through normal substrate operations.

Three engineering consequences:

- **Consensus runs over the substrate's federation, not separately.** Two substrates participating in a consensus runbook exchange their `vote` and `chosen-value` predications through the substrate's normal federation merge. There is no separate consensus message-bus.
- **Consensus state is auditable substrate content.** The full history of a consensus run is in the substrate's witness chain: which agents proposed which values, which acceptors voted for what, when each round began and ended, why each value was chosen. Auditing a consensus run is a substrate traversal.
- **Consensus protocols compose with governance and authorization.** An agent without the `acceptor-role` predication (or whose authorization fiber doesn't admit acceptor capability) is filtered out of the protocol at dispatch time. Governance constraints on which agents can propose, vote, or commit are substrate predications enforced by the same authorization discipline that handles every other substrate operation.

The concept is *sketch* status: it names the relationship between distributed-consensus protocols and the substrate's closure-rule + runbook discipline so the [upstream-substrate-coordination](teaching/explanations/upstream-substrate-coordination.md) narrative has an atomized referent. A theorem-level statement — that a substrate runbook implementing the Paxos or Raft step structure is bisimilar to the corresponding state-machine consensus protocol on the same input message sequence — is left for follow-up work.
