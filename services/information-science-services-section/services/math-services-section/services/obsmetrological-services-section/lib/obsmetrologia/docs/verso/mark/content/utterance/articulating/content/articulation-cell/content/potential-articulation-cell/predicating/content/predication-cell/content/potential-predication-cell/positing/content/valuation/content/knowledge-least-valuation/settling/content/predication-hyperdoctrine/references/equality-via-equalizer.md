---
kind: theorem
status: proved
depends-on: [predicate-specialization, predicate-converse, predicate-category, entity-set, finite-limit-morphisms-decompose]
---

# Equality via equalizer

The equalizer of $\mathrm{id}_p$ and $\mathrm{converse}_p$ in a [predicate category](../objects/predicate-category.md) $\mathcal{C}$ is a [specialization](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-specialization.md) with sub-support

$$\Delta_E = \{(s, s) : s \in E\} \subseteq E \times E$$

— the diagonal of $p$ within the [entity set](../objects/entity-set.md) $E$.

## Proof

By [finite-limit morphisms decompose](../../../../../../../../../../../../predicate-category/references/finite-limit-morphisms-decompose.md), the equalizer map $e : \mathrm{Eq}(\mathrm{id}_p, \mathrm{converse}_p) \to p$ is a specialization to the sub-support where $\mathrm{id}_p^* = \mathrm{converse}_p^*$.
The identity acts as $v(s, o) = v(s, o)$; the [converse](../../../../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/predicate-converse.md) acts as $v(s, o) = v(o, s)$.
These agree exactly on cells with $s = o$ — the diagonal $\Delta_E$. $\square$

## Remark

This characterization sets up the equality construction via Lawvere's $\Sigma$ along the diagonal in the equality and comprehension theory.
