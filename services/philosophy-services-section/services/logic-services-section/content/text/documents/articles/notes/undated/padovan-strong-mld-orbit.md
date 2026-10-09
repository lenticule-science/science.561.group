---
type: example
status: draft
depends-on: [strong-mld-via-composed-duality, padovan-substitution-settling, fibonacci-strong-mld-orbit, step-n-and-bilattice-correspondence]
instantiates: [strong-mld-via-composed-duality]
lineage: 5
title: Strong-MLD orbit of the Padovan substitution settling
description: Padovan has 3 substitution letters $\{a, b, c\}$.
---

# Strong-MLD orbit of the Padovan substitution settling

The L5d strong-MLD instance.

## Firing-orbit-type function

Padovan has 3 substitution letters $\{a, b, c\}$. The cardinality matches the bilattice's three non-bottom values $\{\mathbf{t}, \mathbf{f}, \top\}$ — see the [step-$n$ / bilattice cardinality coincidence theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-and-bilattice-correspondence.md). For *this example* we choose a labelling

- Letter $a$ ↔ $\mathbf{t}$ (truth-only firings),
- Letter $b$ ↔ $\mathbf{f}$ (falsity-only firings),
- Letter $c$ ↔ $\top$ (paraconsistent firings),

as a working convention. Whether this specific labelling is canonical (i.e., preserved by some bilattice operation under the substitution dynamics) is open per the parent theorem; for the strong-MLD analysis below the labelling is used purely as a working choice, and the orbit-type structure does not depend on the labelling being canonical.

The firing-orbit-type function $\tau^{\mathbb{D}}$ takes values in $\{\text{truth-only}, \text{falsity-only}, \top\}$ depending on which letter the substitution rule fires at each firing ordinal.

## Orbit structure

The Padovan substitution's $\sigma : a \mapsto b, b \mapsto c, c \mapsto ab$ implies:

- An $a$-firing produces a $b$-cell at the next stage (truth → falsity).
- A $b$-firing produces a $c$-cell (falsity → $\top$).
- A $c$-firing produces an $ab$-pair (both truth and falsity).

So the orbit-type *changes* with each substitution step — distinct from Fibonacci's *constant* truth-only orbit type. **Padovan exhibits a richer orbit-type pattern** in the strong-MLD classification.

## What this exhibits

Padovan is structurally richer than Fibonacci in terms of strong-MLD orbit types: where Fibonacci has all-truth-only firings (constant orbit), Padovan has *mixed* orbit types changing with each substitution step. This makes the bilattice correspondence at $n = 3$ structurally meaningful — the alphabet's three letters align with the bilattice's three non-bottom values via the substitution dynamics' effect on orbit type.

## Position in Lineage 5d

The L5d strong-MLD instance. Compared with Fibonacci (constant orbit-type), Padovan exhibits the bilattice's full non-bottom-value structure via its mixed orbit-type pattern.
