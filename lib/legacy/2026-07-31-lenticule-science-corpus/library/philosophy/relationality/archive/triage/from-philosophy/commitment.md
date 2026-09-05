---
title: "Commitment"
id: commitment
description: "A Commitment is a four-tuple (A, φ, τ, P) — an agent A, an act-class φ, a deadline τ, and a principal P — where the commitment proposition c is transfer-nucleus-fixed at the time of creation: the transfer nucleus applied to c equals c. Ten external traditions converge on this structure: Bratman's stability norm and resistance to reconsideration (planning theory); the toxin puzzle's volitional independence condition (Kavka 1983); Austin's commissive illocutionary force with world-to-word direction of fit; Searle's essential condition for promising as undertaking of obligation; Brandom's deontic scoreboard entry (inferentialism); Schelling's commitment device and the credibility paradox (strategic theory); the two-phase commit voting/commit-point distinction (Gray 1978); the saga pattern's compensating transaction structure (Garcia-Molina–Salem 1987); Becker's side-bet mechanism (sociology); and Kiesler's binding coefficient (psychology). Full commitment is the condition where c is an element of the fixed fiber: doubly active, meaning-settled by the saturation nucleus and execution-settled by the transfer nucleus simultaneously. The four lifecycle states — open, discharged, violated, cancelled — map the commitment proposition through its normative career from formation to closure."
minimum-math: relational-history-fiber-transferring-nucleus
component-of: relational-universe
fiber-of: relational-universe
base: t
element-of: relational-history-fiber-heyting-algebra
produced-by: act
requires: [agent, act-class, deadline, principal]
enables: [duty, trust, contract]
governs: discharge
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  agent: person
  act-class: relational-universe
  deadline: relational-history
  principal: person
output: relational-history-fiber-fixed-layer
ast:
  relational-history-transferring-nucleus:
    - agent:
        - act-class
        - deadline
    - principal:
        - act-class
        - agent
---


## Formal definition

A **Commitment** is a four-tuple $(A, \varphi, \tau, P)$:

$$(A : \mathrm{Agent},\; \varphi : \mathrm{ActClass},\; \tau \in T,\; P : \mathrm{Person})$$

where:
- $A$ is the **agent** — the party who commits; $A$ is accountable for discharge
- $\varphi$ is the **act-class** — the type of act $A$ commits to performing; $\varphi$ specifies what counts as discharge (what act satisfies the commitment); it is an act-type, not a specific act
- $\tau \in T$ is the **deadline** — the latest history by which $A$ must have performed an act of type $\varphi$
- $P$ is the **principal** — the party who holds the correlative [Hohfeldian](hohfeldian-position.md) claim-right; $P$ is the right-holder corresponding to $A$'s obligation to perform $\varphi$

The **commitment proposition** $c \in H_{t_0}$ asserts "$A$ performs an act of type $\varphi$ at some history $t_1 \leq \tau$." The creation of the commitment is the act of submitting $c$ for [transfer-nucleus](../math/relational-history-fiber-transferring-nucleus.md) fixation at $t_0$.

**Transfer-settlement condition.** A commitment is *binding* at $t_0$ if and only if:

$$\Delta_{t_0}(c) = c$$

The [transfer nucleus](../math/relational-history-fiber-transferring-nucleus.md) carries $c$ forward without loss: $c$ holds at all histories downstream of $t_0$ until the deadline $\tau$. A commitment that is not transfer-settled is a **mere intention** — present in the fiber but not binding future histories.

**Full commitment** is the condition $c \in H^*_{t_0} = \mathrm{Fix}(\Delta_{t_0}) \cap \mathrm{Fix}(\sigma_{t_0})$: the commitment proposition is also [saturation-nucleus](../math/relational-history-fiber-saturating-nucleus.md)-fixed — meaning-settled as well as execution-settled. Full commitment requires both stages:

| Stage | Nuclear condition | What it gives |
|---|---|---|
| **Endorsed intention** | $\sigma_{t_0}(c) = c$, $\Delta_{t_0}(c) \neq c$ | Meaning settled but not execution-stable — acknowledged but not carried forward into downstream histories |
| **Transfer-settled commitment** | $\Delta_{t_0}(c) = c$, $\sigma_{t_0}(c)$ may or may not equal $c$ | Execution-stable, propagated into all downstream histories; may lack full meaning-settlement |
| **Full commitment** | $c \in H^*_{t_0}$ | Both stages complete — meaning-settled and execution-settled simultaneously |

