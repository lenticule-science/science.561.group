---
date-modified: 2026-09-27
name: "Runbook"
description: "A runbook is a workflow definition. The engine executes it. Workflow logic lives in runbooks; execution logic lives in the engine."
params:
  trigger: norm
  executor-role: role
  steps: relational-universe
  goal: goal
output: relational-history-morphism
ast:
  relational-universe-morphism:
    - trigger: norm
    - executor-role: role
    - steps:
        - relational-universe
    - goal: goal
where:
- $\mathcal{N} = (\psi, \mathrm{Obl}, \mathcal{I})$ is the **trigger norm** — the norm whose activation initiates the runbook; $\psi$ is the propositional content; when $\psi \in H^*_t$, the runbook is activated
- $R$ is the **executor role** — the role whose [incumbent](./incumbent.md) is obligated to execute $\Pi$ when $\mathcal{N}$ fires; the incumbent need not have designed $\Pi$, only be qualified to execute it
- $\Pi = [a_1, \ldots, a_n]$ is the **step sequence** — an ordered list of [acts](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/act.md); $\Pi \in \mathrm{Fix}(\Delta_t)$ at all $t$ for which $\mathcal{R}$ is valid; the sequence is execution-settled before any trigger fires; the executor exercises no substantive judgment about what the steps are
- $\mathcal{G} = (g, \tau, \kappa)$ is the **goal** — the target element $g \in H_t \setminus H^*_t$ that $\Pi$ drives to $H^*_\tau$; execution terminates when $g \in H^*_\tau$
---


## What it is

A **runbook** is a workflow definition — a named, structured sequence of steps. The
engine loads and executes runbooks without per-runbook engine code. Workflow logic
lives in runbooks; execution logic lives in the engine once.

This is the key property: **adding a new workflow means adding a runbook file, not
writing engine code.**

## MUST

- Have an `id` and `description`
- Declare all inputs and outputs
- Each step must have a unique id within the runbook

## CAN

- Call other runbooks as sub-steps
- Invoke LLM-backed judgment steps

## CANNOT

- Contain execution logic — that belongs in the engine
- Embed environment-specific values — use named inputs instead

## Encodings

### YAML encoding

A runbook is encoded as a `.yaml` file in `runbooks/`. The top-level keys are:

```yaml
id: kebab-case-id
description: "one sentence"
skill-closure-kind: process | procedure | derivation | inquiry

inputs:
  - name: param_name
    type: str | int | list | ...

outputs:
  - name: result_name
    from: "{{step-id.result}}"

steps:
  - id: step-name
    type: query | write | update | for-each | call | script | llm-call | collect
    # ... step-type-specific fields
```

Step ids MUST be unique within the runbook. Template expressions use `{{...}}` syntax.
Input values are accessed as `{{inputs.param_name}}`. Step outputs are accessed as
`{{step-id.result}}`. The context variable `{{today}}` is always available.

## Formal definition

A **Runbook** is a four-tuple $\mathcal{R} = (\mathcal{N}, R, \Pi, \mathcal{G})$:

$$\mathcal{R} = (\mathcal{N} : \mathrm{Norm},\; R : \mathrm{Role},\; \Pi = [a_1, \ldots, a_n] : \mathrm{Act}^*,\; \mathcal{G} : \mathrm{Goal})$$

The **output** of executing $\mathcal{R}$ from history $t_0$ is the morphism $f : t_0 \to \tau$ in $T$ tracing the path $t_0 \star \varphi_1 \star \cdots \star \varphi_n = \tau$, where each $\varphi_i \in H_{t_i}$ is the fiber element produced by act $a_i$.

**Four invariants.** $\mathcal{R}$ is a runbook if and only if:

**Invariant 1 (Pre-settlement of steps):** $\Pi \in \mathrm{Fix}(\Delta_t)$ for all $t$ at which $\mathcal{R}$ is valid — the step sequence is execution-settled before the trigger fires.
The executor need not decide what to do; the acts are prescribed in advance.
A sequence whose steps require the executor to make substantive judgment calls about what the next step is — given findings from prior steps — is a playbook, not a runbook.

