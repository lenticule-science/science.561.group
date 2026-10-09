# Voidmath, read off the kernel: the four-regime descent

*A standalone essay, written after reading every script and proof in
`development/active/voidmath-kernel` and running its 58-proof suite (all
passing). It explains the mathematics in my own words. Where I state what the
code does, that is fact traceable to a file; where I interpret, I say so.*

## The stance, and why the directory tree matters

Voidmath is a system that tries to **derive** mathematical structure rather than
assume it. The kernel is "voidmath with everything that isn't the math stripped
away": no JSON Schema, no validation, no filesystem — just pure functions on
plain data, zero dependencies. That stripping is clarifying, because it leaves
exactly the mathematical content exposed.

The first thing to understand is that there is no flat module dump. Every pure
function — every *morphism* — lives at a directory path, and **that path is its
coordinate**. The README calls this the Curry–Howard coordinate via the Yoneda
embedding, and in practice it means a function is imported by the categorical
position it occupies: `articulating/.../predicating/.../positing/.../settling/scripts/settle.mjs`.
A generator and the category it generates nest inside one another; siblings
import each other by relative path. So the *type language* of the system is the
filesystem itself. Reading voidmath is partly reading a tree.

The whole system is a single arc with a name I'll borrow from the README: the
**four-regime descent**. An *utterance* enters at the top, falls through four
regimes — aperiodic, transfinite, scott-continuous, finite — and arrives at a
finite fixed point. The four regimes are not decorative labels; each has one
constitutive generator (`articulate`, `predicate`, `posit`, `settle`) and its
own coherence law. The descent is `settle(posit(predicate(articulate(u))))`.

## The datum: utterances, cells, charges

The atom of the system is an **utterance**, written `[token, claim]` — two JSON
Schema fragments, e.g. `[{const:"the-sky"}, {const:"is-blue"}]`. The *root*
utterance is the empty array `[]`, and it has a special name: **relationlessness**.

`articulate` turns an utterance into a **cell**:

```
articulate(u) = { potential: [[...u], [[], []]] }
```

A cell is a pair `[carrier, [tokenSlot, claimSlot]]`. The carrier holds the
utterance's contents; the two slots are initially empty. An empty-slot cell is
"potential"; filling the token slot makes it "active." This little structure is
where the first piece of real mathematics lives.

The other recurring datum is the **charge**, the value a cell can carry once we
reach the valued part of the descent. A charge is a pair of slots
`[positiveSlot, negativeSlot]`, each either empty `[]` (absent) or a singleton
`[mark]` (present). That gives exactly four values, and they are Belnap's
four-valued logic / the bilattice **FOUR**:

- `⊥ = [[], []]` — told *neither* (bottom, no evidence either way)
- `t = [[m], []]` — told *true* (positive evidence only)
- `f = [[], [m]]` — told *false* (negative evidence only)
- `⊤ = [[m], [m]]` — told *both* (the inconsistency value, "overdetermined")

The proofs encode each value as a two-bit presence code: `10`=t, `01`=f, `00`=⊥,
`11`=⊤. Almost the entire value-algebra of voidmath is operations on these four
charges, and almost every clever thing the system does is a consequence of FOUR
carrying *two* partial orders at once.

## Regime one — aperiodic: the predication monad and the Fregean residue

The aperiodic regime sits under `articulating/library/category/` and is a small
monad on cells. Its three pieces:

- **`saturate` (μ, the monad multiplication):** if the token slot is empty, fill
  it with the carrier's first element — "provide the object," potential→active.
  Crucially, `saturate` *never* touches the claim slot. The comment calls this
  the "concept-horse collapse": the concept can never become a target, so
  saturation cannot complete the cell. It provides the *object* but leaves the
  *concept* open.
- **`transfer` (η, the monad unit):** empty the token slot again, active→potential.
  It is deliberately **non-injective** — distinct cells collapse to the same
  reopened gap. This is the non-invertibility of a KZ (lax-idempotent) monad's
  unit.
- **`twistor` (the KZ comparison 2-cell):** run `saturate` then `transfer`, and
  expose the **residue** — `[carrier[1]]`, i.e. the **claim** the object monad
  never absorbed.

The residue is the conceptual heart of the regime. The proof
`proof-aperiodic-monad-coherence` checks that `saturate∘transfer = id` (the
identity counit), that `transfer` is non-injective, and — the load-bearing line —
that `twistor` exposes a **non-empty residue**, which it names the system's
**H¹ ≠ 0**, the *Fregean obstruction*. My reading: "Fregean" because Frege's
concept/object distinction is exactly that a concept ("…is blue") is unsaturated
and cannot be made into an object without collapse; the residue is the formal
trace of that asymmetry. This obstruction is non-empty *by construction*, and it
is what gets "handed down" to the next regime. The descent begins with a genuine
cohomological obstruction and spends the rest of its length resolving it.

