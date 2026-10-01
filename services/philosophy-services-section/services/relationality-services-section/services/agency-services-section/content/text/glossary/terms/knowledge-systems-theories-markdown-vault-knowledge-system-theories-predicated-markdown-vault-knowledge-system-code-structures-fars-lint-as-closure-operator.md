---
type: definition
class: formal-object
status: settled
depends-on:
  - validation-rule.md
  - ../../../objects/relation-graph.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md
see-also:
  - validation-rule.md
  - ../morphisms/relation-graph-update.md
  - ../theorems/theory-discipline-conformance-decidable.md
  - ../theorems/frontmatter-relation-graph-acyclic-modulo-see-also.md
  - ../../../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/objects/predication-graph-store.md
name: FARS lint as closure operator
description: "The FARS lint operator is the algorithmic realization of the curation theory's closure-rule-system: the operator that, given a vault, applies every validation rule and emits the set of defects the vault contains."
---

# FARS lint as closure operator

The **FARS lint operator** is the algorithmic realization of the curation theory's closure-rule-system: the operator that, given a vault, applies every [validation rule](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/validation-rule.md) and emits the set of defects the vault contains. Read predication-categorically, the operator is a *closure operator* on the witness lattice over a fixed vault — idempotent, extensive, and monotone — whose fixed points are the witness-saturated states; the *discipline-conformant* states are the fixed points with empty witness set.

## Definition

Fix a [vault](../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/markdown-services-section/content/text/glossary/terms/vault.md) $V$ and let $\mathcal{W}_V = (\mathcal{P}(\mathrm{Wit}_V), \subseteq)$ be the lattice of *witness sets* against $V$ — the powerset lattice of the (finite) set of well-formed defect witnesses $\mathrm{Wit}_V$ that the closure-rule-system can produce when applied to $V$. The order is set inclusion; the bottom is $\varnothing$ (no witnessed defects) and the top is $\mathrm{Wit}_V$ (every possible witness recorded).

The **FARS lint operator** $L_V: \mathcal{W}_V \to \mathcal{W}_V$ is defined on this fixed-vault lattice by

$$L_V(W) = W \cup \mathrm{defects}(V)$$

where $\mathrm{defects}(V) \subseteq \mathrm{Wit}_V$ is the set of defect witnesses produced by applying every [validation rule](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/validation-rule.md) in the closure-rule-system to $V$. The operator's domain is the witness lattice for *one* vault; comparing operators across distinct vaults is a separate construction (see "Cross-vault behaviour" below).

## Closure-operator properties

$L_V$ is a closure operator on $\mathcal{W}_V$:

1. **Extensive.** $W \subseteq L_V(W)$ for every $W$, since $W \subseteq W \cup \mathrm{defects}(V)$. Lint never *removes* witnesses; it only adds them.
2. **Monotone.** If $W \subseteq W'$ then $L_V(W) \subseteq L_V(W')$. (Both sides receive the same $\mathrm{defects}(V)$ contribution; the inclusion is preserved by union with a fixed set.)
3. **Idempotent.** $L_V(L_V(W)) = L_V(W)$, since $L_V(W) \supseteq \mathrm{defects}(V)$ already, so unioning $\mathrm{defects}(V)$ in again is a no-op.

The fixed points of $L_V$ are exactly the witness sets $W$ with $\mathrm{defects}(V) \subseteq W$ — the *witness-saturated* states for $V$. Two distinguished fixed points matter:

- **The minimum fixed point** $\mathrm{defects}(V)$ itself, which records exactly the defects $V$ carries and nothing more. This is what FARS lint emits in practice.
- **The discipline-conformant state** $\varnothing$, which is a fixed point *iff* $\mathrm{defects}(V) = \varnothing$ — i.e., iff $V$ has zero defects. Conformance is the conjunction of "fixed point" and "empty witness set," not "fixed point" alone.

The *discipline-conformant vaults* are exactly those $V$ whose minimum fixed point coincides with $\varnothing$; equivalently, those for which $L_V(\varnothing) = \varnothing$. This is the precise sense in which the operator's fixed points "carve out" the conformant subspace.

## Cross-vault behaviour

Edits to the vault produce a new vault $V'$ with its own lattice $\mathcal{W}_{V'}$ and its own operator $L_{V'}$. The [relation-graph-update morphism](relation-graph-update.md) is what relates $L_V$ to $L_{V'}$: it identifies the *affected subgraph* of the edit and shows that defect witnesses outside the affected subgraph are unchanged between $\mathrm{defects}(V)$ and $\mathrm{defects}(V')$, modulo a canonical injection $\mathrm{Wit}_V \hookrightarrow \mathrm{Wit}_{V'}$ on the unaffected witnesses. This is what licenses incremental linting without losing soundness.

## What the operator does, concretely

For each [validation rule](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/validation-rule.md) $\varphi = (s, c, w)$ in the closure-rule-system:

1. Enumerate the instances of scope $s$ in $V$. For `note`-scoped rules, this is every note. For `note-pair`-scoped rules, this is every edge. For `vault`-scoped rules, this is the singleton $\{V\}$.
2. Apply the check $c$ to each instance. If $c$ fails, invoke the witness function $w$ to produce a defect record.
3. Accumulate the defect records into $\mathrm{defects}(V)$.

The composite of these per-rule passes is one application of $L$.

## Why this matters

Read this way, the FARS lint operator is not just a build-tool that emits errors; it is a *formal closure operator* whose fixed points carve out the discipline-conformant subspace of the vault lattice. This is what licenses three claims the discipline relies on:

- **Defects are decidable.** Each $\varphi$'s check $c$ is decidable, so $\mathrm{defects}(V)$ is finite and computable. (See [theory-discipline-conformance-decidable](../concepts/theory-discipline-conformance-decidable.md).)
- **The discipline composes.** Closure operators compose: applying $L_1$ for one rule subset and then $L_2$ for another is the same as applying $L_1 \cup L_2$. This is what licenses incremental linting (linting only the changed subgraph after a [relation-graph-update](relation-graph-update.md)) without losing soundness.
- **The discipline is monotone in the rule system.** Adding a new validation rule can only add defects, never remove them. Loosening the discipline (removing a rule) can only remove defects. This is the property that lets the discipline evolve incrementally.

