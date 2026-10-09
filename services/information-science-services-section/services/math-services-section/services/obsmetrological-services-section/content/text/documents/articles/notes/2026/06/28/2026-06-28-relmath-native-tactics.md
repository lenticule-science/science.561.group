---
title: "Native Tactics for RelMath: Toward Practiceable Automation in a Dependency-Free Foundational Lean Library"
author:
  - Morgan Sennhauser
  - The 561 Group
date: 2026-06-28
abstract: "RelMath is not merely a Lean library with unusual subject matter. It is a dependency-free foundational mathematics project whose proof objects are organized around its own carriers, bundled algebraic structures, constructive quotient reals, four-valued charges, closure dynamics, and a derivation-stratum module spine. This paper audits the emerging tactic surface in sites/relationality.dev.emsenn.net/lean and asks which proof procedures are already practiceable, which are distinctive to this project, and where standard tactics such as simp, rw, omega, ring, linarith, grind, and aesop can be replaced or wrapped by RelMath-native tactics. The current built surface is small but important: iring, an Int polynomial normalizer used throughout the internal rational and real development, and cring, a reflective normalizer for RelMath's bundled CommRing, including internal rationals and Bishop reals. The larger opportunity is not to imitate mathlib's tactic ecosystem, but to derive local normalizers from RelMath's own mathematical strata: charge exhaustion, quotient descent, closure-settling flows, binder transport in the Curry-Howard-Lambek layer, finite certificate verification, and bundled algebra. The paper ends with a maturity-graded roadmap for turning recurring proof idioms into small, named, kernel-checked tactics without adding new axioms, new primitives, or a second ontology."date-created: 2026-06-28
description: The immediate tactic opportunity in RelMath is not a generic "more automation" program.
---

# 1. Claim

The immediate tactic opportunity in RelMath is not a generic "more automation" program.
It is a program of **native proof procedures**: tactics whose search space is cut down by the mathematical shape of RelMath itself.

The live Lean project at `sites/relationality.dev.emsenn.net/lean` is a dependency-free Lean 4 library.
Its `lakefile.toml` has no `[[require]]` dependencies and explicitly records the no-Mathlib mandate.
Its top-level library is built from Lean core, with `autoImplicit = false` and `relaxedAutoImplicit = false`.
This means that several familiar mathlib tactics and typeclass-driven automation habits are either unavailable, inappropriate, or too semantically broad for the project.

That constraint is not a deficit.
It forces proof automation to be closer to the kernel of the mathematics:

- algebraic normalization should know RelMath's bundled `CommRing`, not only typeclass rings;
- real-number algebra should know the internally built rationals and Bishop reals;
- finite four-valued reasoning should know `Charge`, not arbitrary booleans;
- closure proofs should know monotone settling, inflationary firing, and fixed points;
- quotient proofs should know the representative/equivalence pattern of `PreRat`, `Rat`, and `RReal`;
- language proofs should know the binder transport lemmas that recur in the Curry-Howard-Lambek development.

The resulting thesis is:

> RelMath should grow tactics from its derivation strata.
> Standard Lean tactics remain useful as leaf tools, but the practiceable frontier is to replace repeated `simp`/`rw`/`omega` scripts with small reflective or structural tactics whose correctness is expressed in RelMath's own theorem spine.

# 2. Evidence From The Live Tree

This audit used the checked-out project rooted at:

```text
sites/relationality.dev.emsenn.net/lean
```

The relevant files opened for this paper include:

- `lakefile.toml`
- `lean-toolchain`
- `lake-manifest.json`
- `RelMath.lean`
- `RelMath/Calculus/Algebra.lean`
- `RelMath/Calculus/Algebra/Ring.lean`
- `RelMath/Calculus/Algebra/RingTactic.lean`
- `RelMath/Calculus/Algebra/Instances.lean`
- `RelMath/Calculus/Real/Internal.lean`
- `RelMath/Calculus/Real/Multiplication.lean`
- `RelMath/Persistence/Aperiodic/StepN/MetallicReal.lean`
- `RelMath/Language/Predicating/CurryHowardLambek.lean`
- `RelMath/Closure/Collatz/ResidueGap.lean`
- `dev/content/researching/2026/06/28/lean_proofing_research_memo.md`

