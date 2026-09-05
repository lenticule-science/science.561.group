---
type: question
status: open
---

# When is a sequence of refactorings safely composable?

Each refactoring in isolation preserves observable behavior. But a sequence of refactorings interacts: rename A → A', extract method M, rename A' → A. Each step is in the invisible-automorphism subgroup; the composition is the identity. That's the trivial case.

The non-trivial case: rename A → A', then refactor C which uses A. After the rename, C uses A'; if the refactoring of C is structurally sensitive to its dependencies, the second refactoring's structure-preservation claim depends on the first having landed.

In the substrate, this is composition in the automorphism group, which is closed; in the disciplinary, IDE-tooling sense, it's the question of *staging* — when is it safe to ship one refactor before the next? The answer is sensitive to: (a) what witnesses are checked between steps, (b) whether the codebase is shared with other contributors during the sequence, (c) whether the refactorings touch the same regions.

The math is closed under composition. The discipline is not — staging matters because *people* settle the sequence, not just the substrate. The unresolved question is whether the discipline can be encoded as a substrate-level constraint (e.g., a transient closure-rule that fires during the sequence) rather than left to operator vigilance.
