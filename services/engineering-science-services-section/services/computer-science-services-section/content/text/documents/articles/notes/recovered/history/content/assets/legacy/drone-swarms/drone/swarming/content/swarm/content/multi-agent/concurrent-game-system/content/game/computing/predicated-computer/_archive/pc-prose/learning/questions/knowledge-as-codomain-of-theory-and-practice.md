---
name: knowledge as codomain of theory and practice
description: Whether knowledge is the codomain of a morphism in the predication category whose domain is built from theory and practice — and, subordinately, whether theory is the structure of *knowing* (the well-derived, proof-side content per Curry-Howard / Lambek-Scott) while practice is the structure of *falsehood* (the bigraded-diamond / inductive-paradox side that exhibits $\mathbf{f}$ and $\top$ in the bilattice fiber), with truth arising as the codomain-content their joint action produces.
status: open
---

# Is knowledge the codomain of a morphism $\mathrm{Theory} \otimes \mathrm{Practice} \to \mathrm{Knowledge}$?

**Question.** Does the predication category carry a morphism whose codomain is *knowledge* and whose domain is composed from a *theory* object and a *practice* object — and, if so, is the substantive shape of the conjecture that **theory is the structure of *knowing*** (the well-derived, proof-side content per Curry-Howard / Lambek-Scott) while **practice is the structure of *falsehood*** (the side that lives at the level of the bigraded diamond and the inductive paradox, exhibiting $\mathbf{f}$ and $\top$ in the bilattice fiber), with **truth** arising as the codomain-content their joint action produces?

## What is established

- **Theory is a structure in the polity's vocabulary.** [`concepts/theory.md`](../../teaching/explanations/theory.md) presents a theory as $T = (\Sigma, A, R)$ — signature, axioms, derivation calculus — whose theorems are the types $B$ for which $\vdash t : B$ is derivable from $A$ under $R$. Under Curry-Howard, propositions $\leftrightarrow$ types and proofs $\leftrightarrow$ terms; under Lambek-Scott, the theory *is* a category whose objects are types and whose morphisms are derivable terms. This is the proof-side, "knowing" content.

- **The bilattice has two orthogonal orders.** [`code/structures/bilattice.md`](../../../code/structures/bilattice.md) gives $\mathbf{FOUR} = \{\mathbf{t}, \mathbf{f}, \bot, \top\}$ with truth-order $\leq_t$ and knowledge-order $\leq_k$ transversal: cells move in $\leq_k$ as evidence accretes, and "right/left" in $\leq_t$ depending which side evidence weighs. The orders are independent. $\mathbf{f}$ is a settled value with the same standing as $\mathbf{t}$, not a failure.

- **Predication cells carry bilattice values, not Boolean values.** [`code/structures/predication-cell.md`](../../../code/structures/predication-cell.md): the value of cell $(s, p, o)$ lives in the predication fiber algebra $A_p$ as a bilattice value. Gaps ($\bot$) and contradictions ($\top$) are first-class.

- **The predicate category $\mathbf{C}$ provides the morphism vocabulary.** [`code/structures/predicate-category.md`](../../../code/structures/predicate-category.md) names four generator classes (specialization, converse, subject-projection, object-projection) and the predication fiber functor $F : \mathbf{C}^{\mathrm{op}} \to \mathbf{DBiLat}(L)$ that licenses reindexing.

- **A Level-3 bigraded diamond is conjectured.** [`doing/working/hacking/doing/working/planning/library/task/library/theory-quality/level-3-tower-conjecture-grounding.md`](../../../doing/working/hacking/doing/working/planning/library/task/library/theory-quality/level-3-tower-conjecture-grounding.md) names a bigraded diamond whose shadow is $\{\eta_{\mathbb{M}}, \mu_{\mathbb{M}}, \varepsilon_{\mathbb{N}}, \delta_{\mathbb{N}}\}$ — the four canonical 2-cells of the $\mathbb{M} \dashv \mathbb{N}$ 2-adjunction — with two involutions: $\iota_k^{(3)}$ (adjoint-swap, monad $\leftrightarrow$ comonad) and $\iota_t^{(3)}$ (unit/mult-swap, first-order $\leftrightarrow$ second-order). The two-axis ($k$, $t$) bigrading is structurally parallel to the bilattice's two-axis grading.

- **The inductive paradox generates the witnessing cycle.** Emsenn's foundational log (`old-archive/triage/engineering-archive/operations/command/personnel/emsenn/logs/2026-03-28-1016h.md`) characterizes the substrate's primitive paradox: relationlessness cannot hold to its own constraints, and the entire system is excited around *witnessing that failure*. The cycle Absurd → Possible → Necessary → Determined never grounds on a base "true/false"; every Determination is structured on a prior Absurdity, and falsifying-rupture is what feeds new Absurdity back in.

## What remains open

This question raises three subordinate conjectures, each open:

### (1) Practice is not yet a structure

`code/structures/` contains `theory.md`-adjacent vocabulary (signature, axiom, derivation, transformer), but **does not contain a `practice.md` defining practice as a formal structure with signature and invariants**. The conjecture supposes such a structure exists and is the formal dual to `theory` — the witnessing-of-failure side of the inductive-paradox cycle, as opposed to theory's derivation-side. Specifying this structure is prerequisite: what is its signature, what fiber does it live over, what morphisms does it admit?

