---
type: concept
class: discipline
depends-on: [predication-substrate, settling-quiescence, predication-fiber-algebra, closure-fixed-points-priestley-correspondence, jung-rivieccio-duality, paired-priestley-space]
see-also: [determinism, hash-discipline, witness, canonical-form-via-settling-quiescence]
---

# Canonical form

The discipline that every serialized representation of a substrate object has *exactly one* canonical byte-encoding. In the substrate's hyperdoctrine setting, canonical form is not arbitrary lexicographic convention — it is *the byte-presentation of a substrate value at its [closure fixed point](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md)*, presented through the [paired Priestley dual](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paired-priestley-space.md) of the substrate's [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md). Per [closure-fixed-points-priestley-correspondence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-fixed-points-priestley-correspondence.md), the closure-fixed-point sub-lattice corresponds to a closed Priestley subspace; canonical-form serialization is the substrate-side enumeration of points in this subspace.

Per [canonical-form-via-settling-quiescence](../theorems/canonical-form-via-settling-quiescence.md), the substrate-side meaning of "canonical" is exact: a value is in canonical form iff its byte-encoding is the deterministic Priestley-dual presentation of its closure-fixed-point representative.

Two distinct byte-strings cannot represent the same logical content, and two distinct logical contents cannot collide in the same byte-string. Canonical form is what makes [hash-discipline](hash-discipline.md), [witness](witness.md), and [determinism](determinism.md) operationally meaningful: a content's identity is its canonical-form hash.

## Hyperdoctrinal grounding

Per [jung-rivieccio-duality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/jung-rivieccio-duality.md), distributive bilattices are dual to paired Priestley spaces:

$$\mathbf{DBiLat}^{\mathrm{op}} \;\simeq\; \mathbf{PairedPriSp}.$$

The substrate's [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie E \times E}$ is a distributive bilattice; its Priestley dual is the paired Priestley space $X_p = \mathrm{Spec}(A_p)$. Per [closure-fixed-points-priestley-correspondence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-fixed-points-priestley-correspondence.md), the closure-fixed-point sub-algebra $A_p^{\mathrm{cl}}$ corresponds to a closed subspace $K_p \subseteq X_p$.

A canonical-form serialization of a substrate value $v \in A_p^{\mathrm{cl}}$ is an enumeration of the prime-filter points in $K_p$ corresponding to $v$, presented in the Priestley-dual's structural order. Per [canonical-form-via-settling-quiescence](../theorems/canonical-form-via-settling-quiescence.md), this presentation is *unique* up to the Priestley space's order-disconnection — distinct values have distinct presentations, and the substrate's canonicalization rule is the substrate-side deterministic enumeration recipe.

The canonicalization rule is procedural and exhaustive. The discipline applies to every carrier the substrate transmits or persists: predication-graph sections, operator inputs and outputs, repair-log entries, event-log entries, RPC payloads, storage files. Each carrier has the same rules, with carrier-specific hooks where the carrier's own structure imposes additional constraints.

## The base canonical-JSON rule

For carriers serialized as JSON:

- **Object keys** are sorted lexicographically by codepoint order. No additional whitespace, no formatting hints. (This is the substrate-side enumeration of fiber-algebra co-factors in the Priestley dual's order-component.)
- **Arrays preserve semantic order** declared by the producing specification (sections in declaration order, repair-log entries in chronological order, evidence arrays in causal order, etc.). Arrays MUST NOT be re-sorted during canonicalization.
- **Strings** are UTF-8 encoded; escape sequences use the JSON-standard minimal form. Non-ASCII characters are emitted as themselves (UTF-8) rather than escaped, unless the carrier's spec requires ASCII-only.
- **Numbers** use the shortest decimal representation that round-trips. No leading zeros; no leading `+`; minimal-exponent form when scientific notation is used.
- **Booleans** appear only where the carrier definition permits them. Carriers that don't admit Booleans encode the same content via numeric or string conventions declared in the carrier spec.
- **Whitespace** outside string values is omitted entirely.
- **The byte-encoding is UTF-8 with no BOM.**

## Ordering constraints inherited from semantics

Canonical form preserves semantic orderings that the substrate's other commitments depend on. These orderings are exactly the structural orders the Priestley dual's $\leq_t$ / $\leq_k$ components impose on the dual space's points:

- Contexts and declarations follow introduction order; α-equivalent reorderings are not allowed.
- Sections in a fiber appear in the section-set's declaration order; tables (Heyting tables, repair tables, etc.) mirror that order in their row and column structure exactly.
- Constructors and invariants are evaluated in the order listed by the producer; repair recipes do not reorder them.
- Repair-log entries appear in the order in which the associated state change becomes canonical; re-sorting by code or hash is forbidden.
- Evidence arrays list hashes in causal order: input payloads, repair-log entry hashes, then outputs.

## Hashing and content addressing

Canonical-JSON bytes are hashed with SHA-256; the lowercase hexadecimal digest is the canonical identifier for every substrate object. Whenever a carrier includes an embedded identifier and an external filename or envelope hash, all copies MUST match the canonical-bytes digest exactly. Mismatches are hard errors at the consumer.

A canonical-form serializer is a total function: every input has exactly one canonical output, and equality of inputs is equality of outputs. Per [canonical-form-via-settling-quiescence](../theorems/canonical-form-via-settling-quiescence.md), this totality follows from the Priestley-dual's structural determinism — the substrate's value is at a unique closure-fixed-point, the dual is a closed subspace, and the enumeration recipe is deterministic. Implementations MUST canonicalize *before* hashing and *before* using a payload as a cache key.

## Replay obligation

Any replay — closure re-execution, transport interaction reconstruction, audit reproduction — MUST re-canonicalize payloads using the same rules before re-hashing. Per [settlement-via-closure-2-monad](../theorems/settlement-via-closure-2-monad.md), the closure 2-monad's idempotence guarantees that re-running closure on a canonical value produces the same value; the canonical form is then a property the substrate computes once and verifies on every replay.

Witnesses derived from non-canonical bytes are invalid. The substrate's audit operations apply the canonicalization rule, hash, and compare; any deviation from the recorded witness is a coherence violation.

## Carrier-specific hooks

Particular carrier types add constraints on top of the base rule:

- **Predication-cell carriers** apply the substrate's normalization strategy before hashing the cell. Tables in the cell follow the section element order — the Priestley-dual's structural order on fiber components.
- **Judgment carriers** normalize terms (e.g., call-by-value, left-to-right) before hashing or embedding.
- **Closure-output carriers** are canonicalized at the moment they become canonical — typically immediately after the closure step that produces them, when the value reaches its closure-fixed-point — before hashing or returning.
- **RPC envelopes** are canonical JSON with sorted keys; embedded payloads are base64-encoded canonical bytes; envelope-level hash fields MUST equal the hash of the decoded canonical bytes.

The discipline is what makes the substrate's content *content-addressed* rather than reference-addressed: an entity is found by its canonical hash, not by a name or location, and the same content always has the same address regardless of where or how it was produced.