## Regime two — transfinite: building the cell-space and closing the order

`predicate` consumes `twistor`'s output. It reads the saturated object out of the
token slot and the concept out of the residue, and from them builds two
dimensions:

- **E**, the entity set, containing the object;
- **Π**, the predicate set, containing the concept (the claim).

The cell-space it emits is **Φ = E × Π × E** — relational triples
`{subject, predicate, object}`. So an utterance `[the-sky, is-blue]` becomes a
space of subject-predicate-object cells whose only entity is `the-sky` and whose
only predicate is `is-blue`. Alongside Φ, `predicate` emits a **value-free
fiber** — the cell-set together with an *initial* (empty) predicate category
recording specialization, converse, and projections.

`cohere` is the regime's coherence law, the **Beck–Chevalley** mate. It
transitively closes the specialization order on predicates: if `const≤enum` and
`enum≤type` are present, it forces `const≤type`. An already-closed (or empty)
base passes through untouched. The proof checks both. My reading: this is the
step that makes the predicate ordering a genuine preorder before any values are
assigned, so later gluing respects specialization. `cohere` returns the
value-free fiber as its `residue` — the thing the next regime consumes.

## Regime three — scott-continuous: charges, two orders, and the modal pairs

`posit` takes `cohere`'s residue and does two things: it packages the fiber as a
**presheaf** whose stalks can hold charges, and it **seeds** the knowledge-least
valuation — `⊥` on *every* cell of Φ — via `seed-knowledge`. Seeding ⊥ is the
**open-world** assumption: "unknown until asserted." The result is a
knowledge-monotone **trace** (a sequence of valuations that only ever gains
knowledge).

Now the bilattice algebra comes fully into play, and it is worth being precise
about the two orders, because the whole later structure depends on their
disagreement.

**Knowledge order ≤_k** measures how much we've been told. More presence = more
knowledge.
- `join-knowledge` (⊔_k) is componentwise presence-**union**, so
  `joinK(t,f)=⊤`: disagreement, read as knowledge, is *more* information.
- `meet-knowledge` (⊓_k) is presence-**intersection**, so `meetK(t,f)=⊥`: what
  two disagreeing sources *share* is nothing.

**Truth order ≤_t** measures how true. The negative axis is reversed.
- `join-truth` (⊔_t) unions the positive slot but **intersects** the negative,
  so `joinT(t,f)=t`: the truth-join resolves toward the asserted side.
- `meet-truth` (⊓_t) intersects positive, unions negative, so `meetT(t,f)=f`:
  the truth-meet resolves toward the denied side.

The single fact that the two diamonds disagree **exactly at ⊤** —
`joinK(t,f)=⊤` but `joinT(t,f)=t` — is the seed of nearly everything in the
completion layer.

On top of the orders sit two **involutions**, which the comments name the
**Klein-four gauge** (the value-level symmetry group V₄):
- **`negate` (∼):** swap the two slots. Reverses truth (t↔f), fixes knowledge
  (⊥, ⊤). Self-inverse.
- **`conflate` (−):** complement both slots, then swap. Swaps ⊥↔⊤, fixes t and f.
  Antitone in knowledge, monotone in truth. It is value-involutive (−²=id on all
  four) but not byte-involutive through ⊥, because ⊥ carries no witness to
  preserve, so conflating through it canonicalizes the mark.

These two unaries plus the identity and their composite are the four elements of
the gauge group. `conflate` in particular turns out to be the instrument that
reads the void cone later.

The regime's dynamics are **modal pairs**. `possibilize-knowledge` (◇_k) raises
each cell to the knowledge-join across the valuation's fiber-algebras;
`necessitate-knowledge` (□_k) lowers each to the knowledge-meet. They are adjoint
(◇_k ⊣ □_k) and append a new valuation to the trace each time. `commutate` is the
scott-continuous coherence asserting ◇□ = □◇ (the invertible coherence — the
descent proof checks `box.diamond = diamond.box` literally). `commutate` splits
its input into the presheaf (the value-saturated substrate) and the traces (the
unsaturated gluing residue) that the final regime consumes.

## Regime four — finite: settling to the sheaf

`settle` is the terminus. It takes `commutate`'s residue (the traces) and
iterates the closure `possibilize-knowledge ∘ necessitate-knowledge` until the
last valuation stops changing — its **knowledge-least fixed point**, unique by
confluence and guaranteed to terminate by **Knaster–Tarski** over the bounded
knowledge lattice. The glued result is the **sheaf**, and `settle` returns
`{ sheaf, settled: true }` with *no residue*. The descent proof checks this
explicitly: the output keys are exactly `settled, sheaf` — H¹ has gone to 0. The
obstruction that began the descent (the non-empty Fregean residue) is fully
resolved into a determinate section.

