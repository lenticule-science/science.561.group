---
name: governance
description: Specification of resource files under a theory's `governance/` directory. Governance is the substrate's pattern for *who decides* — modal-necessity restriction $\Box_R u_a$ on capability fibers, indexed by a world-set of (scope, time, governing-context) triples. Mathematically a governance record is itself a substrate predication: office graph, accessibility-relation shape, authority closure rules, Hohfeldian-position records. Substrate-recorded, not runtime-enforced.
---

A governance resource file presents a single piece of the substrate's authority-restriction structure.

## What governance is, mathematically

From the predicated-agentic-orchestration-platform's [governance](../../../../../predicated-agentic-orchestration-platform/concepts/governance.md) concept: governance is read as a [modal-necessity restriction](../../../../../../../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/modal-necessity-operator.md) on the agent's capability fiber, indexed by a [world set](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/world-set.md) $W$ of $(\text{scope}, \text{time}, \text{governing-context})$ triples and equipped with a [bilattice accessibility relation](../../../../../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-bound/content/world-set/content/bilattice-accessibility-relation/bilattice-accessibility-relation.md) $R$ encoding the governance graph:

$$\mathrm{authorized}_a(p)(s, o) \;=\; (\Box_R u_a)_w(s, o) \;=\; \bigwedge_t \{R(w, w') \to u_a(s, o) : w' \in W\}$$

Per AgOP's *self-representation* engineering invariant, governance is recorded as substrate content — not enforced by runtime branching.
The office graph is a sub-region of the predication-graph store; the accessibility relation $R$ is recorded as $\mathcal{C}$-natural predications; governance rules ARE [closure rules](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule.md).
Editing the governance structure is editing substrate predications.

The four classical Hohfeldian positions are accessibility-relation *shapes* on the same modal apparatus, not separate primitives:

- **Power** — forward accessibility, $\Box_R$ over worlds the action would produce.
- **Duty** — anti-accessibility on inaction.
- **Privilege** — trivial accessibility within scope.
- **Immunity** — protected accessibility from other-agent action.

Governance models (hierarchical, quorum, reputation-weighted, consent-based) are shapes of $R$ — switching models is replacing the relevant closure rules.

## File location

`<theory>/governance/<resource-slug>.md` — or in a kind-specific sub-directory of `governance/` when the realization distinguishes governance content types:

- `governance/offices/<slug>.md` — office records (nodes of the office graph).
- `governance/charters/<slug>.md` — charter records (declared scope of authority).
- `governance/staff/skills/<slug>.md` — operational skill records (procedures agents follow).
- `governance/staff/skills/<slug>/scripts/<script-slug>.mjs` — scripts that operationalize a skill.
- `governance/staff/characters/<slug>/` — character directories (sub-theories of governance).
- `governance/rules/specifications/<slug>.md` — specifications (normative rules for substrate kinds).

These sub-divisions are realization-specific; the canonical commitment is that all governance content is in `governance/` and SHALL be substrate-recorded, not external runtime configuration.

## Frontmatter

### `name`

The slug naming this governance record.
Required.

### `description`

One-sentence statement of what this record asserts about authority structure.
Required.

## Body

Human-readable description of the governance content: what office, charter, skill, or rule is being recorded; what scope it applies to; what closure rules give it effect.

## Engineering invariants the spec inherits

Per AgOP's governance concept, conformant governance content MUST satisfy:

- **Recorded.** Every governance decision produces a witness in the substrate's event log.
- **Scope-local by construction.** Decisions affect only the scope they were made in; cross-scope governance requires explicit federation bridges.
- **Self-representable.** Governance rules ARE closure rules; the office graph IS a sub-region of the substrate.
- **Bilattice-valued, not Boolean.** Partial authority ($\bot$) and contested authority ($\top$) are admissible governance states.

## What this specification does not pin

The structured frontmatter representing the kind of governance content (office vs charter vs skill vs rule) is deferred.
Each kind warrants its own per-kind sub-spec; until then, the `name` + `description` minimum frame applies, and the body carries the structured content in prose.
