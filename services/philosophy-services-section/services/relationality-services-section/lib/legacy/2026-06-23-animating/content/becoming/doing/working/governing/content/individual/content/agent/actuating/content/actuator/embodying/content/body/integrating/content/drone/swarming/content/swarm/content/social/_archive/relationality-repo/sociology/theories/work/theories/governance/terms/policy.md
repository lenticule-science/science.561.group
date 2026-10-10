---
title: Policy
description: "A Policy is an enacted, standing normative commitment that applies to all agents within a defined scope and persists until explicitly repealed, generating duties for whoever falls within the scope."
defines: Policy
aliases:
  - "policy"
  - "standing commitment"
  - "organizational policy"
related: Norm, Duty, NormativeSystem, Rule, Authority, Institution, Charter
extends: [Norm]
requires: [NormativeSystem, Authority]
enables: [Duty, Implementation, Compliance, Accountability]
contrasts-with: [Custom, Norm, Regularity, Rule, Law, Guideline]
references:
  - id: lasswell1950
    type: document
    title: Power and Society: A Framework for Political Inquiry
    author:
      - literal: H. D. Lasswell
      - literal: A. Kaplan
    container-title: Yale University Press
    issued:
      - year: 1950
  - id: simon1947
    type: document
    title: Administrative Behavior: A Study of Decision-Making Processes in Administrative Organization
    author:
      - literal: H. A. Simon
    container-title: Macmillan
    issued:
      - year: 1947
  - id: ostrom1990
    type: document
    title: Governing the Commons: The Evolution of Institutions for Collective Action
    author:
      - literal: E. Ostrom
    container-title: Cambridge University Press
    issued:
      - year: 1990
  - id: kelsen1960
    type: document
    title: Pure Theory of Law
    author:
      - literal: H. Kelsen
    container-title: University of California Press
    issued:
      - year: 1960
date-created: 2026-04-03
---

## What This Is

A **Policy** is a standing normative commitment enacted by some authority that constrains future action within a defined scope.
It is not a single decision but a FRAME for future decisions: a commitment that persists until actively repealed, generates duties for all agents within its scope, and applies universally to whoever occupies the scope—not to named individuals.

The crucial distinction: a [norm](./norm.md) can emerge through custom or practice (a regularity that has acquired normative force).
A policy is always ENACTED—someone with authority declares it.
A [duty](./duty.md) is instantiated to a specific bearer with a specific correlative party.
A policy generates duties for whoever falls within its scope, but the policy itself is the standing commitment, not the individual duties it creates.

Harold Lasswell and Abraham Kaplan (1950) defined policy as "a projected program of goals, values, and practices."
This captures the forward-looking, programmatic character: a policy is not a fact about how things are done but an intention made operational—a statement about how things WILL be done by authority.

## Formal Definition

A **Policy** is a six-tuple $\mathcal{P} = (\mathcal{N}, A, S, \beta, \tau, r)$:

$$\mathcal{P} = (\mathcal{N} : \mathrm{Norm},\; A : \mathrm{AgentSet},\; S : \mathrm{Scope},\; \beta : \mathrm{Authority},\; \tau : \mathrm{Persistence},\; r : \mathrm{RepealCondition})$$

where: - $\mathcal{N} = (\varphi, O, \mathcal{N}_{\mathrm{sys}})$ is the underlying [norm](./norm.md)—the propositional content $\varphi$, deontic operator $O$ (obligation, permission, or prohibition), and the [normative system](./normative-system.md) $\mathcal{N}_{\mathrm{sys}}$ within which it operates - $A$ is the **agent set**—the class of all agents to whom the policy applies; not named individuals but role-bearers (employees, residents, officeholders) - $S$ is the **scope**—the spatial, temporal, or contextual boundaries within which the policy applies; the **jurisdiction** of the policy - $\beta$ is the **authority source**—the source (statute, charter, organizational directive) from which the policy derives its binding force; without $\beta$, $\mathcal{N}$ is a suggestion, not a policy - $\tau : T \to \{0,1\}$ is the **persistence condition**—the policy is ACTIVE (in force) at times in $\tau^{-1}(1)$ and INACTIVE at times in $\tau^{-1}(0)$; a policy remains in force by default until explicitly repealed - $r$ is the **repeal condition**—the rule or procedure by which the policy can be revoked; without $r$, the policy is permanent and indefeasible

**Five invariants.** $\mathcal{P}$ is a policy iff:

1. **Enactment**: $\beta$ is an exercised authority, not a theoretical one.
  The policy was declared by an authorized agent or body through an established procedure (a vote, a signature, an announcement).
  This distinguishes policies from customary norms: policies have a birth moment—a determinate history of enactment.

2. **Universality within scope**: the policy applies to ALL agents satisfying the scope condition, not to individuals selected case by case.
  If the scope is "employees of company X," the policy applies to every such employee identically; if the scope is "transactions over $10,000," the policy applies to all such transactions.
  Universality is what makes a policy generative of duties: each agent within the scope incurs a duty.

