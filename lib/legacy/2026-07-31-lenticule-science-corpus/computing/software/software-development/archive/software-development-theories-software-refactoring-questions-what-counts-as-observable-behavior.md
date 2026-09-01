---
type: question
status: open
---

# What counts as observable behavior?

Refactoring is the activity that changes structure *without changing observable behavior*. Everything turns on what "observable" means, and the answer is not a fact about the code.

Concretely:

- A rename of a private variable is invisible to test runners, users, and most static analyzers — but visible to a hex-dump of the compiled binary, to a debugger reading source-line metadata, and to a code reviewer.
- A change in iteration order of an iterable is invisible to most tests but visible to any test that depends on order.
- A change in error-message wording is invisible to programmatic callers but visible to log-grep monitoring and to users reading errors.
- A whitespace reformat is invisible to the compiler in most languages and visible in Python, YAML, Makefiles.

The pattern: observability is *witness-relative*. There is no single answer to "is this observable?" — only answers to "is this observable to witness-language $W$?". The refactoring discipline is therefore parameterized by a choice of witness language, and refactorings are safe *under that choice*.

This question is fully resolved in the predicated form: the [settling-associated sheaf](../../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-associated-sheaf.md) is the observable-behavior structure, and its parameterization by which cell-positions are designated witness-bearing is the witness-language choice. The theorem [refactor-as-invisible-automorphism](../../../../../../predicated-computing/theories/predicated-software-engineering/theories/predicated-software-development/theories/predicated-software-refactoring/theorems/refactor-as-invisible-automorphism.md) makes the witness-relativity precise.

The unresolved sub-question is *normative* rather than mathematical: which witness languages should we adopt? Project-by-project, what counts as the canonical choice — only-tests, tests-plus-public-api, plus-monitoring, plus-debugger-paths, plus-binary-equivalence? The theory does not tell us which to pick; it tells us that the choice has consequences and which.