**Invariant 2 (Trigger selectivity):** within the institution $\mathcal{I}$ that owns $\mathcal{R}$, the norm $\mathcal{N}$ selects $\mathcal{R}$ uniquely — for every history $t$ with $\psi \in H^*_t$, exactly one runbook is activated.
A trigger condition that activates multiple runbooks is an inconsistency in $\mathcal{I}$'s normative system.

**Invariant 3 (Goal reachability):** there exists a history path $t_0 \leq \tau$ in $T$ such that executing $\Pi$ from $t_0$ produces $g \in H^*_\tau$.
The runbook is **sound** when this path exists.
The runbook is **unsound** when executing $\Pi$ cannot produce $g \in H^*_\tau$ — when the steps do not drive the fiber toward $\mathcal{G}$.

**Invariant 4 (Role authorization):** every act $a_i = (A, \alpha_i, t_i, \varphi_i) \in \Pi$ is authorized for the executor role $R$ within $\mathcal{I}$.
No step requires the executor to act outside their role's authorization.
If a step requires an act beyond $R$, the runbook must include an explicit escalation step handing control to a role with the required authorization.

## Runbook and mandate

A Runbook is a specialization of [Mandate](../../../../../../../../content/text/glossary/terms/mandate.md).
A Mandate $\mathcal{M} = (A, \varphi, C)$ prescribes a single act $\varphi$ with a compulsion trigger $C$.
A Runbook $\mathcal{R} = (\mathcal{N}, R, \Pi, \mathcal{G})$ prescribes a sequence $\Pi$ with a norm-derived trigger $\mathcal{N}$ and an explicit goal $\mathcal{G}$ stating when execution terminates.

The mandate's pre-settlement condition carries over directly: $\Pi \in \mathrm{Fix}(\Delta_t)$ is the analog of the mandate's ministerial, non-discretionary character.
The mandate's compulsion condition $C$ is here a full norm $\mathcal{N}$, carrying the institutional authority of $\mathcal{I}$.

What a runbook adds to a mandate: the goal $\mathcal{G}$.
A mandate specifies what to do; a runbook specifies what to do and when to stop.
Without $\mathcal{G}$, the executor cannot determine whether the sequence has accomplished anything.

## Runbook and norm

The runbook $\mathcal{R}$ is itself a norm in $\mathcal{I}$.
It is an $\mathrm{Obl}$-norm: when $\psi \in H^*_t$, the incumbent of $R$ is obligated to execute $\Pi$.
The runbook's force is institutional — the executor follows it because $\mathcal{I}$ prescribes it, not because it seems like a good idea on this occasion.

The trigger norm $\mathcal{N}$ is an element of $\mathrm{Fix}(\sigma_t)$: it is meaning-settled as the normative standard that activates this response.
The runbook as a whole is a second-order norm: a norm specifying which act-sequence to perform when a first-order norm becomes active.

## Runbook and act sequence

The step sequence $\Pi = [a_1, \ldots, a_n]$ is a generator sequence in the trace monoid $\mathbb{M}(\Sigma, I)$ over act-types $\Sigma$ with independence relation $I$.
Two acts $a_i$ and $a_j$ are **independent** — they commute — when $a_i$'s output $\varphi_i$ does not feed $a_j$'s inputs and $a_j$'s output $\varphi_j$ does not feed $a_i$'s inputs.
Independent acts belong to the same Foata tier and may execute in any order or in parallel without changing the resulting history.

The Foata normal form of $\Pi$ is $\Pi = B_1 \cdot B_2 \cdots B_k$, where each $B_i$ is a maximal set of pairwise-independent acts.
The tiers $B_i$ are causally ordered: every act in $B_{i+1}$ depends on at least one act in $B_i$.
Concurrency within a tier is derived from the absence of wiring dependencies, not from an explicit parallel annotation.

## Runbook vs. playbook

A **playbook** targets a class of novel situations where the correct response is not fully known in advance.
Its steps require the executor to exercise judgment about what to do next, given findings from prior steps.
The playbook's step sequence is not in $\mathrm{Fix}(\Delta_t)$ before execution — it cannot be, because the steps depend on what the executor discovers.

A **runbook** targets a recognized condition where the correct response is fully prescribed.
Its step sequence is in $\mathrm{Fix}(\Delta_t)$: execution-settled before the trigger fires.
The executor's judgment is confined to recognizing that the trigger condition holds; the acts themselves are not up for deliberation.