**Discharge.** The commitment is discharged at $t_1 \leq \tau$ when $A$ performs an act of type $\varphi$ at $t_1$ and the performance is fully settled: $\mathrm{Gap}_{t_1}(\varphi') = (\varphi', \varphi')$. Discharge terminates the commitment's forward-binding force.

**Institutional akrasia.** A commitment proposition $c$ with $\sigma_{t_0}(c) = c$ but $\Delta_{t_0}(c) \neq c$ is the institutional signature of **akrasia**: the agent has endorsed the commitment (meaning-settled) but it does not carry forward into action (not execution-stable). The gap $\Delta_{t_0}(c) - c > 0$ is the formal measure of commitment-without-follow-through. See [Will](will.md).

## Correspondence table

Ten external doctrines, each with a precise internal rendering:

| External doctrine | Source | Internal construct |
|---|---|---|
| **Stability norm** — plans are rationally resistant to reconsideration; non-reconsideration is the default option | Bratman, *Intention, Plans, and Practical Reason*, Harvard, 1987, Chs. 2, 4 | Transfer-settled $c$: maintaining the commitment costs zero; exiting it requires the agent to produce a crossing of the gap $\Delta_t(c) - c$ |
| **Toxin puzzle volitional independence** — one cannot form a genuine intention to do A while knowing one will not do A when the time comes | Kavka, "The Toxin Puzzle," *Analysis* 43(1): 33–36, 1983 | Genuine transfer-settlement cannot be formed at $t_0$ when the agent's best response at $t_1 \leq \tau$ is violation; transfer-settlement is volitionally independent of ex-post instrumental recalculation |
| **Commissive illocutionary force** — a commissive speech act commits the speaker to a future course of action with world-to-word direction of fit | Austin, *How to Do Things with Words*, Oxford, 1962, Lecture XII, pp. 150–163 | Transfer-settled speech act: the commissive utterance submits $c$ for $\Delta$-fixation; the utterance is the commitment-creation event |
| **Essential condition for promising** — the speech act counts as the undertaking of an obligation; the sincerity condition is genuine intention | Searle, *Speech Acts*, Cambridge, 1969, pp. 57–61; *Expression and Meaning*, Cambridge, 1979, pp. 1–29 | Essential condition = transfer-settlement creation; sincerity condition = $\sigma_{t_0}(c) = c$; insincere promise = transfer-settled without saturation-settlement (execution-stable without meaning-settled) |
| **Deontic scoreboard entry** — committing places an item on the speaker's deontic score, publicly attributable and dischargeable | Brandom, *Making It Explicit*, Harvard, 1994, Ch. 3, pp. 141–198 | Transfer-settled $c$ is a public deontic score entry: it can be attributed by $P$, acknowledged by $A$, and challenged by third parties; discharge clears the entry |
| **Commitment device** — removing one's own future options makes a threat or promise credible; commitment is credible because it is structurally irrevocable | Schelling, *The Strategy of Conflict*, Harvard, 1960, Chs. 2–3 | Transfer-settlement as irrevocability operator: the act of $\Delta$-fixing $c$ removes $\neg c$ from the set of forward-reachable propositions; burning bridges = restricting the stepping map's range |
| **Time inconsistency** — a policymaker with discretion cannot credibly commit to future restraint; the optimal plan under commitment is unavailable under discretion | Kydland & Prescott, *Journal of Political Economy* 85(3): 473–491, 1977 | $\Delta_t(c) = c$ is unavailable under discretion: $c$ is revisable at each history; credible commitment requires removing the defection action from the stepping map, not merely announcing intent |
| **Two-phase commit point** — the coordinator's forcing of the commit log record is the irrevocable transition; before the force, abort is possible; after, commitment propagates to all participants | Gray, "Notes on Database Operating Systems," LNCS 60, Springer, 1978, pp. 393–481 | The transfer-settlement event is the commit point: forcing the commit record makes $\Delta_{t_0}(c) = c$ durable; the voting point (participant writes prepare record) is transfer-settled-but-not-yet-propagated |
| **Side-bet mechanism** — commitment arises when accumulated stakes make abandoning a course of action costly independent of its current value | Becker, "Notes on the Concept of Commitment," *American Journal of Sociology* 66(1): 32–40, 1960 | Each downstream history $t_k$ accumulates side-bet cost at each step; commitment robustness grows with the depth of the transfer-settled sub-site |
| **Binding coefficient** — commitment strength increases with explicitness, publicity, irrevocability, importance, and freedom of the act | Kiesler, *The Psychology of Commitment*, Academic Press, 1971 | Transfer-nucleus fixation degree: weak commitment = $\Delta_t(c) = c$ over a narrow sub-site; strong commitment = $\Delta_t(c) = c$ across all of $T_{\leq \tau}$; the binding coefficient is the scope of the transfer-fixed sub-site |

## The planning tradition: Bratman's stability norm

Michael Bratman's planning theory (*Intention, Plans, and Practical Reason*, Harvard, 1987) establishes that future-directed intentions are not merely strong desires — they are **conduct-controlling pro-attitudes** that exhibit characteristic stability under reconsideration pressure. Three functional properties distinguish intentions from desires (Bratman 1987, p. 20):

1. **Conduct control**: an intention directs and guides behavior; an agent is disposed to act on it absent countervailing force.
2. **Stability/inertia**: intentions exhibit rational resistance to reconsideration. "Retention of my prior intention and nonreconsideration is, so to speak, the 'default option'" (Ch. 4).
3. **Input to practical reasoning**: intentions function as settled premises in deliberation about means and scheduling; they are not open options to be re-evaluated at each step.

The **stability norm** is the functional content of what transfer-settlement adds over mere fiber-membership: $c \in H_{t_0}$ is an intention; $\Delta_{t_0}(c) = c$ is a commitment. Non-reconsideration costs zero; departing from $c$ requires producing an act that changes the downstream fiber state. Bratman's two rationality norms on plans — overall consistency (agglomerativity: all intentions must be jointly co-realizable) and means-end coherence (intending an end requires intending necessary means) — both operate on the transfer-settled sub-lattice of $H_{t_0}$.

**The toxin puzzle** (Kavka, *Analysis* 43(1), 1983) reveals a structural property of genuine transfer-settlement. A toxin-drinking agent who knows at $t_0$ that at $t_1$ the best response is to not drink cannot genuinely form $\Delta_{t_0}(c) = c$ at $t_0$ — because genuine transfer-settlement is unconditional forward-propagation, not a conditional that collapses under instrumental recalculation. Kavka: "one cannot intend what one will not do" (p. 35). This establishes **volitional independence**: transfer-settlement is not a confident prediction that one will act on $c$; it is a forward-stability of $c$ that is not defeasible by ex-post calculation. A rational agent who cannot form unconditional transfer-settlement needs a Schelling commitment device — an external mechanism that removes the defection option.

**Bratman's two faces of intention** ("Two Faces of Intention," *The Philosophical Review* 93(3): 375–405, 1984) distinguish the prospective/planning face (future-directed intention as a plan element — the locus of transfer-settlement) from the agential/action-characterizing face (intention-in-action, constitutively tied to ongoing execution). The planning face is where transfer-settlement operates: $\Delta_{t_0}(c) = c$ is formed at $t_0$ and maintained to $t_1$. The agential face is what operates at $t_1$: the agent performs the act *with* the intention of discharging $c$. Both faces are required for full commitment: the planning face carries $c$ to the execution point; the agential face completes the discharge.

**BDI architectures** formalize the drop conditions for transfer-settled commitments (Cohen & Levesque, "Intention Is Choice with Commitment," *Artificial Intelligence* 42(2–3): 213–261, 1990; Rao & Georgeff, *Proceedings of KR '91*, Morgan Kaufmann, 1991, pp. 473–484). Cohen and Levesque define a **persistent goal** — the BDI analog of a transfer-settled commitment — as one dropped only when (i) believed achieved or (ii) believed impossible. Rao and Georgeff add a third drop condition for open-minded agents: (iii) the goal is no longer desired. These map directly onto the lifecycle:

| BDI drop condition | Lifecycle state | Nuclear reading |
|---|---|---|
| Believed achieved | Discharged | Performance gap closes: $c \wedge \mathrm{performed}(\varphi)$ enters $H^*_{t_1}$ |
| Believed impossible | Violated | Deadline $\tau$ reached without discharge; $c$ persists as breach record |
| No longer desired (open-minded) | Cancelled | Principal $P$ releases $A$; transfer-settlement explicitly removed |

## The speech act tradition: commissives and the deontic scoreboard

Austin (*How to Do Things with Words*, Oxford, 1962, Lecture XII) identifies **commissives** as the illocutionary category whose point is to commit the speaker to a future course of action (p. 157). The defining illocutionary force is **world-to-word direction of fit**: the speaker commits to bringing the world into conformity with the propositional content, not to describing how the world already is. Commissives include promises, vows, contracts, guarantees, pledges, and offers. Felicity conditions require both the conventional procedure for commitment to exist (Austin's A-rules) and the speaker to genuinely intend the committed act (Gamma-1 rule: sincerity condition). An insincere commissive — a promise made with no intention to keep — is an **abuse** rather than a misfire: the transfer-settlement event occurs (the obligation is undertaken) but the sincerity condition is not met.

Searle's essential condition for promises (*Speech Acts*, Cambridge, 1969, pp. 57–61) is "the utterance counts as the undertaking of an obligation by S to do A." This essential condition is the transfer-settlement creation event. The **sincerity condition** — "S intends to do A" — maps onto $\sigma_{t_0}(c) = c$: the speaker genuinely endorses $c$ (meaning-settled). A promise with sincerity condition met but essential condition misfired is not a commitment; a promise with essential condition executed but sincerity condition absent is transfer-settled without saturation-settlement — execution-stable but meaning-unsettled. Searle's five categories of illocutionary acts (*Expression and Meaning*, Cambridge, 1979, pp. 1–29) place commissives in the world-to-word class alongside directives, distinguishing them from assertives (word-to-world, sincerity condition = belief) by the direction of fit and the resulting normative position.

Robert Brandom's **deontic scoreboard** (*Making It Explicit*, Harvard, 1994, Ch. 3, pp. 141–198) formalizes commitment as a public deontic score entry. When $A$ makes a commissive speech act toward $P$:
- $A$ *undertakes* a commitment: $c$ is entered on $A$'s side of the scoreboard.
- $P$ *attributes* the commitment: $P$'s scoreboard registers $A$ as committed to $c$.
- $A$ is *answerable* for $c$: $A$ can be challenged if $c$ is not discharged by $\tau$.
- Discharge *clears* $A$'s scoreboard entry.

The scoreboard makes commitment a social fact rather than a purely private mental state: what is *attributed* corresponds to the observable transfer-settlement status of $c$; what is *acknowledged* corresponds to $A$'s own act of submitting $c$ for fixation. Brandom's contribution is that the normative force of commitment is constituted by the social practice of scorekeeping — consistent with the relational reading of transfer-settlement as a social fact about the state of $H_{t_0}$.

## The strategic tradition: credible commitment

Schelling's central result (*The Strategy of Conflict*, Harvard, 1960, Chs. 2–3) is that **commitment creates bargaining power by removing options**. A threat or promise is credible only if the threatening or promising party cannot defect ex post. The mechanism — burning bridges, cutting off retreat — is the act of making defection structurally unavailable: the agent transforms $\neg c$ from a reachable proposition to an unreachable one, restricting the range of the stepping map from the commitment history.

The paradox is precise: an agent is made better off by *constraining* their own future choices, because the constraint makes current announcements credible. Schelling's **commitment device** is any action taken in advance that binds future behavior — posting a bond, delegating authority with irrevocable instructions, making public announcements that create social costs for defection. Each mechanism achieves $\Delta_{t_0}(c) = c$ through external enforcement rather than volitional strength alone.

**Time inconsistency** (Kydland & Prescott, *Journal of Political Economy* 85(3): 473–491, 1977) is the macroeconomic instantiation of the same failure. A central bank that announces zero inflation cannot credibly commit under discretion: rational forward-looking agents anticipate that the bank will inflate once they have settled nominal wages, and the zero-inflation announcement does not alter expectations. Transfer-settlement of the monetary commitment is unavailable under discretion — the bank's stepping maps always include the defection action. Kydland and Prescott's solution is constitutional or rule-based commitment: a binding constraint that removes the inflation option from the policymaker's reachable futures, the macroeconomic analog of burning bridges.

**Incomplete contracts** (Hart & Moore, *Econometrica* 56(4): 755–785, 1988; *Review of Economic Studies* 66(1): 115–138, 1999) establish a structural limit on transfer-settlement: parties can only transfer-settle commitments over act-classes $\varphi$ that are *verifiable* — observable by both parties and enforceable by an external authority. Non-verifiable act-classes cannot be transfer-settled through contract; they remain in the free zone of $H_{t_0}$. This is the nuclear reading of the incompleteness result: the transfer nucleus operates only over the verifiable sub-site, and renegotiation is the act of renegotiating fixation on the verifiable portion after private information is revealed.

Williamson's **hostage mechanism** ("Credible Commitments: Using Hostages to Support Exchange," *American Economic Review* 73(4): 519–540, 1983) is the bilateral form of the commitment device. Each party posts a specific asset — one worth more in the relationship than outside it — in the other party's control. Defection destroys the posted asset, internalizing the cost. The optimal hostage value equals the quasi-rent at stake: precisely enough to make $\neg c$ costlier than $c$ for both parties, thereby achieving mutual $\Delta$-fixation without relying on either party's volitional strength.

## The distributed systems tradition: two-phase commit

Jim Gray's two-phase commit protocol ("Notes on Database Operating Systems," LNCS 60, Springer, 1978, pp. 393–481; Gray & Reuter, *Transaction Processing: Concepts and Techniques*, Morgan Kaufmann, 1992) formalizes the commitment event with two analytically distinct moments:

**Voting point** (*prepare phase*): a participant writes a durable prepare record, forces it to active storage, and votes YES. After this point, the participant cannot abort unilaterally — it has surrendered its defection option and entered the uncertain state: committed-to-commit, but not yet having received the coordinator's decision. The voting point is transfer-settled-but-not-yet-propagated.

**Commit point**: the coordinator forces the commit log record to durable storage. After this point the transaction *is* committed — the transfer-settlement is irrevocable regardless of subsequent failures. The forcing of the commit log record is the physical embodiment of $\Delta_{t_0}(c) = c$ becoming durable. Subsequent $\mathrm{COMMIT}$ messages to participants are the propagation of an already-irrevocable decision, not the decision itself.

The two moments are separated in time and on different nodes. Gray's precision: the irrevocability of the commit derives from three interlocking facts — the coordinator's commit log record is durable, all participants have voted YES (surrendering their defection option), and external effects may already be observable. Together these make the transition thermodynamically stable: there is no rollback path.

**The saga pattern** (Garcia-Molina & Salem, "Sagas," *ACM SIGMOD Record* 16(3): 249–259, 1987) extends commitment to sequential act-classes. A saga is a sequence of sub-transactions $T_1, \ldots, T_n$, each independently committed. If $T_j$ fails to complete, **compensating transactions** $C_j, \ldots, C_1$ execute in reverse. Compensation is not rollback: $T_1, \ldots, T_{j-1}$ are already durably committed and externally visible; $C_i$ applies a semantic correction (crediting back what $T_i$ debited). Each $C_i$ is itself a full commitment — transfer-settled from the violation history of $T_j$. The saga structure formalizes the **compositional commitment problem**: a commitment to a multi-step act-class is not a single transfer-settled proposition but a sequence of independently transfer-settled sub-propositions, each irrevocable, with compensation as the failure-recovery mechanism for the whole.

**Paxos** (Lamport, "The Part-Time Parliament," *ACM Transactions on Computer Systems* 16(2): 133–169, 1998; "Paxos Made Simple," *ACM SIGACT News* 32(4): 18–25, 2001) achieves distributed commitment without a single coordinator. The chosen-value safety invariant (P2 in "Paxos Made Simple") is commitment irrevocability at the distributed level: once a quorum has accepted value $v$, no future round can choose a different value. This is $\Delta$-fixation by majority — $\Delta_{t_0}(c) = c$ when a majority of nodes independently hold $c$, so that no minority defection can remove $c$ from the reachable futures of the whole system.

## The psychological tradition: binding, side-bets, and escalation

Howard Becker's **side-bet mechanism** ("Notes on the Concept of Commitment," *American Journal of Sociology* 66(1): 32–40, 1960) grounds commitment in accumulated stakes: a commitment is real when the agent has independently staked something of value — reputation, relationships, resources — on continuing the committed course. The side bets may not have been consciously staked; structural forces accumulate them. Becker's key claim: commitment need not arise from intrinsic attachment to the act-class; it arises from the cost of leaving the transfer-settled state. Each downstream history $t_k$ accumulates a side-bet cost at each step; the total cost of cancellation grows with depth, making the commitment increasingly robust.

Charles Kiesler's **binding coefficient** (*The Psychology of Commitment*, Academic Press, 1971) formalizes the degree to which a person is bound to an act. Binding increases with: (1) the number of acts performed, (2) the importance of the acts, (3) the explicitness and irrevocability of the acts, (4) the perceived freedom under which the acts were performed, and (5) the public nature of the act. Each factor corresponds to a dimension of transfer-settlement strength: a public, irrevocable, important act creates a wider sub-site over which $\Delta_t(c) = c$ holds. Private intentions have narrow sub-sites; public irrevocable commitments have wide ones. Kiesler's empirical finding — committed subjects show less attitude change under counterattitudinal pressure — is the psychological analog of the transfer nucleus's resistance to perturbation.

Leon Festinger's **cognitive dissonance** (*A Theory of Cognitive Dissonance*, Row, Peterson, 1957) reveals the self-reinforcing dynamics of commitment: after an irreversible choice, the agent reduces dissonance by inflating the chosen option's value and deflating the unchosen one's. Post-commitment dissonance reduction functions as a retroactive saturation-nucleus operation: $\sigma_t$ is applied to the committed state after the fact, raising the settled value of $c$ to match the agent's now-committed position. The dissonance reduction produces genuine saturation-settlement of a proposition that was initially not saturation-fixed — commitment creates its own ex-post meaning-settlement.

Barry Staw's **escalation of commitment** ("Knee-Deep in the Big Muddy," *Organizational Behavior and Human Performance* 16(1): 27–44, 1976) documents a pathological failure mode: agents continue investing in failing courses of action beyond rational justification, specifically when they bear personal responsibility for the initial decision. Staw's experimental design showed subjects allocated significantly more resources to a failing division when they had made the initial allocation themselves. The escalation mechanism is self-justification: transfer-settlement $\Delta_t(c) = c$ persists while dissonance reduction inflates the saturation value $\sigma_t(c)$ retroactively, rationalizing the original commitment as correct. Escalation is the pathological form of commitment's self-reinforcing dynamics: the transfer-settled commitment and the dissonance-driven saturation-closure mutually reinforce, maintaining $c$ in the fixed fiber long past the point where a Bratman-rational agent would cross the reconsideration threshold.

Robert Cialdini's **consistency principle** (*Influence*, Scott, Foresman, 1984) establishes that once a person has publicly committed to a position, strong psychological pressure to behave consistently follows — independent of whether the original commitment was rationally well-grounded. The foot-in-the-door technique (Freedman & Fraser, *Journal of Personality and Social Psychology* 4(2): 195–202, 1966) exploits this: a small initial compliance act creates a transfer-settled $c$ in the agent's self-image, which then functions as the nucleus for larger subsequent compliance. Cialdini's consistency principle is the psychological substrate of Bratman's stability norm, approximating it for most normal cases while remaining exploitable in adversarial contexts and pathological under escalation.

## Nuclear reading

**Sources:** [Saturation Nucleus](../math/relational-history-fiber-saturating-nucleus.md), [Transfer Nucleus](../math/relational-history-fiber-transferring-nucleus.md), [Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md), [Idempotence](../math/relational-history-fiber-nucleus-idempotence.md), [Commutation](../math/relational-history-fiber-nucleus-commutation.md).

At each history $t$, a commitment proposition $c \in H_t$ is classified by its position in the nuclear quartet:

| Nuclear position | Formal condition | Commitment status |
|---|---|---|
| **Free zone** | $c \notin \mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t)$ | Mere intention — present in the fiber but settled by neither nucleus |
| **Saturation-only** | $\sigma_t(c) = c$, $\Delta_t(c) \neq c$ | Endorsed intention — meaning-settled by the past, but not execution-stable into downstream histories; the nuclear signature of institutional akrasia |
| **Transfer-only** | $\Delta_t(c) = c$, $\sigma_t(c) \neq c$ | Execution-stable but meaning-unsettled — forward-present in every extension, but the past has not fully recognized what this commitment is; the insincere commissive case |
| **Fixed fiber** | $c \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ | Full commitment — meaning-settled and execution-settled; Bratman's stable plan, Searle's sincerely-executed commissive, Gray's committed transaction |

**Definition (Assertion vs. commitment directionality).** Assertion submits $p$ for saturation-nucleus settlement: $\sigma_t(p) = p$ certifies that the past fully determines $p$. Commitment submits $c$ for transfer-nucleus settlement: $\Delta_t(c) = c$ certifies that every forward extension carries $c$. Both may reach $H^*_t$, but by opposite paths: assertion is $\sigma$-first, commitment is $\Delta$-first.

**Definition (Joint closure operator).** The *joint closure* $\pi_t = \sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ (the equality holding by commutation of the nuclei, [Commutation](../math/relational-history-fiber-nucleus-commutation.md)) maps any $c \in H_t$ to the smallest fully-committed proposition above $c$. This is the full commitment operator.

**Proposition (Commitments are closed under finite meets).** If $\varphi, \psi \in \mathrm{Fix}(\Delta_t)$ — i.e., both are transfer-settled commitments — then $\varphi \wedge \psi \in \mathrm{Fix}(\Delta_t)$.

*Proof.* By meet-preservation of $\Delta_t$ ([Meet Preservation](../math/relational-history-fiber-nucleus-meet-preservation.md)):
$$\Delta_t(\varphi \wedge \psi) = \Delta_t(\varphi) \wedge \Delta_t(\psi) = \varphi \wedge \psi$$
where the last step uses $\varphi, \psi \in \mathrm{Fix}(\Delta_t)$. Hence $\varphi \wedge \psi \in \mathrm{Fix}(\Delta_t)$. $\square$

**Corollary.** The conjunction of two commitments is a commitment. If $A$ has committed to performing $\varphi$ and has committed to performing $\psi$, then the joint commitment "perform $\varphi$ AND perform $\psi$" is itself transfer-settled. This is not trivial — it means that the intersection of two forward-active propositions is forward-active, so a system of commitments is closed under conjunction.

**Proposition (Full commitments are closed under finite meets).** If $\varphi, \psi \in H^*_t$, then $\varphi \wedge \psi \in H^*_t$.

*Proof.* By meet-preservation of $\Delta_t$: $\Delta_t(\varphi \wedge \psi) = \varphi \wedge \psi$ (as above). By meet-preservation of $\sigma_t$: $\sigma_t(\varphi \wedge \psi) = \sigma_t(\varphi) \wedge \sigma_t(\psi) = \varphi \wedge \psi$. Hence $\varphi \wedge \psi \in H^*_t$. $\square$

**Proposition (Idempotence: no escalation of commitment by repetition).** For any $c \in H_t$, $\Delta_t(\Delta_t(c)) = \Delta_t(c)$ ([Idempotence](../math/relational-history-fiber-nucleus-idempotence.md)). Applying the transfer nucleus twice is the same as applying it once: there is no stronger or "more committed" version reached by iteration. In particular, $\Delta_t(c)$ is already in $\mathrm{Fix}(\Delta_t)$, so no second-order or iterated commitment operation produces a distinct result.

*Proof.* $\Delta_t(c) \in \mathrm{Fix}(\Delta_t)$ because $\Delta_t(\Delta_t(c)) = \Delta_t(c)$ by idempotence. $\square$

**Remark (Promise vs. full commitment).** The table entry "Transfer-only" — $\Delta_t(c) = c$, $\sigma_t(c) \neq c$ — is the nuclear model of a *promise* in the informal sense: a proposition present in every forward extension (the agent's behavior will conform) but not yet meaning-settled (the past has not fully constituted this as a recognized obligation). A full commitment $c \in H^*_t$ additionally has $\sigma_t(c) = c$: the past fully establishes what this commitment is (Searle's sincerity condition; Brandom's public deontic score entry).

## The four lifecycle states

Following Singh's commitment machine ("An Ontology for Commitments in Multiagent Systems," *Artificial Intelligence and Law* 7(1): 97–113, 1999), a commitment $(A, \varphi, \tau, P)$ passes through four lifecycle states:

| State | Nuclear condition | Description |
|---|---|---|
| **Open** | $\Delta_t(c) = c$, $t \leq \tau$ | The commitment is potential and transfer-settled; $A$ is bound forward; $c$ propagates to all downstream histories |
| **Discharged** | $A$ performs $\varphi'$ at $t_1 \leq \tau$, $\varphi' \in [\varphi]$, gap closed | The act satisfies the commitment; transfer-settlement is released; the scoreboard entry is cleared |
| **Violated** | $t > \tau$ and no discharge event has occurred | Deadline passed without discharge; $c$ persists as a breach record; remedial commitments may arise from $P$'s claim-right enforcement |
| **Cancelled** | $P$ releases $A$; transfer-settlement explicitly removed | The principal exercises their power to dissolve the commitment; no breach record is generated |

Transition structure: Open → Discharged (by performance); Open → Violated (by deadline passage without discharge); Open → Cancelled (by principal release). Violated does not transition to Discharged or Cancelled without remedial action; Cancelled is terminal with no breach record.

The **saga pattern** maps onto sequential commitment: a multi-step commitment $c_1, c_2, \ldots, c_n$ is a sequence of independently transfer-settled sub-propositions. If $c_j$ passes into Violated, compensating transactions $C_j, \ldots, C_1$ semantically correct the effects of discharged sub-commitments $c_{j-1}, \ldots, c_1$. Compensation is not cancellation of the discharged sub-commitments — they remain irrevocably in Discharged state — but an independent commitment sequence that restores the intended overall state from the violation history.

## Commitment levels

| Level | Transfer-settlement scope | Example |
|---|---|---|
| **Intention** | $c \in H_t$, $\Delta_t(c) \neq c$ | "I'll try to do $\varphi$" — present in fiber, not forward-active |
| **Endorsed intention** | $\sigma_t(c) = c$, $\Delta_t(c) \neq c$ | Meaning-settled without execution-settlement — the institutional akrasia condition |
| **Promise** | $\Delta_t(c) = c$ over bounded sub-site; $\sigma_t(c) = c$ | Full commitment over limited scope; bilateral, typically unenforced externally |
| **Contract commitment** | $\Delta_t(c) = c$ through $\tau$ under external enforcement | Transfer-settlement backed by legal normative system; verifiable act-class required |
| **Duty** | $\Delta_t(c) = c$ throughout $T$ imposed by normative system | Global transfer-settlement independent of $A$'s individual act of commitment |
| **Constitutional rule** | $\Delta_t(c) = c$ for all $t$; defection option removed from stepping map | Kydland-Prescott commitment: transfer-settled by institutional removal of the defection option, not by volitional strength |

## Domain readings

**Philosophy of action.** Bratman's planning theory provides the constitutive account: commitments are intentions that have achieved the stability norm's threshold. The toxin puzzle establishes volitional independence. Frankfurt's hierarchy ([Will](will.md)) establishes the endorsement structure that gives rise to saturation-settlement of the commitment. The BDI architectures of Cohen-Levesque and Rao-Georgeff provide the formal drop conditions.

**Speech act theory.** Austin's commissives and Searle's essential condition ground commitment in the illocutionary structure of language: the commissive speech act *is* the transfer-settlement event. Brandom's scorekeeping makes the social-normative structure explicit: commitment is a public deontic fact, attributable and dischargeable, not merely a private intention.

**Strategic theory.** Schelling, Kydland-Prescott, and Hart-Moore reveal the structural conditions under which transfer-settlement is achievable: credibility requires either volitional independence (Bratman) or external removal of the defection option (Schelling's commitment device). Incomplete contracts establish the verifiability limit: transfer-settlement is bounded by what is externally enforceable. Williamson's hostage mechanism provides the bilateral symmetric version.

**Distributed systems.** Gray's two-phase commit and Garcia-Molina's saga pattern provide the engineering formalization of commitment irrevocability and sequential commitment failure recovery. The commit point = transfer-settlement event; compensation = remedial transfer-settlement from the violation history. These are not metaphors — they implement the nuclear structure in a formally specified protocol.

**Psychology.** Becker, Kiesler, Festinger, and Staw trace the psycho-social dynamics of commitment formation, maintenance, and pathology. The consistency principle approximates the stability norm in most cases; escalation reveals the pathological regime where transfer-settlement and dissonance-driven saturation-closure mutually reinforce past rational reconsideration thresholds.

## Open questions

- **Volitional independence as a nuclear condition**: Kavka's toxin puzzle shows that genuine transfer-settlement cannot be formed when the agent knows at $t_0$ that the best response at $t_1$ is violation. Whether this is a formal constraint on the transfer nucleus — that $\Delta_{t_0}(c) = c$ can only be formed when the agent's stepping maps at all $t \leq \tau$ do not include a strictly dominant defection action — or whether it is a contingent psychological fact about human agents, is not yet derived. The formal version would establish that the transfer nucleus is defined only over act-classes whose discharge is at least weakly dominant in the agent's utility structure through $\tau$; a commitment formed against dominant defection incentives would be a formal contradiction rather than merely a normative failure.

- **The Singh machine as a nuclear partition**: Whether the four lifecycle states — Open $= \{c : \Delta_t(c) = c,\; t \leq \tau\}$, Discharged $= \{c : c \wedge \mathrm{performed}(\varphi) \in H^*_{t_1}\}$, Violated $= \{c : \Delta$-fixed past $\tau$ with no discharge$\}$, Cancelled $= \{c : \Delta$-settlement explicitly removed by $P\}$ — form an exhaustive and mutually exclusive partition of the commitment propositions in $H_{t_0}$, and whether this partition is exactly co-extensive with a well-defined sub-structure of the fiber Heyting algebra, is not yet derived. If it is, Singh's social commitment machine is a faithful reformulation of the transfer-nucleus lifecycle over the commitment sub-site of $H_{t_0}$.

- **Staw escalation as pathological nuclear fixation**: Whether escalating commitment corresponds to a specific pathological condition on the interaction of the saturation and transfer nuclei: $\Delta_t(c) = c$ persists (the commitment is maintained) while $\sigma_t(c)$ grows under dissonance reduction (retroactive rationalization), so that the joint projection $\pi_t(c) = \sigma_t(\Delta_t(c))$ produces a new fixed point that is not reachable from the original $c$ by rational updating. Whether this produces a second stable fixed point in the fiber above $c$ — a "sunk-cost attractor" — toward which escalating agents converge, and whether the transfer nucleus's interaction with the saturation nucleus under dissonance dynamics generates a bifurcation in the fixed fiber, is not yet derived.

- **Credible threat as transfer-settlement**: Schelling's claim that a threat becomes credible when the threatener cannot defect maps onto transfer-settlement of the threat proposition. The formal question: whether all Schelling-credible threats are transfer-settled in the nuclear sense, and whether every transfer-settled threat proposition corresponds to a Schelling-credible threat. If credibility and transfer-settlement are co-extensive, the nuclear structure exactly characterizes the game-theoretic credibility condition. If they diverge — for instance, if some transfer-settled propositions are not credible threats because they are not verifiable by the threatened party — the divergence reveals a distinction between the nuclear structure and the strategic structure that is not yet analyzed. The incomplete-contracts result (verifiability as the boundary of nuclear fixation) suggests the divergence is real, with verifiability as the reconciling concept.

- **Sequential commitment and the saga decomposition**: Whether a commitment $(A, \varphi_1 \to \varphi_2, \tau, P)$ to a two-step act-class decomposes as the sequential composition of two independently transfer-settled sub-commitments, and whether the transfer nucleus distributes over sequential composition of act-classes. The saga pattern suggests the answer is negative in general: each sub-commitment is independently transfer-settled, but the whole is conditionally transfer-settled — $c_2$ becomes transfer-settled only after $c_1$ is discharged. Whether this conditional transfer-settlement corresponds to a specific nuclear construction — perhaps $\Delta_{t_1}(c_2) = c_2$ where $t_1$ is the discharge history of $c_1$, so that the whole composite commitment is a sequence of step-conditional fixations — and whether violated sub-commitments generate new compensating commitments that are themselves transfer-settled from the violation history, is the open question. If so, the saga structure is the exact nuclear decomposition of sequential commitment, with the compensating transaction as the remedial transfer-settlement that the violation creates.

## Key references

- Bratman, M.E. *Intention, Plans, and Practical Reason*. Harvard University Press, Cambridge, MA, 1987. Reprinted CSLI Publications, 1999.
- Bratman, M.E. "Two Faces of Intention." *The Philosophical Review* 93(3): 375–405, July 1984. Duke University Press.
- Kavka, G.S. "The Toxin Puzzle." *Analysis* 43(1): 33–36, January 1983. Oxford University Press.
- Cohen, P.R. and Levesque, H.J. "Intention Is Choice with Commitment." *Artificial Intelligence* 42(2–3): 213–261, March 1990. DOI: 10.1016/0004-3701(90)90055-5.
- Rao, A.S. and Georgeff, M.P. "Modeling Rational Agents within a BDI-Architecture." In *Proceedings of KR '91*, Morgan Kaufmann, 1991, pp. 473–484.
- Austin, J.L. *How to Do Things with Words*, 2nd ed. Oxford University Press, 1975. Commissives: Lecture XII, pp. 150–163.
- Searle, J.R. *Speech Acts: An Essay in the Philosophy of Language*. Cambridge University Press, 1969. Promise conditions: pp. 57–61.
- Searle, J.R. *Expression and Meaning: Studies in the Theory of Speech Acts*. Cambridge University Press, 1979. Five categories: Ch. 1, pp. 1–29.
- Brandom, R.B. *Making It Explicit: Reasoning, Representing, and Discursive Commitment*. Harvard University Press, 1994. Scorekeeping: Ch. 3, pp. 141–198.
- Schelling, T.C. *The Strategy of Conflict*. Harvard University Press, Cambridge, MA, 1960.
- Kydland, F.E. and Prescott, E.C. "Rules Rather Than Discretion: The Inconsistency of Optimal Plans." *Journal of Political Economy* 85(3): 473–491, June 1977. DOI: 10.1086/260580.
- Hart, O. and Moore, J. "Incomplete Contracts and Renegotiation." *Econometrica* 56(4): 755–785, July 1988.
- Hart, O. and Moore, J. "Foundations of Incomplete Contracts." *Review of Economic Studies* 66(1): 115–138, January 1999.
- Williamson, O.E. "Credible Commitments: Using Hostages to Support Exchange." *American Economic Review* 73(4): 519–540, September 1983.
- Gray, J. "Notes on Database Operating Systems." *Lecture Notes in Computer Science* 60, Springer-Verlag, Berlin, 1978, pp. 393–481.
- Gray, J. and Reuter, A. *Transaction Processing: Concepts and Techniques*. Morgan Kaufmann, San Mateo, CA, 1992.
- Garcia-Molina, H. and Salem, K. "Sagas." *ACM SIGMOD Record* 16(3): 249–259, 1987. DOI: 10.1145/38713.38742.
- Lamport, L. "Paxos Made Simple." *ACM SIGACT News* 32(4): 18–25, December 2001.
- Singh, M.P. "An Ontology for Commitments in Multiagent Systems." *Artificial Intelligence and Law* 7(1): 97–113, 1999. DOI: 10.1023/A:1008319631231.
- Becker, H.S. "Notes on the Concept of Commitment." *American Journal of Sociology* 66(1): 32–40, 1960. DOI: 10.1086/222820.
- Kiesler, C.A. *The Psychology of Commitment: Experiments Linking Behavior to Belief*. Academic Press, New York, 1971.
- Festinger, L. *A Theory of Cognitive Dissonance*. Row, Peterson, Evanston, IL, 1957.
- Staw, B.M. "Knee-Deep in the Big Muddy: A Study of Escalating Commitment to a Chosen Course of Action." *Organizational Behavior and Human Performance* 16(1): 27–44, 1976. DOI: 10.1016/0030-5073(76)90005-2.
- Cialdini, R.B. *Influence: The Psychology of Persuasion*. Scott, Foresman, Glenview, IL, 1984.
- Freedman, J.L. and Fraser, S.C. "Compliance Without Pressure: The Foot-in-the-Door Technique." *Journal of Personality and Social Psychology* 4(2): 195–202, 1966. DOI: 10.1037/h0023552.
