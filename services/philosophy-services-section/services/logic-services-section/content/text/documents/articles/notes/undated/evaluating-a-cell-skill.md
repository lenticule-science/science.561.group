---
name: evaluating-a-cell
description: The morphism (cell, valuation) → (cell, value) that produces the value a valuation assigns at a cell. The output is a pair with cell and value as sibling fields; the cell appears unchanged from input, and the value is the bilattice-value v(p)(s, o) drawn from the fiber A_p.
title: evaluating-a-cell
---

## What this transformer is

Evaluating-a-cell is the morphism

$$\mathrm{ev} : \Phi \times \mathrm{Val} \to \Phi \times \mathbf{L}^\bowtie,\qquad (\phi, v) \mapsto (\phi,\, v(p)(s, o))$$

where $\phi = (s, p, o)$ and $\mathrm{Val}$ is the set of valuations over the fixed base. The left coordinate is the identity on $\Phi$ — the cell appears in the output exactly as it appeared in the input. The right coordinate is the application of the valuation at the cell's predicate, evaluated at the cell's entity-pair. The two coordinates remain sibling components of the output pair; there is no morphism in the apparatus that returns a value-bearing cell.

When the valuation has not assigned a value at the entity-pair $(s, o)$ in the fiber at $p$, the implicit value is the knowledge-bottom $\bot = \langle \bot_L, \bot_L \rangle$ of the twist product — "no evidence either way."

## Realization on this platform

1. Validate the cell against the predication-cell JSON Schema and the valuation against the predication-valuation JSON Schema using ajv 2020.
2. Look up the fiber-algebra for the cell's predicate in the valuation's `fiber-algebras` map. A missing fiber is a structural error (the valuation's domain does not cover this predicate); the script throws `RangeError`.
3. Compute the entity-pair key `<s>:<o>` and read the assignments entry. Absent entries default to the knowledge-bottom of the twist product.
4. When the underlying residuated lattice is the two-element Boolean $\mathbf{2}$, encode the twist-product element as a FOUR carrier element via the standard isomorphism $\mathbf{2}^\bowtie \cong \mathbf{FOUR}$. Otherwise emit a general twist-product bilattice-value.
5. Return `{cell, value}` as sibling top-level fields.

## Failure modes

- Schema-violating cell or valuation throws `TypeError`.
- Missing fiber-algebra at the cell's predicate throws `RangeError`.
- Twist-pair components outside the underlying lattice's carrier throw `RangeError`.