The project is Lean 4 `v4.31.0`, and `lake-manifest.json` lists no packages.
That matters because it sharply distinguishes RelMath-native automation from mathlib-oriented automation.
The library can use Lean core tactics that are available in this environment, but it does not inherit mathlib's algebraic hierarchy, simplifier database, `linarith`, `nlinarith`, `aesop`, or the usual mathlib `ring` tactic stack.

A direct token count over `RelMath/**/*.lean` gave the following rough usage profile:

| token | hits |
|---|---:|
| `rw` | 1682 |
| `simp` | 697 |
| `omega` | 566 |
| `iring` | 102 |
| `cring` | 9 |
| `ring` | 91 |
| `linarith` | 0 |
| `grind` | 0 |
| `nlinarith` | 0 |
| `aesop` | 0 |

These counts should be read as a smell map, not a formal metric.
They show that the library is already proof-engineered through rewriting and arithmetic, but that project-native tactics are concentrated in a few algebraic regions.
They also show that several standard tactics named in the prompt are not presently part of the RelMath proof surface.

The built project-native tactic surface found in the tree is:

| tactic | maturity | home | role |
|---|---|---|---|
| `iring` | Built+green | `RelMath/Calculus/Real/Internal.lean` | Dependency-free `Int` commutative-ring normalizer by `simp only` over integer AC/distributivity/negation/subtraction lemmas. |
| `cring` | Built+green | `RelMath/Calculus/Algebra/RingTactic.lean` | Reflective polynomial normalizer for RelMath's bundled `CommRing`, with explicit and inferred ring arguments. |

This is not yet a tactic zoo.
It is more interesting than that: the current automation is beginning exactly where the foundational project needs it most, at the algebraic seam between internal carriers and proof scripts.

# 3. What RelMath Has That Others Usually Do Not

It would be too strong to claim that no other Lean development has reflective ring tactics, quotient normalizers, or finite-domain decision procedures.
The distinctive point is narrower and more useful:

> RelMath has tactics over a nonstandard, dependency-free, internally derived mathematical substrate.

`cring` is the clearest current example.
Mathlib's `ring` tactic targets the usual typeclass algebraic hierarchy.
RelMath's `cring` targets the bundled structure:

```lean
structure CommRing extends Ring where
  mul_comm : forall a b, mul a b = mul b a
```

The bundled `CommRing` lives in `RelMath/Calculus/Algebra/Ring.lean`.
Instances are not typeclass instances in the mathlib sense; they are explicit bundled values such as:

- `RelMath.
  Algebra.intCommRing`
- `RelMath.
  Algebra.ratCommRing`
- `RelMath.
  Algebra.rrealCommRing`

That changes the shape of automation.
A tactic must infer or accept a bundled ring term, inspect the equality goal's carrier, quote expressions through the bundle's operations, and discharge equality by a theorem about a reflected normal form.
`RelMath/Calculus/Algebra/RingTactic.lean` does precisely this:

- defines `PolyExpr`;
- evaluates expressions into a bundled `CommRing`;
- defines a normal form `RingNF.
  NF`;
- proves soundness through `RingNF.eval_eq_of_normalize_eq`;
- quotes goal expressions using Lean metaprogramming;
- exposes `cring` and `cring R`;
- searches local bundled `CommRing` hypotheses and known ring constants.

The important novelty is not the word "ring".
The novelty is the target: RelMath's own algebraic tower, including its internal quotient rationals and Bishop-style reals.

`iring` is older and narrower, but it is also strategically important.
`RelMath/Calculus/Real/Internal.lean` defines it as a dependency-free integer ring normalizer:

```lean
macro "iring" : tactic =>
  `(tactic| simp only [Int.mul_comm, Int.mul_assoc, Int.mul_left_comm, ...])
