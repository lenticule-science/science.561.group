---
type: narrative
status: active
see-also:
  - ../objects/side-effect.md
  - ../theorems/side-effect-irreversibility-bound.md
  - ../theorems/composition-correctness-undecidable.md
---

# Tool use and safety

Tool use is the substrate of agentic capability and the substrate of agentic risk.
The two travel together; analyzing one without the other misses the structure.
This narrative collects the safety implications of tool augmentation.

## The capability-risk coupling

Per [tool-augmentation-strict-improvement](../theorems/tool-augmentation-strict-improvement.md), tool augmentation strictly expands the action space.
Some of those actions are harmful.
Therefore tool augmentation strictly expands the harm-action space.

This coupling is unavoidable: you cannot give an agent the ability to send email without giving it the ability to send harmful email; cannot give it ability to execute code without enabling harmful code; cannot give it computer use without enabling harmful UI actions.

Safety mechanisms therefore *constrain* rather than *eliminate* the harm space.

## The four risk classes

Tool use introduces four broadly distinct risk classes:

**1.
Direct harm.** The agent's tool use directly causes harm — sending fraudulent email, executing destructive code, transferring funds inappropriately.

**2.
Indirect harm.** Tool use produces harmful downstream effects — leaking credentials enabling later attacks, modifying data corrupting later processes.

**3.
Adversarial exploitation.** Tools become attack surface — prompt injection through tool inputs, adversarial pages in browser automation, malicious API responses.

**4.
Aggregate harm.** Many individually-benign actions compound into harmful outcomes — small purchases adding to financial damage, many messages becoming spam.

Different mechanisms address different classes.

## Pre-commit gating

Per [side-effect-irreversibility-bound](../theorems/side-effect-irreversibility-bound.md), irreversible actions need pre-commit gating:

- Classify tools by reversibility.
- Require approval for irreversible actions.
- Default to read-only.

This is the *single most important* safety mechanism for agentic systems with action capacity.

## Sandboxing

Code execution and computer use need sandbox isolation:

- Filesystem isolation.
- Network isolation (or allowlisting).
- Resource limits.
- Process isolation between users.

Sandboxes contain the blast radius of tool-use errors.
Sandbox escape is a serious vulnerability class.

## Verification and testing

Per [composition-correctness-undecidable](../theorems/composition-correctness-undecidable.md), agent behavior cannot be verified statically in general.
Production safety relies on:

- **Pre-deployment testing.** Behavior on representative scenarios.
- **Adversarial red-teaming.** Behavior under adversarial inputs.
- **Runtime monitoring.** Behavior in production observed for anomalies.
- **Bounded rollback.** Ability to undo recent state changes.
- **Human review.** For high-stakes actions.

These are layers; no single mechanism suffices.

## Action injection

The action analog of prompt injection:

- Adversarial content (in web pages, in retrieved documents, in tool outputs) tries to influence agent to take unintended actions.
- Indirect prompt injection: malicious content in agent's context window tries to override instructions.
- Especially severe with computer use: malicious UIs can attempt to manipulate the agent.

Defenses:

- Input sanitization (limited efficacy).
- Action approval for high-stakes actions.
- Sandbox-level access controls.
- Adversarial training.

No complete defense exists.

## Capability evaluation

Knowing what an agent *can* do is a safety prerequisite:

- Capability evaluations test what tasks the agent can complete.
- Dangerous-capability evaluations test specifically for harmful task completion.
- Tool-using agents have substantially expanded capability sets requiring corresponding evaluation.

Capability evaluations are increasingly standard pre-deployment for capable agents.

## Authentication and authorization

Tools that touch external systems need:

- **Authentication.** Agent acts as a specific principal.
- **Authorization.** Permissions limit what actions the principal can take.
- **Audit logging.** All actions attributable.
- **Revocation.** Ability to disable agent access.

Standard distributed-systems security applied to agent contexts.

## The AI safety-at-deployment problem

Tool use makes "safety at deployment" central:

- Pre-deployment safety (alignment, training) is necessary but insufficient.
- Tool-using agents in production produce real consequences requiring real-time safety mechanisms.
- The deployment context (what tools, what users, what data) determines real risk.

Safety evaluation must include the deployment configuration, not just the model.

## The supervision problem

Effective tool-use safety often requires supervision:

- Human-in-loop for high-stakes actions.
- Supervisor agents monitoring primary agents.
- Policy engines enforcing rules.

But:

- Human supervision doesn't scale to many agents acting fast.
- Supervisor agents have their own reliability problems.
- Policy engines are bypassed by sufficiently creative agent behavior.

No clean solution; production systems combine mechanisms.

## What's improving

- **Vendor safety features.** Function-calling APIs add increasingly sophisticated safety options (strict mode, content filters, etc.).
- **Sandboxing technology.** Modern sandboxes are more reliable.
- **Capability evaluations.** Standardized evaluations exist; coverage growing.
- **Industry practice.** Awareness of agent risks is increasing.

## What's not solved

- **Action injection.** No complete defense.
- **Long-horizon agent behavior.** Hard to verify or audit.
- **Computer-use safety.** Risk surface vastly larger than API tool use.
- **Multi-agent emergent behavior.** Not yet studied systematically.
- **Capability-of-deployed-systems estimation.** What any specific deployed agent can do is unclear.

## In summary

Tool use is the substrate of agentic capability *and* agentic risk.
Safety in this domain is a portfolio of mechanisms — gating, sandboxing, verification, monitoring — none of which suffices alone.
The trajectory is toward more capable agents with correspondingly more sophisticated safety mechanisms; the race between capability gain and safety sophistication is ongoing and will define the next several years of agentic AI deployment.
