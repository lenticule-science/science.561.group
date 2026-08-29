---
title: "Chu Spaces over FOUR"
description: "Chu spaces valued in the Belnap–Ginsberg four-valued bilattice, with Chu transforms as adjoint pairs making them a category Chu(FOUR), a transpose-and-negate duality, and knowledge-join settling — the kernel-backed lift of carriers prototyped in swarm (EAVT memory, office tables, readiness)."
date-created: 2026-06-11
status: draft
type: term-record
keywords: ["chu-spaces", "four-valued-logic", "belnap-logic", "bilattice", "category-theory", "linear-logic", "star-autonomous-categories", "knowledge-order", "truth-order", "open-world-assumption", "formal-concept-analysis"]
msc-id: [18M10, 18B99, 03B50, 03B47, 06B99]
depends-on: [bilattice]
introduces: [chu-space, chu-transform, chu-four-category, chu-duality, positive-extension, absent-default, line-settling]
sources:
  - triage/2026/06/06/math-core/chu/README.md
  - triage/2026/06/06/math-core/chu/src/four.mjs
  - triage/2026/06/06/math-core/chu/src/chu.mjs
  - triage/2026/06/06/math-core/chu/src/chu-transform.mjs
  - triage/2026/06/06/math-core/chu/src/index.mjs
  - triage/2026/06/06/math-core/chu/src/index.d.ts
  - triage/2026/06/06/math-core/chu/CHANGELOG.md
  - triage/2026/06/06/math-core/chu/test/four.test.mjs
  - triage/2026/06/06/math-core/chu/test/chu.test.mjs
  - triage/2026/06/06/math-core/chu/test/chu-transform.test.mjs
  - triage/2026/06/06/math-core/README.md
  - triage/2026/06/06/math-core/bilattice/README.md
  - triage/2026/06/06/apps/tools/swarm/src/chu.mjs
  - triage/2026/06/06/apps/tools/swarm/src/chu-transform.mjs
  - triage/2026/06/06/apps/tools/swarm/src/eavt-chu.mjs
---

## Definition

A **Chu space over FOUR** is, per the source, "a relation `r : A × X → K` valued in an alphabet `K`, presented as a carrier you can read two ways (rows and columns) and dualize," where `K` is **FOUR**, the Belnap–Ginsberg four-valued bilattice $\{t, f, \bot, \top\}$ (`triage/2026/06/06/math-core/chu/README.md:5-7`; `src/chu.mjs:3-7`). Concretely:

- **Objects.** $C = (A, r, X)$: a finite list of named **points** $A$ (rows), a finite list of named **states** $X$ (columns), and a total cell-read $r(a, x) \in$ FOUR. Cells outside the matrix read as a per-space `absent` default — `f` by default (closed-world: "absence is the negative charge") or $\bot$ on request (open-world: "absence is unwitnessed," as in EAVT memory) (`src/chu.mjs:24-59`; `test/chu.test.mjs:31-42`).

- **The alphabet.** A FOUR value is a *reading* of the bilattice floor's charge coordinate `value = [believesTrue, believesFalse]`:
  - `t = [true, false]` (true only), `f = [false, true]` (false only),
  - `bot = [false, false]` ($\bot$, "neither — no evidence"), `top = [true, true]` ($\top$, "both — contradiction")
  (`src/four.mjs:10-11`). Two σ-dual orders run on the pair: knowledge $\le_k$ ("how determined") and truth $\le_t$ ("which way"), each with a join and a meet, plus two involutions — `negate` (swaps $t \leftrightarrow f$) and `conflate` (swaps $\bot \leftrightarrow \top$), called "the Klein gauge" (`src/four.mjs:13-16, 95-109`). Every operation delegates to a kernel morphism in `@561-group/math/bilattice/charge`; the module "re-derives NOTHING" (`src/four.mjs:3-8`).

- **Morphisms (Chu transforms).** A morphism $C = (A, r, X) \to D = (B, s, Y)$ is an **adjoint pair** $(f, g)$ with $f : A \to B$ forward on points (covariant) and $g : Y \to X$ backward on states (contravariant), satisfying the single adjointness law
  $$s(f\,a,\ y) = r(a,\ g\,y) \quad \text{for all } a \in A,\ y \in Y$$
  (`src/chu-transform.mjs:2-12`). Note the law is stated and checked as an **equality** in FOUR, not an inequality in either order.

