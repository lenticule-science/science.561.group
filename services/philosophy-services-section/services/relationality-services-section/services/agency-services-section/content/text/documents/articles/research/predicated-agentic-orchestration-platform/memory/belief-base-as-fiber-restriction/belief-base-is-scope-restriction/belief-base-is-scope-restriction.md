---
type: theorem
class: engineering-claim
status: proved
depends-on:
  - teaching/explanations/belief-base-as-fiber-restriction.md
  - teaching/explanations/scope.md
  - teaching/explanations/agent.md
  - teaching/explanations/federation.md
  - ../../../teaching/explanations/extend-restrict-adjoint.md
  - ../../../teaching/explanations/predication-fiber-algebra.md
  - ../../../../objects/predication-graph-store.md
  - ../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md
  - ../../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md
  - references/rao-georgeff1995.md
  - references/bordini-et-al2007.md
see-also:
  - teaching/explanations/belief-base-as-fiber-restriction.md
  - teaching/explanations/intention-as-scope-bounded-commitment.md
  - teaching/explanations/practical-reasoning-as-runbook-execution.md
  - ../theorems/dispatch-composes-authorization.md
  - theories/flatfile-agentic-resource-system/theorems/scope-composition-is-knowledge-order-monotone.md
  - theories/flatfile-agentic-resource-system/theorems/flatfile-federation-equivalence.md
title: The agent's belief base is the predication fiber algebra restricted to the agent's scope
description: Claim.
---

# The agent's belief base is the predication fiber algebra restricted to the agent's scope

**Claim.** Let $G$ be the platform's predication-graph store, with predication-fiber-algebra $\mathcal{F}(G)$ — the fiber of $(s, p, o)$-cells across all entities in $G$.
Let $\Gamma_a$ be the agent's scope context (the subset of the predicate category over which the agent's authorization fiber lives).
The agent's belief base $\mathcal{B}_a$ is the reindexing restriction:

$$\mathcal{B}_a \;=\; \mathcal{F}(G)\!\upharpoonright_{\Gamma_a}$$

the predication fiber algebra restricted to predicates visible at $\Gamma_a$.
The restriction functor $\mathrm{res}_{\Gamma_a}$ has a left adjoint $\mathrm{ext}_{\Gamma_a}$ (existential extension along the scope inclusion $\iota: \Gamma_a \hookrightarrow \mathcal{P}$, the predicate category), forming the extend-restrict adjunction $\mathrm{ext}_{\Gamma_a} \dashv \mathrm{res}_{\Gamma_a}$.

Three derived claims follow:

1. **Inter-agent belief overlap** is the restriction to the intersection of their scopes: if agents $a$ and $b$ inhabit overlapping scopes $\Gamma_a \cap \Gamma_b \neq \emptyset$, then $\mathcal{B}_a$ and $\mathcal{B}_b$ share exactly the predications in $\mathcal{F}(G)\!\upharpoonright_{\Gamma_a \cap \Gamma_b}$.

2. **Percept update** is the admission of new predications at $\Gamma_a$ through the substrate's normal `apply-edit` discipline: the belief base changes iff the substrate's predication at the agent's scope changes.

3. **Federation is left Kan extension**: the composite substrate $G_{\mathrm{fed}}$ produced by federating $G_A$ and $G_B$ recovers $\mathcal{B}_a$ in $G_{\mathrm{fed}}$ as the left Kan extension $\mathrm{Lan}_{\iota_A} \mathcal{F}(G_A)$ along the inclusion of $G_A$'s predicate context into $G_{\mathrm{fed}}$'s.

## Why the restriction claim holds

**The BDI belief base as a separate data structure.** In Rao–Georgeff (1995) and AgentSpeak/Jason (Bordini et al. 2007), a BDI agent maintains a belief base as an agent-internal logic-programming database.
The database is updated through percept processing (adding new ground atoms), belief revision (retracting inconsistent atoms), and plan-body effects (explicitly adding or retracting atoms).
The database is *private* — it is not shared across agents without explicit communication.

**The platform's substrate-based realization.** The platform commits to a single predication-graph store $G$ shared across all agents in the deployment.
An agent's beliefs are not a separate per-agent database.
They are the predications in $G$ that are visible at the agent's scope $\Gamma_a$.

