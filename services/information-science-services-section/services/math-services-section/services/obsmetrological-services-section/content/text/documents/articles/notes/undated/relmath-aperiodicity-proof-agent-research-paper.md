---
title: From RelMath Aperiodic Settling to a Finite Proof Certificate for Jeandel–Rao Marker Cohomology
description: "Prepared for: a proofing agent working on the RelMath-guided aperiodicity/certificate program Primary computational artifact: relmathaperiodicitylabv20.py Primary finite witness artifact: jeandelraomarker01decoratedcertificatev20.json…"
---
# From RelMath Aperiodic Settling to a Finite Proof Certificate for Jeandel–Rao Marker Cohomology

## A research paper and proof-agent briefing

**Prepared for:** a proofing agent working on the RelMath-guided aperiodicity/certificate program  
**Primary computational artifact:** `relmath_aperiodicity_lab_v20.py`  
**Primary finite witness artifact:** `jeandel_rao_marker_01_decorated_certificate_v20.json`  
**Primary proof-spec artifact:** `jeandel_rao_marker_01_decorated_certificate_proofspec_v20.md`

---

## Abstract

This paper consolidates a long exploratory conversation into a coherent research program and proof-agent work order.

The central question was whether the user's RelMath system could make progress on an active hard problem in mathematics, with special attention to aperiodicity, Wang tiles, monotiles, and the problem of extracting computable certificates for non-periodic structure.

The resulting research direction is not a universal tiling solver.
It is a certificate-extraction program for structured, hierarchical aperiodic systems.

The computational work focused on the Jeandel–Rao aperiodic Wang tile set, the minimal known aperiodic Wang set of 11 tiles on 4 colors.
The public literature already proves aperiodicity and minimality, and Labbé later exposes a substitutive structure involving marker tiles, recognizable substitutions, decorations for fault lines, and shear conjugacy.
The RelMath-guided program asks a different question:

> Can we extract small, proof-bearing cohomological witness objects from such hierarchical aperiodic systems, in a form suitable for formal proof assistants?

Over many iterations, the Python laboratory evolved from naive finite homology tables into a pipeline for:
1. building Wang/AP-style finite chain complexes,
2. collaring and decorating local configurations,
3. searching lawful marker quotients,
4. extracting a small marker-ring quotient certificate,
5. isolating a meaningful boundary-connected `b3` cohomology projection,
6. composing marker-domino desubstitution steps,
7. decorating macro edges by witnessed cochain values, and
8. exporting a standalone finite certificate object that verifies independently of the search.

The current endpoint is a finite decorated witness subcomplex with:
- `C1 = Z^6`,
- `C2 = Z^3`,
- `rank(d2) = 2`,
- `H1` rank `4` in the one-vertex AP projection,
- a nonzero cochain `phi` supported on two decorated edges,
- `phi ∘ d2 = 0` on all three faces,
- and a standalone verifier confirming the certificate.

This object does **not** prove Jeandel–Rao aperiodicity.
It proves a finite, extracted, nonzero closed cochain witness on a decorated marker-domino subcomplex derived from Jeandel–Rao local structure.
The proofing agent's first job is to formalize exactly that finite theorem.
The next research job is to connect such finite witnesses through lawful directed morphisms into a persistent direct-limit class, matching the RelMath `cl-inv` architecture.

---

## 1. The mathematical problem and why RelMath pointed at it

The original prompt asked for a "rabbit" in current hard mathematics that might become more tractable using the attached RelMath system.
The selected rabbit was:

> Aperiodicity, monotiling, and mutual-local-derivability classification via finite bounded cohomological certificates.

This was chosen because RelMath already contains several pieces that align unusually well with modern tiling theory:

1. **Local rule systems.**  
   RelMath's `ClosureRuleSystem` treats positive closure rules as an immediate-consequence operator with least fixed point semantics. That is directly analogous to local matching rules generating a global closure space.

2. **Finite bounded sites.**  
   RelMath's Alexandrov/Husainov layer treats finite posets and Alexandrov topology as a bridge between combinatorial finite data and sheaf/cohomology computation. Under acyclicity hypotheses, finite Čech calculations can be treated as derived-functor sheaf cohomology in the bounded regime.

3. **No temporal covers.**  
   RelMath's bitopological site insists that covers are fiber-local and that cross-ordinal/cohomological content lives in morphisms and direct limits, not in covers.

