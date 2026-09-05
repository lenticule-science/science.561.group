---
type: theorem
class: trajectory-projection
status: proved
depends-on: [canonical-firing-trajectory-via-lex-order, closure-rule-system, predication-fiber-algebra, stratified-predication-fiber, settling-monotonicity, independence-implies-confluence]
see-also: [closure-2-monad-lax-idempotence, settlement-via-closure-2-monad]
---

# Per-artifact trajectory projection is contiguous

**Claim.** Let $\sigma_\Omega = ((r_1, \vec{y}_1), \dots, (r_m, \vec{y}_m))$ be the lex-canonical [firing trajectory](canonical-firing-trajectory-via-lex-order.md) of a settling $\Omega$ on a stratified predication fiber $A^{\flat}_p$. For each *artifact* $a$ — an addressable substrate object whose canonical hash is updated by trajectory entries (a single cell coordinate $(s, p, o)$, a fiber slice over a sub-support, or a per-entity fiber projection) — let

$$
\pi_a(\sigma_\Omega) \;=\; (e_{i_1}, e_{i_2}, \dots, e_{i_k})
$$

denote the *per-artifact projection*: the strictly-increasing-in-trajectory-ordinal subsequence of entries that update the canonical bytes of $a$. Write $h^{(a)}_j$ for the canonical hash of $a$ at trajectory step $i_j$ (i.e. immediately after $e_{i_j}$ has been applied), and $h^{(a)}_0$ for the canonical hash of $a$ before the trajectory begins. Then:

1. **Per-artifact contiguity.** For every $j \in \{1, \dots, k-1\}$, the canonical hash of $a$ between trajectory steps $i_j$ and $i_{j+1}$ is constant: $h^{(a)}_j$ remains the canonical hash of $a$ at every $\sigma_\Omega$-step strictly between $i_j$ and $i_{j+1}$.
2. **Per-artifact hash chain.** The pre/post hash pairs of consecutive projected entries form a contiguous Merkle-style chain:
$$
\text{post-hash}_a(e_{i_j}) \;=\; \text{pre-hash}_a(e_{i_{j+1}}) \quad \text{for all } j < k,
$$
where $\text{pre-hash}_a(e)$ is the canonical hash of $a$ immediately before applying $e$ and $\text{post-hash}_a(e)$ is the canonical hash of $a$ immediately after.
3. **Reconstructibility.** The canonical hash $h^{(a)}_k$ at the end of the trajectory is determined by $\pi_a(\sigma_\Omega)$ alone — entries in $\sigma_\Omega \setminus \pi_a(\sigma_\Omega)$ do not affect the per-artifact hash sequence at $a$.

The conjunction is the *sub-trajectory hash-chain coherence* property of the lex-canonical trajectory: the global trajectory's hash chain factors through any per-artifact projection without gaps or splits. This is the math content that makes per-artifact hash-chain verification a structural property of the trajectory rather than an implementation accident.

## Setting

An *artifact* is any addressable substrate object whose canonical bytes are determined by a sub-support $\mathrm{supp}(a) \subseteq \mathrm{Atoms}(A^{\flat}_p)$ of cell atoms. Examples:

