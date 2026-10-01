---
type: definition
class: formal-object
status: settled
depends-on:
  - teaching/explanations/note-type.md
  - teaching/explanations/note.md
  - ../../../objects/relation-graph.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md
see-also:
  - fars-lint-as-closure-operator.md
  - ../theorems/theory-discipline-conformance-decidable.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md
name: Validation rule
description: "A validation rule is a single discipline-level check the curation theory commits to: a decidable predicate $\\varphi$ on the vault's relation graph (or on a single note in it) that holds when the discipline is satisfied and fails when it…"
---

# Validation rule

A **validation rule** is a single discipline-level check the curation theory commits to: a decidable predicate $\varphi$ on the [vault's relation graph](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/objects/relation-graph.md) (or on a single note in it) that holds when the discipline is satisfied and fails when it is violated. The set of all validation rules the curation theory commits to is its closure-rule-system (the upstream concept lives at the [predication-categories closure-rule-system](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-system.md); the curation theory inherits it without re-defining); the FARS lint toolkit is the operator that applies them.

## Definition

A validation rule is a triple $\varphi = (s, c, w)$ where:

- $s$ — the *scope* of the rule: the structural locus the rule applies to. Common scopes are `note` (a single note's frontmatter and body), `note-pair` (two notes connected by an edge), `subgraph` (an induced subgraph picked out by a pattern), `vault` (the entire relation graph).
- $c$ — the *check*: a decidable predicate on instances of the scope. For `note`-scoped rules, $c$ takes a note and returns satisfied / violated. For `vault`-scoped rules, $c$ takes the whole relation graph.
- $w$ — the *witness function*: when $c$ fails, $w$ produces a structured defect record naming the offending instance(s) and the rule that was violated. Witnesses are what FARS lint emits as defect reports.

A rule is *sound* iff $c$ correctly characterises the discipline commitment it claims to enforce. A rule is *complete relative to its commitment* iff every violation of the commitment is detected by $c$ (no false negatives). The discipline as a whole is sound and complete iff its rule set is sound and the union of the rules' commitments covers the discipline.

## Examples (rule scopes)

The corpus's actual validation rules — implemented in the FARS toolkit and enumerated in this theory's [specifications/note-types/](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/specifications/note-types) — fall into the following families:

- **Frontmatter-shape rules** (scope: `note`). Every note carries a `type:` field; every typed relation is one of the discipline's enumerated relation types; etc.
- **Body-structure rules** (scope: `note`). Every `theorem` note's body has a `## Statement` and either a `## Proof`, `## Sketch`, or `## Refutation`; every `concept` note's body opens with the concept's role in one paragraph; etc.
- **Edge-resolution rules** (scope: `note-pair`). Every relative-path edge target resolves to an actual file in the vault.
- **Edge-typing rules** (scope: `note-pair`). `realizes` runs from `definition` to `concept`; `instantiates` runs from `example` to a typed object; etc.
- **Acyclicity rules** (scope: `vault`). The subgraph induced by `depends-on`, `realizes`, `instantiates`, `defines` is a DAG.
- **Coverage rules** (scope: `vault`). Every theory's `_index.md` lists at least one note of each kind it commits to (concepts, objects, ...).

## Validation rules as predication cells

A validation rule $\varphi$ corresponds to a predication cell over the relation graph: the subject $s$ is the structural locus, the predicate $p$ is the rule's identity, the object $o$ is the rule's expected outcome (`satisfied`), and the bilattice valuation $v$ is the rule's check result on the actual vault (one of `satisfied`, `violated`, `unverifiable`, `inconsistent` per the bilattice). This reading is what licenses the [predicated-knowledge-systems](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/predicated-knowledge-systems) framing of the discipline as a predication-categorical structure rather than a flat list of checks.