4. **Aperiodic classifying invariant.**  
   RelMath's aperiodic layer models `cl-inv` as an `H^1` classifying invariant for mutual-local-derivability-style equivalence and treats aperiodic `H^1` as a direct limit of finite-stage cohomologies.

5. **Non-Scott firings.**  
   RelMath's non-Scott-continuous firing layer says that infinitary/non-Scott firings contribute generators to transfinite or aperiodic cohomology.

Thus, the natural proof-agent research problem became:

> Given a finite local rule system, can we extract finite cohomological witness objects that are not merely large finite homology artifacts, but candidates for persistent direct-limit classes?

This is precisely the distinction between a numerical diagnostic and a proof-bearing certificate.

---

## 2. Public literature context

### 2.1 Wang tiles and Jeandel–Rao

A Wang tile is a unit square with colored edges; a tiling is valid when adjacent edges have matching colors.
A finite Wang tile set is aperiodic if it tiles the plane but every valid tiling is nonperiodic.

Jeandel and Rao proved the existence of an aperiodic set of 11 Wang tiles on 4 colors and proved minimality: no Wang set with fewer than 11 tiles or fewer than 4 colors is aperiodic.
This resolved a classical size-minimality question in Wang-tile aperiodicity.

In this project, the Jeandel–Rao set was used not because we needed to reprove its aperiodicity, but because it is a known minimal frontier object with sufficiently rich structure to test certificate extraction.

### 2.2 Labbé's substitutive structure

Labbé studied the Wang shift generated by the Jeandel–Rao 11-tile set.
His work is crucial for our direction because it explains that the Jeandel–Rao system has substitutive/hierarchical structure, but not in a naive block-substitution way.
The structure involves marker tiles, recognizable substitutions, decorations for fault lines, and shear conjugacy.
Labbé also describes a minimal subsystem decomposing into 19 patches of sizes 45 to 112 and a self-similar aperiodic Wang system.

That public result shaped our computational strategy.
When naive macro-block maps failed, the correct conclusion was not "the approach is dead."
It was "we need markers and decorations," exactly as Labbé's work says.

### 2.3 The hat monotile and hierarchical aperiodicity

The 2023 hat monotile paper solved a long-standing aperiodic monotile problem by giving a single topological disk tile whose tilings are necessarily nonperiodic.
The proof relies on hierarchical structure: hats assemble into metatiles, substitution rules are defined for those metatiles, and forced hierarchy leads to aperiodicity.

This supports the broader thesis:
aperiodicity certificates in modern examples often arise from forced hierarchy, recognizability, and substitution structure.
The RelMath-guided certificate program aims to extract proof-bearing cohomological projections of that hierarchy.

### 2.4 Greenfeld–Tao and the limits of universal tiling solvers

Greenfeld and Tao disproved the periodic tiling conjecture in sufficiently high dimensions.
They also studied variants of the periodic tiling conjecture, including cases where decidability can be recovered, such as constant-level integer tilings in finitely generated abelian groups and multi-tilings in `Z^2`.

The lesson for this project is that universal tiling/periodicity decision procedures are the wrong target.
The better target is:

> certificate extraction for structured subclasses, especially hierarchical systems where markers, substitutions, and finite complexes can be found.

This is exactly the scale at which a proofing agent can do meaningful work.

### 2.5 Anderson–Putnam and collared tiling cohomology

Anderson and Putnam showed that the cohomology of substitution tiling spaces can be computed using collared tiles that force their borders, with the tiling space represented as an inverse limit and cohomology computed as a direct limit of the induced map on cohomology.
Later work by Barge, Diamond, Hunton, and Sadun expanded these methods and emphasized how collared complexes make substitution cohomology computable.

This literature is directly aligned with the RelMath claim that aperiodic `H^1` should be understood through finite-stage cohomologies and directed maps rather than isolated finite ranks.

### 2.6 Husainov and Čech cohomology of finite posets

Husainov's work compares Čech cohomology of presheaves on posets with topos cohomology of the associated sheaves, and gives finite-poset acyclicity criteria involving Dedekind–MacNeille cuts.
For RelMath, this provides the formal bridge from finite combinatorial patch posets to meaningful sheaf cohomology, when the acyclicity hypotheses are met.

The proof-agent should treat this as a boundary condition:
finite AP/Wang chain computations are currently **cellular/AP projections**, not automatically sheaf cohomology in all generality.
The agent should only promote them to sheaf-theoretic claims after verifying the relevant bounded-site and acyclicity assumptions.

