---

name: modal-calculus
description: "Topic: FiberNuclearLanguage — the first encounter with the fiber language. Introduces the language, proves its good behavior (soundness and normalization), and constructs its canonical initial model."
---

### Definition — The Modal Calculus {#modal-calculus}

*The first encounter with the fiber language.*

The fiber algebras are now in place. Before asking how local meanings cohere globally,
we establish what can be *said* at each history individually. The answer is
FiberNuclearLanguage — the nuclear Heyting-modal propositional calculus of the fiber: the
language whose terms denote elements of $H_t$ and whose two modal operators realize the
nuclei $\sigma_t$ and $\Delta_t$.

FiberNuclearLanguage is purely local: its typing judgments reference only the fiber $H_t$,
with no topology. Geometry does not precede language; it follows from asking how the
local languages fit together. One axiom ([fiber-nuclear-language-axiom](fiber-nuclear-language-axiom.md)) introduces FiberNuclearLanguage.
Two theorems establish its good behavior: Soundness (§soundness — the language faithfully
names the algebra) and Normalization (§normalization — every term settles into a unique
canonical form). A construction (§syntactic-relational-universe) shows that FiberNuclearLanguage
has a canonical initial model built purely from its own signature.

The subscript "0" marks this as the first in a family. The family itself becomes visible
only when the hyperverse tower is built ([hyperversal-nuclear-language](hyperversal-nuclear-language.md)). For now: this is level zero.
