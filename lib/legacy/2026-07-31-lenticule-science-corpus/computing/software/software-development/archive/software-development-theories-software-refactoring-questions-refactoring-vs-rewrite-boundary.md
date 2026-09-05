---
type: question
status: open
---

# When does a refactoring become a rewrite?

A long enough sequence of refactorings can produce a codebase whose structure has nothing in common with the original — every line replaced, every name changed, every module reorganized — yet whose observable behavior, by the chain's discipline, is unchanged. Is that a refactoring (a long composition of structure-preserving transformations) or a rewrite (a structurally-distinct codebase achieving the same behavior)?

Two intuitions pull in opposite directions:

- **Composition-preserves-class.** If each step is a refactoring, and refactorings compose, the whole sequence is a refactoring no matter how long.
- **Identity-doesn't-survive.** A codebase with no surviving lines from the starting state is, in any everyday sense, a different codebase that does the same thing — i.e., a rewrite.

The substrate-algebraic answer favors the first: in the predicated form, refactorings are exactly the [invisible-automorphism subgroup](../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/invisible-automorphism-subgroup.md) of the codebase's settling, and the subgroup is closed under composition. A long sequence of refactorings is one element of the subgroup.

But this only resolves the *formal* question. The *practical* question — when do we, in code review or planning, call a change a rewrite rather than a refactoring? — is independently meaningful. Likely answers track the *evidence* the change produces, not the change itself: a "rewrite" is a refactoring whose evidence cannot fit on a single screen, whose risk profile differs, whose witness language has to be reconsidered. Rewrite is a label about the *episode*, not about the substrate transformation.

This is unresolved as a normative question — when is it useful to call something a rewrite — even though the formal substrate question has a clean answer.
