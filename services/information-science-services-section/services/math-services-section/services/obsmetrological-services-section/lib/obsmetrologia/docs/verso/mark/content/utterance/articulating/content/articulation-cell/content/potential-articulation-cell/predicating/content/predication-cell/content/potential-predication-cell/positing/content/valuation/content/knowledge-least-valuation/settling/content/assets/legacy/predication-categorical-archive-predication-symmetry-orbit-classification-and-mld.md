---
type: question
class: internal
status: open
explores: [aperiodic-regime-classification, bilattice-two-orders-duality, conflation-strong-mld, klein-four-self-duality-on-named-substitutions]
---

# How do bilattice symmetry-group orbits relate to MLD-classification?

The corpus has two classification frameworks for aperiodic settlings:

1. **MLD-classification** (per [aperiodic-regime classification](../../aperiodic-settling/references/aperiodic-regime-classification.md), [combinatorial firing-ordinal bijection](../../aperiodic-settling/references/aperiodic-classification-via-firing-ordinal-bijection.md)): classes are determined by the firing-ordinal set up to settling-shift, with values at each firing tracked.

2. **Bilattice symmetry-orbit classification** (per [bilattice-Klein-four-symmetry](bilattice-klein-four-symmetry.md), [Klein-four self-duality on named substitutions](../examples/klein-four-self-duality-on-named-substitutions.md)): classes are determined by the orbit under the bilattice symmetry group acting on FOUR — Klein-four $K_4 = \langle -, \sim \rangle$ within a single closure theory, $D_4 = \langle \sigma, -, \sim \rangle$ across the two-orders duality.

The original Path 3 plan was to prove the aperiodic MLD-classification *via* bilattice symmetry-group orbits — i.e., show MLD-equivalence iff $D_4$-orbits agree. Working out the details: this **doesn't give an independent proof of the same theorem.** Instead, it surfaces a structural relationship that's worth understanding on its own terms.

## What's actually true

**$K_4$-orbits and MLD.** The Klein-four $K_4 = \langle -, \sim \rangle$ acts within a single $T_k$-theory: each element takes a $T_k$-settling to another $T_k$-settling with values relabeled. A settling's $K_4$-orbit type is a *property of its firing pattern with values*, captured by predication categories' "firing-ordinal set with cell values" data. So:

$$K_4\text{-orbit type} \;\subseteq\; \text{firing-ordinal-set-with-values data}.$$

The $K_4$-orbit refines or equals the firing-set classification — it's part of the same invariant, not a separate axis.

**$D_4$-orbits and MLD.** The full $D_4 = \langle \sigma, -, \sim \rangle$ extends $K_4$ by $\sigma$, the order-swap involution. $\sigma$ takes a $T_k$-settling to a $T_t$-settling — *a different theory*. So $D_4$-orbits *combine* MLD-classes from $T_k$ and $T_t$ theories.

$$D_4\text{-orbit} \;=\; T_k\text{-MLD-class} \;\sqcup\; \sigma_*(T_t\text{-MLD-class})$$

(plus possibly more orbits when conflation enters).

This means $D_4$-orbits are **coarser** than $T_k$-MLD — multiple $T_k$-MLD classes can sit in the same $D_4$-orbit (paired with their $T_t$-images).

## The actual research question

Neither $K_4$ nor $D_4$ orbits give a standalone classification equivalent to MLD. But the orbit structure carries structural information:

1. **Self-dual orbits.** Settlings whose firings are all on the truth axis $\{\mathbf{t}, \mathbf{f}\}$ are *conflation-self-dual* (per [conflation-strong-MLD theorem](../theorems/conflation-strong-mld.md)). They form a structural sub-stratum of the MLD-classification. The $D_4$-orbit type detects this sub-stratum without computing the full firing set.

2. **Refinement when firing patterns are degenerate.** Two settlings with *different* firing-ordinal sets but the same $D_4$-orbit type are actually different MLD-classes; the orbit type is a coarser invariant in this case. But two settlings with *the same* firing-ordinal set may have different $D_4$-orbit-stabilizer types — one self-dual, one not — giving a refinement.

3. **Lift to two-theory classification.** The $D_4$-orbits suggest a unified classification combining $T_k$ and $T_t$ theories. The "two-orders MLD-equivalence" $v \sim_{2\text{-MLD}} v'$ defined by "$v \sim_{T_k\text{-MLD}} v'$ OR $v \sim_{T_k\text{-MLD}} \sigma_*(v')$" is exactly the $D_4$-orbit equivalence (modulo conflation refinement).

## Sub-questions

1. **Does 2-MLD give a classification by $D_4$-orbits?** Define 2-MLD as MLD-equivalence allowing $\sigma$-conjugation. Does the firing-set + $D_4$-orbit-type pair determine 2-MLD-classes uniquely?

2. **Self-dual stratum structure.** What are the structurally-distinct self-dual sub-strata? Conflation-self-dual is one; negation-self-dual is another; full $D_4$-self-dual is a third. The corpus's existing examples ([Klein-four self-duality on named substitutions](../examples/klein-four-self-duality-on-named-substitutions.md)) compute these for Fibonacci/Padovan/etc. — extending to $D_4$ adds $\sigma$-self-dual.

3. **$D_4$-orbit detection from cohomology.** Can the $D_4$-orbit type be read off the apex $H^1$ class directly, without enumerating the firing set? If yes, the orbit becomes a quick-test invariant for self-duality.

4. **Connection to MLD-refinement via [strong-MLD](../theorems/strong-mld-via-composed-duality.md).** The strong-MLD classification refines MLD by composed-duality orbit type. Whether strong-MLD ≡ $D_4$-orbit-type-equivalence is open — they're both refinements but the precise relationship needs verification.

## Why this is open rather than proved

The original Path 3 plan assumed the $D_4$-orbit gave an independent proof of the same MLD-classification. Working through:

- $K_4$-orbits don't add new info beyond the firing-set classification.
- $D_4$-orbits give a *coarser* classification (2-MLD), not the same MLD.
- The structural relationship between MLD and orbit types is genuinely interesting but doesn't reduce to "MLD iff orbit equality."

This is a real research question, not a failed proof. Documenting it as such — with concrete sub-questions and worked examples in mind — preserves the structural information without overclaiming.

## Position in predication categories

Replaces what was originally tasked as "Path 3: aperiodic classification via Galois-equivariant symmetry group" — a path that turned out not to exist as initially formulated. The actual content is a refinement question about the relationship between bilattice symmetry-orbits and MLD, which is structurally informative but distinct from the MLD-classification proof itself.

Two existing paths for the MLD-classification stand:
- [aperiodic-regime classification](../../aperiodic-settling/references/aperiodic-regime-classification.md) (sketch via Hermida-Jacobs + Bonchi).
- [aperiodic-classification via firing-ordinal bijection](../../aperiodic-settling/references/aperiodic-classification-via-firing-ordinal-bijection.md) (proved via combinatorial bijection on common base).

Together they establish the MLD-classification on independent foundations. The symmetry-orbit refinement is supplementary, captured here as an open question for follow-up.
