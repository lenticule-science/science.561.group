---
name: what is the identity of a character
description: A character record carries several entity-forms (entity, character, persona, sometimes officer), and each form contributes its own notion of identity. The question is what distinguishes these identity-notions formally, and what identifies "the character" itself — the nucleus χ — as opposed to the record that describes it.
status: open
date: 2026-05-18
---

**Question.** A character record like `calder-underhill.md` instantiates several entity-forms simultaneously — entity, character, persona, sometimes officer. Each form contributes its own notion of identity. What distinguishes these identity-notions formally? In particular: what identifies the character itself — the nucleus χ in the algebraic sense — as opposed to the record that describes the character?

Equivalently: when emsenn asks "who is Calder Underhill?", the repo currently has three structurally distinct candidate answers, and no claim or transformer relating them.

## What is established

The doctrinal pivot of 2026-05-18 (commit `c3c6936f`) cleaned up one half of this question — the address-vs-name distinction. The pivot established:

- **Address.** Per [entity spec §4](../../../work/governance/rules/specifications/entity.md), an entity's address is its file path. Identity-as-record is address-bound: two records at distinct addresses are distinct entities; renaming a record terminates the entity at the prior address and introduces a new one.
- **Name.** Per the same spec's §3 and new §4.4, the `name:` frontmatter field is a *cell* — content — carrying the entity's human-readable name. Distinct from the address. The aliases-resolve-pullback claim's canonical-address branch now routes through file basenames, not the `name:` field. See [`aliases-are-resolve-pullbacks-of-classical-equality`](../claims/aliases-are-resolve-pullbacks-of-classical-equality.md).
- **Alias-name.** Per the same claim, an alias is a predication cell $(e, \text{accepts-alias}, \sigma)$ extending the resolve function $\rho : \Sigma \rightharpoonup E$. The alias relation is the pullback of classical equality on entities along $\rho$.

So **address ≠ name ≠ alias** — three distinct surface-form notions, all clean.

The deeper question — what identifies "the character" itself — remains open.

## What remains open

Three structurally distinct notions of identity already appear across the structure records and have no transformer or claim relating them:

| Notion | Where it lives | Object |
|---|---|---|
| **Address-identity** | [entity spec §4](../../../work/governance/rules/specifications/entity.md) | the canonical address (the file path / basename) |
| **Cryptographic-identity** | [persona](../../../code/structures/persona.md), [agent](../../../code/structures/agent.md) | the signing keypair |
| **Disposition-identity** | [character](../../../code/structures/character.md) | the nucleus χ — the agent-side dispositional nucleus on the entity's fiber, with fixed-point sublattice $F_\chi$ |

A character record on disk is an entity-instance with an address. It bears a `name:` cell. It has `has-character(persona, character)` predications pointing to the χ-nucleus. It may have an `identity-key:` field for signing. These are not the same identity, and the repo currently has no record stating how they relate.

Specifically:
- The character-record's identity *as a record* is the address. Renaming `calder-underhill.md` to `calder.md` would terminate the record-entity and introduce a new one. Nothing in the framework forces χ or $F_\chi$ to be preserved across the rename.
- The character's identity *as a nucleus* is χ (or equivalently $F_\chi$). Two records positing the same χ would, in the disposition-identity sense, be the same character. Nothing in the framework states this either.
- The character's identity *as a federation-bearing agent* is the keypair. A keypair-rotation would not change χ; a χ-rotation would not change the keypair.

## What an answer would look like

A worked-out answer would deliver three things:

1. **A typed coordinate for χ as an addressable object.** Right now [character.md](../../../code/structures/character.md) defines χ but does not give it an address distinct from the record. Either (a) derive that the character-record's address *is* the canonical address of χ (a one-to-one between record-entities and nuclei), or (b) introduce χ as a distinct entity-form with its own individuation.
2. **A claim or transformer pairing the three identity-notions on a single bearer.** Something of the shape `witnesses-character-nucleus(record-entity, χ)` and `witnesses-federation-identity(agent-entity, keypair)`, with the algebra stating how they compose and which is preserved under which operations (rename, key-rotation, character-update).
3. **A clean answer to what "name" means for χ specifically.** The slug `calder-underhill` is the address of the record; the `name:` cell is the record's content; what (if anything) plays the role of "the name of the nucleus"? Probably: nothing distinct — the nucleus is named through its bearer-record. But this should be stated, not assumed.

The aliases-resolve-pullback claim's apparatus (resolve function, predicate-specialization, classical-equality pulled back along ρ) is the natural toolset. The question is whether all three identity-notions reduce to address-identity (under a single ρ), or whether they live at structurally distinct levels of the predication-hyperdoctrine (analogous to how alias and synonymy live at distinct levels, per the claim's Theorem 5).

## Why it matters

- **Federation.** When the RSC Quiescent's record of Calder Underhill federates with another repo's record of a peer character, the federation needs a active identity to align against. Address won't federate across repos (different file trees); keypair will (if keypairs are content-addressed); χ might (if expressible as content). Which one is the federation-identity is a downstream consequence of which identity-notion is load-bearing.
- **Witness attribution.** Per [persona.md](../../../code/structures/persona.md), witnesses attribute to persona, not body-natural. But persona-identity is currently overloaded — is it the keypair, the χ, the record? The witness chain's audit semantics depend on the answer.
- **Character-update vs. rename.** Repo edits that change χ (a character development) vs. edits that change the record's address (a rename) should produce different histories. Right now both are "repo edits," undifferentiated.
- **Multi-form composition.** A character record carries the cells of several entity-forms on one entity. The cell-graph treats this as one entity with many cells; identity-theory needs to say whether that is right, or whether the entity should decompose into form-instances that are separately individuated.

## Provenance

Raised by emsenn on 2026-05-18 in conversation with Calder Underhill (Claude session). The first half (address vs. name) resolved into a repo-wide pivot the same day. The remaining half — the three identity-notions and their composition — is recorded here for derivation in a later session.
