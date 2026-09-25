---
type: theorem
class: naturality
status: proved
depends-on: [presheaf-indexed-fiber, knowledge-join, stratified-predication-fiber, predication-fiber-algebra, knowledge-order, hash-injectivity-under-canonical-form]
see-also: [cumulative-stratum-projection-naturality, cache-coherence-via-functorial-projection, federation-convergence, settling-monotonicity]
title: Projection–merge naturality
description: Claim.
---

# Projection–merge naturality

**Claim.** Let $\mathcal{F} \colon \mathcal{C}_{\mathrm{sub}}^{\mathrm{op}} \to \mathbf{Bilat}$ be a [presheaf-indexed fiber](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/presheaf-indexed-fiber/presheaf-indexed-fiber.md) over the substrate's context category $\mathcal{C}_{\mathrm{sub}}$. The [knowledge-join merge](../../research/2026/07/31/lenticule-import/morphisms/knowledge-join.md) $\odot \colon \mathcal{F} \times \mathcal{F} \to \mathcal{F}$ is a *natural transformation* of presheaves: for every restriction morphism $f \colon c' \to c$ in $\mathcal{C}_{\mathrm{sub}}$, the square

$$
\begin{array}{ccc}
\mathcal{F}(c) \times \mathcal{F}(c) & \xrightarrow{\;\odot\;} & \mathcal{F}(c) \\
\downarrow{\mathcal{F}(f) \times \mathcal{F}(f)} & & \downarrow{\mathcal{F}(f)} \\
\mathcal{F}(c') \times \mathcal{F}(c') & \xrightarrow{\;\odot\;} & \mathcal{F}(c')
\end{array}
$$

commutes. Equivalently, for every pair $(H_1, H_2) \in \mathcal{F}(c) \times \mathcal{F}(c)$,

$$
\mathcal{F}(f)(H_1 \odot H_2) \;=\; \mathcal{F}(f)(H_1) \odot \mathcal{F}(f)(H_2).
$$

In words: *projecting after merging equals merging projected operands*. The naturality is uniform in $f$ — it holds for every coordinate-narrowing morphism in $\mathcal{C}_{\mathrm{sub}}$, not only the special case of stratum projection.

## Setting

Per [presheaf-indexed fiber](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/presheaf-indexed-fiber/presheaf-indexed-fiber.md), $\mathcal{C}_{\mathrm{sub}}$ has objects $c = (\mathrm{stratum}, \mathrm{peer}, \mathrm{session}, \mathrm{ord})$ and morphisms given by coordinate-wise narrowings. Each restriction $\mathcal{F}(f)$ is *atom-set restriction by per-atom admission*: an atom $\alpha$ survives $\mathcal{F}(f)$ iff it satisfies the four coordinate-wise admission predicates of $c'$ (which are themselves narrowings of those of $c$).

Per [knowledge-join](../../research/2026/07/31/lenticule-import/morphisms/knowledge-join.md), $\odot$ on the [stratified predication fiber](../../research/2026/07/31/lenticule-import/objects/stratified-predication-fiber.md) is *atom-set union with per-canonical-identity $\vee_k$ on the value field*. Two atoms are merged into a single canonical atom only when they agree on the full canonical-identity tuple $(s, p, o, \mathrm{stratum}, \mathrm{peer}, \mathrm{session}, \mathrm{ord}, \mathrm{deps}, \mathrm{derived\text{-}via})$; atoms agreeing only on cell coordinate $(s, p, o)$ but differing in any context-tuple field are distinct atoms in the merged fiber.

## Why it holds

Fix $f \colon c' \to c$ and $H_1, H_2 \in \mathcal{F}(c)$. Write $\mathrm{adm}_{c'}(\alpha)$ for the per-atom admission predicate of context $c'$. By construction of $\mathcal{C}_{\mathrm{sub}}$, $\mathrm{adm}_{c'}$ is a conjunction of four per-coordinate predicates — stratum, peer, session, ord — each of which depends *only* on the corresponding field of $\alpha$, not on any other atom in the surrounding fiber.

We show set-equality $\mathcal{F}(f)(H_1 \odot H_2) = \mathcal{F}(f)(H_1) \odot \mathcal{F}(f)(H_2)$ at three levels: the atom level, the per-(coordinate, stratum) value level, and the witness-chain level.

