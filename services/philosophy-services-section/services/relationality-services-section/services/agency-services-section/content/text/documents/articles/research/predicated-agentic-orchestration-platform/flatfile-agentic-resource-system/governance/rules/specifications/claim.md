---
name: claim
description: Specification of a resource file under a theory's `claims/` directory. A claim is a theorem — a settled-true proposition about the theory's substrate behavior, derived under the closure operator. Mathematically a fully-settled cell in the substrate's predication-valuation, or a universal-quantified statement that holds across all settlings. Asserted cell values (axioms) and closure rules (derivation generators) are NOT claims — they are data in entity Fibers and transformers respectively.
title: claim
---

A claim resource file presents one theorem about the theory.

## What a claim is, in an agentic substrate

A claim is a **settled-true proposition** the theory commits to — a statement that holds under the substrate's closure operator.
In predication-categories terms, a claim is a cell whose value reaches $\mathbf{t}$ (or some specified knowledge-order threshold) in the fully-settled state $v^T_\infty$, or a universal-quantified statement that holds across all settlings of the theory.

In FARS-scope agentic substrates, claims are the engineering theorems AgOP and PAOP prove about substrate behavior:

- **Capability non-amplification** — $\Box_R$ never produces a value strictly higher in the knowledge order than its input.
- **Governance-as-modal-restriction** — authority is structurally the modal-necessity $\Box_R u_a$ on capability fibers; not runtime branching.
- **Agent-self-queueing bounded by modal restriction** — agents cannot queue work requiring capability beyond their own modal restriction.
- **Settlement determinism** — given a fixed predication-graph state and closure-rule system, the settled valuation $v^T_\infty$ is determined.
- **Wavefront locality** — closure-rule re-firing under edits is bounded by the rule's match radius.
- **Federation equivalence** — the substrate's algebra commutes with federation handshake.
- **Signature binds witness to identity** — substrate-recorded signatures structurally attribute witnesses to their signing sessions.

Each claim resource records one such theorem.
Some are stated (status: open), some sketched, some proved.
Per AgOP's [agential-self-generation](../../../../agent/agential-self-generation/agential-self-generation.md), the theorems themselves are substrate entities — not external documentation.

## What a claim is NOT

Three things look like claims but are filed elsewhere:

- **Closure rules** (generators of $\mathrm{Cl}^T$) are NOT claims.
  They are *transformers* — morphisms in the predication-fibration.
  Each rule has premise → conclusion shape and IS the closure operator it generates.
  Filed in `transformers/` per [transformer.md](transformer.md).
- **Asserted cell values** (axioms in the initial valuation $v_0$) are NOT claims.
  They are *data* — predications recorded in entity Fibers.
  The substrate carries them as fiber-algebra values at cells, not as separate claim entities.
- **Universal-quantified statements** stated AS substrate rules (like "for all $x$, $P(x) \Rightarrow Q(x)$") are NOT claims.
  They are closure rules with $\forall$-quantified antecedents.
  Filed in `transformers/`.
  A claim about such a rule's BEHAVIOR (e.g., "this rule is Scott-continuous") IS a claim — but the rule itself is not.

The distinguishing test: if the statement is something the substrate *derives* (a settled-true output of the closure operator) or *proves* (a theorem about the substrate's behavior), it is a claim.
If it is a *generator* of the closure operator or *axiom data* the substrate begins with, it is not.

## File location

`<theory>/claims/<claim-slug>.md`.
One file per claim.

## Frontmatter

### `name`

The slug naming this claim.
Required.

### `description`

One-sentence statement of what the claim asserts.
Required.

### `realizes`

List of concepts the claim is about.
Optional, multi-valued.

## Body

The claim's statement, plus its proof (or sketch, or status: open).
Body content depends on the claim's status:

- **Proved** — full proof, citations to lemmas, references to formal verification if applicable.
- **Sketched** — informal argument with the key moves named, gaps acknowledged.
- **Stated/open** — the claim, conditions, an explanation of what proving it would require.

## What this specification does not pin

A `status: open | sketched | proved` discriminator is mathematically meaningful (it affects whether the claim can be cited as a settled fact downstream) but not yet pinned in frontmatter.
Future refinement.

The structured form for a claim's proof — premises cited, lemmas applied, formal-verification module — is deferred.
Claims are currently prose; machine-checkable proof structure is a downstream concern.