**The restriction functor is well-defined.** The predication fiber algebra $\mathcal{F}(G)$ is a functor from the predicate category $\mathcal{P}$ to the four-bilattice: $\mathcal{F}(G)(p) = $ the fiber of cells at predicate $p$ across all entities in $G$, with values in $\{\bot, t, f, \top\}$.
The scope context $\Gamma_a$ is a subcategory of $\mathcal{P}$.
The restriction $\mathcal{F}(G)\!\upharpoonright_{\Gamma_a}$ is the precomposition of $\mathcal{F}(G)$ with the inclusion functor $\iota: \Gamma_a \hookrightarrow \mathcal{P}$: for each predicate $p \in \Gamma_a$, the restricted fiber $\mathcal{B}_a(p) = \mathcal{F}(G)(p)$.
This is well-defined by the predication-fiber-algebra's functoriality.

**The extend-restrict adjunction exists.** The left adjoint $\mathrm{ext}_{\Gamma_a}$ takes a fiber over $\Gamma_a$ and extends it to a fiber over $\mathcal{P}$ by left Kan extension along $\iota$: for predicates $q \notin \Gamma_a$, the extended value is $\bot$ (no information).
The adjunction $\mathrm{ext}_{\Gamma_a} \dashv \mathrm{res}_{\Gamma_a}$ holds by the pointwise Kan extension formula; at each predicate $q \in \mathcal{P}$:

$$(\mathrm{ext}_{\Gamma_a} F)(q) = \mathrm{colim}_{p \in \Gamma_a, \iota(p) \to q} F(p)$$

In the four-bilattice's knowledge-order, the colimit is the $\leq_k$-join.
For $q \notin \Gamma_a$, the diagram is empty, giving $\bot$.
For $q = \iota(p) \in \Gamma_a$, the colimit is $F(p)$.
The adjunction's unit and counit are natural transformations in the bilattice-enriched setting, established by the parent math theory's extend-restrict-adjoint construction.

**The authorization fiber IS the scope fiber.** Per [scope-as-fiber](../../../flatfile-agentic-resource-system/scope-as-fiber/scope-as-fiber.md), the agent's effective scope at a session is a fiber of `reads` and `writes` predicates.
Per [scope-composition-is-knowledge-order-monotone](../../../flatfile-agentic-resource-system/scope-composition-is-knowledge-order-monotone/scope-composition-is-knowledge-order-monotone.md), this fiber is computed by pointwise $\odot$ of three contributing fibers.
The scope context $\Gamma_a$ (the subcategory of $\mathcal{P}$ the agent has access to) is exactly the set of predicates where the agent's scope fiber value is $t$ (admitted).
The restriction $\mathcal{F}(G)\!\upharpoonright_{\Gamma_a}$ is therefore the restriction to the predicates the authorization fiber admits — the agent's belief base IS the authorized view of the substrate.

## The three derived claims

**Claim 1: Inter-agent belief overlap.** If agents $a$ and $b$ inhabit overlapping scopes $\Gamma_a$ and $\Gamma_b$ (with $\Gamma_a \cap \Gamma_b$ non-empty), both agents have direct read access to the same substrate predications at predicates in $\Gamma_a \cap \Gamma_b$.
Their belief bases agree on the intersection: $\mathcal{B}_a(p) = \mathcal{B}_b(p) = \mathcal{F}(G)(p)$ for $p \in \Gamma_a \cap \Gamma_b$.
No explicit inter-agent communication is required to synchronize beliefs on shared predicates.
Disagreement cannot occur at the substrate level (the fiber value IS the substrate value); apparent disagreement between agents means they are reading different predicates or different temporal snapshots.

**Claim 2: Percept update is `apply-edit` at the agent's scope.** A percept arriving from the environment is, in the platform's terms, an external event that produces a predication at some predicate $p$ within the agent's scope $\Gamma_a$.
Per [event-sourcing](theories/flatfile-agentic-resource-system/concepts/event-sourcing.md), the predication is admitted through `apply-edit`; the event log records the admission; the substrate's closure-rule system may fire on the new predication and produce further predications.
The belief base $\mathcal{B}_a$ is updated at $p$ to reflect the new value $\mathcal{F}(G)(p)$.
There is no separate belief-revision step — the substrate's settle IS the belief revision, operating on the updated fiber under the closure-rule system's premise matching.

