---
type: theorem
class: engineering-claim
status: proved
depends-on: [hash-injectivity-under-canonical-form, settlement-determinism, repair-log-byte-canonicality-via-lex-firing, witness-chain-as-proof-object, closure-rule-wire-format-canonicalization, stratified-cell-atom]
math-depends-on: [per-artifact-trajectory-projection-is-contiguous, canonical-firing-trajectory-via-lex-order]
see-also: [cross-peer-trajectory-ordering-is-content-addressed, determinism-via-fiber-functoriality]
---

# Repair-log hash chain as per-artifact Merkle projection

**Claim.** Let $L = (e_1, \dots, e_n)$ be the repair log of a `respond` invocation, where each entry $e_i$ records `(code, before_hash, after_hash, fuel_used, rule_id?, cell_index?, peer?)` per the dev spec's [repair-log](../../../../../../../../operations/engineering/tools/predication-computer/pypredcomp/docs/dev/specs/kernel/repair-log.md) §1 entry shape. For each *artifact* $a$ touched by the invocation — a single cell coordinate $(s, p, o)$, a fiber projection at an entity, or any other addressable substrate object whose canonical bytes are determined by a sub-support of cell atoms — let $\pi_a(L) = (e_{i_1}, \dots, e_{i_k})$ be the *per-artifact projection*: the sub-sequence of log entries whose `cell_index` (or, for non-cell artifacts, the inferred touch-set) intersects $\mathrm{supp}(a)$. Then:

1. **Per-artifact contiguity.** $e_{i_j}.\text{after\_hash} = e_{i_{j+1}}.\text{before\_hash}$ for every $j < k$.
2. **Mechanical chain validation.** The substrate's `PCC_REPAIR_HASH_CHAIN` invariant is verifiable in $O(n)$ time and $O(\sum_a |\pi_a(L)|) = O(n)$ space by per-artifact dispatch into a hashmap keyed on `cell_index`, comparing each entry's `before_hash` to the last `after_hash` recorded for the same artifact.
3. **Partial-log auditability.** A verifier with access to *only* the per-artifact projection $\pi_a(L)$ for some artifact $a$ — e.g., a federation peer interested only in cells the peer is authorized to observe — can verify the per-artifact hash chain on $a$ in isolation, without access to the rest of the log. Verification of $\pi_a(L)$ does not require the global ordering.
4. **Global-log reconstructibility.** Conversely, given the family $\{\pi_a(L)\}_a$ of per-artifact projections together with the per-entry `step_ord` (the trajectory ordinal that attaches each projected entry to its global position), the full log $L$ is reconstructible by ordinal-merge.

The conjunction is the engineering content of "the repair log is a Merkle-style hash chain that splits cleanly across artifacts": the global hash chain is the union of per-artifact hash chains, projected and then re-interleaved by global trajectory ordinal.

## Why this holds

**Part 1 — math says it.** Per [per-artifact-trajectory-projection-is-contiguous](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/per-artifact-trajectory-projection-is-contiguous.md), the lex-canonical trajectory's per-artifact projection has contiguous canonical-hash sequence. Per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md), canonical-hash equals the substrate's SHA-256 hash. The substrate's repair log records, on each entry, the artifact's canonical hash before and after the entry's effect; per [repair-log-byte-canonicality-via-lex-firing](repair-log-byte-canonicality-via-lex-firing.md), these per-entry pre/post hashes are exactly the trajectory's canonical-hash sequence. Identifying the math-side $\text{post-hash}_a(e_{i_j})$ with the wire-form $e_{i_j}.\text{after\_hash}$ — which is the substrate's commitment per the dev spec's §1 entry-shape table — gives the chain identity (1).

**Part 2 — algorithm.** Maintain a hashmap $M : \text{cell\_index} \to \text{hash}$, initially empty (or pre-populated with the pre-invocation cell hashes from substrate state). For each entry $e_i$ in trajectory order:

- If $e_i.\text{cell\_index}$ is unset, the entry is a phase marker (`PCM_RESPOND_PHASE`) or an invocation-scope error; no per-artifact dispatch is needed.
- Otherwise, look up $M[e_i.\text{cell\_index}]$. If absent, the entry is the first to touch this artifact — record $M[e_i.\text{cell\_index}] := e_i.\text{after\_hash}$ and validate that $e_i.\text{before\_hash}$ matches the substrate's pre-invocation hash for the cell coordinate (or is the canonical "absent" sentinel if the cell is being created).
- If present, validate $M[e_i.\text{cell\_index}] = e_i.\text{before\_hash}$. On mismatch, raise `PCC_REPAIR_HASH_CHAIN`. On match, update $M[e_i.\text{cell\_index}] := e_i.\text{after\_hash}$.

The loop visits each entry once and performs $O(1)$ hashmap operations per entry, so the algorithm is $O(n)$ time and $O(\text{distinct cell\_indices})$ space, which is bounded by $n$.

**Part 3 — projection-level independence.** The per-artifact projection $\pi_a(L)$ depends only on $L$'s entries with `cell_index ∈ supp(a)`. Per Part 1, those entries form a contiguous chain among themselves: $e_{i_j}.\text{after\_hash} = e_{i_{j+1}}.\text{before\_hash}$. A verifier with only $\pi_a(L)$ runs the algorithm of Part 2 restricted to $\pi_a(L)$ — equivalent to a single-key hashmap lookup chain — and verifies the chain in $O(|\pi_a(L)|)$ time. The math content (Part 1) makes this verification *meaningful*: a chain break in the partial-log audit is structurally a chain break in the global log, not an artifact of the projection.

**Part 4 — ordinal merge.** Given $\{\pi_a(L)\}_a$ with per-entry `step_ord`, sort the union $\bigcup_a \pi_a(L)$ by `step_ord` ascending. Per the lex-canonical trajectory's deterministic ordinal assignment (per [canonical-firing-trajectory-via-lex-order](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/canonical-firing-trajectory-via-lex-order.md)), the merged sequence is a permutation of $L$ that respects $L$'s original ordering. Phase markers (`PCM_RESPOND_PHASE`) and invocation-scope entries that are not per-artifact would need to be carried separately; the dev spec §5 marks these explicitly, so the merge is well-defined on the recoverable subset.

## Engineering consequence

- **`PCC_REPAIR_HASH_CHAIN` is a structural invariant, not a coincidence.** A repair log produced by a substrate that honours the lex-canonical trajectory and the atoms-not-modified-in-place discipline of [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md) cannot fail per-artifact contiguity. A chain-break observed in a real log is mechanically attributable to one of three implementation faults: a non-canonical firing order (lex discipline broken), an in-place atom modification (a firing's effect bypassed the new-atom-emission discipline), or a non-canonical artifact serialisation (the artifact's canonical bytes depend on context outside its support).
- **Federation peers can validate trajectory locally per partial log.** A peer receiving a witness-lifecycle trajectory per [witness-lifecycle-trajectory-is-regime-conditional-federation-content](witness-lifecycle-trajectory-is-regime-conditional-federation-content.md) for a specific cell or sub-support runs the partial-log audit of Part 3 against its received entries; chain breaks are federation-conformance faults attributable to the sending peer, not to the receiver's projection. This is the structural guarantee that "trust the chain, not the messenger" is operationalisable at the per-artifact level.
- **Auditor tooling can shard log validation by artifact.** A large repair log can be validated by sharding entries across worker threads keyed on `cell_index`; each worker validates its shard's chain independently. The shards are *independent* per Part 3, so no inter-shard coordination is required for chain validation. (Aggregated reporting still needs a join, but per-shard hashing does not.)
- **Compaction can erase entries that do not break chains.** Per [compaction-via-cosettling-equivalence-class](compaction-via-cosettling-equivalence-class.md), the substrate may compact the event log under cosettling equivalence. A repair-log entry can be elided under compaction iff its predecessor and successor on the same artifact's chain admit a direct hash continuation — i.e., iff there exists a canonical re-derivation of the gap. The per-artifact contiguity property gives the compaction algorithm a mechanical predicate to consult.