---

## 3. RelMath architecture relevant to the proof program

The attached RelMath system is not merely inspirational vocabulary.
It provides a formal spine that structures the proof-agent's work.

### 3.1 Closure rules as local constraint systems

A Wang tile system can be read as a finite local rule system:
horizontal and vertical edge constraints determine which adjacent pairs may occur.
RelMath's `ClosureRuleSystem` already formalizes closure-rule systems as positive local rules whose immediate-consequence operator has least-fixed-point semantics.

For the proofing agent, the translation is:

- A local tiling rule is a closure rule.
- A patch language is a finite bounded closure approximation.
- A tiling shift is a global fixed-point/settling object.
- Aperiodicity should be detected not by one finite stage, but by persistent structure in the closure/direct system.

### 3.2 Bounded sites and Alexandrov/Husainov computation

Finite patch posets are naturally Alexandrov spaces:
opens are up-sets, specialization recovers the poset order, and monotone maps are continuous maps.
RelMath's `AlexandrovHusainov` module formalizes exactly this bridge and ties Husainov acyclicity to the claim that finite Čech computations can be the "right" cohomology in bounded strict regimes.

For the proofing agent:
- finite graph/cell complexes are allowed as computational projections;
- claims about sheaf cohomology require a site and an acyclicity bridge;
- the proof of the small certificate should be phrased as a finite chain/cochain theorem first.

### 3.3 Bitopological site and no temporal covers

The bitopological site module matters because it blocks a common mistake.
One cannot treat temporal/desubstitution advancement as just another cover.
RelMath says cross-stage content lives in morphisms/direct limits.

This became a central computational lesson:
raw `H1` at one finite stage is not a certificate.
The proof-agent must track maps.

### 3.4 Aperiodic `cl-inv` as direct-limit class

RelMath's aperiodic classification module models `cl-inv` as a complete invariant for MLD-style equivalence and models aperiodic `H^1` as a direct limit of finite-stage cohomologies.

Therefore, the eventual theorem we want is not:

> this finite complex has nonzero `H1`.

It is:

> this finite class maps through the directed system into a nonzero direct-limit class.

The present work reaches only the finite witness stage.
It prepares a proofing agent to formalize that witness and then continue toward persistence.

### 3.5 Non-Scott firings and generators

The NonScottContinuousFiring layer says that non-Scott-continuous firing ordinals record failures of commuting with directed joins and contribute generators to transfinite/aperiodic cohomology.
The intuition for the Jeandel–Rao marker obstruction is analogous:
finite local configurations reveal partial obstruction data, but the meaningful class emerges through marker/desubstitution stages.

---

## 4. Computational research chronology

The Python laboratory evolved in several conceptual phases.
The important lesson is not any one script version, but the tightening of the invariant.

### 4.1 Phase I: 1D substitution AP graph projections

The first scripts tested one-dimensional substitutions such as:
- periodic `A -> AB, B -> AB`,
- Fibonacci `A -> AB, B -> A`,
- Thue–Morse `A -> AB, B -> BA`,
- period-doubling,
- Rudin–Shapiro-like examples.

For a collar radius `r`, the script formed a de Bruijn/Anderson–Putnam graph:
- vertices are legal words of length `2r`,
- edges are legal words of length `2r+1`,
- `H1 = |E| - |V| + components`.

This showed:
- periodic controls collapse to base-circle `H1`;
- aperiodic substitutions have persistent excess;
- but naive graph maps are insufficient unless the substitution forces its border.

Lesson:
collaring matters, and direct-limit maps matter.

### 4.2 Phase II: 2D Wang AP complexes and false positives

The next phase implemented Wang tile finite torus search and AP-like one-cell chain complexes:
- `C2`: tile or patch types,
- `C1`: vertical and horizontal edge colors/boundary signatures,
- `d2(tile) = right - left + top - bottom`.

The script tested:
- the single tile,
- a small periodic checker-like control,
- Jeandel–Rao 11.

This established a crucial false-positive:
periodic systems can have nontrivial finite `H1`.
Thus raw nonzero finite `H1` is not enough.

### 4.3 Phase III: Jeandel–Rao collars and forgetful maps

The system then built 3x3 collared presentations:
- each valid 3x3 patch becomes a decorated state,
- edge colors become overlap strips,
- center projection maps the collared state back to the original base tile.