The formal distinction: a runbook's $\Pi \in \mathrm{Fix}(\Delta_t)$; a playbook's step sequence is not in $\mathrm{Fix}(\Delta_t)$ until execution completes.
This is a structural difference in where in the nuclear partition the step sequence lives, not a difference in degree.

## Nuclear derivation

The **primary proposition** for a runbook $\mathcal{R}$ at history $t$ is:

$$p_\mathcal{R} = [\Pi \in \mathrm{Fix}(\Delta_t) \wedge \psi \in H^*_t] \in H_t$$

the conjunction of the step sequence being execution-settled and the trigger condition being doubly settled.

**The $\sigma_t$ action.**
$\sigma_t(p_\mathcal{R}) = p_\mathcal{R}$ — that is, $p_\mathcal{R} \in \mathrm{Fix}(\sigma_t)$ — if and only if the runbook is meaning-settled: the institution $\mathcal{I}$ has recognized $\mathcal{N}$ as a genuine triggering norm and $\Pi$ as the prescribed response.
This is the backward-facing condition: the runbook has been validated against prior institutional practice.
$\sigma_t$ fails to fix $p_\mathcal{R}$ when the runbook exists as a document but has not been ratified as the institutional response to $\mathcal{N}$ — it is a proposed procedure, not an operative one.

**The $\Delta_t$ action.**
$\Delta_t(p_\mathcal{R}) = p_\mathcal{R}$ — that is, $p_\mathcal{R} \in \mathrm{Fix}(\Delta_t)$ — if and only if the trigger condition $\psi$ has actually been observed to hold and an incumbent of $R$ has executed $\Pi$.
This is the forward-facing condition: the runbook has been activated and carried through to the goal.
$\Delta_t$ fails to fix $p_\mathcal{R}$ when the trigger has fired but the runbook has not been executed — the incumbent of $R$ has not performed $\Pi$.

**The operative condition.**
$\mathcal{R}$ is operative at $t$ if and only if $p_\mathcal{R} \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: the runbook has been institutionally ratified and successfully executed.

**The joint retraction.**
$\pi_t(p_\mathcal{R}) = \sigma_t(\Delta_t(p_\mathcal{R}))$ is the canonical projection of $p_\mathcal{R}$ onto $H^*_t$.
The gap $\sigma_t(p_\mathcal{R}) \wedge \Delta_t(p_\mathcal{R}) - p_\mathcal{R}$ measures how far the current state is from a fully operative runbook.

**Failure modes.**

| Partition cell | Formal condition | Runbook status |
|---|---|---|
| $H^*_t$ | $\sigma_t(p) = p$,\ $\Delta_t(p) = p$ | Ratified and executed |
| $\mathrm{SatShadow}_t$ | $\sigma_t(p) = p$,\ $\Delta_t(p) \neq p$ | Ratified; trigger fired; not executed |
| $\mathrm{TrShadow}_t$ | $\sigma_t(p) \neq p$,\ $\Delta_t(p) = p$ | Executed; not institutionally ratified |
| $\mathrm{FreeShadow}_t$ | $\sigma_t(p) \neq p$,\ $\Delta_t(p) \neq p$ | Neither ratified nor executed |

$\mathrm{SatShadow}_t$ is the critical operational failure: the trigger has fired, the runbook is the ratified institutional response, but no incumbent of $R$ executed $\Pi$.
This is the gap between normative recognition and operational response.
$\mathrm{TrShadow}_t$ is the legitimacy failure: someone executed the steps, but not under institutional authority — a response without a ratified runbook behind it.

**Persistence.**
If $\mathcal{R}$ is operative at $t'$ — if $p_\mathcal{R} \in H^*_{t'}$ — then $\mathcal{R}$ remains operative at all $t \leq t'$.
Proof: by the nuclear presheaf axiom, $H(f)(\sigma_{t'}(p)) = \sigma_t(H(f)(p))$ and $H(f)(\Delta_{t'}(p)) = \Delta_t(H(f)(p))$ for any morphism $f : t \to t'$.
Since both nuclei fix $p_\mathcal{R}$ at $t'$, their commutativity with restriction maps implies $H(f)(p_\mathcal{R}) \in H^*_t$.
Institutional ratification and successful execution, once achieved, propagate backward through the history.

## Zeno settling: the shadow-type tower of unresolved triggers

