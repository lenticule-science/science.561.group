---
type: theorem
status: sketch
depends-on: [operations-settling, multi-agent-work-as-crdt, capability-fiber-bundle, dispatch, bilattice-network-sheaf-consensus, network-sheaf-consensus-on-agent-graphs, d-frame-valued-sheaf]
realizes: [coordination, distributed-work, consensus, organizational-form]
---

# An agent team is a bilattice network sheaf; team consensus is its $H^0$

The [multi-agent-work-as-crdt](multi-agent-work-as-crdt.md) theorem treats a multi-agent working community as a [distributed settling system](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/distributed-settling-system.md) and gives convergence + cohomological CALM. That treatment is the *abelian shadow* — it tracks cell-values without distinguishing the truth-side and falsity-side fibers. The present theorem upgrades the picture: when the agents form a finite communication graph $G$ with channels (offices, joint sessions, paired roles), the per-agent operations settlings $V_G(v)$ assemble into a [d-frame-valued sheaf](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/d-frame-valued-sheaf.md) on the incidence poset $\hat G$, and the consensus operations settling — the team's *substrate-algebraically-shared* operational state — is the $H^0$ of that network sheaf, with disagreements localized as $\mathrm{con}$-failures of the bilattice join.

This is a direct instantiation of [bilattice network-sheaf consensus on agent graphs](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) at the operations base $B_{\mathrm{op}}$. The new content is operational: the consensus d-frame's components have specific, named work-vocabulary contents.

## Setup

Let $G = (V_G, E_G)$ be a finite *agent communication graph*: vertices are agents (or offices), edges are *channels* — durable communication or joint-action loci between two agents. Standard channel kinds:

- **Office-membership channels**: $v_1, v_2$ are co-incumbents of an office $O$; the edge $e$ is $O$ itself (the joint office-cell).
- **Paired-role channels**: $v_1$ and $v_2$ are correlatively paired in a Hohfeldian relation (e.g., dispatcher / assignee); $e$ is the jural relation.
- **Session channels**: $v_1$ and $v_2$ have shared a [session](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/concepts/session.md); $e$ is the session record.
- **Cadence channels**: $v_1$ and $v_2$ share a recurrent practice $R$; $e$ is the cycle-boundary witness.