For Jeandel–Rao:
- there are 444 collared states,
- the collared one-cell AP projection has large `H1`,
- but the forgetful map to the base AP complex kills most decorated classes.

This established another key lesson:
large collared `H1` mostly records decoration/context/fault-line data.
The proof-agent must distinguish:
- visible base classes,
- internal decoration classes,
- and meaningful persistent quotient classes.

### 4.4 Phase IV: Marker-ring quotient search

The next phase searched marker-ring quotients.
For marker subset `(0,1)`, the quotient collapsed 444 collared states to 4 quotient faces and 7 quotient edge types.
It was lawful:
- quotient boundary was well-defined,
- chain-map checks passed,
- induced `H1` image was nonzero.

This produced the first small certificate carrier.

### 4.5 Phase V: Isolating the `b3` core

The marker-ring quotient had rank-5 `H1`.
Most basis elements were cheap one-edge loops caused by the one-vertex AP projection.
The meaningful class was isolated as `b3`, supported on edges `[1,2,5]`, with nonzero-boundary faces `[0,2,3]`.

The boundary core is:

```text
d2 q2[0] =  q1[1] - q1[2]
d2 q2[2] =  q1[2] - q1[5]
d2 q2[3] = -q1[1] + q1[5]
```

and the cochain/class projection is:

```text
b3 = q1[1] + q1[2] + q1[5].
```

The three boundaries cancel as a cycle dependency:
```text
(q1[1] - q1[2]) + (q1[2] - q1[5]) + (-q1[1] + q1[5]) = 0.
```

### 4.6 Phase VI: Marker-domino desubstitution attempts

A first marker-domino desubstitution was implemented:
- horizontal or vertical dominoes,
- anchored by marker membership,
- with chain-map expansion back to the base AP complex.

For marker subset `(0,1)`, all nonempty domino presentations were lawful chain maps.
The strongest simple path was vertical:
- `V/exactly-one`,
- then second vertical marker steps.

This did not yet prove persistence, but it gave morphism-like stages where the `b3` core could be audited.

### 4.7 Phase VII: Incidence audit of `b3`

The incidence audit asked whether first- and second-stage marker-domino systems saw the `b3` edges/faces.

One step saw only part of the core.
Two steps, specifically:
- `V/exactly-one -> V/first-marker`,
- `V/exactly-one -> V/exactly-one`,

saw the full `b3` edge support and all three nonzero-boundary faces.

This was the first strong signal that `b3` was not merely local noise.

### 4.8 Phase VIII: Cochain pullback attempt and failure

The first cochain-level pullback tried to assign a single `b3` value to each under-decorated composed macro edge.
This was nonzero but partially undefined and not closed.

This failure was informative:
the obstruction was visible, but the macro edges lacked enough local data to define the cochain lawfully.
This is exactly the public-literature pattern: one needs decorations/fault-line data.

### 4.9 Phase IX: Decorated pullback success

The next script decorated macro edges by their witnessed `b3` side-values.
On the witness-decorated subcomplex, `b3` became:
- nonzero,
- closed,
- and explicitly verifiable.

For both:
- `V/exactly-one -> V/first-marker`,
- `V/exactly-one -> V/exactly-one`,

the decorated witness subcomplex had:
- 5 or 6 decorated edges depending on extraction,
- 2 or 3 witness faces,
- zero defects,
- nonzero cochain support.

### 4.10 Phase X: Standalone certificate and verifier

The final artifact separated discovery from proof.

The discovery machinery found the decorated witness.
The verifier reads only the exported finite object and checks:
- boundary rank,
- homology ranks,
- closedness of `phi`,
- nonzeroness of `phi`,
- duplicate face classes,
- reduced complex ranks.

This is the proof-agent handoff point.

---

## 5. The primary finite certificate

The current primary finite certificate is:

```text
jeandel_rao_marker_01_decorated_certificate_v20.json
```

It encodes a decorated witness subcomplex derived from:
- Jeandel–Rao 11 tiles,
- marker subset `(0,1)`,
- first step `V/exactly-one`,
- second step `V/first-marker`,
- macro-marker policy `first-component`.

The verified summary is:

```text
C1 = 6
C2 = 3
rank(d2) = 2
H1 = 4
H2 = 1
phi closed = True
phi nonzero = True
phi support = [2,3]
coboundary values = [0,0,0]
duplicate face classes = [[1,2]]
```

The edge values are:

```text
phi(e0) = 0
phi(e1) = 0
phi(e2) = 1
phi(e3) = 1
phi(e4) = 0
phi(e5) = 0
```

The boundary columns are:

```text
d2(f0) =  e0 - e1 + e2 - e3
d2(f1) =  e2 - e3 + e4 - e5
d2(f2) =  e2 - e3 + e4 - e5
```

Therefore:

```text
phi(d2(f0)) = 0 - 0 + 1 - 1 = 0
phi(d2(f1)) = 1 - 1 + 0 - 0 = 0
phi(d2(f2)) = 1 - 1 + 0 - 0 = 0
```

and since `phi(e2)=1`, `phi` is nonzero.

This is a finite theorem.

---

## 6. What the proofing agent should prove first

The proofing agent should **not** attempt Jeandel–Rao aperiodicity first.
It should prove the finite certificate theorem.

### Theorem A: finite chain object is well-formed

Define finite types:

```lean
inductive Edge
| e0 | e1 | e2 | e3 | e4 | e5

inductive Face
| f0 | f1 | f2
```

Define `d2 : Face -> Edge -> Int` by the boundary columns above.

The proofing agent should prove that the exported matrix matches the stated boundary function.

### Theorem B: `phi` is closed

Define:

```lean
def phi : Edge -> Int
| e0 => 0
| e1 => 0
| e2 => 1
| e3 => 1
| e4 => 0
| e5 => 0
```

Define evaluation of a cochain on a boundary:

```lean
def evalBoundary (phi : Edge -> Int) (f : Face) : Int :=
  sum over edges e, d2 f e * phi e
```

Prove:

```lean
theorem phi_closed : forall f : Face, evalBoundary phi f = 0
```

This is a finite case split.

### Theorem C: `phi` is nonzero

Prove:

```lean
theorem phi_nonzero : phi Edge.e2 ≠ 0
```

or:

```lean
exists e, phi e ≠ 0
```

### Theorem D: nonzero cohomology projection

In the one-vertex AP projection, the coboundary from `C0` to `C1` is zero.
Thus a nonzero closed `C1` cochain gives a nonzero `H^1` class.

The proofing agent may formalize a minimal cohomology structure:

```lean
structure OneVertexCochainComplex where
  Edge : Type
  Face : Type
  d2 : Face -> Edge -> Int
```

with:
- closed cochains,
- zero coboundaries,
- quotient by zero relation,
- nonzero class criterion.

Then prove:

```lean
theorem decorated_certificate_has_nonzero_H1_projection :
  exists phi, Closed d2 phi ∧ phi ≠ 0
```

This theorem is intentionally weaker than "Jeandel–Rao is aperiodic."
It is exactly the finite witness theorem.

---

## 7. What the proofing agent should not prove yet

The agent should not yet prove:
- Jeandel–Rao aperiodicity,
- that `b3` is a direct-limit class,
- that the finite witness is an MLD invariant,
- that the witness is preserved through all Labbé marker/desubstitution steps,
- that the witness gives a complete `cl-inv`.

Those are research targets, not current finite-certificate facts.

The current correct claim is:

> A decorated marker-domino witness subcomplex derived by the Python search carries a nonzero closed cochain in a finite AP-style complex.

The proofing agent should keep that scoping exact.

---

## 8. Proof-agent architecture

The proofing agent should be built in layers.

### 8.1 Input layer

Inputs:
- `jeandel_rao_marker_01_decorated_certificate_v20.json`,
- optionally `jeandel_rao_marker_01_decorated_certificate_proofspec_v20.md`.

Tasks:
- parse JSON,
- validate required fields,
- check matrix dimensions,
- check cochain dimensions,
- compute boundary evaluations,
- compute rank if desired.

### 8.2 Normalization layer

The agent should normalize the certificate into a canonical finite representation:
- enumerate edges in the JSON order,
- enumerate faces in the JSON order,
- define boundary lists as sparse triples `(face, edge, coeff)`,
- define `phi` as an edge-indexed vector.

This normalization should generate both:
- human-readable proof spec,
- Lean definitions.

### 8.3 Lean emitter

The first Lean output should avoid complicated imports.
A standalone theorem can use:
- finite inductive types,
- functions to `Int`,
- direct case analysis.

A minimal generated Lean file should include:
- `inductive Edge`,
- `inductive Face`,
- `def d2`,
- `def phi`,
- `def evalBoundary`,
- theorem `phi_closed`,
- theorem `phi_nonzero`.

