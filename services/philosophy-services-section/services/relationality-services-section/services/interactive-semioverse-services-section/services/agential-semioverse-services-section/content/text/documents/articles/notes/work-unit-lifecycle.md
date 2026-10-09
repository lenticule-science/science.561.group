---
title: "Work-Unit Lifecycle"
date-created: 2026-03-03T00:00:00
aliases:
  - "Work-Unit Lifecycle"
  - "work-unit lifecycle"
keywords:
  - agential-semioverse
date-updated: 2026-03-09T00:00:00
description: A work unit is the atomic unit of agent activity in an Agential Semioverse Repository.
---

## 1. Introduction

A work unit is the atomic unit of agent activity in an Agential Semioverse Repository. The [work-units-and-chains](./work-units-and-chains.md) sketch defines work units as skill invocations with [footprints](../../../../../../../content/text/glossary/terms/footprint.md) and chains as [partially ordered](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/partial-order.md) sets of work units whose outputs feed later inputs. This specification provides the full formal treatment: how work units are created, what structure they carry, how they transition through lifecycle states, how their effects are tracked and composed, and what invariants they must satisfy.

We assume familiarity with the base structures of the [interactive semioverse](../../../../mathematics/objects/universes/interactive-semioverse/index.md) and the [agential semioverse](../../../../mathematics/objects/universes/agential-semioverse/index.md): the complete [Heyting algebra](../../../../mathematics/concepts/heyting-algebra/index.md) $H$ with modal closure $j$ and [trace comonad](../../../../../../../../../content/text/glossary/terms/trace-comonad.md) $G$; the definable operator algebra $\mathsf{Op}^{\mathrm{def}}$; fragments $\mathcal{F}(H)$ as finitely generated modal-temporal [Heyting](../../../../../../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/documents/articles/notes/arend-heyting.md) subalgebras; partial states $\mathcal{U} = \mathcal{P}(H) \times \mathcal{P}(\mathsf{Op}^{\mathrm{def}})$; the composite [closure operator](../../../../mathematics/concepts/closure-operator/index.md) $\mathcal{S} = \mathcal{S}_{\mathrm{fus}} \circ \mathcal{S}_{\mathrm{syn}} \circ \mathcal{S}_{\mathrm{sem}}$ with [least fixed point](../../../../mathematics/concepts/fixed-point/index.md) $X^{\star}$; [handles](../../../../../../../content/text/glossary/terms/handle.md) $\mathsf{Handle}$ with semantic seeds $\eta : \mathsf{Handle} \to H$; [footprints](../../../../../../../content/text/glossary/terms/footprint.md) $\mathrm{Foot}_X(\tau) = \mathcal{S}_X(F_{\tau, X})$; interaction operators $\mathbf{Int}$ as monotone endomorphisms of $\mathcal{U}$; agent profiles $P(a) = (\mathrm{role}_a, \mathrm{goals}_a, \mathrm{policy}_a, \mathrm{Skills}_a, \mathrm{Tools}_a, \mathrm{Mem}_a)$; internal agents $A = (\Sigma, K, \Pi)$; the skill calculus $\mathsf{Skill}^{\mathrm{def}}$ with terms $\mathsf{call}(t, \mathrm{args}) \mid \mathsf{let}\; x = s_1\; \mathsf{in}\; s_2 \mid \mathsf{seq}(s_1, s_2) \mid \mathsf{if}\; p\; \mathsf{then}\; s_1\; \mathsf{else}\; s_2 \mid \lambda x.\, s \mid s_1(s_2)$; policy-restricted interpretation $[\![s]\!]_a$; and the agential [closure operator](../../../../mathematics/concepts/closure-operator/index.md) $\mathcal{S}_{\mathrm{agent}}$ with its [least fixed point](../../../../mathematics/concepts/fixed-point/index.md) $A^{\star}$.

We also reference the [multi-agent coordination](./multi-agent-coordination.md) specification for regions, the [skill manifests](./skill-manifests.md) specification for manifest structure, the [error envelopes](./error-envelopes.md) specification for failure semantics, the [petri-nets-and-lean](../ideas/petri-nets-and-lean.md) specification for the Petri net model, and the [closure operators as API contracts](../ideas/closure-operators-as-api-contracts.md) idea for the connection between skill invocation and closure.