### (2) Knowledge is not yet a structure

Likewise, `code/structures/` contains no `knowledge.md`. Knowledge appears in informal prose as the closure-direction of cell evolution (cells move up in $\leq_k$ toward more information), but is not itself an object with signature and invariants. The conjecture treats knowledge as a *codomain* — which presupposes it is an object in some predication category. Specifying knowledge's structure is the second prerequisite.

### (3) The morphism's shape

If theory and practice are objects $T$ and $P$, the question's "takes in theory and practice" admits multiple realizations:

- **Product**: $f : T \times P \to K$ in a category with finite products — the simplest reading.
- **Span / pushout**: $T \leftarrow X \to P$ with $K$ as colimit — knowledge as the universal object reconciling theory's derivation with practice's falsifying-rupture.
- **2-cell**: $T$ and $P$ as 1-cells, $K$ as the 2-cell composite — putting the question in the same Level-2/Level-3 stratum as the bigraded diamond.
- **Adjoint pair**: $T \dashv P$ (or $P \dashv T$) with $K$ as the unit or counit — making theory and practice formally dual in the same sense the bigraded diamond's $\mathbb{M} \dashv \mathbb{N}$ has $\iota_k$ as adjoint-swap.

The fourth option is the one that *most strongly* couples this question to the existing Level-3 tower conjecture: if $T$ and $P$ are adjoint, then $\iota_k$ is the theory/practice swap and $\iota_t$ is the knowing/falsifying-truth swap, and the bigraded diamond's two axes *are* the two axes of the bilattice — knowledge-order along $\iota_k$, truth-order along $\iota_t$. This is a strong identification that would need its own grounding.

### (4) Truth as the codomain's content, not as a value

The bilattice's $\mathbf{t}$ is a value in a fiber algebra, not an object in the predication category. "Truth arising as what the morphism produces" therefore needs a careful reading: either (a) knowledge $K$ is the object whose fiber algebra is the $\mathbf{t}$-saturated sub-bilattice — knowledge is the *carrier* of truth, not truth itself; or (b) the conjecture is at a higher categorical level where truth is a 2-cell or natural transformation between theory's and practice's evaluations, with the morphism's codomain being the structure on which that transformation lives.

## What an answer would look like

A satisfactory answer would:

- Define `practice` as a structure in `code/structures/`, with signature, invariants, and predication-fiber semantics that make precise the "structure of falsehood" reading — including the relationship to $\mathbf{f}$ as the bilattice value, to $\top$ (held contradiction) as the loci where practice's witnessing-of-failure is operative, and to the inductive paradox's Absurd $\to$ Possible $\to$ Necessary $\to$ Determined cycle.
- Define `knowledge` as a structure in `code/structures/`, with signature and invariants, and identify which categorical role it plays (product object, colimit, 2-cell composite, adjoint unit, etc.).
- Specify the morphism $f$ and verify it lives in the predication category — including its action on fibers under $F : \mathbf{C}^{\mathrm{op}} \to \mathbf{DBiLat}(L)$.
- Either ratify or refute the strong identification (3) above between the bigraded diamond's $(\iota_k, \iota_t)$ axes and the bilattice's $(\leq_k, \leq_t)$ axes. If ratified, the level-3 tower conjecture and this question collapse into a single structural identification; if refuted, the two are adjacent but distinct.
- Specify the sense in which truth "arises" — value-level (carrier-of-$\mathbf{t}$ reading) or higher-categorical (2-cell / natural-transformation reading).

## Why this matters downstream

- **It would close the polity's biggest authored gap.** The polity has theory well-derived but has not formalized practice. If practice is structurally the falsehood-side of the inductive paradox, the asymmetry is not an oversight; it is a *predictable* consequence of the substrate having developed its proof-side faster than its falsifying-side. Naming this clarifies what "developing practice" would actually mean: not "doing things" colloquially, but constructing the formal dual to theory.
- **It would unify the bilattice's two-axis structure with the bigraded diamond's two-axis structure.** Both are two-axis in shape; whether they are the *same* two axes (under some functor or identification) is a structural question whose resolution would tighten the corpus considerably.
- **It would give a categorical reading of *wicozani*.** The substrate condition "no persistent $\top$ on relation-cells and no persistent $\bot$ where settlement is due" ([`code/structures/bilattice.md`](../../../code/structures/bilattice.md)) becomes a *codomain-saturation* condition on knowledge under the morphism: a polity is in wicozani iff its knowledge-codomain is $\mathbf{t}$-saturated relative to its theory-and-practice domain.
- **It would license cross-domain claims.** Multiple records in the substrate informally reason about "knowing" and "doing" without a structure-level account; this question's resolution would give those records something formal to compose against.

## Position

Recorded as an open frontier question at the intersection of the polity's theory-of-theory (well-derived), its theory-of-practice (not yet authored), and the open Level-3 bigraded-diamond tower conjecture. The conjecture's substantive content — that theory and practice are the two axes whose joint action produces knowledge-as-codomain, and that this is structurally the same two-axis-ness as the bilattice and the bigraded diamond — is the polity's own structural reading; whether it holds is the open question.
