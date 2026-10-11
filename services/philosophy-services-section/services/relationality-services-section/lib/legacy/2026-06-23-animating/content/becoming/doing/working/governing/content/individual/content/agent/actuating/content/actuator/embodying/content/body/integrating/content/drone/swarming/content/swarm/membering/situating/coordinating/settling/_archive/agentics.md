---
name: agentics — multi-observer systems, distributed settling, network-sheaf consensus
description: "Reading-notes on the agentic apparatus — multi-observer systems, distributed settling systems, CRDT convergence, cohomological CALM, network-sheaf consensus on agent graphs, and the agentic forms a directory simultaneously instantiates (agent, character, persona, officer, body-natural, agent-community, polity). Cycle 6 of the realigning-the-repository-layout project."
opened-at: 2026-05-19
---

This file is reading-notes for Cycle 6.
Subject: the agentic apparatus — what makes a structure an agent, what makes a set of agents a community, what makes the community's behavior distributed, and how a directory bears the full stack of agentic forms simultaneously.

## Multi-observer system: agency as a functor

From [`prose/teaching/explanations/toward-agentic-swarm-theory.md:35`](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/prose/teaching/explanations/toward-agentic-swarm-theory.md), citing the object definition:

> Multi-observer system: a functor $V : O \to \mathrm{Settlings}_B$ from an observer category to settlings on a common base.
> Consensus is the limit; disagreement is $H^1$.

The observer category $O$ is generic — graph, topological space, simplicial complex.
Each observer carries its own settling; consensus across observers is computed as a categorical limit of the functor; the obstruction to consensus is the first sheaf cohomology of the associated network sheaf.

A directory whose content evolves under multiple agents' inputs is therefore literally a multi-observer system, with each agent-character an observer in $O$, the directory's content the base $B$, and the joint settling the functor $V$.

## Distributed settling system: CRDT-shape

Same file, line 36:

> Distributed settling system: finite family of presheaves merging via cellwise $\vee_k$.
> CRDT-shaped, but anonymous — replicas have indices, not identities or capabilities.

The cellwise $\vee_k$-merge is the join-semilattice operation that makes distributed replicas converge.
The anonymity of the basic distributed-settling-system is a known structural limit: per-agent identities and capabilities are not built in at this level.

## CRDT convergence theorem (proved)

Same file, lines 42–46:

> - CRDT convergence: replicas evolving independently and merging cellwise via $\vee_k$ converge to a common limit state without coordination. - CRDT convergence via Mayer–Vietoris: cohomological reformulation — the connecting Mayer–Vietoris homomorphism $\delta^0$ on the settling-associated sheaf is identically zero on every replica cover.
> CRDT convergence becomes "no obstruction to gluing." - CRDT convergence via cohomological CALM: the strict and Scott-continuous regimes admit a more conceptual proof via $H^1 = 0$. - Cohomological CALM: generalizes Hellerstein–Alvaro CALM to the cohomological setting — CALM-compatibility ⇔ vanishing of all Mayer–Vietoris obstructions.

Three independent proof routes (direct, Mayer–Vietoris, cohomological CALM) all confirm: a knowledge-axis $\vee_k$-merge across distributed replicas converges to a unique fixed point without requiring inter-replica coordination.
The cohomological reformulation makes this a vanishing-obstruction statement.

For a directory holding distributed agentic state, this proves that closure-rule firings emitted by distinct agents and merged via $\vee_k$ (the structural meaning of "append to the witness log") converge without requiring agents to coordinate — exactly the requirement for asynchronous distributed agentic work.

## Network-sheaf consensus on agent graphs

The Hansen–Ghrist program ([@hansen-ghrist2019]; subsequent work [@ghrist-riess2022; @ghrist-et-al2025; @lopez2024; @ghrist-ding2025]) establishes that opinion dynamics on a graph of agents converge iff the harmonic sections of an associated cellular sheaf give the consensus value.
The bilattice extension specifically:

From `toward-agentic-swarm-theory.md` line 110:

> Bilattice-valued network sheaves on agent graphs.
> Lit: Hansen–Ghrist 2019, Riess et al on network sheaves; Lopez 2024 fuzzy-adjoint extension.
> Corpus contribution: bilattice / d-frame value category instead of vector spaces or join-semilattices, treating contradictory information as part of the value structure.

The Q-enriched cellular sheaf framework (via [@lopez2024] and the Ghrist-team papers) gives predication-category theory its place in the network-sheaf-consensus literature.
The Curry equivalence on finite graphs (the `q-enriched-curry-finite-graph.md` theorem) is proved.

## Tunneling and agential dynamics

From the same file at line 63, citing the tunneling-and-agential-dynamics narrative:

> Classifies agents as continuous (within-class evolution) vs transition (regime jumps, increment events, rule perturbations); includes a multi-observer extension and a "swarm-level phase transitions" frontier.

An agent's dynamics fall into one of two structural classes: continuous evolution within a settled regime (the closure-2-monad firing on stable rule system) versus transition (regime jump — the agent's closure changes, an increment arrives that triggers regime-boundary crossing, rules are perturbed).
This is the dynamical structure of agency under the four-regime dichotomy.

## The in-repo agentic vocabulary

From [`code/structures/agent.md:6–10`](../../../../code/structures/agent.md):

> An **agent** is whatever causes an act.
> In a predication ⟨doer, action, target⟩, the agent is the subject — the doer.
> In the richer agentic-system sense an agent is also capable of perception (sensing its environment), goal-directedness (acting toward intended ends), and persistence (carrying state across moments).
> A tool — something wielded — lacks these; an agentic system has all three.

The form-instantiation pattern (`agent.md:10`):

> The agent form is **borne by an entity through form-instantiation**, not stored as a separate record file. ...
> The agent-form predications live as frontmatter cells on the character record alongside its character-form (χ-nucleus) cells.

The forms a directory bears (per `code/structures/`): `agent`, `agent-community`, `body-natural`, `character`, `claude-session`, `officer`, `office`, `persona`, `personnel`, `polity`.
Each is a structure with a Distinguishing predication-shape; the directory's bytes inhabit each form whose signature it satisfies, per form.md's definition.

From `code/structures/agent-community.md:6`:

> A **collective agent-form**: a set of agents that act as a community, with its own predications (membership, governance-process, governing-soul) and its own emissions (acts that no single member could author alone).

From `code/structures/polity.md:5`:

> A **chartered institutional collective**: an agent-community that has additionally constituted itself as a polity by adopting a charter, declaring offices, and maintaining a personnel roster.

A directory bears agent-community-form iff it has a member-set of agents, a governance-process, a governing-soul-of-scope, and emits community-acts (acts attributable to it as a whole, not to any one member).
A directory bears polity-form iff it additionally has a charter, offices, and personnel-roster.
The 561 directory bears both; the predication-categories directory bears agent-community but its polity status depends on whether it has a charter (its `governance/` subdirectory implies the constitutional apparatus exists).

## Dispatch as a positive-Π₁ closure rule

From `code/structures/agent.md:60–64`:

> The agent-form earns its place because **dispatch** needs it as a distinct form.
> Dispatch is the operation that matches incoming work to agents by traversing capability predications.
> Per the theorem `dispatch-as-closure-rule-system`, dispatch is structurally a sub-rule-system of the closure-rule system; the match formula $$\mathrm{match}(w, a) = \mathrm{required}(w) \odot (\Box_R u_a)_w$$ is a positive-$\Pi_1$ closure rule fusing capability-match and governance-restricted authorization via twist-product fusion $\odot$ on the four-bilattice.

The agentic-action layer of a directory is therefore a sub-closure-rule-system of the directory's full closure-rule system.
The same mathematical apparatus (closure-2-monad, settling, witness chain) governs both inference and dispatch — dispatch is a specialization of inference parameterized by capability predications, with the twist-product fusion $\odot$ on the bilattice fusing the capability-match (truth-axis) with the governance-restricted authorization (knowledge-axis).