- A *single cell coordinate* $a = (s, p, o)$: $\mathrm{supp}(a)$ is the set of atoms at that coordinate, and the canonical bytes of $a$ at step $\tau$ are the canonical-form serialisation of the latest atom at that coordinate as of $\tau$ (under the [stratified predication fiber](../objects/stratified-predication-fiber.md)'s default projection).
- A *per-entity fiber projection* $a = (\text{entity}, \text{stratum})$: $\mathrm{supp}(a)$ is the set of atoms at the entity's coordinates that match the stratum, and the canonical bytes are the canonicalised projection.
- A *closure-rule record* $a = r$: $\mathrm{supp}(a) = \emptyset$ (rules are static substrate content within an invocation), and $\pi_a(\sigma_\Omega)$ is empty.

A trajectory entry $e \in \sigma_\Omega$ *touches* artifact $a$ iff its application changes some atom in $\mathrm{supp}(a)$ — equivalently, iff its canonical-form output differs from its canonical-form input on the projection to $\mathrm{supp}(a)$.

## Why this holds

**Part 1 — independence of artifacts in the lex-canonical trajectory.** The lex-canonical trajectory is composed of $(r, \vec{y})$ firing-pairs, each of which produces a finite set of *new* atoms in $A^{\flat}_p$ at coordinates determined by $r$'s conclusion pattern instantiated at $\vec{y}$. Per [stratified-predication-fiber](../objects/stratified-predication-fiber.md)'s atoms-not-modified-in-place discipline, the firing does not modify atoms at any coordinate other than those in its conclusion pattern's instantiation. So a firing $e$ touches artifact $a$ iff $\mathrm{supp}(a) \cap (\text{conclusion-coordinates of }e) \neq \emptyset$.

For a $\sigma_\Omega$-step $\tau$ strictly between $i_j$ and $i_{j+1}$: by definition of $\pi_a$, the entry $e_\tau$ does *not* touch $a$, so $\mathrm{supp}(a) \cap (\text{conclusion-coordinates of }e_\tau) = \emptyset$, so the canonical bytes of $a$ are unchanged from step $\tau - 1$ to step $\tau$. By induction over $\tau \in (i_j, i_{j+1})$, the canonical bytes of $a$ are constant on the open interval $(i_j, i_{j+1})$ at the value $h^{(a)}_j$. Hence (1).

**Part 2 — chain identity from constancy.** By Part 1, the canonical hash of $a$ immediately before $e_{i_{j+1}}$ is $h^{(a)}_j$ — that is, $\text{pre-hash}_a(e_{i_{j+1}}) = h^{(a)}_j = \text{post-hash}_a(e_{i_j})$. This is exactly the chain identity (2). Note this uses *canonical-hash-as-content-identity* (per [hash-injectivity-under-canonical-form](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md), engineering side): bytes equal $\Leftrightarrow$ hash equal, so constant bytes implies constant hash.

**Part 3 — projection determines endpoint.** The final hash $h^{(a)}_k$ is the canonical hash of $a$ after the last touching entry $e_{i_k}$. By Part 1 again, between $e_{i_k}$ and the trajectory's terminal step, $a$'s bytes are unchanged, so $h^{(a)}_k$ is also the trajectory's terminal hash for $a$. The full sequence $(h^{(a)}_0, h^{(a)}_1, \dots, h^{(a)}_k)$ is determined by the projected entries' pre/post-hash data alone. Non-touching entries contribute nothing to the per-artifact hash trajectory.

## Refinement: cause-effect interleaving across artifacts

The global trajectory $\sigma_\Omega$ generally has entries that touch *different* artifacts interleaved by cause-effect — a firing at $a_1$ produces a stratum-1 atom whose value enables a later firing at $a_2$, and the projected sequences $\pi_{a_1}(\sigma_\Omega)$ and $\pi_{a_2}(\sigma_\Omega)$ overlap in trajectory ordinal. Per the lex-canonical discipline, the *global* ordering of entries is fixed; the per-artifact projection inherits that ordering by sub-sequencing.

Two structural consequences:

- *Per-artifact projections are mutually independent as hash chains.* The chain $\pi_{a_1}(\sigma_\Omega)$'s hash sequence is determined entirely by the $a_1$-touching entries; the $a_2$-touching entries' hashes do not appear in it. This is the structural justification for the dev spec's "(Different artifacts proceed independently; entries interleave by cause-effect.)" comment.
- *The global hash sequence is the unioned-and-ordered family of per-artifact chains.* Knowing every per-artifact chain $\pi_a(\sigma_\Omega)$ together with the trajectory ordinals $i_1 < i_2 < \dots$ at which each entry was emitted reconstructs the global trajectory's hash data. This is the math content of the dev spec's verifiable repair-log discipline: an auditor with the per-artifact hash chains and the global ordering reconstructs the full Merkle structure.

## What this rules out

- **Per-artifact hash chains with gaps.** A trajectory in which $\text{post-hash}_a(e_{i_j}) \ne \text{pre-hash}_a(e_{i_{j+1}})$ — that is, the per-artifact projection is non-contiguous — would imply that some non-touching entry between them did modify the canonical bytes of $a$, contradicting Part 1's independence-of-artifacts.
- **Atoms-modified-in-place under firing.** A fiber implementation that *updates* an existing atom's value in place, rather than emitting a new atom and projecting, breaks Part 1 directly: the firing then touches every artifact whose support includes the updated coordinate, even if its conclusion pattern does not name the coordinate. The contiguity property fails. This is why the stratified fiber commits to atoms-not-modified-in-place.
- **Concurrent modification of overlapping artifact supports.** Two artifacts whose supports overlap (e.g., a single-cell artifact and a fiber-projection artifact containing the same cell) are *not* independent — a firing touching the cell coordinate touches both. Their per-artifact chains overlap at touching entries; both inherit the contiguity property, but neither chain alone is sufficient to verify the other. This is a structural property an auditor must respect when partitioning the trajectory by artifact.
- **Trajectory entries whose canonical bytes depend on entries other than their predecessor.** A per-firing canonical form whose bytes depend on non-touching prior entries (e.g., a "compressed" form referencing a delta from an unrelated state) breaks Part 2: the pre/post-hash chain on $a$ requires that the canonical bytes of the artifact at any trajectory step depend only on the touching entries up to that step.

## What this requires

- The lex-canonical [firing trajectory](canonical-firing-trajectory-via-lex-order.md) discipline is in force: trajectory entries are deterministically ordered.
- The stratified fiber emits new atoms rather than modifying in place per [stratified-predication-fiber](../objects/stratified-predication-fiber.md).
- The artifact's canonical-form serialisation is a function of its support content alone (no external context).
- Hash injectivity under canonical form holds (per [hash-injectivity-under-canonical-form](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md)).
- The artifact's support is determined statically (or at least at admission time): the projection $\pi_a$ is well-defined on the trajectory.

## Position

This theorem is the trajectory-projection structural property the substrate's per-entry hash-chain validation rests on. The engineering surface is [repair-log-hash-chain-as-per-artifact-merkle-projection](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/repair-log-hash-chain-as-per-artifact-merkle-projection.md), which lifts the result to the substrate's `PCC_REPAIR_HASH_CHAIN` invariant.

Together with [canonical-firing-trajectory-via-lex-order](canonical-firing-trajectory-via-lex-order.md) (the trajectory itself is canonical) and [hash-injectivity-under-canonical-form](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/hash-injectivity-under-canonical-form.md) (canonical bytes determine hash), this theorem completes the trinity that the substrate's verifiable repair log rests on: deterministic order, deterministic content, and per-artifact contiguity. An auditor reading a repair log can verify the chain by per-artifact dispatch and per-step canonical re-hashing; a divergence at any step is mechanically attributable to one of three failure modes — non-canonical order, non-canonical bytes, or non-contiguous projection (i.e. an atom modified in place by an entry that did not name it).