**Claim 3: Federation is left Kan extension.** Per [flatfile-federation-equivalence](../../../flatfile-agentic-resource-system/flatfile-federation-equivalence/flatfile-federation-equivalence.md), federating two FARS substrates $G_A$ and $G_B$ is a substrate join: the federated store $G_{\mathrm{fed}}$ contains the predications from both, composed at contested predicates via $\vee_k$ (knowledge join).
The agent $a$'s belief base in $G_{\mathrm{fed}}$ is $\mathcal{F}(G_{\mathrm{fed}})\!\upharpoonright_{\Gamma_a}$.
If $\Gamma_a$ is originally defined in $G_A$'s predicate context $\mathcal{P}_A$, the agent's beliefs in $G_{\mathrm{fed}}$ recover the left Kan extension of $\mathcal{F}(G_A)\!\upharpoonright_{\Gamma_a}$ along the inclusion $\mathcal{P}_A \hookrightarrow \mathcal{P}_{A \cup B}$: the agent now sees $G_A$'s beliefs at $\Gamma_a$ AND any federated predications from $G_B$ at predicates in $\Gamma_a \cap \mathcal{P}_B$.

## Engineering consequences

**Beliefs are auditable by construction.** Every predication in the agent's belief base $\mathcal{B}_a$ traces back through the substrate's witness chain to its admitting event (percept, federation merge, closure-rule firing).
The question "why does the agent believe $p = t$?" is answered by substrate traversal: find the admission event that set $\mathcal{F}(G)(p)$ to $t$, and follow the witness to the source.

**Belief revision is governed by the closure-rule system.** When a new percept contradicts an existing belief — the substrate currently has $\mathcal{F}(G)(p) = t$ and a new percept asserts $p = f$ — the `apply-edit` produces a $\top$-cell at $p$.
Per [validation-as-settlement](../../../flatfile-agentic-resource-system/settlement/validation-as-settlement/validation-as-settlement.md), the $\top$-cell is a substrate contradiction.
The closure-rule system's `repair-catalog-entry` for that predicate governs resolution — there is no separate belief-revision operation.
The repair IS the belief revision.

**Scope extension is new-belief acquisition.** When a governance act grants the agent additional scope (adds predicates to $\Gamma_a$), the extend-restrict adjunction means the agent's belief base immediately includes the new predicates' values — the substrate's fiber at those predicates was always there; the agent now has the authorization to see it.
Scope extension is belief acquisition without communication.

**The BDI agent's explicit belief-revision operators become scope and closure-rule edits.** BDI plan bodies contain `+fact` (add belief) and `-fact` (retract belief) primitives.
In the platform's realization, these are substrate edits: `+fact` is `apply-edit` adding a predication within the agent's scope; `-fact` is `apply-edit` retracting one.
The substrate audits both; the witness chain records both; the belief revision is substrate-transparent.

## What the theorem requires

- The predication-fiber-algebra is functorial over the predicate category $\mathcal{P}$ (required by the parent math theory).
- The agent's scope $\Gamma_a$ is a subcategory of $\mathcal{P}$ (a sub-collection of predicates, not an arbitrary filter function).
- The extend-restrict adjunction exists for the four-bilattice-valued functor category (established by the parent math theory's Kan extension machinery in the bilattice-enriched setting).

## What the theorem does not claim

- **That agents always have complete beliefs.** $\mathcal{B}_a(p) = \bot$ for any predicate $p \in \Gamma_a$ where the substrate has no predication.
  Belief incompleteness ($\bot$-cells) is the norm, not the exception.
- **That the restriction is computationally cheap.** The restriction is mathematically well-defined; computing it for a given query requires reading the substrate's fiber at the queried predicate, which has its own cost.
  The theorem establishes the structure, not the performance.
- **That belief bases are disjoint across agents.** Agents with overlapping scopes share beliefs; this is the theorem's Claim 1.
  The classical BDI per-agent privacy is not recovered — it is a special case where scopes do not overlap.
