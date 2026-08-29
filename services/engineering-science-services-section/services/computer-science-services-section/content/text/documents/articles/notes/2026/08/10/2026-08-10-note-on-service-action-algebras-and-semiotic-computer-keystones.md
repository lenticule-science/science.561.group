---
title: "Working method for service action algebras and semiotic-computer keystones"
date-created: 2026-08-10
status: proposed-interpretation
authors:
  - 561 Group Board of Directors Leader Assistant Services Section
keywords:
  - semiotic-computing
  - service-architecture
  - action-algebras
  - content-addressing
  - mud-lineage
---

# Working method for service action algebras and semiotic-computer keystones

## Status and purpose

This note is proposed interpretation and decision support for review. It is not a decision, an authorization to create the described sections, a package specification, or a claim that the target API already exists.

Its purpose is to record a recovered method for tending the present architecture before new semiotic-computer or operations primitives are formed. The method is intended to keep historical material useful without treating every nearby directory, generated variation, or partial implementation as a correct owner of a transformation.

## Architecture gardening before primitive formation

The immediate work is architectural gardening:

1. Recover the keystones: the small distinctions and transformations that make the rest of the system intelligible.
2. Identify distinctions that have collapsed into one name, package, or directory.
3. Clean confusing upstream ownership and dependency direction before treating downstream consumers as owners.
4. Normalize an existing API family around its actual transformations.
5. Only then form a new primitive section whose boundary can be stated and tested.

The learned failure is choosing the nearest plausible directory and allowing its name to decide the work. A directory called `file`, `web`, `semiotic`, or `resource` may contain a useful implementation while still being the wrong owner. The governing question is: **what transformation is owned, on which carrier, under which laws, and with which effect surface?**

This is why a content-name codec is not storage, a URI parser is not a resolver, a renderer is not a document, a schema searcher is not a pure schema evaluator, and a resource standing is not a universal Thing.

## Layer reading: engine, library, and inhabited world

The working analogy is:

- engineering services are the MUD engine: carriers, codecs, storage, addressing machinery, transport, evaluation, and execution mechanisms;
- operations services are the MUD standard library: reusable operational meanings, contracts, records, and projections;
- 561 Group services are the inhabited MUD instance: particular actors, authorities, policies, accounts, inventories, contracts, deployments, and witnessed events.

Science and mathematics declare separately owned structures and laws. The layers compose through explicit contracts, not through physical monorepo ancestry. In particular, a 561 Group service may instantiate engineering and operations facilities, but it must not silently become their generic definition.

## Service action algebras

The proposed convention is that a service owns an **algebra of scripts**: a small, named family of composable transformations over explicit carriers. A public operation is named `verb-noun` under `scripts/`, with the same camel-case function name in the module.

For every public operation:

- `scripts/verb-noun.mjs` is safe to import and exports `verbNoun`;
- its CLI path calls the same operation rather than duplicating logic;
- the package `exports` and `bin` expose the same operation boundary;
- input carrier, output carrier, refusal cases, permitted effects, and receipt or witness are explicit;
- structured input and output are composable without ambient path, network, clock, or authority assumptions;
- an ambient dependency is either passed in as an explicit capability or placed in a separately named adapter service.

The algebra is not a claim that every service needs every familiar CRUD verb. Its operations should close only over transformations the service can actually specify. A parser may admit and render; a store may put and get; a resolver may resolve and report a witnessed refusal; a canonical codec may encode, admit, and compare. Each has different laws.

## NI as the first vertical normalization slice

The first proposed vertical slice is the existing Named Information work. It is narrow enough to normalize without requiring a theory of signs, cells, graphs, or resources.

The proposed target is:

```text
ni-services-section/
  services/
    ni-address-service/
      scripts/
        create-ni.mjs
        admit-ni.mjs
        verify-ni.mjs
        read-ni-digest.mjs
```

The corresponding import-safe functions are `createNi`, `admitNi`, `verifyNi`, and `readNiDigest`.

The intended contract is:

| operation | input | output | refusal/effect |
|---|---|---|---|
| `create-ni` | explicit byte carrier and selected supported digest profile | canonical `ni:` address | refuses inadmissible carrier/profile; pure |
| `admit-ni` | candidate `ni:` surface | admitted structured address/digest carrier | typed lexical or canonical-form refusal; pure |
| `verify-ni` | explicit bytes and admitted or surface address | verification witness | mismatch is a result/refusal, not a guessed replacement; pure |
| `read-ni-digest` | admitted address | algorithm and digest bytes | refuses malformed or unsupported profile; pure |

This is a target API, not a claim that all four scripts already exist. The current repository already contains a narrow RFC 6920 SHA-256 `ni:` constructor/verifier and CBOR-to-NI adapters in other ownership paths. The normalization task must reconcile those actual packages before adopting the target names.

