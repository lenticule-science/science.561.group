# theorems/

Engineering claims about predicated computing — substrate properties, operator guarantees, invariants — stated with the precision that two implementations could be checked against them. One claim per file.

The directory is currently empty pending mining of the engineering triage. Theorems will be added as engineering claims are extracted from the triage's substantive material.

## Frontmatter

```yaml
---
type: theorem
status: stated | sketched | proved | refuted
depends-on: [...]
see-also: [...]
---
```

## Body shape

A theorem's body has three sections at minimum:

1. **Theorem (statement).** The claim, stated precisely, citing the engineering structures it covers.
2. **Why it holds.** The engineering argument — what about the substrate or the operators makes the claim true.
3. **Engineering implication.** What the theorem lets the engineer assume in practice.

A theorem may additionally carry a **failure mode** section noting how implementations can violate the theorem and what the symptoms look like.

## When to add a theorem

When an engineering claim is named precisely enough that two implementations could be checked against it, and the claim has structural content beyond the statement of the relevant objects and morphisms. Engineering claims that are mere restatements of object commitments belong in the object body, not as a separate theorem.