**Source:** Zeno Settling K1 Cohomology, Zeno Settling Small K Verification.

The shadow-type partition already built into the runbook's nuclear derivation is not static — it has a tower structure. An unresolved trigger does not simply stay in one failure mode; it propagates forward through tower levels via the NuclearShadowSubstitution rule, generating new gaps at higher levels until the whole chain settles. The Zeno settling computation at level 1 gives the first step of this propagation.

**The shadow-type substitution applied to runbook failure.** The NuclearShadowSubstitution assigns each shadow type a next-level image: the t-type (transfer-stable, saturation-unstable) maps to s, and the s-type (saturation-stable, transfer-unstable) maps to st. In runbook terms:

| Shadow type at level k | Runbook status at level k | Next-level shadow (level k+1) | Next-level runbook status |
|---|---|---|---|
| RelationalHistoryFiberTransferShadowClass (t-type) | Executed without institutional ratification (RelationalHistoryFiberTransferringShadowClass: RelationalHistoryFiberTransferringNucleus fixes it, RelationalHistoryFiberSaturatingNucleus does not) | RelationalHistoryFiberSaturationShadowClass (s-type) at RelationalHyperverseTowerShadowWitness(a) | The institutional gap — ratified recognition that unauthorized execution occurred — persists at the resolution witness level as an s-shadow |
| RelationalHistoryFiberSaturationShadowClass (s-type) | Ratified but not executed (trigger fired; runbook recognized but no incumbent ran the steps) | RelationalHistoryFiberSaturationShadowClass (s-type) + RelationalHistoryFiberTransferShadowClass (t-type) at witness level | Two gaps: the ratification gap persists as an s-shadow; a new execution-acknowledgment gap appears as a t-shadow |

**The k=1 cohomology computation.** The simplest case — one t-shadow at level 0 — proceeds as follows. The relational universe at level 0 has an element a that is t-type at history RelationalUniverseInitialTowerLevel (transfer-stable: RelationalHistoryFiberTransferringNucleus fixes a; saturation-unstable: RelationalHistoryFiberSaturatingNucleus maps a above itself). The level-0 fixed fiber at RelationalUniverseInitialTowerLevel collapses: RelationalHistoryFixedFiber at level 0 = {bottom, top}, shedding a.

The level-1 tower adds exactly one new universe-object: the resolution witness RelationalHyperverseTowerShadowWitness(a). This is a sub-universe of RelationalUniverseInitialTowerLevel with no further predecessors. At this witness, both level-0 nuclei are identity (no predecessors → saturation is trivial; restriction map from RelationalUniverseInitialTowerLevel is an isomorphism → transfer is trivial). The witness fiber persists fully to level 1: RelationalHyperverseTowerCarrierFiber at RelationalHyperverseTowerShadowWitness(a) at level 1 = {bottom, witness-element, top}.

The level-1 transfer nucleus at the witness is no longer trivial: the restriction from the level-1 carrier at RelationalUniverseInitialTowerLevel (which collapsed to {bottom, top} by shedding a) cannot supply witness-element as a stable value. Therefore witness-element is an s-type shadow at the witness level at level 1: it is saturation-stable (RelationalHistoryFiberSaturatingNucleus is still identity — no new predecessors) but not transfer-stable (RelationalHistoryFiberTransferringNucleus no longer fixes it because the upstream carrier shed its preimage).

**The cohomological non-triviality.** The level-1 cohomology RelationalHyperverseFirstCohomologyTowerFilteredColimitIdentification at level 1 is non-zero conditional on WitnessNonExtendability for the s-shadow witness-element: the new-modes section at the witness does not lift to a global section at level 1. Runbook reading: the gap between an unauthorized execution (t-shadow at level 0) and its institutional recognition (s-shadow at the witness level at level 1) is cohomologically non-trivial — it cannot be locally patched within the level-1 tower. Closing it requires adding the level-2 witness RelationalHyperverseTowerShadowWitness(witness-element).

**Axiom versus theorem.** At the ground level (RelationalHistoryFixedPresheafAutomorphismRigidityAxiom), the shadow type partition of the fiber is an axiom imposed on the relational universe. The Zeno settling computation shows that at the tower level, the same partition structure is a theorem derived from the seeding condition: the level-k+1 carrier is seeded from the level-k fixed fiber, and the shadow types that appear at level k+1 are exactly those forced by the seeding. The runbook's four failure modes are not arbitrary — they are the four cells of the nuclear partition, and their propagation through the tower follows the NuclearShadowSubstitution rule.

