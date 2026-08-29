---
id: naming-math-unit
description: "Domain-specific naming rules for math/ units: classification, head word decision table, and modifier rules."
defines: NamingMathUnit
---

# Naming Math Unit

## What this is

The naming rules passed to `skills/name-unit.md` when naming a math unit. This document
IS the `naming_rules` argument. To improve math unit naming, edit this file only — the
skill picks it up automatically.

---

## Classification

Classify the object as exactly one of:

| Class | Test |
|---|---|
| **Object** | Can you point at it and examine its parts? It has structure and exists. |
| **Quality** | Is it a yes/no condition that holds or fails of something else? |
| **Relation** | Does it describe how two or more things stand relative to each other? |
| **Act** | Is it defined entirely by what it does to its input? |

**Tiebreaker**: when Object and any other class both apply, classify as Object and
encode the secondary character as a modifier (e.g. `SaturationNucleus` not `Saturating`).

---

## Head words — Object class

Choose the **most specific** criterion that applies. More specific beats more general.

### Morphism-type objects (endomorphisms and maps)

**`Nucleus`** — an idempotent, inflationary endomorphism on a Heyting algebra
satisfying $j(a \wedge b) = j(a) \wedge j(b)$, $a \leq j(a)$, $j(j(a)) = j(a)$.
USE only for this specific algebraic concept. Do NOT use for arbitrary maps.
Examples: `SaturationNucleus`, `TransferNucleus`.

**`Morphism`** — a structure-preserving map between two objects of the same algebraic
type, where the map is defined by what structure it must preserve (not by a formula).
USE when defining what it means to be a map from one structured object to another of the
same kind. Example: `UniverseMorphism`.

**`Functor`** — a structure-preserving map between categories; preserves composition
and identities. USE when both source and target are categories and the map respects
categorical structure. Do NOT use `Map` when the structure being preserved is categorical.

**`Map`** — a function defined by an explicit pointwise formula, without a strong
structural preservation claim. USE when the map is given by a formula and its
preservation properties (if any) are proved separately. Example: `FiberNormMap`.

**`Retraction`** — a map $r: X \to Y$ such that $r \circ i = \text{id}_Y$ for some
inclusion $i: Y \hookrightarrow X$. USE only when the unit defines or characterises
a retraction pair.

### Sheaf-theoretic objects

**`Sheaf`** — a presheaf satisfying the gluing (descent) axiom for a given Grothendieck
topology. USE only when the descent condition has been verified or is the subject of the
unit. Do NOT use when descent is not yet established.

**`Presheaf`** — a contravariant functor $C^{op} \to \mathbf{Set}$ (or into algebraic
structures) where the gluing condition has not yet been verified or is not the point.
USE during construction, before sheafification. Example: `PropositionalPresheaf`.

**`Topos`** — a category that is a Grothendieck topos (sheaves on a site) or an
elementary topos (has a subobject classifier, power objects, all finite limits).
USE when the object IS a topos. Do NOT use for Sites or Presheaf categories.
Example: `AmbientTopos`.

**`Site`** — a (small) category equipped with a Grothendieck topology (a coverage or
sieve system). USE when the object is the input to sheafification — it has covering
families but is not yet a topos. Example: `HistorySite`.

### Categorical objects (not sheaf-theoretic)

**`Category`** — an abstract category without a distinguished topology or sheaf theory.
USE when the object is a category of structured objects. Example: `UniverseCategory`.

**`Groupoid`** — a category in which every morphism is invertible. USE when the object
encodes symmetries, equivalences, or orbits as a categorical structure.
Example: `HyperversalPatternGroupoid`.

**`Doctrine`** — a 2-categorical fibration, specifically a hyperdoctrine: a functor
from a base category into ordered categories or Heyting algebras. USE when the object
is a Lawvere-style doctrine or hyperdoctrine. Example: `LawvereDoctrine`.

**`Comonad`** — a comonad on a category (a functor with counit and comultiplication
satisfying comonad laws). USE when the unit defines or characterises a comonad.
Example: `DirectedComonad`.

### Algebraic objects

**`Algebra`** — a set (or object) with finitely many operations satisfying specified
equations. USE when the primary structure is algebraic operations: Heyting algebra,
nuclear algebra, etc. Example: `NuclearHeytingAlgebra`.