3. **Standing force**: once enacted, the policy is in force at all times $t$ such that $\tau(t) = 1$ and no repeal condition has been satisfied.
  The policy is not revisited at each decision point—it is the standing background against which decisions are made.
  Herbert Simon (1947) identified this as the key feature: policies reduce the decision space for organizational members, converting them from decision-makers into rule-followers.
  The policy is the PREMISE for decisions, not a decision.

4. **Authority persistence**: the authority $\beta$ that enacted the policy must persist at the [normative system](./normative-system.md) level for the policy to remain in force.
  If the authority is dissolved or deposed, the policy's force becomes problematic (either it survives through a different authority or it lapses).
  A policy grounded in the old regime's authority does not automatically survive a regime change, though it may be re-enacted under the new regime.

5. **Explicit repeal**: the policy persists until an explicit repeal condition $r$ is satisfied—a vote, a revocation order, a date of expiration.
  This is distinct from a regularity that can fade through disuse.
  A policy that no one follows is STILL in force until actively repealed; this is the mark of its enactment.
  It is a normative commitment, not an empirical regularity.
  (Kelsen, 1960: a norm is valid by its authority, not by compliance rate.)

## Lasswell & Kaplan: Policy as Projected Program

Harold Lasswell and Abraham Kaplan (1950) situated policy in the context of political decision-making.
A policy is the result of a DECISION to establish a projected program of goals, values, and practices.
The decision is made once; the policy executes repeatedly, constraining future decisions within the scope.

Key insight: **policy is intentional action made persistent**.
It is not a prediction about what will happen but a commitment about what ought to happen.
The difference between "most of our employees do arrive before 9 AM" (a regularity) and "employees must arrive by 9 AM" (a policy) is the intentional structure: the regularity describes; the policy prescribes.

**The policy decision process**: Lasswell and Kaplan identify the elements of policy-making as follows.
A policy is a **response to a problem or opportunity** (a gap between the current state and a desired state).
The authority identifies the problem, selects a goal, chooses means, and announces the policy.
Once announced, the policy becomes the operative standard for agents within the scope.
Agents are then expected to conform; failure to conform is a violation of the policy, not a failure of empirical prediction.

## Simon: Policy as Decision Premise

Herbert Simon (1947) reframed policy as part of the theory of organizational decision-making.
In administrative organizations, individuals make decisions continuously.
Without a policy framework, each decision would require solving the full problem afresh.
Policies reduce the decision space.

A **policy is a decision premise**—a constraint on the decision-maker's search space.
The policy says: "For questions of type Q, the answer is A."
The decision-maker then needs only to classify the current situation (does it fall under Q?) and implement the policy answer (do A).
The policy has already made the decision; the individual merely applies it.

**Bounded rationality and policies**: Simon's broader insight is that human agents are *boundedly rational*—they cannot solve problems fully optimally given time and information constraints.
Policies are the solution mechanism: by encoding decisions in advance (in the form of standing commitments), organizations enable agents to act without full deliberation.
The policy is the *transferred decision*: the authority made it once; each agent makes it again implicitly through compliance.

This is why policies work best when they are STABLE (persist over time) and CLEAR (agents understand what they require).
A policy that changes daily is not a decision premise but a constant surprise.
A policy that is ambiguous forces agents to re-deliberate at the point of application, defeating its purpose.

## Ostrom: Polycentric Policies and Nested Governance

Elinor Ostrom (1990) studied how communities manage shared resources (commons) through their own rule systems.
Her observation: policies are not monolithic.
Nested and polycentric systems contain policies at multiple levels: **operational policies** (what to do day to day), **collective-choice policies** (how to change operational policies), and **constitutional policies** (how to change collective-choice policies).

A concrete example: a timber commons in a Swiss alpine village.
The **operational policy** says "each household may harvest up to X timber per year."
The **collective-choice policy** says "the forest management committee meets annually to revise the harvest quota."
The **constitutional policy** says "the canton's law authorizes the village to form a forest management committee."

Ostrom's insight: each level of policy is a standing commitment, but at different timescales.
The operational policy applies to every season.
The collective-choice policy applies annually.
The constitutional policy applies until repealed by the canton.
The system is stable because lower-level policies are sheltered from constant revision by the authority of higher-level policies.

This nesting explains why policies are **scoped by level**: a company's operational policy on email response time does not repeal the collective-choice policy (decisions about work scheduling); both are in force, at different abstraction levels.

## Policy vs. Adjacent Concepts

**Policy vs. Norm**: A [norm](./norm.md) may be customary (arising from practice) or enacted.
A policy is ALWAYS enacted.
A norm states what agents should do; it may emerge slowly and informally.
A policy is announced; it takes effect at a determinate moment.
Both are normative commitments, but policies have a formal birth and (usually) a formal death.

**Policy vs. Rule**: A rule is a specific instruction ("files must have frontmatter").
A policy is a standing commitment that GENERATES multiple rules.
The policy "One Concept Per File" generates rules about structure, naming, linking, and content review.
Rules are tactical; policies are strategic.