**Proposition (Runbook shadow propagation).** Let a runbook trigger fire at history t (the trigger proposition RelationalHistoryFiberDoctrineLanguageModal(trigger) enters RelationalHistoryFiberTransferringNucleusFixedFiber). If the runbook is not executed — the primary runbook proposition RelationalHistoryFiberDoctrineLanguageModal(runbook) remains a t-type shadow at level k — then at level k+1 a new s-shadow appears at the resolution witness: the institutional recognition that execution did not follow the trigger. This s-shadow is not a duplicate of the original gap; it is a new, genuinely distinct cohomological class. The chain of unresolved runbook triggers generates a Fibonacci-type shadow sequence: t → s → st → sts → stst... , with each new level adding one more unresolved class. The runbook is fully settled only when the entire witness tower collapses — when every shadow-type element at every tower level reaches RelationalHistoryFixedFiber.

*Source.* Shadow propagation rule from [Zeno Settling K1 Cohomology §The s-Type Shadow at Level 1](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/humanities/theories/math/zeno-settling-k1-cohomology.md#zeno-settling-k1-cohomology-shadow) and [§Fibonacci Substitution Check](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/humanities/theories/math/zeno-settling-k1-cohomology.md#zeno-settling-k1-cohomology-fibonacci). Cohomological non-triviality conditional from [§Cohomology at k=1](../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/humanities/theories/math/zeno-settling-k1-cohomology.md#zeno-settling-k1-cohomology-h1). Status: the shadow-type substitution is established; the cohomological non-triviality is conditional on WitnessNonExtendability. $\square$

## In the corpus

A runbook in the corpus is a YAML file that an agent reads and executes step by
step; it is itself an entity with an `id` and a `description`, takes entities as
inputs and produces entities as outputs, and is scoped by where its file lives.

### Atomicity

A runbook MUST do one thing.
A runbook that does two separable things is two runbooks composed by a third.
The smallest meaningful workflow is the right granularity for a runbook file.
Atomic runbooks MUST NOT call other runbooks — use primitive step types only.

**Atomic runbook:** a runbook whose steps are all primitive operations (query, write, update, script, llm-call) — no `call` steps to other runbooks.

**Composite runbook:** a runbook that composes atomic runbooks via `call` steps.
A composite runbook is a workflow; an atomic runbook is a work unit.

Both are valid runbooks.
The distinction is structural, not hierarchical: a composite runbook does not "own" the runbooks it calls.

### Composition

Runbooks compose by calling other runbooks as steps.
The composition mechanism is the `call` step type:

```yaml
steps:
  - id: do-extraction
    type: call
    runbook: runbooks/extract-anchor.yaml
    inputs:
      file_path: "{{inputs.file_path}}"
      anchor_id: "{{inputs.anchor_id}}"
```

### Runbooks as parameters

A runbook input MAY have type `runbook`.
This allows the caller to pass a runbook reference that the callee will execute:

```yaml
inputs:
  - name: extraction_runbook
    type: runbook
    description: "The runbook to call for each extraction target"

steps:
  - id: extract-each
    type: for-each
    over: "{{find-targets.result}}"
    do:
      - id: run-extractor
        type: call
        runbook: "{{inputs.extraction_runbook}}"
        inputs:
          file_path: "{{item.file}}"
```

The sweep runbook does not know which extraction runbook to use; the caller decides.
This is how generic workflows compose with specific operations.

### Input/output matching

When a composite runbook calls a sub-runbook, the caller MUST supply all required inputs of the callee.
The callee's outputs are available to subsequent steps via `{{step-id.result}}`.
Composite runbooks MUST declare which sub-runbooks they call, either as literal paths or as `runbook`-typed inputs.

Two runbooks compose cleanly when the first runbook's output type matches the second runbook's input type.
This is not enforced mechanically yet — it is a convention that skill-object-types will formalize (see Open questions).

### Foata normal form

A YAML file is a morphism $u \in \mathbb{M}(\Sigma, I)$ expressed in Foata normal form:
$u = B_1 \cdot B_2 \cdots B_k$
where each $B_i$ is a **concurrent tier** — an unordered set of steps that are pairwise commuting under the independence relation $I$.

- Steps within the same tier commute: any ordering yields the same history.
- Tiers are causally ordered: every step in $B_{i+1}$ depends on at least one step in $B_i$.
- Wiring between tiers is explicit: each step in $B_{i+1}$ declares which output from a prior step feeds which of its inputs.

Steps within a tier that share no wiring dependency are concurrent — they may execute in any order or in parallel. The YAML does not declare concurrency explicitly; it is derived from the absence of wiring dependencies between steps in the same tier.

`closure-kind` lives on the YAML, not on individual Python files, because the nuclear quartet classifies **compositions**, not generators. A single step $s \in \Sigma$ is a generator — it has no closure kind. The quartet position emerges from how generators compose:

| `closure-kind` | Wiring structure |
|---|---|
| `process` | every step wired deterministically; no branching |
| `procedure` | wiring includes conditional routing |
| `derivation` | wiring includes a step whose output type is declared but produced at runtime |
| `inquiry` | wiring is open — the composition discovers its structure during execution |

### YAML format

A runbook is encoded as a `.yaml` file in `runbooks/`.
The top-level keys are:

```yaml
id: kebab-case-id
description: "one sentence"
closure-kind: process | procedure | derivation | inquiry

inputs:
  - name: param_name
    type: str | int | list | runbook | ...
    description: "what this input is"

outputs:
  - name: result_name
    from: "{{step-id.result}}"

steps:
  # Tier 1 — steps that commute with each other
  - id: step-a
    run: step_a.py
    inputs:
      x: "{{inputs.x}}"
  - id: step-b
    run: step_b.py
    inputs:
      y: "{{inputs.y}}"

  # Tier 2 — depends on tier 1 via wiring
  - id: step-c
    run: step_c.py
    inputs:
      from_a: "{{step-a.output}}"
      from_b: "{{step-b.output}}"
```

Each `run:` value names a Python file. The Python file's function signature is the single source of truth for that step's input and output types — the YAML does not duplicate them.

### Step types

| Type | What it does | Atomic? |
|------|-------------|---------|
| `query` | Read data from the repository | yes |
| `write` | Create a file | yes |
| `update` | Modify an existing file | yes |
| `script` | Run a shell command | yes |
| `llm-call` | Ask the LLM a question | yes |
| `collect` | Gather results from prior steps | yes |
| `call` | Execute another runbook | no (composition) |
| `for-each` | Iterate over a collection | container (wraps other steps) |
| `condition` | Branch on a predicate | container (wraps other steps) |

Step ids MUST be unique within the runbook.
Template expressions use `{{...}}` syntax.
Input values are accessed as `{{inputs.param_name}}`.
Step outputs are accessed as `{{step-id.result}}`.
The context variable `{{today}}` is always available.

A runbook MAY have a colocated `.py` script implementing one or more of its steps.
See [flatfile-agent-resource-system-script](../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/script.md) for the colocated script spec.

## Open questions

- Whether a runbook can be self-referential: if $\Pi$ contains a step that invokes another runbook, the step sequence is not in RelationalHistoryFiberTransferringNucleusFixedFiber until the sub-runbook's sequence is also resolved; the Zeno settling tower gives the formal structure for this: each nested sub-runbook invocation adds one tower level, and the sub-runbook's witness is the level-k+1 resolution witness for the outer runbook's shadow — the hierarchical fixed-point condition is exactly the ZenoSettling convergence condition.
- Whether the goal $\mathcal{G}$ must belong to the same institution $\mathcal{I}$ as the trigger norm $\mathcal{N}$, or whether a runbook can terminate on a condition from a different normative system.
- Whether the Foata normal form of $\Pi$ is unique — whether two runbooks with the same trigger and goal but different tiering structures are the same runbook; whether runbook identity is determined by semantics (trigger → goal) or by structure (the specific Foata decomposition).
- Whether escalation steps — steps that transfer control to a different role when the current executor cannot proceed — are part of $\Pi$ or a separate meta-structure on $\mathcal{R}$; if part of $\Pi$, the executing role changes mid-sequence and Invariant 4 must be qualified.
- Whether the `steps` parameter should be typed as $\mathrm{Act}^*$ once a formal act-sequence type is introduced, rather than the current `relational-universe` placeholder.