If possible, the proof should avoid `native_decide` in final form.
Using `decide` or explicit `cases` is more consistent with the RelMath style.
A generated proof can be:

```lean
theorem phi_closed : forall f : Face, evalBoundary phi f = 0 := by
  intro f
  cases f <;> rfl
```

if `evalBoundary` unfolds to concrete arithmetic.
If `omega` or `norm_num` are unavailable in the dependency-free core, write the arithmetic by definitional reduction.

### 8.4 RelMath integration layer

After the standalone proof compiles, the agent can integrate it into RelMath as a module such as:

```text
RelMath/AperiodicWitness/JeandelRaoMarker01Decorated.lean
```

Possible theorem names:

```lean
jeandel_rao_marker_01_phi_closed
jeandel_rao_marker_01_phi_nonzero
jeandel_rao_marker_01_nonzero_h1_projection
```

The module should explicitly state the scope:
it proves a finite decorated witness theorem, not a global aperiodicity theorem.

### 8.5 Search-to-proof trace layer

Eventually, the proofing agent should also formalize:
- that the witness object was derived from Jeandel–Rao tile data,
- that each decorated edge/facet corresponds to a valid local patch,
- that the marker-domino maps are chain maps,
- and that the witness sits inside a directed system.

But that should be a later phase.

---

## 9. Proposed theorem hierarchy

The proof-agent should aim for the following theorem hierarchy.

### Level 0: finite arithmetic verification

```lean
theorem d2_matrix_has_rank_two : rank d2 = 2
```

Optional.
Rank is useful but not necessary for the simplest nonzero closed-cochain theorem.

### Level 1: cochain closedness

```lean
theorem phi_closed : Closed d2 phi
```

This is essential.

### Level 2: cochain nonzeroness

```lean
theorem phi_nonzero : phi ≠ 0
```

This is essential.

### Level 3: finite `H^1` projection

Assuming coboundaries are zero in the one-vertex AP projection:

```lean
theorem phi_nonzero_h1_projection :
  NonzeroCohomologyClass d2 phi
```

This is the first actual cohomological theorem.

### Level 4: decorated witness derived from local data

```lean
theorem decorated_witness_edges_are_valid_marker_edges :
  ...
```

This requires formalizing more of Wang tile local data.

### Level 5: chain maps from marker-domino stages

```lean
theorem first_marker_domino_chain_map :
  ChainMap ...
```

and:

```lean
theorem composed_marker_domino_chain_map :
  ChainMap ...
```

### Level 6: persistence candidate

```lean
theorem phi_survives_decorated_stage :
  pullback b3 = phi ∧ phi ≠ 0
```

This is the first theorem that begins to look like a direct-system persistence statement.

### Level 7: RelMath `cl-inv` bridge

Only after the previous levels:

```lean
theorem jeandel_rao_marker_phi_contributes_to_clinv_projection :
  ...
```

This should be treated as research, not immediate implementation.

---

## 10. How this relates to RelMath's `cl-inv`

The finite witness `phi` is best understood as a **candidate local representative** of a future `cl-inv` projection.
It is not yet `cl-inv`.

To become `cl-inv`, we need:
1. a directed system of finite/coherent stages;
2. chain maps between stages;
3. a proof that the class is compatible with those maps;
4. a proof that the compatible family is nonzero in the direct limit;
5. an MLD/classification theorem connecting the class to tiling/settling equivalence.

RelMath already has the abstract shape:
- `DirectedSystem`,
- direct limit quotient,
- `cl-inv` as complete MLD invariant,
- finite bounded cohomology stages,
- no temporal covers.

The proofing agent should instantiate this shape gradually.

---

## 11. The proof-agent's immediate task list

### Task 1: compile finite certificate Lean

Input:
- `jeandel_rao_marker_01_decorated_certificate_v20.json`.

Output:
- a Lean module proving closedness and nonzeroness.

Acceptance criterion:
- Lean compiles.
- No `sorry`.
- No axioms.
- The theorem is scoped as finite witness only.

### Task 2: generate a RelMath-compatible version

Input:
- standalone Lean theorem.

Output:
- a module importing minimal RelMath infrastructure.

Acceptance criterion:
- still no `sorry`;
- theorem names follow RelMath style;
- comments state honest scope.

### Task 3: formalize one-vertex AP cohomology projection

Input:
- finite chain complex theorem.

