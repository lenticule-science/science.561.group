---
type: narrative
discusses: [invisible-automorphism-subgroup, visible-automorphism-quotient, settling-automorphism-1-truncation, settling-fiber-groupoid, visible-settling-fiber-groupoid]
---

# Fine vs visible moduli

After quotienting settlings by [biequivalence (= MLD)](equivalence-hierarchy.md), the resulting moduli object has automorphism groups $\mathrm{Aut}^\simeq(v)$ at each point. By [settling-automorphism 1-truncation](../../theorems/settling-automorphism-1-truncation.md), these are 1-groups. Two moduli refinements correspond to two ways of handling the [invisible-automorphism subgroup](../../teaching/explanations/invisible-automorphism-subgroup.md) $N(v)$.

## Fine moduli

The **fine moduli** retains the full automorphism group $\mathrm{Aut}^\simeq(v)$ at each point — including the large invisible subgroup $N(v)$. For sparsely-designated settlings — typical of [aperiodic regime](../../theorems/four-regime-dichotomy.md) — $N(v)$ is very large: it contains every bijection of the permanently-$\bot$ cells. The fine moduli's automorphism groups are correspondingly large, dominated by these invisible permutations.

## Visible moduli

The **visible moduli** quotients each $\mathrm{Aut}^\simeq(v)$ to the [visible-automorphism quotient](../../teaching/explanations/visible-automorphism-quotient.md) $\mathrm{Aut}^{\mathrm{vis}}(v) = \mathrm{Aut}^\simeq(v) / N(v)$, retaining only the autos that act non-trivially on the [settling-associated sheaf](../../objects/settling-associated-sheaf.md). The corresponding [visible settling fiber groupoid](../../objects/visible-settling-fiber-groupoid.md) is the primary moduli object of this stratum.

## Same points, different automorphisms

Both moduli have the same underlying *points* — biequivalence-classes-equal-to-MLD-classes — because quotienting by $N(v)$ at each point introduces no new 1-cells between distinct settlings. They differ only in automorphism-group size at each point.

## Why visible is primary

The visible moduli has simpler automorphism groups than the fine moduli: invisible autos (the bulk for sparsely-designated settlings) are collapsed. The classifying datum — the sheaf-iso class of $\mathcal{F}_U$ — is defined on MLD-classes (a fortiori on either moduli's points) and is fixed by $N(v)$, since by [settling-automorphism 1-truncation](../../theorems/settling-automorphism-1-truncation.md) every invisible automorphism acts as the identity on $\mathcal{F}_U$. For questions about the moduli as a stack, the visible automorphism groups are the right ones to track.

## Fine moduli as a gerbe over visible

The relation between fine and visible is structurally an *$N$-gerbe*: the fine moduli sits over the visible moduli as a "gerbe of invisible automorphisms," with each point of the visible moduli having a band of invisible-auto data above it. The corpus records that the fine moduli is recoverable from the visible plus the $N(v)$-data at each point; the explicit gerbe-theoretic formulation is not pursued here.

## Summary

- *Same coarse moduli* (set of MLD-classes) in either case.
- *Different stacky data*: full $\mathrm{Aut}^\simeq$ for fine, quotient $\mathrm{Aut}^{\mathrm{vis}}$ for visible.
- *Visible is primary*: matches the [cohomological invariants](../../objects/aperiodic-classifying-invariant.md) and gives smaller automorphism groups.
- *Fine recovers from visible* via $N(v)$-gerbe data.