- **Duality.** The dual of a space is "transpose AND negate every cell": $C^\perp = (X, \lnot r^\top, A)$, with the `absent` default also negated so the round-trip is exact off the matrix (`src/chu.mjs:98-108`). The source asserts this is "exactly linear-logic / *-autonomous negation" over the self-dual alphabet FOUR (`src/chu.mjs:6-7`) — see Open questions; the standard Chu-construction dual is plain transpose, and the package's variant composes transpose with the alphabet involution. The dual of a transform $(f, g) : C \to D$ is the same pair swapped, $(g, f) : D^\perp \to C^\perp$ (`src/chu-transform.mjs:126-134`).

The definitions are stable and unambiguous within this snapshot. One interpretive variance across sibling snapshots is flagged under Settledness: the same coordinate pair carries Belnap names here (`bot` = "no evidence") but regime names on the bilattice floor (`[F,F]` = "absurd", `[T,F]` = "potential", `[F,T]` = "active", `[T,T]` = "stable"; `triage/2026/06/06/math-core/bilattice/README.md`). The algebra is identical; the readings differ.

## Motivation

The package exists for de-duplication and unification. Two pressures are documented:

1. **~20 hand-rolled copies of FOUR.** "This package exists because ~20 copies of this bilattice were hand-rolled across the repo, each re-deriving the same four-valued logic inline" (`src/four.mjs:3-4`). The fix is to make FOUR a *reading* of the already-settled bilattice kernel — "FOUR is the floor's algebra wearing Belnap's names" — adding only naming and the charge⇄name codec (`src/four.mjs:5-8`; `README.md:19-24`).