Output:
- a generic lemma:

```lean
if d0 = 0 and phi is closed and phi ≠ 0, then phi represents a nonzero H^1 projection
```

Acceptance criterion:
- the finite certificate uses the generic lemma.

### Task 4: formalize marker-ring quotient certificate

Input:
- `jeandel_rao_marker_01_certificate_v13.json`.

Output:
- Lean proof that the marker-ring quotient has the stated boundary structure and `b3` core.

Acceptance criterion:
- the v20 decorated certificate can be traced back to the v13 marker-ring quotient.

### Task 5: formalize decorated witness derivation

Input:
- decorated witness JSON and Python trace.

Output:
- a theorem that the v20 witness is a subcomplex of the marker-domino construction.

Acceptance criterion:
- every edge/face label corresponds to an actual local patch or completed witness.

---

## 12. Important caveats

### 12.1 The finite witness is not a global proof

The v20 certificate proves a finite nonzero closed cochain.
It does not prove that every Jeandel–Rao tiling is nonperiodic.

### 12.2 The witness subcomplex is not the full tiling space

The decorated witness subcomplex was extracted from completed local patterns.
It is not yet the full AP complex for the Jeandel–Rao shift or its Labbé minimal subsystem.

### 12.3 Completion search is computational, not a proof

The Python completion routine found witnesses.
A proofing agent must either:
- formalize the specific witnesses directly, or
- prove the completion search exhaustive under stated bounds.

For the immediate finite theorem, direct formalization of the exported object is enough.

### 12.4 Nonzero closed cochain vs nonzero cohomology class

Because the one-vertex AP projection has zero `d0`, nonzero closed cochains represent nonzero classes.
If the proofing agent changes the complex model, it must recheck the coboundary group.

### 12.5 RelMath style matters

The attached RelMath system is careful about:
- no free data below the initial primitive layers,
- no `sorry`,
- explicit scope,
- avoiding claims beyond proved finite facts.

The proofing agent should preserve this discipline.

---

## 13. The current artifact inventory

### Main Python lab

```text
relmath_aperiodicity_lab_v20.py
```

Capabilities include:
- 1D substitution AP graph ranks;
- Wang tile torus search;
- finite Wang/AP homology;
- Jeandel–Rao marker and collar analysis;
- marker-ring quotient search;
- finite certificate extraction;
- decorated witness extraction;
- standalone certificate verification;
- proof-spec emission.

### Main finite witness JSON

```text
jeandel_rao_marker_01_decorated_certificate_v20.json
```

This is the primary object for formalization.

### Proof-spec Markdown

```text
jeandel_rao_marker_01_decorated_certificate_proofspec_v20.md
```

This is the human/agent-readable proof handoff.

### Earlier important artifacts

```text
jeandel_rao_marker_01_certificate_v13.json
```

The marker-ring quotient certificate with the `b3` core.

```text
jeandel_rao_marker_01_b3_incidence_v15.json
```

The first incidence audit showing one-step partial coverage.

```text
jeandel_rao_marker_01_composed_b3_v16.json
```

The two-step incidence audit showing full core coverage.

```text
jeandel_rao_marker_01_b3_pullback_v17.json
```

The failed under-decorated pullback attempt.

```text
jeandel_rao_marker_01_decorated_b3_pullback_v18.json
```

The successful decorated pullback audit.

---

## 14. Agent prompt for the next proofing run

The following prompt can be given to a Lean/proofing agent.

```text
You are formalizing a finite proof object extracted from a RelMath-guided aperiodicity certificate search.

Input files:
- jeandel_rao_marker_01_decorated_certificate_v20.json
- jeandel_rao_marker_01_decorated_certificate_proofspec_v20.md

Your first goal is NOT to prove Jeandel–Rao aperiodicity.
Your first goal is to formalize the finite decorated witness theorem.

Define finite inductive types:
- Edge with six constructors e0...e5.
- Face with three constructors f0...f2.

Define d2 : Face -> Edge -> Int using:
- d2(f0) = e0 - e1 + e2 - e3
- d2(f1) = e2 - e3 + e4 - e5
- d2(f2) = e2 - e3 + e4 - e5

Define phi : Edge -> Int using:
- phi(e0)=0
- phi(e1)=0
- phi(e2)=1
- phi(e3)=1
- phi(e4)=0
- phi(e5)=0

Define evalBoundary phi f as the signed sum of phi over d2(f).

Prove:
1. forall f, evalBoundary phi f = 0.
2. exists e, phi e ≠ 0.
3. In the one-vertex AP projection where d0=0, phi represents a nonzero H^1 projection.

Use explicit finite case splits.
Avoid sorry.
Avoid claiming global Jeandel–Rao aperiodicity.
State in comments that this is a finite decorated witness theorem derived from a Python search and intended as a component toward a future direct-limit cl-inv persistence proof.
```

