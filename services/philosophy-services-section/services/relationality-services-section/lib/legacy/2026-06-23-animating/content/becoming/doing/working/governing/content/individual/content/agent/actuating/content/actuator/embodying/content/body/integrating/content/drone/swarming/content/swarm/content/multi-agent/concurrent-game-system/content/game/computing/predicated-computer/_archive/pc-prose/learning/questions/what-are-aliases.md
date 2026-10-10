---
title: "What are aliases?"
status: answered
date: 2026-05-17
answered-date: 2026-05-17
answered-by: prose/learning/claims/aliases-are-resolve-pullbacks-of-classical-equality.md
relates-to:
  - prose/learning/claims/aliases-are-resolve-pullbacks-of-classical-equality.md
  - prose/teaching/explanations/alias.md
  - prose/teaching/explanations/aliases.md
  - code/structures/alias.md
  - code/structures/aliases.md
  - work/governance/rules/specifications/alias.md
  - work/governance/rules/specifications/aliases.md
  - prose/teaching/explanations/encoding-of-agents-and-skills.md
  - prose/learning/surveys/aliases-may-2026.md
---


## The question

The repo skill naming grammar require every content token in a slug to resolve to a repo record — verbs to `code/transformers/`, nouns to `code/structures/`, adjectives to `prose/teaching/explanations/`. To make this discipline tolerable against English's morphological variation (singular/plural, inflection, kebab-multi-word variants), the repo records carry an `aliases:` field that admits alternate surface forms for resolution.

The field has been named and committed to use, but what an alias *is* has not yet been authored. The commitments so far are negative — aliases are not synonyms (semantically-related-but-distinct concepts), not abbreviations (forbidden by the no-abbreviation rule), not compatibility shims for renames-in-flight — but the positive content is open.

So: **what is an alias?**

