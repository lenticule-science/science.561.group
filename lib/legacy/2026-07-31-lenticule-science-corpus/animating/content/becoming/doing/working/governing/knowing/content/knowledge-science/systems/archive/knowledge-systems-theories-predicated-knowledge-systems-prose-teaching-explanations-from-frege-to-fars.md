---
type: narrative
recaps: [predication-as-residuation, the-adjoint-structure-of-predication-on-bilattice-valued-fibers, predication-logic-through-knowledge-systems]
introduces: [knowing-as-settling, discourse-community-as-fiber, epistemic-closure]
discusses: [predicated-knowledge-system]
---

# From Frege to FARS

Each step of the line from Frege's *Begriffsschrift* (1879) to the FARS toolkit (2026) was taken in service of a real engineering problem in knowledge representation; every step that survived did so because the next problem in the line could not be solved without it. The FARS toolkit is what the line's accumulated commitments look like as a working substrate.

## Frege solves the *unsaturated function* problem

The pre-Fregean way of writing "Socrates is mortal" was as a noun-phrase plus copula plus noun-phrase. The structural problem: there is no algebra over noun-phrases. You cannot meaningfully ask whether one noun-phrase entails another, or compose noun-phrases, or quantify over their possible fillings. The notation hides what it should expose.

Frege's move was to write "Socrates is mortal" as the application $\mathrm{mortal}(\mathrm{Socrates})$ of an unsaturated function $\mathrm{mortal}(\cdot)$ to the argument $\mathrm{Socrates}$. The function has algebraic structure (it can be composed, quantified, evaluated); the argument is just a name. This is the structural origin of the modern *predicate* — a function with an argument-place — and the structural origin of every storage-unit-as-function-application choice that followed.

The FARS toolkit's storage unit is the predication-cell $(s, p, o)$. The cell is not a name-pair-with-string; it is the application of the binary predicate $p$ to the subject $s$ and object $o$. Frege's solution to the unsaturated-function problem is what makes the cell algebraically meaningful.

## Lambek solves the *combination* problem

Once predicates are functions, how do they combine? Categorial grammar (Ajdukiewicz, Bar-Hillel, Lambek) recognised that combination is *typed application* and proved that the typed-application algebra is *residuated*: if $a \cdot b$ is the combination, there are operations $\backslash$ and $/$ such that $a \cdot b \leq c \iff b \leq a \backslash c \iff a \leq c / b$.

The FARS toolkit's `fars context <slug> --depth <d>` command extracts a bounded subgraph of substrate content. Bounding the depth is not a free engineering choice — it is the residuation: $\mathrm{context}(s, d) \leq c$ iff $d \leq \mathrm{required-depth}(s, c)$. The toolkit's bounded traversal *is* Lambek's residuation, instantiated on the substrate's predication graph.

## Lawvere solves the *quantifier* problem

What happens to a predicate when its argument-place is filled with a bound variable rather than a name? Pre-Lawvere, this was handled syntactically — quantifiers were operators on formulas, taking variables as arguments, with substitution rules for variable elimination. The semantic content of "for all $x$, $P(x)$" was treated as derived from the syntactic structure.

Lawvere (1969, 1970) recognised that quantification is *adjunction*. The substitution functor $f^*: \mathrm{Pred}(B) \to \mathrm{Pred}(A)$ for a base morphism $f: A \to B$ has left and right adjoints $\exists_f \dashv f^* \dashv \forall_f$, and these adjoints *are* the existential and universal quantifiers along $f$. Quantification became algebra rather than syntax.

The FARS toolkit's `fars query` verb (with its 18 read-only graph-and-EAVT subcommands) is the substrate's quantifier surface. Existential queries (`fars query exists ...`) are $\exists_f$; universal queries are $\forall_f$; substitution-along-morphism queries (`fars query along <morphism> ...`) are $f^*$. The toolkit's query language is Lawvere's adjoint quantifier algebra in working form.

## Belnap solves the *multi-source disagreement* problem

Pre-Belnap, knowledge bases that received information from multiple sources had three options when sources disagreed: pick one (lose information), reject both (lose information differently), or trip a global inconsistency that propagates everywhere (lose all knowledge by ex falso quodlibet). None of the three is a logic.

Belnap (1977) gave the four-valued solution: $\bot$ (no source said anything), $t$ (some source affirmed, none denied), $f$ (some source denied, none affirmed), $\top$ (some source affirmed, some denied). The contestation is recorded explicitly rather than collapsed; the substrate that carries the contestation is the bilattice $\mathbf{2} \otimes \mathbf{2}$ with two independent orderings (truth and knowledge).

