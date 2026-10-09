---
name: question
description: Specification of a resource file under a theory's `questions/` directory. A question is an *abstaining speech act* — a recorded $\bot$-valued cell that names what the theory does not yet commit to. Mathematically, a question is the precondition for a researching morphism: it identifies the gap that researching closes by extending the theory.
---

A question resource file presents a single open inquiry of the theory.

## What a question is, mathematically

In the [speech-act](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/speech-act.md) framework, the four illocutionary force classes are determined by the bilattice-value of the positing datum:

| Force | Datum | Morphism |
|---|---|---|
| **Abstaining** | $\bot$ | Identity (no positing morphism) |
| Asserting | $\mathbf{t}$ | Assertive positing morphism |
| Denying | $\mathbf{f}$ | Denial positing morphism |
| Contesting | $\top$ | Contestation positing morphism |

A question is the substrate's recording of an abstaining speech act: a named cell or family of cells where the theory has not committed, accompanied by the inquiry-content that would make commitment possible.

Each question is the precondition for a [researching morphism](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/researching.md) $\rho: T \to T'$ that would close the gap by extending the theory's predicate scope or its closure rules such that some cell currently at $\bot$ achieves a determinate value.
The researching morphism is "non-free at the theory level" — it requires genuine new discovery.
A question records the discovery target.

A theory that has not surfaced its open questions cannot license its researching activity.
Per AgOP's [agential-self-generation](../../../../agent/agential-self-generation/agential-self-generation.md), inquiries are substrate entities, not external research notes — a question is the substrate's record of an agent expressing $\bot$-commitment at cells the agent wants resolved.

In a multi-observer agentic substrate, a question additionally has agentive attribution: per [agentive positing morphisms](../../../../../../notes/undated/agentive-positing-morphism.md), it is the particular observer's recorded abstention.
Other observers may posit non-abstaining values at the same cell; the question persists as the inquiring observer's named position pending researching activity that resolves it for that observer.

## File location

`<theory>/questions/<question-slug>.md`.
One file per question.

## Frontmatter

### `name`

The slug naming this question.
Required.

### `description`

One-sentence statement of the open inquiry.
Required.

### `inquires-into`

List of entities (structures, transformers, claims, concepts, or other theories) the question is inquiring into — the substrate entities at whose cells the abstaining posit applies.
The substrate uses this to compute which researching activity would close the question.
Optional, multi-valued.

## Body

Human-readable description of the inquiry: what is unknown, why it matters, what would count as resolution, and what researching activity might close the gap.

## What this specification does not pin

The structured form of a question's target cells — naming the specific $(s, p, o)$ positions whose values are at $\bot$ — is deferred.
A future refinement may add a `target-cells:` key for machine-evaluable question structure.

The relationship between a question and the researching morphism that would close it is currently presentation-only.
A future refinement may add a `closed-by:` key referencing the researching activity (work item or claim) that resolves the question.
