---
type: concept
class: classification
depends-on: [origin, provenance, identity-by-relations]
see-also: [boundary, vocabulary-completeness]
---

# Endogenous and exogenous predications

The substrate's distinction between predications that come from *inside* an entity's own content and predications that come from *outside* about the entity. Both are first-class substrate predications under [identity-by-relations](identity-by-relations.md); the distinction is in their *origin* and the trust the substrate extends to each.

- **Endogenous predications** are declared by the entity itself — its content asserts them. Examples: a Markdown file's frontmatter declaring its title, tags, cited works; a Python module declaring its imports and decorated relations; a runbook record declaring its steps. The entity is its own source for these predications.
- **Exogenous predications** are derived from context external to the entity's content — observation about the entity by another substrate operation, party, or boundary. Examples: a file's authorship and modification time (from version control), its MIME type (from filesystem inspection), its place in a directory hierarchy, its checksum, its [witness](witness.md) chain (recorded by the substrate as the entity is operated on).

Both kinds are admissible; both carry [provenance](provenance.md) per substrate discipline; both are queryable through the same [traversal](../morphisms/traversal.md) operators. What distinguishes them at the engineering level:

- **Source authority.** An endogenous predication is what the entity claims about itself; an exogenous predication is what others claim about the entity. The substrate's audit can ask both "what does this entity say of itself?" and "what does the substrate's external view say about this entity?" — separate questions with separate answers.
- **Trust calibration.** Particular platforms may extend different trust to the two kinds. Endogenous predications may be accepted at face value (the entity's claim is admissible); exogenous predications may require corroboration (multiple boundary observers must agree). Or vice versa — the discipline is platform-policy.
- **Updateability.** Endogenous predications change when the entity's content changes. Exogenous predications change when the external context changes (a file's MIME type stays exogenous; a re-checksum is a new exogenous predication, not a re-endogenous one).
- **Provenance trail.** A typical substrate carries both kinds with distinct provenance signatures: endogenous predications cite the entity's content as source; exogenous predications cite the boundary, ingestion operator, or external service that produced them.

## Engineering uses

- **Discovery rules.** Closure rules can fire on the conjunction of endogenous and exogenous predications: "if the file's frontmatter declares `tag: draft` (endogenous) AND its last-modified-time is older than 30 days (exogenous), mark it stale." The substrate's rules consult both freely.
- **Validation per-kind.** Shape constraints can target endogenous-only or exogenous-only patterns: a draft-author shape might require the file *itself* declares the author (endogenous), while an authorship-audit shape might require the version-control history to show the same author (exogenous).
- **Boundary discipline.** Per [boundary](boundary.md), the substrate's read-only ingestion of external sources produces exogenous predications. Endogenous predications come from the entity's content; if the substrate also writes back into the entity, those writes change the entity's endogenous content.

The distinction is what makes the substrate's view of an entity *layered*: there is what the entity says, what the substrate has recorded about the entity, and the relationship between the two. A predicated computer that conflates them loses the audit's "is this what the entity claimed or what we observed?" answerability.