**Policy vs. Duty**: A [duty](./duty.md) is always indexed to a specific bearer and a specific correlative party.
A policy applies to all agents within a scope, generating duties for each.
The policy generates the duty, but the policy itself is not the duty.

**Policy vs. Law**: A law is a policy enacted by sovereign authority (the state).
Organizational policies have the same structure as laws—they are enacted, standing, universal within scope—but derive from organizational authority, not sovereign authority.
A company's policy on benefits and a state's tax law are structurally identical; they differ in the source of authority.

**Policy vs. Guideline or Recommendation**: A guideline advises; it does not bind.
It is permissive ("you may do X") or suggestive ("consider doing X").
A policy is a commitment; it binds agents to a standard and creates accountability for deviation.
A policy violated is a governance failure; a guideline violated is merely a missed opportunity.

## Policy-as-Code: The Computational Limit Case

The emergence of **policy-as-code** movements in software engineering and compliance illustrates the upper limit of policy precision.
When a policy is encoded as executable rules—checks that can be automatically evaluated against compliance logs—the policy becomes fully determinate.
A policy-as-code rule might state: "If transaction_amount > 10000, then request_approval() must be called before settlement()."
The rule is checkable, automated, unambiguous.

A system might store policies in a machine-readable form — numbered standing commitments that can be evaluated against work products.
This represents the formal limit: when a policy is precise enough to be executable, it becomes a complete specification of the required behavior.

Most organizational policies fall short of this precision.
They state principles that agents must interpret and apply contextually.
The challenge of governance is maintaining this tension: policies must be precise enough to guide action without being so rigid that they prevent adaptive judgment.

## Nuclear Reading

A policy $\mathcal{P} = (\mathcal{N}, A, S, \beta, \tau, r)$ is **operative at history $t$** iff:

1. The underlying [norm](./norm.md) $\mathcal{N} = (\varphi, O, \mathcal{N}_{\mathrm{sys}})$ is operative at $t$ (meaning $\varphi \in \mathrm{Fix}(\sigma_t)$, the saturation nucleus has closed on the policy's content)
2. The persistence condition is active: $\tau(t) = 1$ (the policy is not yet lapsed or repealed)
3. No repeal condition has been satisfied: the rule $r$ has not triggered
4. The authority $\beta$ is still active in the [normative system](./normative-system.md)

The **scope** $S$ determines which agents incur duties under the policy.
An agent $a$ is in scope iff $a \in A$ and $a$ is in the [normative system](./normative-system.md) $\mathcal{N}_{\mathrm{sys}}$.
For each such $a$, a [duty](./duty.md) $D(a, \cdot, \mathcal{N}_{\mathrm{sys}}, \varphi, r)$ is generated, where $r$ is the correlative party (the entity or class on behalf of which the policy is enacted—often the organization or the public).

A policy is **self-persisting**: once enacted, it remains in force unless an explicit repeal condition is satisfied.
This is the mark of its enactment.
A custom may fade; a policy must be formally revoked.

## Open Questions

- **The Grundnorm of a policy system**: Is there a foundational policy (a Grundnorm in the Kelsenian sense) from which all other policies derive their authority?
  In a company, is the [Charter](./charter.md) the Grundnorm, or does it presuppose an even deeper founding commitment?

- **Ostrom's three-level policy nesting vs. the nuclear tower**: Do Ostrom's operational, collective-choice, and constitutional policies correspond to three strata of the relational-history tower, with restriction maps connecting them?
  And does the nuclear double-settlement ($\sigma_t$ and $\Delta_t$) apply equally at each level, or does policy operativity at different levels require different nuclear structures?

- **Policy stability and agent internalization**: When a policy is repeatedly followed, do agents internalize it such that it becomes part of their dispositions?
  If so, is the transition from $\tau(t) = 1$ (policy is in force) to $\tau(t) = 0$ (policy is repealed) still binding if agents have been habituated to the policy?
  Does internalization create a second layer of normativity independent of $\beta$'s authority?

- **Conflict resolution among nested policies**: When an operational policy conflicts with a constitutional policy, which takes precedence?
  Is the resolution built into the [normative system](./normative-system.md) hierarchy, or does it require a meta-policy (a policy about which policies to follow when they conflict)?

- **The boundary between policy and implementation**: At what point does a policy become a rule or a procedure?
  Is the distinction one of abstraction level (policies are abstract, rules are concrete) or of structure (policies are deontic commitments, rules are procedures)?
  Or is it temporal (policies are standing, rules are one-time)?

## See Also

- [Norm](./norm.md) — the propositional structure of policies and the distinction between norm and regularity
- [Duty](./duty.md) — the instantiation of a policy's normative content in the bearer-correlative pair
- [NormativeSystem](./normative-system.md) — the ambient order within which a policy operates and derives its force
- [Authority](./authority.md) — the source from which a policy's binding force derives
- [Institution](./institution.md) — the collective acceptance structure that sustains policies over time
- [Charter](./charter.md) — the founding document that typically establishes the constitutional-level policies
- [Rule](../../../../../../../../engineering/theories/tech/terms/rule.md) — the tactical, context-specific instructions that policies generate