## Witness emission and the deps-chain discipline

From `code/structures/agent.md:67–68`:

> The agent form is also load-bearing for **witness emission**.
> Every skill invocation produces a witness signed by the invoking entity's identity-key; the witness chain accumulates as the entity's operative history under its agent-form.
> Witness-attribution requires the agent-form cells to be present on the entity.

The witness chain *is* the `deps`-chain discipline of the stratified-predication-fiber from [agentive-triad.md](agentive-triad.md).
Each agentic act emits a stratum-1 (σ-doing-act) or stratum-2 (Δ-doing-act) atom into the fiber, with `deps` pointing to the stratum-0 (asserted = speech-act) atoms it presupposes plus the lower-stratum doing-act atoms in its chain.
By the acyclicity-of-witness-chain property (`stratified-predication-fiber.md:37`), the resulting witness graph is acyclic: an agent's act presupposes strictly-earlier acts in the witness ordering.

The repository's `code/logs/tool-uses/YYYY-MM-DD.jsonl` is the on-disk realization of this witness chain: each line records one MCP tool call, signed by the calling character's identity, attributable via `deps` to the prior acts that justified it.

## A directory's agentic stack

Synthesizing the agentic-form vocabulary against the form.md definition (form = (structure, inhabitance)), a directory's bytes simultaneously instantiate at least the following agentic forms when its predications satisfy each form's Distinguishing predication-shape:

| Form | Carrier signature (from `code/structures/<name>.md`) |
|---|---|
| `entity-form` | identity predications, recognized by the polity |
| `character-form` | χ-nucleus on the Heyting algebra of the entity's fiber |
| `agent-form` | identity-key, has-skill, dispatchable-against-work-type, governance-regime, individual or office-mediated authorization |
| `persona-form` | durable cross-session identity |
| `body-natural-form` | per-session ephemeral instance |
| `officer-form` | time-bounded incumbency of an office |
| `agent-community-form` | member-set, governance-process, governing-soul-of-scope, community-acts |
| `polity-form` | charter, personnel-roster, offices, recognition-cell, peer-confederacy |
| `561-group-form` | the specific named instance (for the top-level 561 directory) |

These are not synonyms or aliases.
They are distinct forms — distinct (structure, inhabitance) pairs — coexisting on the same bytes by form-instantiation.
A directory's agentic activity is governed by closure-rule firings against whichever form's predications the activity invokes: dispatch matches against agent-form's capability predications; community-acts emit witnesses attributable under agent-community-form; office-bounded acts are validated against officer-form's incumbency window.

## Synthesis

A directory is an agent-community by the agent-community.md signature when it carries member-set, governance-process, governing-soul-of-scope, and emits community-acts.
The 561 directory is one such community (it is also a polity, having additionally charter + offices + personnel-roster); the predication-categories directory is also one.
The agentic apparatus operates at multiple strata simultaneously: at the cell-value layer dispatch fires as a positive-Π₁ closure rule fusing capability and authorization; at the stratified-fiber layer agentic acts emit stratum-1 and stratum-2 atoms whose `deps`-chains are the on-disk witness log; at the multi-observer layer the directory's content is the base on which agent-observers' settlings live, with consensus computed as the categorical limit and disagreement as $H^1$.

The four-regime dichotomy classifies an agent's dynamics by the closure ordinal of its rule system: continuous-evolution agents sit in the strict and Scott-continuous regimes; transition-event agents sit at regime boundaries; aperiodic agents (the deepest case) carry $\omega_1$-or-longer orbits and have non-trivial $H^1$ classifying invariants.
The tunneling-and-agential-dynamics narrative names these as the dynamical types of agency.