---

## 2. Work-Unit Structure

**Definition 2.1 (Work unit).** A **work unit** is a tuple:

$$W = (\mathrm{id}, \mathrm{agent}, \mathrm{skill}, \mathrm{input}, R, \mathrm{pre}, \mathrm{post}, \mathrm{trace}, \mathrm{status})$$

where:

- $\mathrm{id}$ is a unique identifier drawn from a countable set $\mathsf{WID}$;
- $\mathrm{agent} \in \mathsf{Agent}$ is the executing agent, with profile $P(\mathrm{agent})$;
- $\mathrm{skill} \in \mathrm{Skills}_{\mathrm{agent}}$ is a skill identifier from the agent's skillset, referencing a manifest entry with id, input schema $T_{\mathrm{in}}$, and output schema $T_{\mathrm{out}}$;
- $\mathrm{input} \in T_{\mathrm{in}}$ is a concrete value satisfying the skill's input schema;
- $R \subseteq \mathcal{F}(H)$ is the **region** the unit operates on, in the sense of Definition 2.1 of the [multi-agent coordination](./multi-agent-coordination.md) specification (a downward-closed subset of the fragment [lattice](../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/order-services-section/content/text/glossary/terms/lattice.md));
- $\mathrm{pre} \subseteq \mathcal{U}$ is a **precondition**: a downward-closed set of partial states in which the unit may fire;
- $\mathrm{post} \subseteq \mathcal{U}$ is a **postcondition**: an upward-closed set of partial states guaranteed after successful execution;
- $\mathrm{trace}$ is a provenance record (Section 5);
- $\mathrm{status} \in \{\mathsf{pending}, \mathsf{active}, \mathsf{completed}, \mathsf{failed}\}$ is the current lifecycle state.

**Remark 2.2 (Precondition closure direction).** The precondition $\mathrm{pre}$ is downward-closed: if the unit may fire in state $u$ and $u' \leq u$, then it may also fire in $u'$. This reflects the monotonicity of the base interaction operators — if a skill can act on a state, it can act on any state with less information. The postcondition $\mathrm{post}$ is upward-closed: successful execution guarantees that the resulting state is at least as informative as the postcondition.

**Remark 2.3 (Region constraint).** The region $R$ constrains the work unit to modify only fragments within $R$. This connects to the region-restricted skillset $K|_R$ from the multi-agent coordination specification (Definition 3.1): the skill interpretation $[\![s]\!]_a$ must act as the identity on all fragments $F \notin R$.

---

## 3. Work-Unit Lifecycle States

**Definition 3.1 (Lifecycle state machine).** The lifecycle of a work unit is a finite state machine with states $\{\mathsf{pending}, \mathsf{active}, \mathsf{completed}, \mathsf{failed}\}$ and transitions:

$$\mathsf{pending} \to \mathsf{active} \to \mathsf{completed}$$
$$\mathsf{pending} \to \mathsf{active} \to \mathsf{failed}$$

No other transitions are permitted. The terminal states are $\mathsf{completed}$ and $\mathsf{failed}$.

**Definition 3.2 (Transition rules).** The transitions are governed by:

1. **Activation** ($\mathsf{pending} \to \mathsf{active}$): A work unit $W$ may transition from $\mathsf{pending}$ to $\mathsf{active}$ when:
   - the current partial state $X \in \mathrm{pre}(W)$ (the precondition holds), and
   - the authorization context $C$ satisfies $C \models \mathrm{Scopes}$ for the referenced skill, and
   - the policy $\mathrm{Pol}_a(s, \mathrm{in}, X)$ holds (policy authorization is satisfied).