**`Fiber`** — specifically the stalk $H_t$ of the relational presheaf at a history
$t \in T$: the Heyting algebra at that point, carrying $\sigma_t$ and $\Delta_t$.
USE when the object IS this stalk. Do NOT use for arbitrary fibers of other sheaves.
Examples: `SaturationStableFiber`, `TransferStableFiber`.

**`Language`** — a formal logical syntax: a grammar defining terms, formulas, or
proof rules. USE when the object is defined by its syntax, not by algebraic operations.
Examples: `FiberNuclearLanguageAxiom`, `HyperversalNuclearLanguage`.

**`Monoid`** — a set with an associative binary operation and identity. USE when the
algebraic structure is specifically monoid-level (no inversion, no lattice). Example:
`HistoryMonoid`.

### Geometric/topological objects

**`Space`** — a set with a topology or metric. USE when the object has classical points
and an explicit topology, and is NOT presented as a category of sheaves.

**`Locale`** — a pointless topological space (a frame of opens, without assuming
classical points). USE when the object is defined by its lattice of opens.
Example: `HyperversalStableLocale`.

**`Hull`** — the closure of a set under a specified operation (orbit closure, convex
hull, quasicrystal hull). USE when the object is defined as the smallest X containing
Y closed under some operation. Example: `HyperversalQuasicrystalHull`.

**`Moduli`** (→ `ModuliSpace`) — a space parametrising equivalence classes of
structured objects. USE when the object classifies structures up to isomorphism.
Example: `UniverseModuliSpace`.

### Universe-level objects

**`Universe`** — specifically a Relational Universe $R$ satisfying the self-generation
axiom $R = U_G(R)$, or a generalisation of it. Do NOT use for arbitrary large objects.
Example: `RelationalUniverse`.

**`Hyperverse`** — specifically $\mathcal{H}$ or a structure at the hyperversal level
(a universe of universes). Example: `RelationalHyperverse`.

### Indexed/sequential objects

**`Tower`** — a sequential diagram $X_0 \to X_1 \to \cdots$ indexed by $\mathbb{N}$
or an ordinal. USE when the object IS such a diagram, not just a collection of levels.
Example: `DepthFiltrationTower`.

**`Sequence`** — an indexed family without a specified colimit or limit structure.
USE when the indexing is the point but the directed structure is not. Example:
`SpectralSequence`.

### Named structural patterns

**`Quartet`** — four objects arranged in the specific nuclear quartet configuration:
two adjunctions sharing a middle object, forming a square. USE only for this pattern.

**`Dyad`** — two objects in a specific duality relation (construction–observation,
limit–colimit). USE only for this two-part duality structure.

**`Tetrad`** — four objects in a configuration distinct from the quartet (e.g. a
diamond or parallel pair). USE only for this specific four-part pattern.

---

## Head words — Quality class

MUST use an adjective. If no standard adjectival form exists, use the noun + `-ness`.

Common quality head words in this corpus: `Completeness`, `Soundness`, `Stability`,
`Aperiodicity`, `Idempotence`, `Convergence`, `Locality`, `Decidability`.

---

## Head words — Relation class

MUST use a flat verb (no `-ing`, `-ed`, `-s`). The name states the relation as a verb.

Common relation head words: `Commute`, `Restrict`, `Correspond`, `Separate`.

---

## Head words — Act class

MUST use a gerund (the `-ing` form of the operative verb). The name states what the act
does.

Common act head words: `Settling`, `Saturating`, `Normalizing`, `Tunneling`.

---

## Modifier rules

Modifiers MUST precede the head in order: `[scope] [property] [head]`.

- **Scope** — the mathematical domain the unit lives in:
  `Fiber`, `Universe`, `History`, `Hull`, `Hyperverse`, `Hyperversal`, `Tower`, `Depth`.
- **Property** — what makes this instance specific:
  `Stable`, `Transfer`, `Nuclear`, `Saturation`, `Commutation`, `New`, `Raw`.

When a modifier is derived from a verb: MUST use the attributive noun form.
The `-ing` rule applies ONLY to Act heads. MUST NOT apply to modifiers.

Omit scope and property when the head alone is unambiguous across the full corpus.

---

## Validation

After assembling a candidate name:
1. Confirm no existing unit has the same `id`.
2. Confirm the head word criterion is satisfied by the mathematical content.
3. If the unit's heading type prefix is "Theorem —" or "Conjecture —": the name
   describes the SUBJECT of the theorem, not the theorem itself. The unit's name
   reflects what mathematical object or property the result concerns.
   (Example: `NoetherFiber` is a theorem about fiber algebras, named for its subject.)