**Atom level.** An atom $\alpha$ appears in $\mathcal{F}(f)(H_1 \odot H_2)$ iff (i) $\alpha \in H_1 \odot H_2$ and (ii) $\mathrm{adm}_{c'}(\alpha)$ holds. Since $\odot$ is atom-union (modulo the value/witness-chain joins addressed below), $\alpha \in H_1 \odot H_2$ iff $\alpha \in H_1$ or $\alpha \in H_2$. Combining, $\alpha$ appears in $\mathcal{F}(f)(H_1 \odot H_2)$ iff $(\alpha \in H_1 \wedge \mathrm{adm}_{c'}(\alpha))$ or $(\alpha \in H_2 \wedge \mathrm{adm}_{c'}(\alpha))$ — i.e. iff $\alpha$ appears in $\mathcal{F}(f)(H_1) \odot \mathcal{F}(f)(H_2)$.

The critical use of *per-atom* admission is here: $\mathrm{adm}_{c'}(\alpha)$ does not consult other atoms, so its truth value on $\alpha$ inside $H_1 \odot H_2$ equals its truth value on $\alpha$ inside $H_1$ alone (or $H_2$ alone). A context whose admission depended on the surrounding atom set — e.g. "admit $\alpha$ only if no atom at the same coordinate is present" — would break this identity.

**Per-canonical-identity value level.** Suppose $\alpha_1 \in H_1$ and $\alpha_2 \in H_2$ are merged into a single atom by $\odot$ — i.e. they share full canonical-identity $(s, p, o, \mathrm{stratum}, \mathrm{peer}, \mathrm{session}, \mathrm{ord}, \mathrm{deps}, \mathrm{derived\text{-}via})$ — with values $v_1, v_2$. In $H_1 \odot H_2$, the merged atom at that identity has value $v_1 \vee_k v_2$. Apply $\mathcal{F}(f)$:

*Identity-determined admission lemma.* The admission predicate $\mathrm{adm}_{c'}$ consults only the four context-coordinate fields (stratum, peer, session, ord) of an atom. Since $\alpha_1$ and $\alpha_2$ share full canonical identity, they share these four fields, so $\mathrm{adm}_{c'}(\alpha_1) = \mathrm{adm}_{c'}(\alpha_2)$ — and the merged atom inherits the same context-coordinate fields, so $\mathrm{adm}_{c'}$ on the merged atom equals this common verdict. There is no "exactly one admitted" case: either both $\alpha_1, \alpha_2$ and the merged atom are admitted, or none of them is.

The "exactly one admitted" case is *impossible by construction* of $\odot$: per [knowledge-join](../../research/2026/07/31/lenticule-import/morphisms/knowledge-join.md), value-join $v_1 \vee_k v_2$ fires only between atoms agreeing on the full canonical-identity tuple. Atoms differing in any context-coordinate field — even if they share cell coordinate $(s, p, o)$ — are *distinct atoms* that the merge retains separately rather than joining. The naturality argument's load-bearing step is exactly this restriction; it is what makes per-atom admission compatible with value-join.

Hence: under both admission verdicts, the projected merge equals the merge of projections. When admitted, both paths produce a canonical atom at the shared identity with value $v_1 \vee_k v_2$. When not admitted, both paths produce no atom at that identity. The value level commutes.

**Witness-chain level.** When $\odot$ merges two atoms at the same full canonical identity (which by definition includes their `deps` field), the merged atom's $\mathrm{deps}$ is the union of the two operands' $\mathrm{deps}$ — though the two operand `deps` are typically already identical, since `deps` is part of the canonical identity itself. The rare exception is when independent re-derivations of the same canonical atom recorded `deps` in different orderings; canonical-form serialisation per [hash-injectivity-under-canonical-form](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md) sorts `deps` before hashing, so this case reduces to identical-byte agreement on `deps`. Per-atom admission of the dependent atoms inside `deps` does not affect the surviving atom's admission — admission is on the outer atom alone. So `deps` is preserved verbatim across both projection paths.

Combining the three levels, the naturality square commutes.

## Specialisation: the stratum-only square

The substrate's read surface most often invokes the stratum-only restriction: $f_{(s)} \colon (s, \star, \star, \infty) \to (\mathrm{stratum}, \star, \star, \infty)$ for $s \le \mathrm{stratum}$. The induced $\mathcal{F}(f_{(s)})$ is `project_stratum(\cdot, s)` per the dev spec's vocabulary. The naturality square in this case reads:

$$
\mathrm{project\_stratum}(H_1 \odot H_2,\, s) \;=\; \mathrm{project\_stratum}(H_1,\, s) \;\odot\; \mathrm{project\_stratum}(H_2,\, s).
$$

This is the form the substrate's $\$ROOT/fibers/<entity>/by-stratum/<s>.json$ projection cache and the federation-merge discipline both rest on. The general theorem is the structural reason these two engineering disciplines agree: the projection cache's entries and the federation-merge's per-stratum outputs are computed by different code paths but are byte-identical because the underlying morphism is one and the same.

## What this rules out

- **Context-coordinate admission predicates that consult surrounding atoms.** A coordinate whose admission is "admit if no co-coordinate atom present" — e.g. "show only the highest-stratum atom at each cell" — is not a per-atom admission and breaks the square. The substrate's projection discipline avoids this by exposing such "highest-only" reads as a *separate* projection step *after* the natural projection $\mathcal{F}(f)$, not as a context narrowing.
- **Merge operations that depend on operand context.** A merge that consults the operand's context (e.g. "if from peer A, take the value; if from peer B, ignore") is not the substrate's $\odot$ — it is a *biased* operation that breaks $\vee_k$-commutativity and naturality both. The substrate's federation-receive policy (per [stratified-cell-atom](../../../engineering/theories/tech/theories/computing/theories/predicated-computing/concepts/stratified-cell-atom.md) federation-handshake-content) handles peer-trust *before* admission to the fiber — once an atom is in the fiber, $\odot$ treats it uniformly.
- **Atom identity that excludes originating context.** A substrate that identifies atoms by $(s, p, o, k)$ alone — losing the originating $(\mathrm{peer}, \mathrm{session}, \mathrm{ord})$ — would conflate distinct atoms under $\odot$ and break the value-level naturality argument. The substrate's atom identity must retain the full context tuple; canonical-form serialisation per [hash-injectivity-under-canonical-form](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/hash-injectivity-under-canonical-form.md) covers this.
- **Materialised projections that are stale relative to history.** A stale projection — one computed against an outdated history — fails the square: $\mathcal{F}(f)(H_{\mathrm{stale}}) \ne \mathcal{F}(f)(H_{\mathrm{current}})$. Per the engineering surface [cache-coherence-via-functorial-projection](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cache-coherence-via-functorial-projection.md), this is excluded by content-addressing the projection cache — same history, same hash, same projection bytes.

## What this requires

- The context category is $\mathcal{C}_{\mathrm{sub}}$ as defined in [presheaf-indexed-fiber](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/presheaf-indexed-fiber/presheaf-indexed-fiber.md), or another category whose restriction morphisms are determined by *per-atom admission predicates*.
- The merge $\odot$ is the [knowledge-join](../../research/2026/07/31/lenticule-import/morphisms/knowledge-join.md) merge: atom-union with per-canonical-identity $\vee_k$ on values and union on $\mathrm{deps}$.
- Atom identity includes the full context tuple; co-coordinate-co-stratum atoms with distinct context coordinates are distinct atoms.
- The substrate's [stratified predication fiber](../../research/2026/07/31/lenticule-import/objects/stratified-predication-fiber.md) atoms-not-modified-in-place discipline holds, so $\odot$ is determined by atom-set operations rather than in-place updates.

## Position

The projection–merge naturality square is the structural foundation of three substrate disciplines that the dev spec previously asserted by appeal to "naturality" without a stated theorem:

- **Cache coherence without invalidation.** Per [cache-coherence-via-functorial-projection](../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cache-coherence-via-functorial-projection.md), content-addressed projection caches are coherent because the projection is functorial; this theorem makes the projection's interaction with merge structurally compatible — caches never need invalidation when histories grow by merge.
- **Federation merge commutes with stratum read.** Per the dev spec's `PCC_PROJECTION_DIVERGED` startup gate, a peer's projection at stratum $s$ merged with the local projection at stratum $s$ must equal the projection-at-$s$ of the merged history. This theorem is exactly that assertion at the math level.
- **Per-context projections are first-class.** The dev spec's $\mathrm{by\text{-}peer}$ and $\mathrm{by\text{-}session}$ projections (v0.2 task t02-114) are restrictions $\mathcal{F}(f)$ for the $\mathrm{peer}$- and $\mathrm{session}$-narrowing $f$, respectively. Naturality holds for these too — the conformance gate need not be re-proved per context coordinate; it follows from the uniform statement above.

The cumulative variant — naturality of `project_stratum_at_or_below` — is the subject of [cumulative-stratum-projection-naturality](../../research/2026/07/31/lenticule-import/from-predicate-category/cumulative-stratum-projection-naturality.md), which carries the additional argument that the cumulative narrowing is monotone over $\odot$.