```

Its role is visible in the real-number development.
`Real.
Internal` uses it heavily in the quotient construction of rationals and reals.
`Real.
Multiplication` describes several analytic foundation lemmas as "`iring`/`omega`-clean."
`Persistence/Aperiodic/StepN/MetallicReal.lean` says the Cassini determinant identity was "out of reach until `iring`" was in scope.

That sentence is the key signal.
Native tactics in RelMath are not just keystroke reducers.
They open proof neighborhoods that were otherwise too costly to inhabit.

# 4. Maturity Map

The maturity discipline for this paper is:

- **Built+green**: present in the opened Lean files and used by compiling proof scripts in the project.
- **Proven-in-Lean**: a named theorem exists in Lean.
  For tactics, the tactic itself is not a theorem, but its soundness core may be.
- **Research-grade**: a repeated proof idiom has enough structure to justify a tactic design, but the tactic does not yet exist.
- **Roadmap**: a named obligation or implementation direction, not yet built.

## 4.1 Built+green: `iring`

`iring` is a macro, not a reflective procedure.
It delegates to `simp only` with a curated list of `Int` lemmas:

- commutativity and associativity for addition and multiplication;
- left-commutativity lemmas;
- distributivity;
- negation multiplication;
- subtraction as addition of negation;
- zero and one laws;
- additive inverse laws.

It is practiceable today when a goal is an integer polynomial identity after unfolding definitions.
It often pairs with `omega` when a proof contains both a polynomial equality and a linear/natural side condition.

The current paper should not overstate `iring`.
It is not a general ring tactic.
It is an `Int` normalizer by simplification.
But it is already extensively used where RelMath's constructive rationals reduce to cross-multiplication over integers.
That makes it foundationally important.

## 4.2 Built+green / Proven-in-Lean core: `cring`

`cring` is the more important tactic design.
Its mathematical core is a reflective normalizer:

- expressions are quoted into `PolyExpr`;
- normal forms are lists of monomial/coefficient pairs;
- equality of normal forms is reduced to decidable equality;
- soundness is carried by Lean theorems over `CommRing`.

The opened file shows examples such as:

```lean
example (R : CommRing) (x y : R.carrier) :
    R.add x y = R.add y x := by
  cring R

example (R : CommRing) (x y z : R.carrier) :
    R.mul x (R.add y z) = R.add (R.mul x y) (R.mul x z) := by
  cring R
