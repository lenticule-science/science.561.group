# SEN and SEAVT release candidate: source recovery and bounded errata

Recovered 2026-10-06 from Bare Cedar Fog snapshot `36116a727f8993d64063341d9ed5cbd281ecd00f`. This snapshot is source evidence, not the current publishing repository. The originals are byte-preserved; manifest.json gives every exact source URL, Git blob SHA-1 and SHA-256.

## The requested public specifications

- **Semiotic Expression Notation (SEN)**, “Specification of the semiotic expression notation,” created 2026-09-23, version 0.1.0, draft. Former name: Relation Model Notation (RMN). JSON-array terms with de Bruijn variables; statics in the computer-data section, reduction and runtime in computer-code.
- **Semiotic EAVT (SEAVT)**, “Specification of the semiotic EAVT,” created 2026-09-23, version 0.1.0, draft. Rows `{e,a,v,t}`: SEN entity, attribute and value, plus witnessed time.
- **ActivityPub++**, “Specification of ActivityPub++,” created 2026-09-27, version 0.1.0, draft. The recovered authored JSON, generated Markdown and RFCXML draft-emsenn-activitypub-plus-plus-00.xml are included from the separate transport inquiry.
- **Supporting specification: Semiotic Content Address (SCA)**, created 2026-09-23, version 0.1.0, draft. It supplies content commitment; it is not the third specification named by the user.

SEN and SEAVT were recovered as authored Markdown. No corresponding Specification JSON or RFCXML was present in their bounded owning code subtree. AP++ already has the record/rendered-carrier arrangement. Publishing an existing draft does not require pretending it is an adopted RFC or inventing a new framework.

## What the released SEN 0.1.0 prose actually specifies

Four CHL core types: base, arrow, prod, unit. Seven core term constructors: var, lam, app, pair, fst, snd, star. Executable extension: list type and mark, coincide, cond, fold. Charge values and operations, fields, lists, predication cells, witnesses and effect bundles are derived terms rather than new primitive constructors. The prose limits its cited Church–Rosser proof to the core; no Lean build was run in this recovery.

The current implementation is a separate witness:
- forms.mjs declares 16 term forms and 7 type forms. It adds prim, inl, inr, case, abort, empty and sum to the specified profile
- typing.mjs admits sums and empty elimination but has no prim typing case
- eval.mjs executes prim with the interpreter's named operation table; the default typed runtime does not supply that table
- notation/types.mjs lists 15 term forms and omits prim
- the source history records prim in c2776c8c (2026-09-25) and finite sums in 219a4881 (2026-09-26); these establish implementation changes, not governing mathematical or normative authorization
- the last spec change, 467cb218 (2026-10-03), updated static/dynamic placement; it did not reconcile those extensions

The candidate diff therefore adds a short implementation-status section. It does not broaden the normative grammar or transfer the core proof to extensions.

## SEAVT implementation consistency

The original prose places SEAVT beside code, but the pinned implementation exports @red-cup-engineering/semiotic-eavt-services-section under the data/content/JSONL/EAVT subtree. Its row admission demands closed, inferable coordinates; a closed lambda can be checkable against an explicit type while having no inferable type at this boundary. normalizeSeavtRow normalizes the EAVT row shape; it does not evaluate all coordinate terms.

The original semantic-record example uses charge:{support,refutation}. Current recorder schema and tests use told:{for,against}, with optional causes and origin. The candidate diff directly corrects the implementation placement and executable example, and states the inference/row-normalization boundary. It leaves the abstract SEAVT row definition untouched. Original historical bytes remain in originals/.

## Identity and vectors

The four rows in sen-core-v2.tsv retain exact canonical-CBOR hexadecimal bytes and ni URIs. All four SHA-256/base64url byte checks passed (vector-byte-verification.json):
- star
- four-neither
- mark-nfc-e-acute
- identity-rml

They are byte-identity vectors, not sufficient grammar/type/normalization conformance. In particular, four-neither encodes the retired four constructor, which the current grammar rejects. Keep it as a labelled legacy identity fixture; do not advertise it as an accepted current term.

The typed conformance boundary requires [ascribe, Type, Term], checks the type before and after bounded evaluation, verifies canonical bytes and declared identity, and returns the normal form. The ascribe array is an envelope, not a term constructor.

SCA's 0.1.0 prose still describes RMN normalized-envelope version 2. The current content implementation uses kind semiotic-expression-notation.normalized-semantic-content, version 3, normalization profile urn:rce:sen:normalize:0.1.0. Commit 730c3465 records this Sept24 change. Preserve prior byte identities; never rewrite old envelopes in place.

## Red Cup page mapping

**Specifications**: SEN (typed expression language), SEAVT (temporal semantic row format), ActivityPub++ (transport profile), with SCA linked as supporting content-addressing specification. Each card should link source and draft version; show original/current profile distinctions in its implementation note.

**Implementations**: SignCell is the pure evidence-bearing predication-cell library. SignCraft composes SignCell, SignChain and SignGraph for settlement, causal history, inference and presentation. These are software systems implementing/using the carriers, not alternate names for the standards. The package manifests, not older README dependency spellings, give the current pinned dependency names.

## Existing publication path

Recovered publishing-a-specification method:
1. Recover clauses from governing rulings and enforced behavior, with source and test per clause; keep unsettled additions in Open questions
2. Derive the existing Specification JSON record using derive-specification.mjs
3. Render Markdown and RFCXML using render-specification.mjs and render-specification-rfcxml.mjs
4. Verify citation targets and inline clause/standard/law references; require Security Considerations and IANA Considerations
5. Point the owning README to the authored record and its renderings

The schema and entry scripts are included as original evidence. They are not a new pipeline or a standalone runnable installation. AP++ supplies the existing authored render input. No IETF/W3C/FEP submission, license grant, public repository write, source integration or renderer run was performed.

## Release decisions still required

The selected current publication repository and governing license need confirmation from their owner. Current red-cup-engineering exact-name repository searches did not resolve the new computer-code/specification section owners. Older private relation-model-notation-services-section remains historical evidence, not a replacement destination. Its runtime MIT license was explicitly removed as “stray licence” during the Sept24 move (2c31b388); it is preserved in originals only and must not be copied as the current specifications' license.

The immediate bounded publication can preserve these draft specifications and the short implementation-status notes. Formal adoption, submission venue and any new rights grant are separate decisions. No broader product invention or proof completion is needed to make the recovered drafts reviewable.