The FARS toolkit's `fars validate` verb runs the substrate's closure to fixpoint and reports cells with $\top$ values — explicit contestations — distinctly from cells with $f$ values (denied) or cells with $\bot$ values (silences). The validation surface is Belnap-aware: the toolkit does not collapse contestations into errors; it reports them as a substrate-level state requiring resolution.

## Fitting solves the *fixpoint semantics for bilattice* problem

Datalog over $\mathbf{2}$ has Apt-Van Emden-Kowalski fixpoint semantics: the program's intended model is the least fixpoint of the immediate-consequence operator, monotone in the standard ordering. For bilattice-valued logic programs, what is the analogous fixpoint?

Fitting (1991) gave the answer: the immediate-consequence operator is monotone in the *knowledge order* $\leq_k$, and the least fixpoint in $\leq_k$ is the program's intended model. The construction is a direct generalisation of the Boolean case; the bilattice's $\leq_k$ ordering is what makes it work.

The FARS toolkit's settlement discipline runs Fitting's fixpoint semantics on the substrate. Each `fars validate` invocation computes the substrate's $\leq_k$-least fixpoint of the closure-rule system applied to the corpus content. The toolkit terminates when the fixpoint is reached; the regime of the closure-rule system (per the [four-regime classification](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md)) determines whether termination is in finite time, $\omega$ time, or longer.

## Busaniche-Cignoli solves the *bilattice residuation* problem

Belnap and Fitting had the four values and the fixpoint, but the bilattice as a *residuated* algebra was not yet established. Busaniche & Cignoli (2014) proved that the twist product $L \otimes L$ of any commutative residuated lattice $L$ inherits a residuated pair $\odot \dashv \Rightarrow$ extending the standard residuation. Instantiated on $L = \mathbf{2}$, the construction gives explicit operations on $\{\bot, t, f, \top\}$.

The FARS toolkit's substrate operations include cell-level *extension* (combining evidence from multiple sources, $\odot$) and *restriction* (testing whether one cell's evidence implies another's, $\Rightarrow$). These are the substrate-level realisations of Busaniche-Cignoli's residuation; the toolkit exposes them as the algebra by which the substrate's content is composed and decomposed.

## Maruyama solves the *unification* problem

The line had eight contributions by 2021 — Frege's predicate, Lambek's residuation, Lawvere's adjoint quantifiers, Belnap's four values, Fitting's fixpoint, Busaniche-Cignoli's residuation, Jakl's Chu-construction identification, and the bilattice-valued allegory of Freyd-Scedrov. They had not been unified into a single mathematical structure for arbitrary non-classical first-order logics. Maruyama (2021) gave the unification: the *fibered algebraic semantics* — a fiber functor from a syntactic category to a category of algebras, instantiated on the bilattice value-domain over the predicate category.

The FARS toolkit's substrate is Maruyama's fibered algebraic semantics in working form: the predicate category $\mathcal{C}$ is the syntactic category, the bilattice fiber algebras $A_p$ are the algebra category, the predication-fibration is the fiber functor, and the closure-rule system is the dynamic that settles the fibers. The toolkit operates at every layer of the fibration: it asserts cells, runs closure, computes substitution along morphisms, projects sub-fibrations, federates across scopes.

## What FARS adds to the line

The line did not produce a working knowledge system; it produced the mathematical substrate that a working knowledge system can run on. The FARS toolkit (and the broader [predicated-computing](../../../../../../../engineering/theories/tech/theories/computing/theories/predicated-computing/) discipline) is the engineering surface that makes the substrate operational:

- **The substrate's content is a directory of frontmatter-markdown notes**, not an opaque database. Every substrate cell is a named cross-reference in a note's frontmatter or body. Every substrate operation has a corresponding command-line verb. The substrate is *legible*.
- **The substrate's discipline is checkable**. `fars validate` runs the closure to fixpoint and reports violations; `fars check` does the same on a single file. The substrate's invariants are not aspirational; they are tested.
- **The substrate's content is composable**. `fars compose` extracts a sub-fiber and renders it as a monograph. The substrate's monograph view is just a projection of substrate content; no separate publication pipeline is required.
- **The substrate's social discipline is operational**. Scopes are directories; communities are scope-owners; federation is cross-directory cross-reference resolution. The substrate's social commitments (per [process-ontology-and-situated-learning](../texts/process-ontology-and-situated-learning.md)) are made into engineering surface.

The line from Frege to FARS is not eight independent steps; it is one accumulating structural commitment, with each step *required* by the next. The FARS toolkit is what the line accumulates into when given a substrate to run on. The predicated-knowledge-systems subtheory is the named theory of why the accumulation lands here.
