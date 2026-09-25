---
type: morphism
class: discipline-morphism
status: settled
depends-on:
  - ../../../objects/relation-graph.md
  - ../../../objects/vault.md
  - ../../../objects/note.md
  - ../objects/fars-lint-as-closure-operator.md
see-also:
  - staging-area-to-theory-promotion-decision.md
  - ../theorems/frontmatter-relation-graph-acyclic-modulo-see-also.md
  - ../objects/fars-lint-as-closure-operator.md
title: Relation graph update
description: The relation-graph-update morphism is the operation that updates the vault's relation graph in response to a vault edit (note added, note edited, note deleted, note relocated).
---

# Relation graph update

The **relation-graph-update morphism** is the operation that updates the vault's [relation graph](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/objects/relation-graph.md) in response to a vault edit (note added, note edited, note deleted, note relocated). It is the morphism that closes the loop between the vault's primary representation (notes as files) and its derived representation (the typed multi-graph of frontmatter edges).

## Signature

$$\mathrm{update}: \mathrm{Vault} \times \mathrm{Edit} \to \mathrm{Vault} \times \mathrm{RelationGraph} \times \mathrm{Defects}$$

Given a vault $V$ and an edit $\delta$ (one of: $\mathrm{add}(n)$, $\mathrm{edit}(n)$, $\mathrm{delete}(n)$, $\mathrm{relocate}(n, p \to p')$), the morphism produces:

- $V'$ — the vault after $\delta$ is applied.
- $G_{V'}$ — the relation graph of $V'$, updated from $G_V$.
- $\Delta$ — the set of defects introduced (or healed) by the edit, as witnessed by the [FARS lint operator](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/fars-lint-as-closure-operator.md) restricted to the changed subgraph.

## What the morphism commits to

The morphism is *incremental*: it does not recompute $G_{V'}$ from scratch. Instead, for each edit type:

- **Add a note $n$.** Add $n$ as a new vertex; for each typed-relation edge $n$ declares, add an edge from $n$ to its target. Re-lint the new vertex.
- **Edit a note $n$.** Diff the old and new frontmatter; remove edges from $n$ that are no longer declared; add edges from $n$ that are newly declared. Re-lint $n$.
- **Delete a note $n$.** Remove $n$ as a vertex; remove all outgoing edges from $n$; mark all incoming edges from other notes as broken-link defects (they need to be cleaned up by a separate edit). Re-lint the in-neighbour sources whose edges have just become broken.
- **Relocate a note $n$ from $p$ to $p'$.** Update $n$'s identity from $p$ to $p'$; rewrite every incoming edge whose target was $p$ to target $p'$ instead. Re-lint the relocated note and the rewritten-edge sources.

The defect set $\Delta$ is computed by re-running [FARS lint](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/fars-lint-as-closure-operator.md) restricted to the *affected subgraph* (the changed note plus, for delete and relocate, the in-neighbour sources whose outbound edges resolve through the changed note). The affected subgraph is *not* extended along outbound `see-also:` edges, because each `see-also:` edge is stored at exactly one site (the source note) and a target's lint state is independent of which other notes happen to point at it. This restriction is sound *under a locality assumption on the rule system*: every [validation rule](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/objects/validation-rule.md) in the closure-rule-system has a declared *scope* (single note, note-pair, induced subgraph of bounded radius, or — explicitly excluded from the incremental case — the whole vault), and the affected subgraph is computed to be at least as large as the union of scopes whose support intersects the edit. Rules whose scope is the whole vault (e.g., a global acyclicity check) cannot be discharged incrementally and are re-run at vault-scope on commit; the morphism's incremental case applies only to local rules. Closure-operator monotonicity gives the *witness-set* side of soundness ($L_V$ never removes witnesses); the edit-locality side is a separate property of the rule system, made explicit here as a precondition.

## Idempotence and edit composition

The morphism is *idempotent on no-op edits*: applying $\mathrm{edit}(n)$ to a vault when $n$ is unchanged returns the same vault, the same relation graph, and an empty defect delta. Edit composition is associative *modulo the order of conflicting edits*: editing a note and then deleting it is well-defined; deleting and then editing is undefined (the edit has nothing to act on).