---

## 15. Future research path after the finite proof

Once the finite proof compiles, the next research stages are:

1. **Formalize the v13 marker-ring quotient**  
   Prove that the `b3` core exists in the 4-face/7-edge quotient.

2. **Formalize the v18/v19 decorated pullback relation**  
   Show that the decorated witness cochain is the pullback of the `b3` cochain through the composed marker-domino witness map.

3. **Implement more of Labbé's desubstitution chain**  
   Replace the crude domino steps with Labbé-style marker substitutions, decorations, and shear.

4. **Build a directed system of witness complexes**  
   Each marker/desubstitution stage should supply a chain map.

5. **Prove persistence of a nonzero class**  
   Show that the class is compatible through a directed subsystem.

6. **Connect to RelMath `cl-inv`**  
   Only after persistence is proven should the class be advertised as a `cl-inv` projection.

---

## 16. Conclusion

The conversation did not solve a famous open problem.
It did something more precise and useful for a proofing agent:

- It selected a frontier-aligned target: hierarchical aperiodicity certificates.
- It rejected false-positive diagnostics: raw finite `H1`, large collared `H1`, and under-decorated cochains.
- It extracted a lawful marker-ring quotient from Jeandel–Rao data.
- It isolated a meaningful `b3` core.
- It composed marker-domino stages until the core became fully visible.
- It added the missing decoration so the cochain became nonzero and closed.
- It exported a standalone finite witness object.
- It generated a proof-spec suitable for Lean formalization.

The next proofing agent should begin by proving the finite witness theorem.
That theorem is small.
It is honest.
It is scoped correctly.
And it is the first formal brick in a RelMath-style path from local rules to persistent aperiodic cohomology.

---

## References

1. Emmanuel Jeandel and Michael Rao, *An aperiodic set of 11 Wang tiles*, arXiv:1506.06492, 2015. https://arxiv.org/abs/1506.06492

2. Sébastien Labbé, *Substitutive structure of Jeandel–Rao aperiodic tilings*, arXiv:1808.07768, 2018. https://arxiv.org/abs/1808.07768

3. David Smith, Joseph Samuel Myers, Craig S. Kaplan, and Chaim Goodman-Strauss, *An aperiodic monotile*, arXiv:2303.10798, 2023. https://arxiv.org/abs/2303.10798

4. David Smith, Joseph Samuel Myers, Craig S. Kaplan, and Chaim Goodman-Strauss, *A chiral aperiodic monotile*, arXiv:2305.17743, 2023. https://arxiv.org/abs/2305.17743

5. Rachel Greenfeld and Terence Tao, *A counterexample to the periodic tiling conjecture*, Annals of Mathematics 200(1), 301–363, 2024. https://annals.math.princeton.edu/2024/200-1/p05

6. Rachel Greenfeld and Terence Tao, *Some variants of the periodic tiling conjecture*, arXiv:2505.06757, 2025. https://arxiv.org/abs/2505.06757

7. Rachel Greenfeld and Terence Tao, *Undecidability of translational monotilings*, arXiv:2309.09504, 2023. https://arxiv.org/abs/2309.09504

8. J. E. Anderson and I. F. Putnam, *Topological invariants for substitution tilings and their associated C*-algebras*, 1995. Public PDF mirror: https://www.mimuw.edu.pl/~miekisz/anderput.pdf

9. Marcy Barge, Beverly Diamond, John Hunton, and Lorenzo Sadun, *Cohomology of Substitution Tiling Spaces*, arXiv:0811.2507, 2008. https://arxiv.org/abs/0811.2507

10. Ahmet A. Husainov, *Čech cohomology of partially ordered sets*, arXiv:2310.05577, 2023. https://arxiv.org/abs/2310.05577

11. emsenn, *RelMath attached Lean corpus*, especially `AlexandrovHusainov`, `AperiodicClassification`, `BitopologicalSettlingSite`, `ClosureRuleSystem`, and `NonScottContinuousFiring`, uploaded in this conversation.