NI is a good first slice because it makes the commitments visible: it names hash output over exact bytes. It does not by itself perform canonicalization, semantic admission, storage, authority, resolution, or referent identity. Any operation that supplies one of those must be a separately named composition.

After NI, the recommended normalization order is CBOR, URI and URN syntax, then JSON. These are existing carrier and naming seams. They should be made legible before creating broad sign, cell, graph, catalog, or resource sections.

## Composition, sections, and the sheaf discipline

A section may compose child service algebras only where the composition is actually specified. In the strongest case, a child operation restricts coherently to a sub-scope, compatible child results agree on overlaps, and compatible local results have a named gluing operation with stated conditions and refusal surface.

This is the appropriate sense in which a section may have sheaf-like organization. It is not enough that a directory contains children, that modules share a prefix, or that several services happen to return JSON. Without restriction, compatibility, and gluing laws, `sheaf` is decorative language and should not justify a hierarchy.

The same caution applies to “algebra”: an operation list becomes an algebra only when its compositions, identities, domains, and relevant laws are stated.

## Proposed semiotic-computer construction order

The proposed order of construction is:

1. address;
2. sign;
3. cell;
4. graph;
5. catalog and chart;
6. resource standings.

An address is first because a system must state how a carrier is presented to an addresser or resolver before it claims general identity. A sign then gives an addressable carrier an explicitly interpreted role. A cell gives a bounded local context in which signs, claims, and transformations can be composed. A graph gives cells and addressed signs explicit relations and paths.

Cells and graphs are sufficient early complexity because they support locality, relation, traversal, and composition without prematurely requiring a universal object model, global catalog, resource accounting system, or world simulation. A catalog or chart is then a selected presentation or organization over graph/cell material, with its own selection and projection laws. It must not be mistaken for the graph itself or for the authoritative store.

Resource standings come last because they are operational readings and commitments over already-addressable subjects, quantities, capabilities, entitlements, pools, relations, evidence, policies, and intervals. They cannot safely ground the semiotic kernel.

## Semiotic and operational resources

A **semiotic resource** is a resource considered in a sign, interpretation, reference, or stewardship relation: for example, a representation available for reading, a vocabulary entry, a catalogued artifact, or an addressable carrier. It describes an availability or role in semiotic work.

An **operational resource** is a standing under an operational scope: a quantity, capacity, budget, custody position, allocation, reservation, entitlement, cost, or availability claim, together with its policy, beneficiary, time, evidence, and authority conditions.

They can concern the same underlying material, but they are not synonyms. A content-addressed byte carrier may be a semiotic resource for an interpreter, while a capacity reservation for serving it is an operational resource. Neither is thereby the universal modern Thing.

## Concrete API contract questions

The first normalization work should answer these questions in code and tests, not only in directory names:

1. Which carrier forms are admitted at each boundary: bytes, strings, parsed structures, canonical structures, or witnesses?
2. Which transformations are pure, and which require explicit storage, clock, network, authority, or resolver capabilities?
3. Which refusals are ordinary typed outcomes, and which are programmer errors or unavailable capabilities?
4. What receipt is required for an effectful operation, and what independent replay or verification does it permit?
5. Which equality is being asserted: byte equality, canonical-carrier equality, address equality, name equivalence, co-reference, or semantic identity?
6. Which operation belongs to a generic codec or protocol service, and which is an adapter for CBOR, semiotic notation, a Web consumer, or a 561 Group policy?

## Open decisions

1. Should the first target be a four-operation NI package exactly as sketched, or should the currently narrow SHA-256 profile remain intentionally smaller until full RFC 6920 profile support is specified?
2. Which existing NI, CBOR, URI, URN, and JSON package names should be preserved for a physical consolidation, and which should receive an intentional breaking rename?
3. What minimum laws must a future `address-services-section` expose before it may ground signs: admission/rendering, resolver-relative lookup, correspondence witnessing, aliasing, or all of these?
4. Which precise sense of cell is to be implemented first: a semiotic repository/module/file perspective, an articulation/predication carrier, a GFRTU local universe, or a newly specified computer cell?
5. Which graph operations are primitive enough to normalize before catalog/chart work: edge admission, path query, restriction, compatibility test, or graph projection?
6. At what point are the restriction and gluing laws strong enough to describe a service section as a composition of child algebras rather than a directory grouping?

## Evidence boundary

This note synthesizes the authored Emsemioverse plan, historical Interactive Semioverse and GFRTU work, TAB and qtOps lineage, active Obsmetrologia distinctions, current RFC 6920 codec work, and the current operations/resource review. It preserves their useful separations without claiming that the historical formal papers are checked proofs or that later agent-generated organizational variations define the architecture.
