---
type: narrative
introduces: [work-type-as-closure-structure]
discusses: [function-grounded-in-critical-tradition, work-regime]
---

# Closure rules and the iron cage

The critical theory of work supplies a vocabulary of structural diagnoses — iron cage, real subsumption, contested terrain, algorithmic management, deskilling — for conditions under which the organizational apparatus that coordinates work also constrains, captures, and degrades the people performing it. PredWork's substrate gives these diagnoses precise structural content: each corresponds to a definite property of the closure-rule systems, settling dynamics, or morphisms of the operations settling.

This narrative is not a reduction of the critical diagnoses to mathematics. It is a translation that makes the diagnoses structurally checkable on the substrate.

## The iron cage: settling-monotonicity as structural lock-in

Weber's *stahlhartes Gehäuse* — the shell as hard as steel — names the condition in which a rationalization process that once required human motivation has become self-sustaining, imprisoning even those it nominally serves. The bureaucratic apparatus fires its rules regardless of whether the people subject to them still find the apparatus meaningful.

The substrate analog: **settling-monotonicity**. The operations settling is [settling-monotone](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md): cells only move upward in the knowledge order; no firing retracts settled content. A closure-rule system installed in $\mathcal{S}_{\mathrm{op}}$ continues to fire whenever its antecedents are met, regardless of whether the agents whose activity generated those antecedents intended the rules to keep firing. Once a bureaucratic closure rule is installed and its antecedents are met by the operational context, it fires — and its consequences accumulate.

The iron cage is not merely an inconvenience; it is the structural impossibility of undoing settled content from inside the settling. Escape requires a *visible automorphism* — a [restructure-as-visible-automorphism](../theorems/restructure-as-visible-automorphism.md) event that changes the substrate's rule structure in a way the entire community recognizes. Incremental resistance (refusing to produce antecedent content) can slow firing but cannot retract what is already settled. Structural change (a charter amendment that removes the rule from $\mathcal{S}_{\mathrm{op}}$) is the only settling-theoretic escape.

## Real subsumption: closure-rule expansion into autonomous work space

Marx's distinction between *formal* and *real* subsumption tracks the difference between capital organizing work as it exists vs. transforming work to conform to capital's requirements. Real subsumption is the extension of the capitalist closure-rule system into domains of work previously governed by the worker's own rules — the transformation of craft into process, of autonomous practice into managed procedure.

The substrate analog: **closure-rule-subsystem expansion**. Each agent $A_i$ maintains a local closure-rule subsystem $\mathcal{S}_{A_i}$ governing their private work domain. Real subsumption is a morphism

$$\mathrm{subs}: \mathcal{S}_{A_i} \;\to\; \mathcal{S}_{\mathrm{op}}$$

that transfers rules from the worker's private subsystem into the shared operational subsystem — or, equivalently, that installs new rules in $\mathcal{S}_{\mathrm{op}}$ that fire on cells the worker's rules previously governed exclusively. After subsumption, the cells that the worker previously settled under their own authority are now settled by $\mathcal{S}_{\mathrm{op}}$'s rules, which fire first (shared rules are visible to all; local rules are local).

Formally: the [multi-agent-work-with-local-rules-as-crdt theorem](../theorems/multi-agent-work-with-local-rules-as-crdt.md) shows that per-agent local rules and shared operational rules converge if they do not force incompatible values. Real subsumption is the governance process by which the shared operational rules are extended to *compete* with and eventually *displace* the worker's local rules — not by violating the compatibility condition (which would produce $\top$-state conflicts) but by settling the relevant cells via shared rules before the worker's local rules can fire, rendering the local rules idle.

## Deskilling: work-type regression via rule-substitution

Braverman's deskilling thesis: capitalist management systematically degrades work from judgment-requiring procedures to deterministic processes, concentrating skill in management and leaving execution as mechanical performance. The skilled craft worker (procedure: branching rules, agent judgment at decision nodes) becomes a machine operator (process: deterministic rules, no branching).

The substrate analog: **work-type regression**. By [work-type-as-closure-structure](../theorems/work-type-as-closure-structure.md), a procedure-type task has disjunctive rules in $\mathcal{S}_T$ — the agent evaluates which branch's antecedent applies. Deskilling is the morphism $d: \mathcal{S}_T \to \mathcal{S}_{T'}$ that replaces disjunctive rules with deterministic ones:

$$(\phi_1 \vee \phi_2) \Rightarrow \psi \;\;\mapsto\;\; \phi_1' \Rightarrow \psi$$

where $\phi_1'$ is a pre-committed antecedent (the management decision about which branch to take, now encoded as a rule). The agent's decision node is eliminated; the branch is pre-determined by the rule. Execution-settled$(T') = $ true.

The cost is not only to the worker but to the system's adaptability: a deterministic rule fails when its pre-committed antecedent does not match the actual operational context. A procedure's branching rules handle variance; a process's deterministic rules fail under variance and require management intervention (a new rule) to adapt. Deskilling trades resilience for throughput at the cost of fragility.

## Algorithmic management: high-frequency closure-rule monitoring

Algorithmic management — the real-time, granular monitoring and behavioral direction of workers by software systems — is a governance pattern in which closure rules fire on fine-grained behavioral predicates rather than on output-state predicates.

The substrate analog: **monitoring-rule density**. Traditional managerial oversight fires rules on task-output cells: "when task $T$ reaches $\texttt{completed}$, assess quality." Algorithmic management fires rules on behavioral-trace cells: "when $\langle A, \texttt{response-latency}\rangle > \theta$, assert $\langle A, \texttt{performance-flag}\rangle = \mathbf{t}$." The rules fire continuously during task execution, not only at output boundaries.

The effect: the worker's behavioral space is partitioned into algorithmic-rule-antecedent regions (actions that trigger monitoring rules) and non-antecedent regions. The management's closure-rule system becomes visible throughout the task's execution, not only at its completion. This is the [hypernudge](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/hypernudge.md) applied at the rule-system level: the design of closure-rule antecedents to make certain behaviors trigger rule-firings (positive or negative) constitutes the nudge architecture.

Formally: high-density monitoring rules increase the rule system's *closure rule count on behavioral cells*, not its closure ordinal. The settling regime is not changed (monitoring rules are strict-regime rules: they fire once when the threshold cell crosses). But the monitoring apparatus' presence throughout execution affects worker behavior — which is the point of the management strategy, and the content of the critical diagnosis.

## Contested terrain: $\top$-state zones in the operations settling

Richard Edwards's "contested terrain" names the labor process as a site of ongoing struggle over the rules governing work — not a static structure but a dynamic field of competing claims about what the work requires, how it should be evaluated, and who has authority over it.

The substrate analog: **$\top$-state zones**. When two competing closure-rule systems both settle the same cells — management's rules asserting one value, workers' local rules asserting another — the resulting bilattice value is $\top$ (both true and false). The $\top$-state is not an error condition in the substrate; it is the substrate's representation of genuine normative contest. An operations settling that contains $\top$-state zones on evaluation cells, performance cells, or output-quality cells is a settling with contested terrain.

The [adjudicate-witness-conflict morphism](../morphisms/adjudicate-witness-conflict.md) is the substrate's formal tool for handling $\top$-state zones. Resolution requires governance-layer intervention: a structural decision (charter amendment, management directive, collective agreement) that either installs one set of rules as authoritative (removing the $\top$ by establishing precedence) or removes the contest from the operational settling by delegating the contested domain to a new governance process.