2. **Many carriers, one shape.** Several structures in the owner's program are literally relations $A \times X \to$ FOUR and were each implemented separately in the swarm prototype (`README.md:8-17`):

   | Chu space | points $A$ | states $X$ | value |
   | --- | --- | --- | --- |
   | EAVT memory | Entity | ⟨Predicate, Object⟩ | charge |
   | an office table | Office | Capability | holds |
   | readiness | Work | Check | FOUR |

   The payoff of the Chu presentation is stated most sharply in the EAVT instance: a row (one subject's costate) is what the memory's `read` already returns for free, but a **column** (which subjects assert a proposition) "is the transpose — the read TTMS does NOT give you, and the reason making the memory a Chu space pays off" (`apps/tools/swarm/src/eavt-chu.mjs:11-15`).

3. **Governed views.** The backward leg of a Chu transform is "the whole point: a view pushes points forward but pulls observations back, and the law says 'what D sees of the moved point equals what C saw through the pulled-back observation' — a governed view, with no information invented at the seam" (`src/chu-transform.mjs:9-12`). The intended instance is the office ↪ EAVT-memory view (`apps/tools/swarm/src/chu-transform.mjs:7-8`).

## Formal content

### The alphabet (`src/four.mjs`, spec in `test/four.test.mjs`)

Exports: `FOUR`, `GLYPH`, `isFour`, `asFour`, `toCharge`, `fromCharge`, `negate`, `conflate`, `knowledgeJoin`, `knowledgeMeet`, `truthJoin`, `truthMeet`.

- Charge codec: `toCharge` lifts a name to an evidence-free kernel charge `{ value: bits, evidence: [[],[]] }`; `fromCharge` is "`present()`'s projection" — the value bits, discarding evidence (`src/four.mjs:69-87`). Round-trips on all four values (`test/four.test.mjs:39-41`).
- Each binary operation is a kernel charge-morphism read on the evidence-free fiber, via `lift1`/`lift2` (`src/four.mjs:89-93`).
- **Laws, tested exhaustively** (the 4-element domain makes "exhaustive over all values" the property test, no sampling gap — `test/four.test.mjs:17`):
  - Each of ⊕, ⊗, ∨, ∧ is commutative, associative, idempotent, with identities $\bot$, $\top$, $f$, $t$ respectively (`test/four.test.mjs:22-31, 68-71`).
  - `negate` and `conflate` are involutions fixing $\{\bot,\top\}$ and $\{t,f\}$ respectively (`test/four.test.mjs:48-62`), and they commute — "the Klein gauge" (`test/four.test.mjs:64-66`).
  - De Morgan both ways: $\lnot(a \vee b) = \lnot a \wedge \lnot b$, and `conflate` carries ⊕ to ⊗ (`test/four.test.mjs:80-90`).
  - Characteristic Belnap values pin the tables: $t \oplus f = \top$ ("told both"), $t \otimes f = \bot$ ("told neither"), $t \vee f = t$, $t \wedge f = f$ (`test/four.test.mjs:73-78`).

### The spaces (`src/chu.mjs`, spec in `test/chu.test.mjs`)

Exports: `chuSpace`, `fromMatrix`, `isChuSpace`, `row`, `col`, `extension`, `transpose`, `dual`, `settleColumn`, `settleRow`.

- `chuSpace(points, states, valueAt, { absent })` freezes points/states in order (deterministic reads) and totalizes the relation by the `absent` default (`src/chu.mjs:43-59`); `fromMatrix` is the explicit-matrix special case (`src/chu.mjs:69-71`).
- The two reads: `row(space, point)` is a point's **costate** ("what this point asserts across states"); `col(space, state)` is a state's extension-with-values (`src/chu.mjs:73-82`). `extension(space, state)` is the **positive extension**: the points whose value is exactly `t` (`src/chu.mjs:84-87`; $\top$ does *not* count — see Open questions).
- `transpose` swaps points and states; `transpose ∘ transpose = id` (`src/chu.mjs:94-96`; `test/chu.test.mjs:62-70`).
- `dual` = transpose + `negate` on every cell and on `absent`; since both transpose and `negate` are involutions, `dual ∘ dual = id` (`src/chu.mjs:98-108`; `test/chu.test.mjs:72-78`).
- `settleColumn` / `settleRow` fold a line to one FOUR value through a bilattice join, defaulting to knowledge-join ⊕ with identity $\bot$; "any associative/commutative FOUR operation may be supplied with its identity" (`src/chu.mjs:110-130`). Tested: a column holding $t$ and $f$ settles to $\top$ (`test/chu.test.mjs:80-85`).

### The category Chu(FOUR) (`src/chu-transform.mjs`, spec in `test/chu-transform.test.mjs`)

Exports: `checkChuTransform`, `chuTransform`, `isChuTransform`, `idTransform`, `composeTransforms`, `dualTransform`.

- `checkChuTransform(source, target, forward, backward)` verifies (i) both legs stay in their carriers and (ii) the adjointness law on every $(a, y)$ cell, returning every failing cell (`src/chu-transform.mjs:38-69`). `chuTransform` **throws** on a non-adjoint pair — "building a non-morphism is a category error" (`src/chu-transform.mjs:72-92`; `test/chu-transform.test.mjs:41-44`).
- `idTransform`: both legs identity, trivially adjoint (`src/chu-transform.mjs:99-105`).
- `composeTransforms(t1, t2)`: points run forward $f_2 \circ f_1$; states pull back in the **opposite** order $g_1 \circ g_2$ — "the state leg's contravariance is what makes the composite well-typed." Adjointness is re-checked on composition, and a source/target mismatch throws (`src/chu-transform.mjs:107-123`; `test/chu-transform.test.mjs:61-73`).
- `dualTransform`: $(f, g) : C \to D$ dualizes to $(g, f) : D^\perp \to C^\perp$; applying it twice recovers the original legs, and the double-dual space agrees cell-for-cell with the original (a fresh object with equal values, not the same reference) (`src/chu-transform.mjs:126-134`; `test/chu-transform.test.mjs:75-86`). The construction routes through `chuTransform`, so the dual pair's adjointness is checked, not assumed.

What is **not** present: no tensor product of spaces, no internal hom, no par — the *-autonomous structure is invoked in comments ("the dual functor falls straight out of *-autonomy," `src/chu-transform.mjs:12-13`) but only the dual functor itself is constructed. Composition associativity and identity laws of the category are not explicitly tested (associativity is function composition, but no test asserts it).

## Relations

- **Downward: the bilattice floor.** Every FOUR operation is a morphism of `@561-group/math/bilattice` applied to the charge coordinate (`README.md:19-21`; `src/four.mjs:18-26`). FOUR is the evidence-free fiber of the floor's charge `{ value, evidence }`; `fromCharge` deliberately discards the lossless evidence carrier (`src/four.mjs:82-87`). The EAVT instance keeps the full charge and projects to FOUR only when a bilattice-named reading is wanted (`apps/tools/swarm/src/eavt-chu.mjs:16-20`).
- **Upward: swarm's carriers.** The swarm snapshot at the same date has already been *rebased onto* this package — its `src/chu.mjs` and `src/chu-transform.mjs` are now pure re-exports of `@561-group/math/chu`, with the domain instances (office tables, readiness, EAVT memory) staying in swarm (`apps/tools/swarm/src/chu.mjs:1-13`, `apps/tools/swarm/src/chu-transform.mjs:1-9`).
- **Siblings in the math package.** `math-core/README.md` places `chu` beside `bilattice`, `closure` (closure ordinals and fixed-point iteration), `obstruction` (temporal firing cohomology of settlings), `verdier`, `dframe`, etc. The `settleColumn`/`settleRow` fold through ⊕ is the same knowledge-monotone settling move that the closure construct iterates to fixpoint; the existing archive note "What Closure Does to the Bilattice" (`topical-archive/science/mathematics/algebra/archive/algebra-prose-teaching-explanations-what-closure-does-to-the-bilattice.md`) analyzes the post-closure shape of the same FOUR. (Direct code dependence of `closure` or `obstruction` on `chu` is not evidenced in these files — (uncertain).)
- **Classical anchors.** The README links Chu spaces to the standard literature; over the two-element alphabet, Chu spaces are formal contexts (formal concept analysis), and the `extension` read here is the FCA extent specialized to the positive value — that bridge is implicit, not stated in the sources (uncertain as the owner's intent).

## Settledness

**Settled mathematics, evolving packaging.** Evidence:

- This is the *third* generation of the construct: ~20 inline hand-rollings → swarm's prototype (`src/chu.mjs`, `src/chu-transform.mjs`, `src/eavt-chu.mjs`) → this kernel-backed package; and the consumer has already been migrated, with swarm re-exporting the kernel rather than carrying its own copy (`CHANGELOG.md:21-22`; `apps/tools/swarm/src/chu.mjs:5-8`). A construct whose prototype host has already been rebased onto it is past the exploratory stage.
- The test suites are exhaustive law tests over the whole 4-element alphabet (semilattice laws, involutions, Klein commutation, de Morgan, both Chu involutions, adjointness acceptance and rejection, composition typing, the dual functor) — specifications, not smoke tests.
- Counter-evidence on the packaging side: version `0.0.1 — unreleased` (`CHANGELOG.md:7`), no license ("the repo declares no top-level license yet," `README.md:99-100`), and the *-autonomous claims live in comments rather than constructed structure.
- One cross-snapshot reading shift, same date: the bilattice floor names the four regimes absurd/potential/active/stable, with `[T,F]` glossed "has-potential, not active" and `[F,T]` "engaged" (`bilattice/README.md`), while this package names the same coordinates with Belnap's t/f/⊥/⊤, glossing `[true,false]` as "true only." The chu README is explicit that this is deliberate layering — "the floor's charge algebra wearing Belnap's names" — not a conflict, but the two semantic vocabularies coexist in the corpus and a reader can be misled if they assume one canonical reading.

## Open questions

1. **Is the negating dual "exactly" *-autonomous negation?** The standard Chu-construction dual of $(A, r, X)$ is the plain transpose $(X, \breve r, A)$; this package's `dual` additionally applies the alphabet involution `negate` to every cell (`src/chu.mjs:98-108`). The source asserts the composite "is exactly linear-logic / *-autonomous negation" over the self-dual alphabet (`src/chu.mjs:6-7`), but no tensor, par, or internal hom is constructed and no test exercises *-autonomy beyond `dual² = id` and the dual functor on morphisms. Whether the negating dual yields a category equivalent to (or deliberately different from) standard Chu(**Set**, FOUR) is unargued in the sources. (uncertain)
2. **Why `negate` and not `conflate` (or both) in the dual?** FOUR carries two involutions; the dual privileges the truth involution. No source discusses the `conflate`-dual or the composite. (uncertain whether this is a considered choice or just the linear-logic default.)
3. **Should $\top$ belong to a state's extension?** `extension` takes only cells valued exactly `t` (`src/chu.mjs:84-87`). Over FOUR, a point valued $\top$ ("told both") also positively asserts the state; the closed choice is undocumented.
4. **Strictness of the adjointness law.** The law is checked as equality in FOUR. Lax/oplax variants (inequality in $\le_k$ or $\le_t$), which would matter for views that *lose* but never *invent* information, are not considered.
5. **Mixing absence conventions.** A transform between a closed-world space (`absent = f`) and an open-world one (`absent = ⊥`) is well-defined cell-wise, but nothing addresses whether the adjointness law is the right seam condition across differing absence semantics.
6. **Category laws.** Associativity of `composeTransforms` and the unit laws are not tested; transform equality (extensional, on legs) is undefined, so the category is presented operationally rather than verified as a category.
7. **Finitary, string-named carriers only.** Points and states are frozen string lists; no account of infinite or structured carriers (the EAVT instance string-encodes its ⟨predicate, object⟩ columns via a canonical key, `apps/tools/swarm/src/eavt-chu.mjs:33-36`).

## Proposed home

`topical-archive/science/mathematics/category-theory/library/chu-construction/`

The construct's content — objects-with-duality, adjoint-pair morphisms, the dual functor, and the (claimed) *-autonomous structure — is category theory first, with the four-valued alphabet imported from the bilattice work already housed under `algebra`; `category-theory` exists in the taxonomy and the recursive topic/library/topic shape puts the new subtopic under its `library`. (Secondary cross-reference candidates: `order-theory/formal-concept-analysis` for the extension/extent bridge, and `mathematical-logic/many-valued-logic` for FOUR itself.)