Distributed agency is governed by CRDT convergence (proved): independent agent-observers merging their settlings cellwise via $\vee_k$ converge without coordination.
The cohomological reformulation makes this "no obstruction to gluing" — the Mayer–Vietoris connecting morphism on the settling-associated sheaf is identically zero on every replica cover.
For a directory holding distributed agentic state, this proves no inter-agent coordination is required for convergence; the math forces it.

## Falsifiable inquiries

**Inquiry 1.** Is the predication-categories directory an agent-community by the agent-community.md signature?

*Proved from references.* Yes — verified by signature-matching in [stack-of-roles.md](stack-of-roles.md) Inquiry 3 and re-verified here: its `agents/` provides member-set (`mining-curator.md`, `predication-category-theory-auditor.md`, `predication-category-theory-researcher.md`, `predication-physicist.md`); its `governance/` provides governance-process (presence of the assets subdirectory implies the constitutional apparatus exists); its `_index.md` provides governing-soul-of-scope; emissions ascribed to it as a body (the `prose/learning/claims/` files attributed to the library rather than to any individual agent) satisfy community-acts.

**Inquiry 2.** Does dispatch in the agent-form sense reduce to a closure-rule firing in the closure-2-monad sense, or is it a separate machinery?

*Resolved.* Reduces, per `code/structures/agent.md:60–64`.
Dispatch is a *sub-rule-system* of the closure-rule system, with the match formula $\mathrm{match}(w, a) = \mathrm{required}(w) \odot (\Box_R u_a)_w$ a positive-Π₁ closure rule.
The same closure-2-monad machinery covers both inference and dispatch.

**Inquiry 3.** Does CRDT convergence hold for any predication-settling system where replicas merge cellwise via $\vee_k$, or are there restrictions?

*Proved from references.* The CRDT convergence theorem (proved) covers the general case for predication settlings on a common base under cellwise $\vee_k$-merge.
Two proof routes are available: direct via the join-semilattice structure of the $\vee_k$-operation, and cohomological via Mayer–Vietoris (the connecting morphism $\delta^0$ is identically zero on every replica cover).
The strict and Scott-continuous regimes additionally admit a proof via cohomological CALM ($H^1 = 0$).
The transfinite-bounded and aperiodic regimes carry non-trivial $H^1$ but CRDT convergence still holds — the cohomology classifies *post-convergence* equivalence rather than convergence itself.

**Inquiry 4.** Are agent-form, character-form, persona-form, officer-form, body-natural-form, agent-community-form, polity-form distinct forms or aliases of one form?

*Proved from references.* Distinct, per the form.md definition (form = (structure, inhabitance)) and each form's `code/structures/<name>.md` Distinguishing predication-shape.
The signatures are non-overlapping in their characterizing predications: agent-form requires identity-key + dispatchable-against-work-type; character-form requires the χ-nucleus on the Heyting algebra; persona-form requires durable cross-session identity; officer-form requires time-bounded office incumbency; etc. A record can inhabit several simultaneously by carrying all the required predications, per the form-instantiation pattern.
Conflation across forms is a categorically-detectable failure mode (see `agent.md`'s "Not synonymous with" sections).

**Inquiry 5.** Is the witness chain at `code/logs/tool-uses/YYYY-MM-DD.jsonl` the on-disk realization of the stratified-predication-fiber's `deps`-chain discipline?

*Proved by signature match.* The stratified-predication-fiber's `deps` map (per `stratified-predication-fiber.md:17`) sends each atom to the strictly-lower-stratum atoms that justified its emission.
The witness log records each MCP tool call with the calling character's identity-key signature and the operation's parameters; reconstructing the `deps` graph from the log is the function described in `code/structures/agent.md:42–43`: "produces-witness-of(agent, skill-invocation) — the operational-history accumulator.
The witness chain is a derived view reconstructed from `code/logs/tool-uses/` on demand."
The acyclicity follows from the forward-only stratum property (`stratified-predication-fiber.md:33`): atoms emitted later have strata $\geq$ those of their predecessors, so reconstructing `deps` gives an acyclic DAG.