```

The tactic is practiceable in two modes:

- `cring R`, where the bundled ring is explicit;
- bare `cring`, where the tactic tries to infer a local `CommRing` or one of the known bundled constants.

The current built surface is modest: only a handful of direct `cring` uses were found.
But it is exactly the correct replacement direction for many future proofs that would otherwise use repeated algebraic `rw`, hand-written associativity/commutativity chains, or `iring` after projecting into `Int`.

## 4.3 Research-grade: `cring` as the successor of `iring`

The obvious next step is not to delete `iring`; existing callers should remain stable until the replacement is proven locally.
The research-grade direction is:

1. preserve `iring` as the established `Int` leaf normalizer;
2. use `cring intCommRing` to close new integer ring goals where the goal is already expressed through bundled operations;
3. add bridge lemmas or quoting support so ordinary `Int` notation can pass through `intCommRing` when desirable;
4. gradually migrate repeated `iring` clusters only after the local target builds.

The reason to be conservative is that `iring` works over ordinary `Int` notation, while `cring` is built around `CommRing` operations and carrier matching.
They overlap but are not identical surfaces.

# 5. Where Standard Tactics Should Be Replaced

The replacement question has to be handled carefully.
`simp`, `rw`, and `omega` are not mistakes.
They are the substrate on which many native tactics can be built.
The goal is to replace repeated proof regimes, not every individual call.

## 5.1 Replace `ring`-style algebra with `cring`

Maturity: Built+green for bundled commutative rings; Research-grade for broad migration.

The strongest built replacement is:

```lean
cring R
```

in place of hand-written algebraic rewrites over `CommRing`.
This should become the default for goals whose conclusion is an equality in a bundled commutative ring and whose terms are built from zero, one, addition, multiplication, negation, subtraction, numerals, and atoms.

Likely targets:

- `RelMath/Calculus/Algebra/Ring.lean`, where hand-written proofs of derived ring identities remain useful as trusted lemmas but future derived identities can be tactic-closed;
- `RelMath/Calculus/Algebra/Instances.lean`, where instance obligations can often reduce to algebraic equalities;
- `RelMath/Calculus/Real/Multiplication.lean`, where rational algebra already relies on `iring`;
- `RelMath/Persistence/Aperiodic/StepN/*.lean`, where metallic recurrences and determinant identities produce polynomial obligations.

For ordinary `Int` polynomial goals, `iring` is still the existing practiceable tool.
The eventual target is a clear law:

- use `iring` for raw `Int` normalization;
- use `cring` for RelMath bundled algebra;
- do not import mathlib `ring` to solve a local foundational problem.

## 5.2 Replace repeated `simp` over finite charges with a `charge` tactic

Maturity: Research-grade.

Many RelMath objects have a finite carrier whose proofs are routinely closed by case exhaustion and simplification:

```lean
cases c <;> simp [...]
cases p <;> cases n <;> simp [...]
```

The most obvious domain is the FOUR/Belnap charge layer: truth, falsity, knowledge bottom, and inconsistency top, together with the two orders, negation, join/meet operations, and designated masks.

A native tactic, tentatively:

```lean
charge
charge [defs]
```

would perform finite exhaustion over known charge-like carriers and normalize the operations whose tables are already part of RelMath.
It would replace repeated `cases ... <;> simp` scripts in:

- `RelMath/Language/Predicating/Equality.lean`
- `RelMath/Language/Positing/BigradedCohomology.lean`
- `RelMath/Calculus/Order/TwistProductResiduation.lean`
- `RelMath/Language/Positing/Gauge.lean`
- `RelMath/Language/Positing/D4Gauge.lean`

The tactic should not be a generic finite-domain brute force tool at first.
It should know the small set of RelMath carriers whose truth tables are part of the foundational spine.
That keeps it honest and auditable.

## 5.3 Replace long `rw` binder-transport scripts with a CHL transport tactic

Maturity: Research-grade.

`RelMath/Language/Predicating/CurryHowardLambek.lean` contains repeated proof patterns around:

- `rename_rename`;
- `rename_subst`;
- `subst_rename`;
- `subst_subst`;
- `upRen`;
- `upSub`;
- `ParSub.up`;
- binder cases for `lam`, `app`, `pair`, `fst`, `snd`.

The file is doing real mathematics: de Bruijn syntax, substitution, renaming, parallel reduction, and the Takahashi-style triangle needed for Church-Rosser/normalization behavior.
The recurring scripts are not arbitrary rewrites; they are functoriality and naturality proofs for syntax with binders.

A native tactic, tentatively:

```lean
chl
chl_transport
```

could target goals of the form:

- renaming composition;
- substitution composition;
- substitution under lifted binders;
- pointwise function equality produced by `funext`;
- structural congruence cases for `Tm`.

This tactic would replace parts of `rw [rename_subst, subst_rename]`, local `funext`, and repeated binder case splits.
It should be developed only after the core CHL lemmas are stable, because the tactic's job would be to package those lemmas, not rediscover them.

## 5.4 Replace closure/fixed-point `rw` scripts with a `settle` tactic

Maturity: Research-grade.

RelMath's closure and dynamics layers repeatedly prove facts of this form:

- an orbit step unfolds;
- a settled point is fixed;
- monotonicity carries a valuation forward;
- once a flow stops changing, it remains stopped;
- finite iteration reaches a fixed point;
- no non-Scott-continuous firing occurs under a smooth/omega-regime hypothesis.

The existing scripts often use combinations of `rw [orbit_succ]`, `rw [M.settle_fixed seed]`, exact monotonicity lemmas, and small case facts.
A native tactic, tentatively:

```lean
settle
settle [M, seed]
```

should not attempt arbitrary fixed-point reasoning.
It should cover the local RelMath shape:

1. unfold the named orbit/drive/tflow operation at the current stage;
2. rewrite known fixed-point hypotheses;
3. apply monotonicity and inflationary lemmas when the goal is an order inequality;
4. close definitional smooth/firing negations when they are exactly by definition.

Likely target files include:

- `RelMath/Dynamics/Flow/ClosureFlowDynamics.lean`
- `RelMath/Dynamics/Flow/TransfiniteClosureFlow.lean`
- `RelMath/Dynamics/Flow/NSCFiring.lean`
- `RelMath/Closure/RuleSystem.lean`
- `RelMath/Closure/Scott.lean`

The tactic would be RelMath-native because it depends on the library's own meaning of closure, settling, firing, smoothness, and omega-stage continuity.

## 5.5 Replace quotient boilerplate with a `quot`/`descend` tactic

Maturity: Research-grade.

The internal rationals and reals use quotients heavily.
In the opened real files, many proofs follow this pattern:

1. reduce a quotient statement by `Quotient.inductionOn` or `Quotient.inductionOn2`;
2. unfold representative operations;
3. show the operation respects the equivalence relation;
4. use `iring` and `omega` on the resulting integer obligations;
5. lift the representative result back to the quotient.

This suggests a tactic:

```lean
descend
descend with iring
```

or:

```lean
rat_descend
real_descend
```

The first version should be narrow: quotient descent for `PreRat`/`Rat` representative algebra.
It would not replace proof obligations; it would standardize the boilerplate of entering representative space and invoking the right local algebra normalizer.

Potential benefits:

- make `Real.
  Internal` less visually dominated by quotient mechanics;
- expose the real mathematical lemmas more clearly;
- make future `RReal` multiplication and order proofs easier to maintain;
- reduce the temptation to add classical shortcuts.

The danger is over-generalization.
A generic quotient tactic can become opaque.
RelMath should instead start with a named `Rat` descent tactic whose target equivalence relation is explicit.

## 5.6 Replace Presburger clusters with local arithmetic wrappers over `omega`

Maturity: Research-grade.

`omega` is heavily used and should not be removed.
But many `omega` calls occur inside domain-specific arithmetic regimes:

- Collatz parity, residues, powers of two, and branch words;
- finite list lengths and bounded indices;
- positive denominators and natural casts;
- finite matrix dimensions in StepN metallic mean files;
- spacetime incidence and past-count arguments;
- reaction-network conservation and support counts.

The replacement should be wrapper tactics that expose the domain facts before calling `omega`.

For Collatz:

```lean
collatz_omega
```

could normalize `branch`, `step`, parity facts, `Nat.pow_succ` for powers of two, and `dvd_sub_of_mod_eq` before delegating to `omega`.

For finite matrix/index proofs:

```lean
fin_omega
```

could normalize `Fin` cases, small index constructors, and matrix dimensions before using `omega`.

For rational denominator positivity:

```lean
denom_omega
```

could expose `den_pos`, positivity of products, and natural-cast facts.

These are not competitors to `omega`.
They are ways to make `omega` practiceable inside RelMath's repeated domains without hand-unfolding the same facts.

## 5.7 Avoid premature replacements for `grind`, `aesop`, and `linarith`

Maturity: Roadmap.

The audit found no `grind`, `aesop`, `linarith`, or `nlinarith` uses in `RelMath/**/*.lean`.
Therefore the project does not currently have a direct replacement problem for those tactics.

The correct conclusion is not "build our own `grind`."
That would be too broad.
The correct conclusion is:

- use small RelMath-native normalizers for the domains where the library already has structure;
- preserve Lean core tactics as leaf solvers;
- avoid importing a standard automation stack just to avoid designing the local proof procedure.

If a future proof genuinely needs congruence closure or search, the first native candidate should be a constrained search tactic over a curated set of RelMath lemmas, not a general-purpose clone of `aesop` or `grind`.

# 6. Practiceable Tactic Families

The following families are practiceable in the sense that each has a clear input shape, a local theorem spine, and a plausible first implementation that does not require new primitives.

## 6.1 `cring`: bundled commutative-ring normalization

Maturity: Built+green.

Current command:

```lean
cring
cring R
```

First-class targets:

- `CommRing` equalities;
- `intCommRing`, `ratCommRing`, `rrealCommRing`;
- polynomial equalities over `R.carrier`;
- distributivity/AC/negation/subtraction identities.

Development obligations:

- broaden ordinary notation support where safe;
- add examples for `intCommRing`, `ratField.toCommRing`, and `rrealCommRing` near the tactic or in a focused examples file;
- audit the `iring` overlap and migrate only when the goals are semantically bundled-ring goals.

## 6.2 `charge`: finite FOUR and gauge table normalization

Maturity: Research-grade.

Proposed command:

```lean
charge
charge [Charge.joinK, Charge.meetK, Charge.negate]
```

Input shape:

- goals over `Charge`;
- goals over `Gauge`, `D4Gauge`, or small FOUR-derived finite carriers;
- decidable propositions produced by truth/falsity/inconsistency masks;
- finite-table equalities.

Implementation strategy:

1. identify the finite carrier variables in the local context and target;
2. case split only those carriers;
3. unfold the curated finite operations;
4. close with `simp`/`decide`.

This would replace local finite exhaustion scripts while keeping the proof term kernel-checkable and small.

## 6.3 `descend`: quotient descent for internal rationals

Maturity: Research-grade.

Proposed command:

```lean
rat_descend
rat_descend <;> iring
```

Input shape:

- quotient statements over `Rat`;
- representative statements over `PreRat`;
- equivalence-respecting obligations for rational operations;
- cross-multiplication equalities over positive denominators.

Implementation strategy:

1. recognize `Rat` quotient goals;
2. apply the appropriate quotient induction principle;
3. unfold representative operations;
4. reduce equivalence goals to integer polynomial and order obligations;
5. call `iring` and `omega` only at the leaves.

This is one of the highest-value candidates because the real-number development has many obligations of exactly this shape.

## 6.4 `settle`: closure and flow normalization

Maturity: Research-grade.

Proposed command:

```lean
settle
settle [orbit_succ, drive_succ]
```

Input shape:

- closure orbit equalities;
- smooth/firing step negations;
- fixed-point rewrites;
- monotone/inflationary closure inequalities;
- omega-stage flow facts already named in the local theory.

Implementation strategy:

1. rewrite orbit/drive/tflow definitions at the relevant stage;
2. rewrite fixed-point hypotheses;
3. try named monotonicity/inflationary lemmas;
4. close definitional equivalences with `rfl`, `simp`, or a short local proof.

This tactic should be built after a survey of the closure/dynamics API, because its quality depends on choosing the right canonical lemmas.

## 6.5 `chl`: binder transport in the language layer

Maturity: Research-grade.

Proposed command:

```lean
chl
chl_transport
```

Input shape:

- `rename`/`subst` functoriality;
- `upRen`/`upSub` naturality;
- `Par` congruence through syntax constructors;
- pointwise function equalities in binder cases.

Implementation strategy:

1. inspect whether the goal is an equality of syntax terms or substitutions;
2. try the canonical transport lemmas;
3. use `funext` for pointwise function equality;
4. case split binder indices only where necessary;
5. close structural constructors by congruence and recursive hypotheses.

This would replace a large amount of repeated `rw` in the CHL file and would also give proofing agents a named handle for "do the binder transport step."

## 6.6 `cert`: finite certificate verification

Maturity: Roadmap.

RelMath has a strong finite-certificate research program around aperiodic tilings, marker cohomology, and small extracted witnesses.
The proof-agent memo from 2026-06-23 describes a pipeline where finite data should become proof-bearing certificates.

A future tactic:

```lean
cert
cert_json
```

is not immediate, because the first obligation is to formalize the certificate format and verifier.
Once that exists, the tactic can be a convenience layer for finite matrix/cochain verification.
Its trusted content should remain the Lean definitions and theorems, not the external search that found the certificate.

# 7. What Not To Do

## 7.1 Do not import a second ontology

The temptation is to solve automation by importing the standard ecosystem and using its tactics.
That would defeat the point for foundational RelMath layers.
The library's algebra, rationals, reals, charges, closure operators, and cohomological objects are not merely poor copies of standard objects.
They are the local derivation spine of the project.

Therefore a tactic that proves a theorem by translating the goal into an unrelated external hierarchy is suspect unless the translation itself is a named, proved bridge.

## 7.2 Do not make giant search tactics first

RelMath does not need a local `grind` clone as its first automation project.
The proof corpus is giving much clearer invitations:

- normalize bundled ring expressions;
- exhaust finite charges;
- descend quotient representatives;
- transport binders;
- settle closure orbits;
- discharge domain-specific arithmetic leaves.

Each of these can be small, named, auditable, and aligned with an existing mathematical layer.

## 7.3 Do not hide the proof architecture

A tactic is harmful if it erases the proof's mathematical skeleton.
The best RelMath tactics should expose the correct stratum:

- `cring` says "this is bundled algebra";
- `charge` would say "this is finite FOUR table reasoning";
- `descend` would say "this is quotient descent";
- `settle` would say "this is closure/fixed-point dynamics";
- `chl` would say "this is syntax-with-binders transport."

That is better than replacing everything with `simp` or a general search hammer, because the tactic name itself records the proof's mathematical mode.

# 8. Near-Term Implementation Plan

## Phase 1: Consolidate `cring`

Maturity: Built+green extension.

Tasks:

1. add a focused examples file under the calculus algebra stratum;
2. include `Int`, internal `Rat`, and `RReal` examples;
3. document the intended split between `iring` and `cring`;
4. run the cheap gates for the algebra stratum.

Acceptance criteria:

- examples compile;
- no new axioms or primitives;
- no Mathlib dependency;
- `RelMath.
  Calculus.
  Algebra` remains the import surface.

## Phase 2: Build `charge`

Maturity: Research-grade to Built+green.

Tasks:

1. survey finite FOUR/charge proof clusters;
2. identify the minimal curated operation set;
3. implement a first tactic that case-splits `Charge` variables and closes by `simp`/`decide`;
4. replace only a few high-signal examples.

Acceptance criteria:

- tactic closes existing proofs without increasing opacity;
- no broad finite brute force over arbitrary types;
- proof scripts become more semantically legible.

## Phase 3: Build `rat_descend`

Maturity: Research-grade to Built+green.

Tasks:

1. inventory quotient induction patterns in `Real.
  Internal` and `Real.
  Multiplication`;
2. implement a narrow tactic for `Rat` quotient descent;
3. preserve explicit representative lemmas where they are mathematical content;
4. replace boilerplate only where the proof shape is repeated.

Acceptance criteria:

- representative obligations are still visible when they matter;
- integer algebra leaves remain `iring`/`omega`-clean;
- no classical choice is introduced.

## Phase 4: Prototype `settle`

Maturity: Research-grade.

Tasks:

1. survey closure/dynamics lemmas and pick canonical rewrite handles;
2. implement a tactic that rewrites orbit/fixed-point forms and applies monotonicity;
3. test in `ClosureFlowDynamics`, `TransfiniteClosureFlow`, and `NSCFiring`.

Acceptance criteria:

- tactic is local to RelMath closure semantics;
- it does not attempt arbitrary fixed-point search;
- proof scripts retain named theorem structure.

## Phase 5: Prototype `chl`

Maturity: Research-grade.

Tasks:

1. stabilize the CHL transport theorem names;
2. implement a binder transport tactic for `rename`/`subst` goals;
3. test on a small subset of the existing CHL proofs.

Acceptance criteria:

- repeated binder boilerplate shrinks;
- recursive proof structure remains readable;
- no theorem is weakened into an unprincipled rewrite soup.

# 9. Agentic Use

RelMath-native tactics are especially valuable for proofing agents.
A proofing agent does not merely need powerful tactics; it needs tactics whose names reveal the intended mathematical move.

The current external Lean-proofing memo in the project describes an agentic stack:

1. observe the proof state;
2. retrieve definitions, lemmas, examples, and traces;
3. propose a tactic or lemma;
4. run Lean;
5. inspect the result;
6. repair or continue.

For RelMath, a native tactic vocabulary would make that loop much less blind.
Instead of choosing among generic actions like `simp`, `rw`, and `omega`, an agent could choose:

- `cring` when the goal is bundled algebra;
- `charge` when the goal is finite FOUR reasoning;
- `rat_descend` when the goal is quotient rational descent;
- `settle` when the goal is closure/fixed-point dynamics;
- `chl` when the goal is syntax transport under binders.

This matters because the project has a novel foundational mathematics.
The automation vocabulary should teach the agent the ontology.
If the available tactics are only generic, the agent will keep trying to prove RelMath as if it were ordinary Lean exercise code.
If the available tactics are named by RelMath's strata, the agent has a better chance of selecting the right proof mode.

# 10. Conclusion

The emerging RelMath tactic picture is small, but it is not immature in the ordinary sense.
It is concentrated at the first place a dependency-free foundational Lean library needs relief: algebraic normalization over internally derived carriers.

`iring` proves that a tiny local tactic can unlock an entire region of rational and real construction.
`cring` proves that the next step can be principled: reflective, bundled, and sound over RelMath's own `CommRing`, rather than borrowed from an external algebra hierarchy.

The next tactics should follow the same law.
They should not be generic automation hammers.
They should be small proof procedures named for the mathematical acts RelMath actually performs:

- normalize bundled algebra;
- exhaust FOUR-valued charge tables;
- descend quotients;
- settle closure flows;
- transport binders;
- verify finite certificates.

That is the practiceable frontier.
RelMath's automation should become a second readable layer of its mathematics: not a replacement for the theorem spine, but the operational grammar by which proof agents and human proof engineers move through it.