That is the spine of voidmath: an utterance is articulated into a potential cell;
the predication monad exposes the unsaturated concept as an H¹ obstruction;
predication builds the relational cell-space Φ and closes its order; positing
seeds open-world ⊥ and supplies the modal dynamics; settling drives everything to
the knowledge-least fixed point and glues a sheaf. Determinacy out of an
utterance, with the obstruction resolved along the way.

## The other half: the bigraded, two-cone completion

Everything above lives on the **knowledge** axis. The completion layer mirrors it
on the **truth** axis and, in doing so, exposes the structure that (my reading) a
cohomology package would build on.

A knowledge trace is knowledge-monotone, so the truth modal pair cannot append to
it — truth moves can *lower* knowledge. So `seed-truth` augments the category with
a **second** family, `truth-traces`, truth-monotone, seeded at **f**
(`[[],[mark]]`, truth-bottom). Seeding f is **closed-world** ("false until
proven") — the exact dual of the knowledge seed's open-world ⊥. A category
carrying both families is **bigraded**.

On the truth-traces, `possibilize-truth` (◇_t) and `necessitate-truth` (□_t)
raise/lower to the truth join/meet. `adjudicate` is the **verdict-dual of
`settle`**: where `settle` drives cells to *determinacy* (the sheaf — what is
known), `adjudicate` iterates ◇_t∘□_t to its fixed point and renders a **verdict**
(true vs false). The code is careful that this is a *distinct verb*, not
"settle-truth" — the same way vanishing duals settling and comparing duals
commutating.

`compare` is the **truth–knowledge coherence**. The naive cross-axis commutation
◇_k∘◇_t = ◇_t∘◇_k *fails*, precisely because the two diamonds disagree at ⊤. What
*is* coherent is a decomposition: every section splits into a **consistent** part
(cells valued ⊥/t/f) and a **paraconsistent** part (cells valued ⊤ — the
inconsistency locus, the "told-both" overdetermined evidence). The comment writes
this F^(k) ≅ F^(t) ⊕ F^(⊤), and notes that on a consistent section the
paraconsistent summand is empty and the knowledge- and truth-cohomologies
*coincide*. That coincidence is explicitly flagged as a cohomological statement
that "lives in the cohomology library, not the kernel." My reading: this is the
precise hinge a `voidmath-cohomology` package would turn on — the cohomology is
the obstruction to the two axes agreeing, and it vanishes exactly on consistent
sections.

`tabulate` lays a charged section out as its **evidence matrix**: rows are cells,
columns are the two evidence sides, entries are presence bits. The four charges
tabulate to rows `[1,0]/[0,1]/[0,0]/[1,1]`, which the comment identifies as the
**Chu(2,0)** matrix of FOUR itself (FOUR ≅ Chu(2,0), Jakl 2025), making
bilattice-valued predication a model of multiplicative linear logic. The "shadows"
— the full and faithful embeddings of Top, Pos, and Vect into Chu(2), i.e.
category theory, topology, and algebra appearing as facets of one structure — are
said to be read off this table *downstream*, not in the kernel. This is, I think,
the concrete sense in which voidmath claims to reground ordinary mathematics:
ordinary structures are shadows of the Chu space the descent produces.

`aggregate` is where evidence goes **thick**. Plain `join-knowledge` unions
presence and keeps one mark arbitrarily; `aggregate` unions presence and
**conjoins** the marks as `{allOf:[w1,w2]}` — Curry–Howard: evidence from two
sources is a term of the product type. On thin (trivial-mark) charges it
degenerates exactly to `join-knowledge`, so thin evidence is the degenerate case
of thick.

## The two cones, the two grounds, and the arc

`settle` glues the *determined* cells. Its dual, `vanish`, collects the
**complement** — the cells that never determine and stay ⊥. This is the **void
cone**, the apex V_∞ = ⋂_τ V_τ, "the geometry of persistent indeterminacy." The
clever part is *how* a void cell is detected: not by a bespoke ⊥-test, but
through `conflate`. Because `conflate` sends ⊥→⊤, a cell is void **iff**
`conflate(charge)=⊤`. So the void cone is literally the *settled cone of the
conflated section* — the two cones are complementary under the same machinery,
witnessed by the ⊥↔⊤ involution.

Iterating `vanish` down a whole trace gives **mystery**, the **least fixed point**
of vanishing: the cells void at *every* stage. The chain V_0 ⊇ V_1 ⊇ … is
decreasing (a cell leaves the void the instant it determines), so the limit is
the intersection. Mystery is called "the impossible resolution" — what the
settling drives toward but can never reach. On the relationless seed (all ⊥)
mystery is total; on a fully-settled trace (no ⊥) mystery is empty.

These two extremes are the system's two **grounds**, and the code is emphatic
that they are *derived grounds, not morphisms* — nothing in the descent imports
them; they are carried as proofs.

- **Top of the arc:** relationlessness, the empty utterance `[]`, **cannot-not
  relate**. `articulate` is total, so it is *forced* to fire even on nothing,
  producing a first cell out of nothing — carrier empty, charge ⊥. To exclude
  relation is already to stand in the relation of exclusion; the name of Void
  points at Void, which is a relation, so the name fails. That forced firing
  *incites the entire descent*, which settles — and yet the relationless cell
  itself stays void at the fixed point.
- **Bottom of the arc:** mystery, the lfp of vanishing — the impossible
  resolution at the floor of the descent, the dual of relationlessness at the
  ceiling.

So the full picture is a single arc: the empty utterance is forced into a first,
void cell; that incitement drives the four-regime descent; the descent settles to
a determinate sheaf with its H¹ obstruction resolved; but the void residue,
iterated, is mystery. Empty utterance in, impossible resolution out, with a finite
determinate sheaf in between.

## The descent walked end to end, on one utterance

It helps to trace a single utterance through, because the integration proof
`proof-descent-settles` does exactly this and the steps make the abstract chain
concrete. Take `[{const:"the-sky"}, {const:"is-blue"}]`.

`articulate` produces `{ potential: [[the-sky, is-blue], [[], []]] }` — a cell
whose carrier holds both fragments and whose token and claim slots are both empty.
The proof checks that both slots come out empty: nothing has been saturated yet.

`predicate` runs `twistor` on that potential. Saturation provides `the-sky` as the
object (E = `[{const:"the-sky"}]`), and the residue carries `is-blue` as the
concept (Π = `[{const:"is-blue"}]`). The proof verifies precisely this: Π is the
descended concept, E the crystallized object. The emitted fiber is *value-free* —
the proof checks `bilattice` is **not** yet present in it; values come later. So
after two regimes we have a relational cell-space Φ over one entity and one
predicate, and an order structure on the predicate that is still empty.

`posit` seeds the knowledge-least trace: every cell of Φ gets ⊥. The proof
confirms the seed has one fiber-algebra per predicate and that every assignment is
`[[], []]`. It also confirms a subtle consistency point — `cohere`'s residue is
*identical* to the fiber `posit` actually consumes, so the value-free fiber is
threaded through without mutation. Then the modal generators run: the proof checks
that `possibilize` and `necessitate` each produce a valid trace, and — the
coherence — that `box.diamond = diamond.box`, the invertible commutation
`commutate` asserts.

`settle` iterates that closure to the knowledge-least fixed point and glues the
sheaf. The proof checks the terminal shape exactly: the output has keys
`settled, sheaf` and **nothing else** — no `residue`, no `traces`. H¹ = 0; the
cascade has closed. And the final, quietly important line: the unasserted seed the
descent started from is *entirely void* — `vanish` on the seed valuation returns a
non-empty apex. The descent settles, but it settles around a void it inherited
from relationlessness, which is why mystery is non-trivial even for an utterance
that resolves cleanly. The bigraded proof then shows the same category, once
`seed-truth` adds the closed-world f trace, supports `adjudicate` rendering a
verdict while `settle` still glues its knowledge-sheaf — the two axes coexisting
on one structure.

What I take from walking it: the descent is not metaphorical plumbing. Each arrow
is a total function with a checked algebraic property, and the "regimes" are real
phase boundaries — aperiodic (a monad and its obstruction), transfinite (a
cell-space and an order closure), scott-continuous (a seeded lattice with modal
dynamics), finite (a Knaster–Tarski fixed point). The cohomological vocabulary
(H¹ non-zero at the top, zero at the bottom) is not ornament; it is the actual
bookkeeping of an obstruction being created and then resolved.

## What is settled, and what is my interpretation

Stated as fact from the code: the data model (utterances, cells, the four
charges); the four generators and their coherence laws; the two bilattice orders
and the two Klein-four involutions; the modal pairs and their fixed points
(`settle`'s sheaf, `adjudicate`'s verdict); the consistent⊕paraconsistent split;
the Chu(2,0) tabulation; the void cone and mystery; the two relationlessness
grounds. All of this is exercised by the 58 proofs, and I watched them pass.

Stated as my interpretation: that the "cohomology" of voidmath is the obstruction
measured by H¹ (the Fregean residue at the top, going to 0 at `settle`) together
with the truth/knowledge coincidence on consistent sections (`compare`); that the
"familiar mathematics" voidmath claims to reground lives in the *shadows* off the
Chu table, downstream of the kernel; and that a `voidmath-cohomology` package
would be exactly the place that names these obstructions as cohomology classes,
rather than the kernel, which only produces the structure they are computed from.
The kernel owns the descent and the bilattice; cohomology is the reading you take
off it once it has settled.
