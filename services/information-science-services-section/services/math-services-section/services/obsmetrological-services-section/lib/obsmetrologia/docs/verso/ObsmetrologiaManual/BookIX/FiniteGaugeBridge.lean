import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.DenseMatter.Quark

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.DenseMatter.Quark

/-!
A teaching chapter for finite gauge holonomy as a relational physical carrier.
-/

#doc (Manual) "Finite gauge bridge" =>

# Finite Gauge Bridge

Finite gauge theory is not frontier merely because continuum gauge theory is
frontier. The dependency-free library has a real finite carrier: local gauge
transformations on graph edges, path holonomy, and Wilson-loop invariance for
class functions.

The claim-site carried here is:

* claim-site: finite gauge holonomy as a relational physical bridge;
* phase: relational physical phases after recurring finite symmetry and graph
  carriers are lawful;
* generating sites: finite group law, directed edge, graph path, local gauge
  transform, closed-loop holonomy, and class function;
* downstream uses: dense-matter invariants, horizon/gauge composites,
  keratinous-disc frontier diagnostics, and comparison-atlas gauge entries;
* Lean carriers: `Obsmetrologia.DenseMatter.Quark.FiniteGroup`,
  `Obsmetrologia.DenseMatter.Quark.GaugeField`,
  `Obsmetrologia.DenseMatter.Quark.GaugeTransform`,
  `Obsmetrologia.DenseMatter.Quark.holo`,
  `Obsmetrologia.DenseMatter.Quark.wilsonLoop_invariant`;
* Blueprint/proof-tree nodes: Blueprint has green nodes
  `thm:finite-gauge-group` and `thm:wilson-loop-invariant`;
* provenance: `docs/blueprint/src/chapters/relational-physics/` records the
  finite gauge, horizon, and dense-matter invariants together;
* familiar comparison: discrete gauge theory, holonomy, Wilson loop, Yang-Mills
  observable;
* reader closure: read every gauge phrase through finite graph holonomy unless
  a stronger carrier is explicitly constructed;
* frontier status: Lie groups, bundles, spinors, `SU(3)`, Wilson area laws,
  confinement, continuum Yang-Mills, and QFT Hilbert spaces are missing
  carriers.

The governing sentence is:

> Gauge is promoted here exactly as finite holonomy, not as continuum gauge
> field theory.

## Finite Gauge Group

The carrier is {name Obsmetrologia.DenseMatter.Quark.FiniteGroup}`FiniteGroup`, a group-like
record. It does not import a Lie group, topology, or smooth bundle.

The repository also supplies a concrete `Z2` carrier:

{docstring Obsmetrologia.DenseMatter.Quark.Z2}

Checked:

```lean
example :
    Z2.one = false :=
  rfl

example :
    Z2.mul true true = false :=
  rfl
```

The physical reading is useful only after this restriction is visible. A finite
group can carry discrete gauge transformations. It cannot carry continuum color
gauge theory by resemblance.

## Local Gauge Transformation

A connection is a label on directed edges:

{docstring Obsmetrologia.DenseMatter.Quark.GaugeField}

A local gauge transform assigns a group element at each vertex:

{docstring Obsmetrologia.DenseMatter.Quark.GaugeTransform}

The action on an edge is:

{docstring Obsmetrologia.DenseMatter.Quark.transformEdge}

Checked:

```lean
example (G : FiniteGroup) {V : Type}
    (A : GaugeField G V)
    (u : GaugeTransform G V) :
    GaugeField G V :=
  transformEdge G A u
```

This is the generated claim-site for local gauge vocabulary. The local action is
an edge relabeling law, not a field equation.

## Holonomy

Path holonomy is the ordered product of edge labels:

{docstring Obsmetrologia.DenseMatter.Quark.holo}

The transformation law telescopes to endpoint conjugation:

{docstring Obsmetrologia.DenseMatter.Quark.holo_transform}

For a closed loop, only basepoint conjugation remains:

{docstring Obsmetrologia.DenseMatter.Quark.closedLoop_holonomy_conjugates}

Checked:

```lean
example (G : FiniteGroup) {V : Type}
    (A : GaugeField G V)
    (u : GaugeTransform G V)
    (x : V) (rest : List V)
    (hclosed : lastOf x rest = x) :
    holo G (transformEdge G A u) x rest
      = G.mul (u x)
          (G.mul (holo G A x rest)
            (G.inv (u x))) :=
  closedLoop_holonomy_conjugates
    G A u x rest hclosed
```

The carrier has the exact shape the physical reading needs: local changes cancel
along the interior of the path.

## Wilson Loop Invariance

A class function is {name Obsmetrologia.DenseMatter.Quark.ClassFunction}`ClassFunction`, a
conjugation-invariant observable on the finite group carrier.

The finite Wilson-loop theorem is:

{docstring Obsmetrologia.DenseMatter.Quark.wilsonLoop_invariant}

Checked:

```lean
example (G : FiniteGroup) {V : Type}
    (A : GaugeField G V)
    (u : GaugeTransform G V)
    (cf : ClassFunction G)
    (x : V) (rest : List V)
    (hclosed : lastOf x rest = x) :
    cf.f (holo G (transformEdge G A u) x rest)
      = cf.f (holo G A x rest) :=
  wilsonLoop_invariant G A u cf x rest hclosed
```

This is a settled finite theorem. It belongs in Book IX, not only in the lab.
The lab frontier begins when a page asks for the analytic layers that are not
present.

## Promotion Boundary

A later page may promote a stronger gauge claim only by adding the missing
carrier and theorem. Typical missing carriers are:

* a Lie-group or smooth-bundle layer;
* continuum path or surface integration;
* representation theory strong enough for `SU(3)`;
* spinor or Hilbert-space state carriers;
* an area-law or confinement theorem;
* a coupling to continuum dense-matter or horizon geometry.

Until those exist, the lawful claim is the finite one proved here: class
functions of closed-loop finite holonomy are invariant under local gauge
transformations.