## What the theorem rules out

- **A substrate that records `before_hash` and `after_hash` against the wrong artifact.** A repair-log entry whose `before_hash` is the artifact's hash *minus the entry's update* (i.e., the substrate computed the post-hash and then derived the pre-hash by reverse-application) is non-conformant: the pre-hash must be the actual pre-application canonical hash of the artifact, computed by serialising the artifact before the entry's effect. Per Part 2, the algorithm validates against the recorded pre-hash; a backward-derived hash silently passes when it shouldn't (and fails when valid logs are validated against the substrate's other state).
- **Logs sorted by anything other than chronological order.** The dev spec §2 commits "Repair logs MUST NOT be re-sorted by code, hash, fuel, or any other key." Per Part 1, the contiguity property holds *only* under chronological (lex-canonical trajectory) ordering. A code-sorted or hash-sorted log loses contiguity and Part 2's algorithm raises `PCC_REPAIR_HASH_CHAIN` on the first inter-artifact transition. The discipline is wire-form sequence preservation.
- **An artifact whose support changes mid-invocation.** A "rolling artifact" whose support varies during the invocation — e.g., a query result whose set of cells is itself derived during settlement — does not have a stable per-artifact projection. The projection $\pi_a$ is well-defined only when $\mathrm{supp}(a)$ is fixed for the invocation; rolling artifacts fall outside the theorem's scope. The substrate handles them by snapshotting the support at the projection's emission time and treating the snapshot as a static artifact for the remainder of validation.
- **`cell_index` as anything other than the canonical $(s, p, o)$ form.** A repair-log entry that records `cell_index` as a hash, a path, or an opaque ID — anything other than the dev spec's `"(s, p, o)"` form — breaks Part 2's hashmap-keyed dispatch. The discipline is that `cell_index` is the per-artifact identity that the algorithm dispatches on.

## What the theorem requires

- The substrate honours the lex-canonical [firing trajectory](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/canonical-firing-trajectory-via-lex-order.md) and emits log entries in trajectory order per [repair-log-byte-canonicality-via-lex-firing](repair-log-byte-canonicality-via-lex-firing.md).
- The substrate's atom emission is in-place-immutable per [stratified-cell-atom](teaching/explanations/stratified-cell-atom.md): firings emit new atoms rather than modifying existing ones.
- Per-entry `before_hash`/`after_hash` are computed by canonical-form serialisation of the artifact before/after the entry's effect, not derived from any other source.
- `cell_index` is the canonical $(s, p, o)$ form per the dev spec; phase markers and invocation-scope entries either omit `cell_index` or use a reserved sentinel that the algorithm distinguishes.
- Hash injectivity holds per [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md).

## Position

This theorem completes the substrate's *per-artifact verifiability contract*. The chain of supporting claims:

- [settlement-determinism](settlement-determinism.md) — endpoint values are determined by inputs.
- [repair-log-byte-canonicality-via-lex-firing](repair-log-byte-canonicality-via-lex-firing.md) — the global log is byte-determined.
- [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md) — canonical bytes determine hash.
- *This theorem* — the global log's chain factors cleanly into per-artifact chains.

Together, they give the substrate's commitment that any auditor — global, per-artifact, per-shard, or per-federation-peer — can verify the structural integrity of a `respond` invocation by inspecting hashes alone, without re-running settlement. The substrate is therefore *auditable at the granularity of any artifact whose support is statically declared*, not just at the global-invocation granularity. This is the structural ground on which the dev spec's `PCC_REPAIR_HASH_CHAIN` invariant rests.