For each agent $v \in V_G$ and each channel $e \in E_G$, set $V_G(v) = v^{\mathrm{op}}_{(v)}$ (the agent's local valuation of the operations settling) and $V_G(e) = $ the consensus settling at $e$ — the bilattice $\wedge_k$-meet of the two endpoint settlings restricted to the cells the channel carries. The incidence morphisms $V_G(v) \to V_G(e)$ are the canonical projections to the consensus.

This is a multi-observer system on $\hat G$ over the operations base $B_{\mathrm{op}}$, in the precise sense of the [multi-observer system object](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/multi-observer-system.md). It carries a d-frame-valued network sheaf $\mathbb F_{V_G}$ on $\hat G$ per the [bilattice network-sheaf consensus theorem](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md).

## Statement

**Theorem.** *Let $G$ be a finite agent communication graph with associated bilattice network sheaf $\mathbb F_{V_G}$ on $\hat G$ over $B_{\mathrm{op}}$. Then:*

(a) *(Team consensus.) The d-frame consensus*
$$\mathbb F_{V_G}^{\mathrm{cons}} \;=\; \lim_{\sigma \in \hat G} \mathbb F_{V_G}(\sigma) \;=\; H^0(\hat G, \mathbb F_{V_G})$$
*is the **team's joint operational substrate**: the cells whose $\mathbf t$- or $\mathbf f$-values every team agent has committed to, and every channel has carried as a positive consensus restriction. Its $L_+$ component is the team's joint truth-side knowledge ("everyone agrees these cells are true"); its $L_-$ component is the team's joint falsity-side knowledge ("everyone agrees these cells are false"); its $\mathrm{con}$ relation tracks which $L_+$-$L_-$ pairs the team can hold without contradiction.*

(b) *(Disagreement localization.) The bilattice $\vee_k$-join over agents,*
$$\mathbb F_{V_G}^{\mathrm{disag}}(\sigma) \;=\; \bigvee_k V_G(v) \quad \text{at each cell } \sigma,$$
*is a d-frame whose $\mathrm{con}$-relation **fails** at exactly the cells where two or more agents have $(\mathbf t, \mathbf f)$-disagreeing valuations. The con-failure cells are the team's open governance items: the substrate-recorded loci that require adjudication for the team to extend its consensus.*

(c) *(Office-membership consensus is automatic.) When $e \in E_G$ is an office-membership channel and $v_1, v_2$ are co-incumbents, $\mathbb F_{V_G}(e)$ contains every cell whose value follows from the office's deontic profile: capability and authority cells propagated by [capability-fiber-bundle](../objects/capability-fiber-bundle.md)'s capability-and-authority propagation under double-settlement. The consensus at office channels is therefore non-trivial without any extra coordination — it is forced by the office's substrate construction.*

(d) *(CRDT-style coordination-freeness, restated structurally.) Every cell-cover of the team's joint cells admits coordination-free merge: $\delta^0 = 0$ on each shadow component of $\mathbb F_{V_G}$ at every cover. The team's distributed work is convergent without coordination on every cell that the network sheaf assigns; coordination is required only where $\mathbb F_{V_G}^{\mathrm{disag}}$ exhibits con-failure (per (b)).*

(e) *(Cohomological CALM-compatibility.) $\delta^n = 0$ for $n \geq 0$. The team's monotone queries on its joint operational substrate compose without coordination across all agent-graph clopens.*

## Sketch

Each clause is a direct citation of [bilattice network-sheaf consensus on agent graphs](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/bilattice-network-sheaf-consensus.md) at the operations base, with the work-vocabulary specialization of the agent-graph data:

**(a)** Limit existence and the $L_+, L_-, \mathrm{con}, \mathrm{tot}$ identification are clause (1) of the cited theorem. The work-vocabulary content is the identification of $L_+$ with the team's truth-side joint knowledge and $L_-$ with falsity-side joint knowledge; this is the d-frame's two-component structure read in the operations base's evidentiary vocabulary. $\square$

**(b)** Clause (2) of the cited theorem: $\mathrm{con}$ fails exactly at $(\mathbf t, \mathbf f)$-disagreement loci, and these are the $\top$-cells of the joint settling. The new operational identification is that these cells are precisely the team's *open governance items* — the cells that require adjudication for the team to extend its consensus. $\square$

**(c)** Take an office channel $e = O$ with co-incumbents $v_1, v_2$. By [capability-fiber-bundle](../objects/capability-fiber-bundle.md)'s double-propagation rule, both $v_1$ and $v_2$ inherit the cells of $O$'s deontic profile uniformly: $\sigma_{v_1}(c) = \sigma_O(c)$ and $\sigma_{v_2}(c) = \sigma_O(c)$ for every capability $c$ on $O$ (similarly for authority). The cellwise $\wedge_k$-meet at $e$ therefore equals $\sigma_O$ — the consensus at the office channel is exactly the office's deontic profile. No coordination round is required to establish this consensus; it is a direct consequence of the propagation rule plus the channel's identification with $O$. $\square$

**(d)–(e)** Clauses (3)–(4) of the cited theorem applied to $\hat G$ over $B_{\mathrm{op}}$. The shadow components are the [settling-associated sheaves](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) of the operations settlings; CRDT convergence via Mayer–Vietoris and cohomological CALM apply componentwise. $\square$

## What this earns over multi-agent-work-as-crdt

The earlier [multi-agent-work-as-crdt](multi-agent-work-as-crdt.md) theorem characterizes convergence and CALM at the abelian shadow level — it tracks cell-values but not the bilattice's two-component structure. The present theorem upgrades to the d-frame level. Three concrete additions:

1. **Disagreement-as-paraconsistency made operational.** Open governance items are not abstract "things to coordinate on"; they are exactly the cells where $\mathrm{con}(\mathbb F_{V_G}^{\mathrm{disag}})$ fails. The d-frame's $\mathrm{con}$-relation is the substrate-algebraic record of which $(L_+, L_-)$ pairs the team can sustain. Adjudication procedures targeting open governance items are operations *on the d-frame's $\mathrm{con}$-relation* — not separate communications protocols.

2. **Channel content is structural.** A channel's settling $V_G(e)$ is not a free parameter; it is the limit of the endpoint settlings restricted to the channel's cells. The substrate determines what passes through which channel, given the channel kind. Office channels, jural-pair channels, session channels, and cadence channels each carry a channel-kind-determined cell-set; misrouting (sending operational state through the wrong channel kind) is a structural error the channel taxonomy diagnoses.

3. **Organizational forms have cohomological signatures.** A team configured as a complete graph (every agent paired with every other) has different network-sheaf cohomology than a team configured as a star (one central coordinator) or a tree (hierarchical) or a sparse mesh. By clauses (d)–(e), the *coordination cost* and *consensus reachability* of each form are computable from the agent graph $G$'s topology together with the channel-kind taxonomy. This brings organizational-design questions ("should we restructure into squads or cells?") into the d-frame cohomology of $\hat G$ — they are mathematical questions with definite structural answers, not pure judgement calls.

## Relation to predicated-governance

A [polity](theories/predicated-governance/objects/polity.md)'s normative substructure is itself an agent graph in the sense above, with offices as vertices and authority-pair channels as edges. The polity-level consensus d-frame $\mathbb F_{V_G}^{\mathrm{cons}}$ is therefore the *normative-substrate consensus* of the polity: the joint cells the polity recognizes as standing normative facts. The [tradition-pluralism-as-fragment-coproduct](theories/predicated-governance/theorems/tradition-pluralism-as-fragment-coproduct.md) theorem characterizes how multiple governance patterns coexist on the polity; under the present theorem, that coexistence is a *con-relation* condition on the polity's network sheaf — the patterns are compatible iff their joint $\mathbb F_{V_G}^{\mathrm{disag}}$ has $\mathrm{con}$ holding on the cells the patterns share.

This identifies multi-pattern governance as a network-sheaf problem on the polity's agent graph and gives the existing pattern-cohomology machinery ([cohomological-signature-of-traditions](theories/predicated-governance/theorems/cohomological-signature-of-traditions.md)) a network-sheaf reading.

## Relation to dispatch and capability propagation

[Dispatch](../morphisms/dispatch.md) reads the capability and authority cells of an agent and a task; under the present theorem, those cells live on the network sheaf and dispatch is a *local computation in a clopen* of $\hat G$. By clauses (d)–(e), dispatch is coordination-free on cells in the team's consensus; dispatch on cells in the disagreement-locus must wait on adjudication. This makes precise which dispatch decisions a team can make in parallel without coordination (those on consensus cells) and which require coordination (those on cells where $\mathrm{con}$ fails).