The question is necessary because aliases sit at a sensitive point in the repo's discipline. The repo's identity-by-relations principle says an entity *is* its predications; what does it mean, then, for two surface forms to refer to the same entity? Are aliases substantive repo content (in which case they're predications, with the entity bearing them)? Or are they non-substantive labels (in which case they live outside the predication graph somehow)? The answer determines how aliases compose with the existing machinery — closure rules, witness chains, the dispatch operator, the federation handshake — none of which has yet been asked about aliases.

## What is settled

- Aliases are in use. This is decided; the naming grammar's per-token resolution rule requires them.
- Aliases admit *morphological* variation. Singular/plural (`citation`/`citations`) and inflection variants (`audit`/`audits`/`auditing`) are the central cases.
- Aliases do not admit *semantic* variation. Synonyms (`citation` and `reference` are distinct concepts even when conversationally interchangeable) are not aliases.
- Aliases do not admit *abbreviated* variation. The no-abbreviation rule on slugs is not relaxed by aliases; `docs` is not an alias for `documents`.
- Aliases do not admit *renaming-in-flight* variation. If a record is renamed, the rename is a repo edit producing a witness; old surface forms are not preserved as aliases on the new record.

## Open sub-questions

### What is an alias, structurally?

Is an alias a *predication* on the repo entity (the entity bears a predication declaring its alternate surface form)? Is it an *equivalence-class membership* (the surface forms are members of a quotient class, with the repo entity as the canonical representative)? Is it a *morphism* (an identity-projection in the repo's category, mapping the alternate form back to the canonical)? Is it something else entirely?

Each framing has consequences. If predication: aliases participate in the closure-rule system and can be added or removed by ordinary repo edits. If equivalence-class: aliases are derived, not declared, and require an underlying equivalence relation to be specified. If morphism: aliases are non-content arrows, structurally distinct from the content-bearing morphisms but composable with them in the category.

### What is the relation of alias to identity-by-relations?

The repo's identity-by-relations principle says: an entity is constituted by the predications it participates in; "what an entity is" is determined by its predication-graph neighborhood. Under this principle, what does it mean for two surface forms to refer to "the same" entity?

One reading: the surface form is not the entity; the entity is the predication-graph node, and surface forms are *labels* the repo uses to address that node. Aliases are non-substantive labels — the entity's identity is unchanged by which label addresses it.

Another reading: identity-by-relations forces every distinction to be a predication-graph distinction. If two surface forms are claimed to refer to the same entity, that claim is itself a predication. Aliases are substantive — they're cells in the graph declaring identity-of-reference.

The two readings agree on much but disagree on whether aliases compose with closure rules, federation, and witness chains.

### What variation may an alias absorb?

*Morphological* variation was the initial framing of the discipline. But morphology is itself a range:

- Singular/plural is uncontroversial (`citation`/`citations`).
- Inflection across the verb's forms (`audit`/`audits`/`audited`/`auditing`) is plausible.
- Kebab-multi-word variants (`work-flow` vs `workflow` vs `work-flow-graph`) — admissible or not?
- Case variation in surface forms (slugs are kebab-lowercase by convention, but is `Auditor-of-Citations` an admissible surface form aliasing `auditor-of-citations`)?
- Transliteration (Lakota terms transliterated to English orthography in different conventions) — admissible or not?
- Orthographic variants (`color`/`colour`, `behavior`/`behaviour`) — admissible or not?

The discipline needs a principle, not just an enumeration.

### Can aliases chain?

If `documents` aliases `document` and `document` aliases `record`, does `documents` alias `record`?

The forward-compatible note in the current concept spec says no — aliases shouldn't chain. But the question is *why*. Two possible reasons:

- *Composition concern*: an alias chain could produce paths of arbitrary length, making resolution non-terminating or producing surprising identifications.
- *Substantive concern*: an alias chain is doing something different from a single alias — it's claiming transitive identity across multiple "different" entities, which collapses distinctions the repo may want to preserve.

The right answer depends on what an alias *is* (sub-question 1).

### Is alpha-equivalence the right formal model?

Lambda calculus's alpha-equivalence — bound variables can be renamed without changing meaning — is the standard formal account of name-variation in formal systems. Nominal sets (Gabbay-Pitts) make this categorical. Is the notion of alias an instance of alpha-equivalence on repo names, or is it something different?

If it's alpha-equivalence: the repo inherits a mature mathematical apparatus and a clean compositional story.

If it's not: the repo needs to specify what's different and why.

## How the question was answered (2026-05-17)

The question was answered in the session of 2026-05-17 by the chain of work:

1. The literature survey [`aliases-may-2026`](../surveys/aliases-may-2026.md) gathered what real literatures (linguistics, database theory, programming languages, library science, knowledge representation, logic and category theory, sociology, plus the post-2013 frontier) say about aliases. Goal-neutral gather; identified the deployed-consensus convergence of "identifier canonical, surface-form alias" across ORCID, DOI, ROR, W3C DIDs, Wikidata Q-IDs, BIBFRAME URIs, Schema.org @id, and SKOS prefLabel/altLabel.

2. A math review of the earned apparatus — classical-equality, paraconsistent-equality, predicate-specialization, q-fuzzy-equivalence, synonymy, predication-cell, entity — at `theories/.../predication-categories/` and at 561's `code/structures/`. The toolkit established what kind of mathematical object the alias relation could be.

3. The claim [`aliases-are-resolve-pullbacks-of-classical-equality`](../claims/aliases-are-resolve-pullbacks-of-classical-equality.md) was authored with proof sketches for eight theorems establishing what aliases are: (1) the alias relation on surface forms is the resolve-pullback of classical equality on entities; (2) it is an equivalence relation; (3) cell values are invariant under alias-form choice; (4) function-uniqueness of $\rho$ forbids chains structurally; (5) alias is distinct from synonymy (different levels of the predication-hyperdoctrine); (6) aliases are the q=1 case of q-fuzzy fiber-equivalence; (7) retired forms are not aliases; (8) the discipline is narrower than the math admits and is enforced at the editing layer.

4. The three-layer concept/structure/spec encoding was authored — singular and plural distinguished (per emsenn's clarification that `alias` and `aliases` are distinct resources, just as `script` and `scripts` are):
   - [`prose/teaching/explanations/alias.md`](../../teaching/explanations/alias.md) — one cell.
   - [`prose/teaching/explanations/aliases.md`](../../teaching/explanations/aliases.md) — the catalog and the relation.
   - [`code/structures/alias.md`](../../../code/structures/alias.md) — cell-level math.
   - [`code/structures/aliases.md`](../../../code/structures/aliases.md) — catalog-level math.
   - [`work/governance/rules/specifications/alias.md`](../../../work/governance/rules/specifications/alias.md) — cell-level RFC.
   - [`work/governance/rules/specifications/aliases.md`](../../../work/governance/rules/specifications/aliases.md) — catalog-level RFC, retirement footnote.

5. Existing specs/concepts that mentioned `aliases:` forward-compatibly were updated to point to the new authority records (`encoding-of-agents-and-skills`, `agent` spec, `skill` spec, `concept` spec, `structure` spec, `transformer` spec).

The five sub-questions are answered explicitly in the claim's §"What this resolves about the open question."

## What remains as deferred / open extensions

The claim names four extensions the repo has not pursued and which remain open:

- Federation of aliases across repos (cross-repo coordination between [polities](../../../code/structures/polity.md) holding distinct repos).
- Aliases under settling evolution (time-indexed resolve function $\rho_t$).
- Multi-language aliases (per-language `altLabel` discipline, as in Wikidata).
- q<1 aliases for contested or provisional declarations.

Each is a candidate for a future question. They do not block the present discipline.