2. **Completion** ($\mathsf{active} \to \mathsf{completed}$): A work unit $W$ transitions from $\mathsf{active}$ to $\mathsf{completed}$ when:
   - the skill interpretation $[\![s]\!]_a(X, \mathrm{in})$ terminates normally, producing $(X', \mathrm{out})$, and
   - the resulting state $X' \in \mathrm{post}(W)$ (the postcondition holds), and
   - the effect report (Section 4) is well-formed.

3. **Failure** ($\mathsf{active} \to \mathsf{failed}$): A work unit $W$ transitions from $\mathsf{active}$ to $\mathsf{failed}$ when:
   - the skill interpretation $[\![s]\!]_a(X, \mathrm{in})$ produces a failure value (returns $\bot$ with failure marks), or
   - the resulting state $X'$ does not satisfy $X' \in \mathrm{post}(W)$ (postcondition violation), or
   - a tool call within the skill interpretation fails and the failure propagates to the top level.

**Lemma 3.3 (Lifecycle determinism).** The lifecycle state machine is deterministic given the skill interpretation: for a fixed initial state $X$, input $\mathrm{in}$, and skill $s$, exactly one of the transitions from $\mathsf{active}$ fires.

*Proof.* The skill interpretation $[\![s]\!]_a(X, \mathrm{in})$ either terminates normally or produces a failure value. If it terminates normally, the postcondition either holds or it does not. These cases are exhaustive and mutually exclusive, so the transition from $\mathsf{active}$ is determined by the interpretation.

Note that this determinism applies to state transitions, not to policy selection: the policy $\Pi(\sigma, u)$ may return a set of admissible operators, introducing nondeterminism at the $\mathsf{pending} \to \mathsf{active}$ boundary. Once the skill and input are fixed and execution begins, the subsequent lifecycle is deterministic.

---

## 4. Effect Reports

**Definition 4.1 (Effect report).** Every work unit that reaches $\mathsf{completed}$ status must produce an **effect report** as part of $T_{\mathrm{out}}$. An effect report is a tuple:

$$\mathrm{EffectReport} = (\mathrm{created}, \mathrm{modified}, \mathrm{deleted}, \mathrm{content\_delta}, \mathrm{metadata\_delta}, \mathrm{links\_added}, \mathrm{links\_removed})$$

where:

- $\mathrm{created} \subseteq \mathsf{Path}$ is the set of paths created by the work unit;
- $\mathrm{modified} \subseteq \mathsf{Path}$ is the set of paths modified (but not created or deleted);
- $\mathrm{deleted} \subseteq \mathsf{Path}$ is the set of paths deleted;
- $\mathrm{content\_delta} : \mathsf{Path} \to \mathsf{Hash} \times \mathsf{Hash}$ maps each created or modified path to its (before, after) content hash pair;
- $\mathrm{metadata\_delta} : \mathsf{Path} \to \mathsf{Diff}$ maps each path with changed metadata to a structured diff of its frontmatter;
- $\mathrm{links\_added} \subseteq \mathsf{Path} \times \mathsf{Path}$ is the set of (source, target) link pairs added;
- $\mathrm{links\_removed} \subseteq \mathsf{Path} \times \mathsf{Path}$ is the set of (source, target) link pairs removed.

The sets $\mathrm{created}$, $\mathrm{modified}$, and $\mathrm{deleted}$ are pairwise disjoint.

**Definition 4.2 (State hash).** For a partial state $X = (H_X, \mathsf{Op}_X)$ and a path $p$, let $H_X(p)$ denote the semantic content associated with $p$ in $X$ (the restriction of $H_X$ to the fragment generated by the [handle](../../../../../../../content/text/glossary/terms/handle.md) at $p$). Two states $X, X'$ differ at $p$ if $H_X(p) \neq H_{X'}(p)$.

**Invariant 4.3 (Effect completeness).** The effect report must account for every change to the partial state. For all paths $p$:

$$\text{if } H_X(p) \neq H_{X'}(p) \text{ then } p \in \mathrm{created} \cup \mathrm{modified} \cup \mathrm{deleted}.$$

In words: if the semantic content at path $p$ differs between the pre-execution state $X$ and the post-execution state $X'$, then the effect report declares $p$ as created, modified, or deleted.

**Invariant 4.4 (Effect soundness).** The effect report must not claim changes that did not occur. For all paths $p$:

$$\text{if } p \in \mathrm{created} \cup \mathrm{modified} \cup \mathrm{deleted} \text{ then } H_X(p) \neq H_{X'}(p).$$

**Lemma 4.5 (Effect reports characterize state differences).** The completeness and soundness invariants together imply that $\mathrm{created} \cup \mathrm{modified} \cup \mathrm{deleted}$ is exactly the set of paths at which [the state](../../../../../../../../agency-services-section/content/text/documents/articles/notes/undated/the-state.md) changed:

$$\mathrm{created} \cup \mathrm{modified} \cup \mathrm{deleted} = \{p \in \mathsf{Path} : H_X(p) \neq H_{X'}(p)\}.$$

*Proof.* Completeness gives the $\supseteq$ direction; soundness gives the $\subseteq$ direction.

**Remark 4.6 (Relationship to the Agential Semioverse).** The Agential Semioverse specification (Section on Effect Reports and Artifacts) requires that every skill execution produce an effect report describing its interaction with $\mathcal{U}$. This section formalizes that requirement as the completeness and soundness invariants, giving them a precise characterization in terms of state hashes.

---

## 5. Provenance Traces

**Definition 5.1 (Tool call record).** A **tool call record** is a tuple:

$$\mathrm{ToolCall} = (\mathrm{tool\_name}, \mathrm{input}, \mathrm{output}, \mathrm{duration}, \mathrm{status})$$

where $\mathrm{tool\_name}$ identifies the tool, $\mathrm{input} \in \mathrm{In}_t$ and $\mathrm{output} \in \mathrm{Out}_t$ are the concrete values passed to and returned from the tool, $\mathrm{duration}$ is the wall-clock time of the call, and $\mathrm{status} \in \{\mathsf{ok}, \mathsf{failed}\}$ records whether the call succeeded.

**Definition 5.2 (Provenance trace).** A **provenance trace** for a work unit $W$ is a tuple:

$$\mathrm{Trace}(W) = (\mathrm{id}_W, \mathrm{agent}_W, \mathrm{skill}_W, t_{\mathrm{start}}, t_{\mathrm{end}}, \mathrm{tool\_calls}, \mathrm{snapshots}, \mathrm{parent\_chain})$$

where:

- $\mathrm{id}_W \in \mathsf{WID}$ is the work unit's identifier;
- $\mathrm{agent}_W \in \mathsf{Agent}$ is the executing agent;
- $\mathrm{skill}_W \in \mathrm{Skills}_{\mathrm{agent}_W}$ is the skill identifier;
- $t_{\mathrm{start}}, t_{\mathrm{end}}$ are timestamps bounding the execution;
- $\mathrm{tool\_calls} : \mathsf{List}(\mathrm{ToolCall})$ is the ordered sequence of tool calls made during execution;
- $\mathrm{snapshots} : \mathsf{List}(\mathsf{Time} \times \mathsf{StateHash})$ records state hashes at selected points during execution;
- $\mathrm{parent\_chain} : \mathsf{Option}(\mathsf{ChainId})$ references the chain (Section 6) containing this work unit, if any.

**Lemma 5.3 (Trace as provenance history).** The trace $\mathrm{Trace}(W)$ is an element of the provenance category $P(F)$ for each fragment $F$ in the work unit's region $R$. Specifically, the sequence of tool calls in the trace refines into a provenance history in the sense of Section 9 of the [interactive semioverse](../../../../mathematics/objects/universes/interactive-semioverse/index.md) specification: each tool call corresponds to an introduction step (evaluation of an [interaction term](../../../../../../../content/text/glossary/terms/interaction-term.md)), and the sequence of tool calls records a finite sequence of construction steps for the semantic elements produced.

*Proof sketch.* Each tool call $\mathrm{ToolCall}_i$ in the trace corresponds to an evaluation of an [interaction term](../../../../../../../content/text/glossary/terms/interaction-term.md) $t_i \in \mathsf{IxTerm}$ whose denotation $[\![t_i]\!]$ is a semantic generator in $H$. The ordered list of tool calls thus determines a provenance history. The state snapshots provide the refinement ordering: coarser snapshots refine into finer ones as execution proceeds. The result is a well-formed object in $P(F)$.

**Lemma 5.4 (Functorial composition of traces).** Trace construction is functorial: composing work units composes their traces. Given work units $W_1, W_2$ with $W_1$ preceding $W_2$ in a chain (Section 6):

$$\mathrm{Trace}(W_1 ; W_2) = \mathrm{Trace}(W_1) \cdot \mathrm{Trace}(W_2)$$

where $\cdot$ denotes concatenation in the provenance history category $P(F)$ (Lemma 9.1 of the Interactive Semioverse specification: refinement [morphisms](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md) respect concatenation because provenance histories compose functorially).

---

## 6. Work-Unit Chains

**Definition 6.1 (Chain).** A **chain** is a tuple:

$$C = (\{W_1, \ldots, W_n\}, \leq_{\mathrm{dep}})$$

where $\{W_1, \ldots, W_n\}$ is a finite set of work units and $\leq_{\mathrm{dep}}$ is a [partial order](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/partial-order.md) on that set. The relation $W_i \leq_{\mathrm{dep}} W_j$ means that $W_i$ must reach $\mathsf{completed}$ status before $W_j$ may transition from $\mathsf{pending}$ to $\mathsf{active}$.

The dependency relation encodes data flow: if the outputs of $W_i$ are among the inputs of $W_j$, then $W_i \leq_{\mathrm{dep}} W_j$.

**Definition 6.2 (Well-formedness).** A chain $C$ is **well-formed** if the dependency order $\leq_{\mathrm{dep}}$ is acyclic (equivalently, since it is a [partial order](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/partial-order.md) by definition, well-formedness is automatically satisfied; the constraint here rules out the degenerate case of a cycle introduced by construction error in the implementation).

**Definition 6.3 (Satisfiability).** A chain $C$ is **satisfiable** if for each work unit $W_j$ in the chain, the conjunction of postconditions of all predecessors of $W_j$ implies the precondition of $W_j$:

$$\text{for all } W_j, \quad \bigcap_{W_i \leq_{\mathrm{dep}} W_j} \mathrm{post}(W_i) \subseteq \mathrm{pre}(W_j).$$

In words: the guarantees made by earlier work units are sufficient to enable later ones.

**Definition 6.4 (Completeness).** A chain $C$ is **complete** if every work unit $W_i$ in the chain eventually reaches a terminal status ($\mathsf{completed}$ or $\mathsf{failed}$).

**Remark 6.5 (Connection to sequential composition).** A chain with a total dependency order $W_1 \leq_{\mathrm{dep}} W_2 \leq_{\mathrm{dep}} \cdots \leq_{\mathrm{dep}} W_n$ is a sequential composition $W_1 ;_{h_1} W_2 ;_{h_2} \cdots ;_{h_{n-1}} W_n$ in the sense of Definition 6.2 of the [multi-agent coordination](./multi-agent-coordination.md) specification, where each handoff predicate $h_i$ checks that $W_i$'s postcondition holds. A chain with an antichain structure (no dependencies between units) corresponds to parallel composition $W_1 \parallel W_2 \parallel \cdots \parallel W_n$, provided the regions are pairwise disjoint.

---

## 7. Chain Validation

Chain validation connects the work-unit lifecycle to the Petri net model from the [petri-nets-and-lean](../ideas/petri-nets-and-lean.md) specification.

**Definition 7.1 (Petri net encoding of a chain).** Given a chain $C = (\{W_1, \ldots, W_n\}, \leq_{\mathrm{dep}})$, construct a Petri net $N(C)$ as follows:

- For each work unit $W_i$, create a **transition** $t_i$.
- For each precondition element of $W_i$ (each resource or state [property](../../../../sociology/terms/property.md) required), create an **input place** $p_{\mathrm{pre}, i}$.
- For each postcondition element of $W_i$, create an **output place** $p_{\mathrm{post}, i}$.
- For each dependency $W_i \leq_{\mathrm{dep}} W_j$, add arcs from $p_{\mathrm{post}, i}$ to $t_j$ (the output of $W_i$ becomes an input to $W_j$).
- The **initial marking** places one token in each input place corresponding to externally provided resources.
- The **target marking** places tokens in all output places of work units with no successors.

**Theorem 7.2 (Chain validity as Petri net reachability).** A chain $C$ is valid if and only if the target marking of $N(C)$ is reachable from the initial marking.

*Proof sketch.* The forward direction: if the chain is valid, then each work unit fires in dependency order. In the Petri net, this corresponds to firing each transition $t_i$ when its input places have tokens (from externally provided resources or from outputs of predecessors). The firing sequence reaches the target marking. The reverse direction: if the target marking is reachable, there exists a firing sequence for all transitions. Each transition firing corresponds to a work unit completing with its precondition satisfied and its postcondition established.

**Definition 7.3 (Conflict).** Two work units $W_i, W_j$ in a chain **conflict** if they modify the same path:

$$(\mathrm{created}(W_i) \cup \mathrm{modified}(W_i) \cup \mathrm{deleted}(W_i)) \cap (\mathrm{created}(W_j) \cup \mathrm{modified}(W_j) \cup \mathrm{deleted}(W_j)) \neq \emptyset$$

and they do not have a dependency relation ($W_i \not\leq_{\mathrm{dep}} W_j$ and $W_j \not\leq_{\mathrm{dep}} W_i$) and their regions are not disjoint ($R_i \cap R_j \neq \emptyset$).

**Lemma 7.4 (Conflict-free chains produce well-defined composite effects).** A valid chain with no conflicts produces a composite effect report (Section 8) that is independent of the order in which concurrent work units are evaluated.

*Proof.* Concurrent work units (those without a dependency relation) either operate on disjoint regions (and hence commute by Theorem 4.1 of the multi-agent coordination specification) or are conflict-free by assumption. In both cases, the composite effect report is the same regardless of evaluation order.

---

## 8. Effect Composition

Effect reports compose in two ways, depending on whether the work units execute in parallel or in sequence.

**Definition 8.1 (Parallel effect composition).** Given two work units $W_1, W_2$ with disjoint regions ($R_1 \cap R_2 = \emptyset$), define the parallel composite effect report:

$$\mathrm{EffectReport}(W_1 \parallel W_2) = \mathrm{EffectReport}(W_1) \cup \mathrm{EffectReport}(W_2)$$

where union is taken componentwise:

- $\mathrm{created}(W_1 \parallel W_2) = \mathrm{created}(W_1) \cup \mathrm{created}(W_2)$
- $\mathrm{modified}(W_1 \parallel W_2) = \mathrm{modified}(W_1) \cup \mathrm{modified}(W_2)$
- $\mathrm{deleted}(W_1 \parallel W_2) = \mathrm{deleted}(W_1) \cup \mathrm{deleted}(W_2)$
- $\mathrm{content\_delta}(W_1 \parallel W_2) = \mathrm{content\_delta}(W_1) \cup \mathrm{content\_delta}(W_2)$

and similarly for metadata deltas, links added, and links removed. Disjointness of regions ensures the component maps have disjoint domains, so the unions are well-defined (no key collisions).

**Definition 8.2 (Sequential effect composition).** Given two work units $W_1, W_2$ with $W_1 \leq_{\mathrm{dep}} W_2$, define the sequential composite effect report:

$$\mathrm{EffectReport}(W_1 ; W_2) = \mathrm{EffectReport}(W_1) \oplus \mathrm{EffectReport}(W_2)$$

where $\oplus$ denotes sequential composition with the following rules:

- If $W_1$ creates a path $p$ and $W_2$ modifies $p$: the composite reports $p$ as **created** with content hash $(h_{\mathrm{before}}(W_1), h_{\mathrm{after}}(W_2))$. The intermediate hash is absorbed.
- If $W_1$ creates a path $p$ and $W_2$ deletes $p$: the composite omits $p$ (net effect is no change).
- If $W_1$ modifies a path $p$ and $W_2$ modifies $p$: the composite reports $p$ as **modified** with content hash $(h_{\mathrm{before}}(W_1), h_{\mathrm{after}}(W_2))$.
- If $W_1$ modifies a path $p$ and $W_2$ deletes $p$: the composite reports $p$ as **deleted**.
- If $W_1$ deletes a path $p$ and $W_2$ creates $p$: the composite reports $p$ as **modified** (content changed via delete-then-recreate).
- In all other cases (paths touched by only one unit), the individual effect report entry passes through unchanged.

**Lemma 8.3 (Composition preserves completeness and soundness).** If $\mathrm{EffectReport}(W_1)$ and $\mathrm{EffectReport}(W_2)$ each satisfy the completeness and soundness invariants (Invariants 4.3 and 4.4), then $\mathrm{EffectReport}(W_1 \parallel W_2)$ and $\mathrm{EffectReport}(W_1 ; W_2)$ also satisfy both invariants.

*Proof sketch.* For parallel composition with disjoint regions: each path is affected by at most one work unit, so completeness and soundness transfer directly from the individual reports. For sequential composition: the case analysis in Definition 8.2 is exhaustive (it covers all combinations of create/modify/delete between the two units), and each case produces an effect entry if and only if the initial state differs from the final state. The "create then delete" case correctly produces no entry because the net state change is zero.

---

## 9. Idempotency and Re-execution

**Definition 9.1 (Idempotent work unit).** A work unit $W$ with skill $s$ and input $\mathrm{in}$ is **idempotent** if executing it twice from the same initial state produces the same final state:

$$[\![s]\!]_a(X, \mathrm{in}) = [\![s]\!]_a([\![s]\!]_a(X, \mathrm{in})_{\mathcal{U}}, \mathrm{in})$$

where $(-)_{\mathcal{U}}$ projects to [the state](../../../../../../../../agency-services-section/content/text/documents/articles/notes/undated/the-state.md) component.

**Lemma 9.2 (Idempotency as closure).** The idempotency of a work unit corresponds to the idempotency of the [closure operator](../../../../mathematics/concepts/closure-operator/index.md) $\mathcal{S}$ when restricted to the skill's region. A skill invocation that computes a closure is idempotent by construction: once the [fixed point](../../../../mathematics/concepts/fixed-point/index.md) is reached, re-applying the [closure operator](../../../../mathematics/concepts/closure-operator/index.md) produces the same result.

*Proof.* Let $s$ be a skill whose interpretation $[\![s]\!]_a$ computes $\mathcal{S}|_R$ (the [closure operator](../../../../mathematics/concepts/closure-operator/index.md) restricted to region $R$). Then:

$$[\![s]\!]_a([\![s]\!]_a(X, \mathrm{in})_{\mathcal{U}}, \mathrm{in}) = \mathcal{S}|_R(\mathcal{S}|_R(X)) = \mathcal{S}|_R(X) = [\![s]\!]_a(X, \mathrm{in})$$

The second equality holds by idempotency of $\mathcal{S}|_R$ (every [closure operator](../../../../mathematics/concepts/closure-operator/index.md) is idempotent). The first and third equalities hold by the assumption that the skill interprets as the restricted closure.

**Remark 9.3 (Connection to [closure operators](../../../../mathematics/concepts/closure-operator/index.md) as API contracts).** The [closure operators as API contracts](../ideas/closure-operators-as-api-contracts.md) idea proposes treating every skill invocation as computing a closure: a seed produces candidates, a law is applied until stable, and the [fixed point](../../../../mathematics/concepts/fixed-point/index.md) is returned. Idempotent work units are the operational realization of this idea. When a skill is structured as a closure, the soundness guarantee ("output is closed under the law") and the idempotency guarantee ("re-run returns the same [fixed point](../../../../mathematics/concepts/fixed-point/index.md)") follow from the closure properties. Re-executing an idempotent work unit is a no-op because the [fixed point](../../../../mathematics/concepts/fixed-point/index.md) is already reached.

**Remark 9.4 (Practical consequence).** Not all skills are idempotent. A skill that appends a log entry or increments a counter is not idempotent. Skills that normalize content, check style, or enforce structural invariants are natural candidates for idempotent design. When designing skills, prefer idempotent formulations where the domain permits; this makes re-execution safe and simplifies error recovery (a failed chain can be restarted from the last successful work unit without undoing intermediate effects).

---

## 10. Audit Trail

**Definition 10.1 (Audit trail).** An **audit trail** for a sequence of work units is an ordered sequence of effect reports:

$$\mathrm{Audit} = (\mathrm{EffectReport}_1, \mathrm{EffectReport}_2, \ldots, \mathrm{EffectReport}_n)$$

indexed by the order in which the work units completed (for sequential composition) or by a linearization consistent with the dependency order (for chains with parallel components).

**Invariant 10.2 (Audit faithfulness).** The sequential composition of all effect reports in the audit trail, applied to the initial state $X_0$, produces the current state $X_n$:

$$X_n = (\mathrm{EffectReport}_n \oplus \cdots \oplus \mathrm{EffectReport}_1)(X_0)$$

where $\oplus$ is the sequential effect composition from Definition 8.2, applied from left to right.

**Lemma 10.3 (Audit trail as provenance witness).** The audit trail is a constructive witness that the current vault state was produced by admissible operations. Each entry in the trail corresponds to a completed work unit with a provenance trace (Section 5); the sequential composition of all traces forms a single provenance history in $P(F)$ for every affected fragment $F$.

*Proof sketch.* Each effect report satisfies the completeness and soundness invariants (Invariants 4.3 and 4.4), so it faithfully records [the state](../../../../../../../../agency-services-section/content/text/documents/articles/notes/undated/the-state.md) change produced by its work unit. Each provenance trace is an element of $P(F)$ (Lemma 5.3). By functorial composition (Lemma 5.4), the concatenation of traces is itself a provenance history. The audit trail therefore provides, for every fragment $F$ and every element $a \in F$ in the current state, a construction record showing which agent applied which skill with which input to produce $a$.

**Remark 10.4 (Operational counterpart).** The audit trail is the operational counterpart of the provenance category $P(F)$ from the Interactive Semioverse. Where $P(F)$ is defined abstractly as a small category of provenance histories with refinement [morphisms](../../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/morphism.md), the audit trail is a concrete sequence of effect reports that an implementation can produce, store, and query. The faithfulness invariant ensures that the concrete trail is consistent with the abstract category.

---

## 11. Relationship to Other ASR Concepts

This section connects the work-unit lifecycle to other specifications in the Agential Semioverse Repository theory.

**Multi-agent coordination.** Work units are the atomic transitions that agents apply to the partial state. The [multi-agent coordination](./multi-agent-coordination.md) specification defines how these transitions compose when multiple agents are active: region restriction (Definition 3.1 of that spec) constrains each work unit to a region; the non-interference theorem (Theorem 4.1) guarantees that work units on disjoint regions commute; and the coordination correctness conditions (Definition 10.1--10.4 of that spec) apply to chains of work units via the Petri net encoding (Section 7 of this spec).

**Skill manifests.** Each work unit references a skill by its manifest id. The manifest (as specified in the [skill manifests](./skill-manifests.md) spec) provides the input schema $T_{\mathrm{in}}$, the output schema $T_{\mathrm{out}}$, the runtime declaration, and the required scopes. The work unit's $\mathrm{input}$ field must decode against $T_{\mathrm{in}}$; the effect report is part of $T_{\mathrm{out}}$; and the authorization check at activation uses the manifest's scopes.

**Error envelopes.** When a work unit transitions to $\mathsf{failed}$, it produces an [error envelope](./error-envelopes.md) as part of $T_{\mathrm{out}}$. The envelope's semantic code identifies the failure kind (e.g., $\mathsf{INVALID\_INPUT}$, $\mathsf{AUTHORIZATION\_DENIED}$, $\mathsf{POSTCONDITION\_VIOLATION}$). The work unit's status field is set to $\mathsf{failed}$; the trace records the tool call that produced the failure; and the chain can use the error envelope's category to decide whether to abort, retry, or skip the failed unit.

**Agent-skill interaction.** The [agent-skill interaction](../../../../../../../../../../../../../../engineering-services-section/content/text/documents/articles/notes/2026/03/03/2026-03-03-note-on-agent-skill-interaction.md) specification establishes the skill-first principle: agents act through skills, and skills are maintained as first-class artifacts. Work units operationalize this principle by wrapping each skill invocation in a structured lifecycle with preconditions, postconditions, effect reports, and provenance. The skill improvement process described in that specification (improving a skill in response to a gap) can itself be modeled as a work unit with a meta-skill that operates on the skill manifest.

**Closure operators as API contracts.** The [closure operators as API contracts](../ideas/closure-operators-as-api-contracts.md) idea describes the mathematical structure of skill execution: each invocation computes a closure. Section 9 of this specification formalizes the connection: an idempotent work unit is one whose skill interpretation computes a closure, and re-execution is a no-op because the [fixed point](../../../../mathematics/concepts/fixed-point/index.md) is already reached. The "closure contract" of a skill — soundness, minimality, monotonicity, idempotency — translates into invariants on the work unit's effect report and postcondition.
