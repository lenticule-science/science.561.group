---
name: "Reading voidmath from the code — the four-regime descent and its bilattice — 2026-06-01"
description: "A from-scratch reading of the voidmath-kernel package made by reading every morphism in active/voidmath-kernel and the four-bilattice value-algebra journal it rests on, rather than trusting the prose. Explains, in my own words: the cell and the charge; the bilattice FOUR as evidence pairs with two transverse orders; the aperiodic predication monad and the Fregean residue; the descent articulate→predicate→posit→settle to a knowledge-least sheaf; the bigraded completion (truth order, adjudicate, the void cone, the Klein-four gauge, thick evidence and the Chu(2,0) presentation); and the path-is-coordinate discipline that makes the directory tree the type language. Facts point at files; synthesis is marked. Includes one discrepancy caught by reading the code against the journal."
---

# Reading voidmath from the code — 2026-06-01

This note is written for the operator to review. It is my own reading of voidmath,
built by reading every script in `development/active/voidmath-kernel` and the primary
value-algebra journal it stands on
(`development/lab/archive/voidmath/2026-05-25/…/four-bilattice/docs/dev/journal/2026-05-24.md`),
not by trusting the package's own prose. Where I state a fact about a file I name the
file; where I synthesize or reach beyond what a file says, I mark it as a reading.
The active package is `voidmath-kernel`; the older validated `active/voidmath` was
archived to `lab/archive/voidmath/2026-05-28` and the kernel promoted in its place
(`README.md`, "Status"). I ran the kernel's proofs: `node tests/run.mjs` reports
`50/50 passed`.

## The one object: a cell, which is an utterance plus a charge

Everything begins with an utterance, which the code treats as a two-element list
`[token, claim]`. `articulating/scripts/articulate.mjs` is five lines: it returns
`{ potential: [[...utterance], [[], []]] }`. So a **cell** is a pair `[carrier,
charge]` where the carrier is the utterance `[token, claim]` and the charge is
`[[], []]`. The charge has two slots; each slot is either `[]` (empty) or `[mark]`
(a single mark). Reading the rest of the value operations confirms the charge is the
whole numerical content of the system: a **charge is an evidence pair**. With the
convention used throughout (`code = (c) => ` `${c[0].length}${c[1].length}` in
`tests/run.mjs`), the four charges are `BOTTOM = [[],[]]` (00), `t = [[m],[]]` (10),
`f = [[],[m]]` (01), and `TOP = [[m],[m]]` (11). That is exactly the four-element
bilattice **FOUR**, and the four-bilattice journal names the reading directly: `⊥`
told-neither (abstention), `t` told-true (assertion), `f` told-false (denial), `⊤`
told-both (contestation). The first slot is positive evidence (for), the second is
negative evidence (against). Nothing in the kernel ever stores a "truth value" as a
primitive; it stores a pair of presence bits and *derives* truth and knowledge as two
orders on that pair. That single design choice is the root of the whole system.

## FOUR: one carrier, two transverse orders, and why four is forced

The journal's central claim — which I take as the load-bearing mathematics — is that
the value algebra is forced, not chosen. A value algebra adequate for multi-agent
predication must let positive and negative evidence accumulate *independently*: one
agent asserts while another denies, and the record must hold both without collapse.
Boolean `{0,1}` conflates "no evidence" `(0,0)` with "contradictory evidence"
`(1,1)`; Kleene's three values add one middle but still cannot separate abstention
from contradiction. The minimum that keeps all four epistemic states distinct is the
four-element set with **two** orders. This is the journal's "FOUR-forced" theorem,
and it is why the kernel's charge is a pair of bits rather than a single value.

The two orders are both componentwise on the evidence pair, and the kernel implements
them as four tiny slot functions in
`…/positing/library/category/library/bilattice/library/charge/`:

- **Knowledge order** `≤_k`: both components rise together. `join-knowledge.mjs`
  is componentwise OR of presence; `meet-knowledge.mjs` is componentwise AND. So
  `joinK(t,f) = TOP` and `meetK(t,f) = BOTTOM` — disagreement, read as knowledge,
  is *more* information (you have been told both), and its meet is *no* shared
  information.
- **Truth order** `≤_t`: positive rises, negative is reversed. `join-truth.mjs` is
  positive-OR, negative-AND; `meet-truth.mjs` is positive-AND, negative-OR. So
  `joinT(t,f) = t` and `meetT(t,f) = f` — disagreement, read as truth, resolves
  toward the positive on the join and the negative on the meet.

The single fact that the *same* `t`/`f` pair joins to `TOP` under knowledge but to
`t` under truth is the entire reason the system carries two orders and not one. I
verified this is exactly what `proveValueOps` and `proveTruthDiamond` assert. The
journal supplies the pedigree: FOUR is the twist product `2^⋈` (Fitting/Kalman), the
free distributive bilattice on no generators (so every distributive bilattice receives
a unique map from it), and — the deepest line — `FOUR ≅ Chu(2,0)` (Jakl 2025), which
makes bilattice-valued predication a model of multiplicative linear logic. I will come
back to the Chu fact; it is the seed of the "shadows" claim downstream.

## The descent, regime by regime

The kernel's spine is a four-step pipeline, and the README's example is the whole
thing in one line: `settle(posit(predicate(articulate([token, claim]))))`. Each step
is a "regime" with its own constitutive generator and its own coherence morphism. I
read them in order.

**Aperiodic (articulate).** `articulate` produces the potential cell. The interesting
content of this regime is the little monad in
`articulating/library/category/{saturating,transferring,twistoring}`. `saturate.mjs`
(the monad multiplication μ) fills the positive/token slot — "provides the object",
potential → active — but it is written so it can *never* fill the claim slot: that gap
"is never a target", a deliberate refusal the comment ties to "the concept-horse
collapse" (Frege: the moment you make the concept an object you lose the concept).
`transfer.mjs` (the unit η) reopens the object slot, active → potential, and is
non-injective: distinct cells collapse to the same reopened gap. `twistor.mjs` runs
`saturate` then `transfer` and returns `residue: [carrier[1]]` — the **claim** — which
is "always non-empty (that is Fregean-ness)". My reading: the residue is the system's
H¹, the obstruction that cannot be discharged inside the object-monad and must be
*handed down* to the next regime as new structure. `proveAperiodicCoherence` checks
all of this concretely, including that the residue is the claim and not the token.

**Transfinite (predicate).** `predicate.mjs` consumes `twistor`'s output: the
saturated object becomes the lone **entity** `E = {object}`, and the residue (the
claim) becomes the lone **predicate** `Π = {concept}`. From these it forms the
cell-set Φ = E × Π × E and a "value-free fiber" over it (an initial predicate category
with empty specialization, converse, and projections). So the Fregean residue is not
discarded — it is *promoted* to the predicate dimension. The regime's coherence is
`cohering/scripts/cohere.mjs`, a Beck–Chevalley mate: it transitively closes the
`specialization` relation on predicates (if `const ≤ enum` and `enum ≤ type` then
`const ≤ type`), and hands the closed-base fiber on as its residue. `proveCohereClosure`
verifies the transitive closure and that an empty base is a no-op.

**Scott-continuous (posit).** `posit.mjs` re-runs `cohere` to get the closed fiber,
then calls `seeding-knowledge/scripts/seed-knowledge.mjs`, which builds one
fiber-algebra per predicate whose assignments are every `{subject, predicate, object}`
cell of E × Π × E, each charged **BOTTOM**. Seeding ⊥ everywhere is the open-world
assumption made literal: "unknown until asserted". It packages a presheaf and a single
knowledge-monotone `trace` holding that seed valuation. The regime's two modal
generators live here: `possibilizing-knowledge` (◇_k) raises each cell to the
knowledge-**join** across the fiber-algebras, and `necessitating-knowledge` (□_k)
lowers each to the knowledge-**meet**; they are adjoint (◇_k ⊣ □_k), each appends a new
valuation to the trace so the trace stays monotone. The coherence
`commutating/scripts/commutate.mjs` simply splits the category into `saturated` (the
presheaf substrate) and `residue` (the traces) — and the proof
`commutating commutes (diamond.box = box.diamond)` confirms the two modalities commute,
the invertible coherence of this regime.

**Finite (settle).** `settling/scripts/settle.mjs` is the payoff. It takes
`commutate`'s residue (the traces) and iterates the closure `possibilizeKnowledge ∘
necessitateKnowledge` until the last valuation stops changing (compared by canonical
JSON), then returns `{ sheaf: { base, section }, settled: true }`. The comment names
the math: the iteration is a Knaster–Tarski fixed point over the bounded knowledge
lattice, unique by confluence, and the glued section is the sheaf. `proveDescent`
checks that the result has *no residue left* — `Object.keys` is exactly
`settled,sheaf` — and reads this as "H¹ = 0": the cascade terminates with nothing
undischarged. So the whole descent is: an utterance carries a Fregean obstruction
(H¹≠0 at `twistor`); each regime converts that obstruction into the structure the next
regime needs; `settle` drives the obstruction to zero and crystallizes a sheaf. That
arc — obstruction created, propagated, discharged — is, in my reading, the single
story the four regimes tell.

## The bigraded completion: the other half of every duality

Reading the descent alone, only the *knowledge* order is exercised: seed ⊥, raise by
knowledge-join, lower by knowledge-meet, settle to the knowledge-least fixed point. The
bigraded layer (the work the kernel's own dev note,
`2026-06-01-evidence-the-carrier-and-the-chu-root.md`, was written to consolidate) adds
the matching truth-order half, so that every knowledge construction has its truth dual.
I read each addition against its proof.

- **A second trace family.** `seeding-truth/scripts/seed-truth.mjs` augments the posit
  category with a `truth-traces` family seeded at `f = [[],[mark]]` — the truth-bottom,
  "false until proven", the closed-world dual of the knowledge seed's open-world ⊥. The
  comment is explicit that a knowledge trace *cannot* host truth moves ("truth moves can
  lower knowledge"), so the truth pair needs its own monotone family. Same carrier, two
  bottoms, two orders — this is the note's "evidence is the carrier" reading made
  mechanical, and `proveBigraded` confirms the category then carries both `traces` and
  `truth-traces`, the latter seeded entirely at `f`.
- **The truth modal pair.** `possibilizing-truth` (◇_t) and `necessitating-truth` (□_t)
  are byte-for-byte the knowledge versions with truth-join/truth-meet swapped in, acting
  on `truth-traces`. `proveTruthDiamond` shows the split crisply: ◇_t collapses a
  `t`/`f` disagreement to `t`, while ◇_k collapses the same to `TOP`.
- **The verdict, dual of the sheaf.** `adjudicating/scripts/adjudicate.mjs` iterates
  ◇_t ∘ □_t to *its* fixed point and returns `{ verdict, adjudicated: true }`. The
  comment draws the duality I find most clarifying: where `settle` drives cells to
  **determinacy** (known vs unknown — the sheaf), `adjudicate` drives them to a
  **verdict** (true vs false). Two finite generators, one per order, same Knaster–Tarski
  shape, different lattice.
- **The truth–knowledge coherence.** `comparing/scripts/compare.mjs` splits a section
  into a **consistent** part (cells ⊥/t/f) and a **paraconsistent** part (cells ⊤ — the
  inconsistency locus), the decomposition `F^(k) ≅ F^(t) ⊕ F^(⊤)`. The comment is careful
  and I think correct to flag that the naive cross-axis commutation ◇_k∘◇_t = ◇_t∘◇_k is
  **false** (because `t ≠ ⊤`); the genuine strict commutation is cohomological and lives
  downstream, reading off this split. `proveComparison` checks the partition exactly.

## The Klein-four gauge and the two cones

FOUR has *two* involutions, and the kernel carries both as charge operations.
`negate.mjs` swaps the two slots — `(pos, neg) → (neg, pos)` — which reverses truth
(t↔f) and fixes ⊥/⊤; this is the bilattice negation `∼`. `conflate.mjs` is the second
involution `−`: it complements-then-swaps, `(pos, neg) → (¬neg, ¬pos)`, which swaps
⊥↔⊤ and **fixes t and f**. Together `∼` and `−` commute and generate the Klein-four
group `K₄ = Z/2 × Z/2 = Aut(FOUR)` (the journal proves both that they commute and that
these four maps are *all* of FOUR's automorphisms). My reading: this is the system's
gauge group — the symmetries under which the evidence pair may be relabelled without
changing the mathematics — and the kernel seats it as two unary charge ops rather than
as an abstract group, which is the right altitude for a kernel.

One subtlety I caught by reading the code against the math, and want on record. The
journal's **main** conflation definition is `−(a,b) = (¬b, ¬a)`, which fixes `t` and
`f` and swaps `⊥/⊤`. The kernel's `conflate.mjs` computes exactly that:
`[complement(charge[1]), complement(charge[0])]` = `(¬neg, ¬pos)`. But a later
"composted leftover" section appended to the same journal writes conflation as
`−(a,b) = (1−a, 1−b)` (coordinatewise complement) while *claiming* it "swaps ⊥ and ⊤,
fixes t and f". That formula is inconsistent with its own stated behaviour: `(1−a,1−b)`
sends `t=(1,0)` to `(0,1)=f`, i.e. it is the composite `∼∘−`, not conflation. The
kernel's code tracks the **authoritative** main table, not the leftover's slip. This is
the kind of thing the operator asked me to find by reading rather than trusting prose:
the code is right and one stratum of the documentation was wrong.

*(Corrected 2026-06-01.) The slip appeared in two archived journals — the composted
section of the `four-bilattice` journal and the `klein-four-group-on-four` journal,
each in a definition and a proof. In `klein-four-group-on-four` the conflation and
`∼∘−` formulas were simply transposed. All four spots are now fixed: conflation reads
`−(a,b) = (1−b, 1−a)` and the composite `∼∘−` reads `(1−a, 1−b)`, agreeing with the
authoritative main table and with `conflate.mjs`; the two affected commutation proofs
were re-derived to stay consistent.*

The second involution is not decorative — it is what gives the descent a *second cone*.
`vanishing/scripts/vanish.mjs` collects the cells whose charge stays ⊥ (the
never-determined cells, the void apex `V_∞`), and it detects them precisely by
conflation: a cell is void iff `conflate(charge)` is ⊤, because `conflate(⊥) = ⊤`. So
the void cone is literally the *settled* cone of the conflated section — the duality is
not asserted, it is computed through `−`. `settle` glues the determined cells; `vanish`
collects the persistently indeterminate ones; the two are complementary in the cell-set
under cell-complementation. `proveVanishing` confirms the void apex is exactly the ⊥
cells, that a no-⊥ section has empty apex, and that the unasserted seed (all ⊥) is
entirely void.

## Thick evidence and the Chu root

The last pieces are where the bits become *witnesses*. So far a present slot has held
the trivial canonical mark `{const: true}` — pure presence, no content. Two morphisms
lift this to real evidence terms.

`aggregating/scripts/aggregate.mjs` is a knowledge-join that, instead of keeping one
mark arbitrarily, **conjoins** distinct witnesses as `{allOf: [w1, w2]}` — itself a
valid token (a JSON Schema document), so the slot stays a singleton and a charge stays
a charge. The comment ties this to Curry–Howard: evidence for `p` from two sources is a
term of the product type, the conjunction of the two proofs. The thin presence-join is
the degenerate case — on identical trivial marks `aggregate` is exactly
`join-knowledge`, which `proveThickEvidence` verifies. So thin evidence is thick
evidence with no content, and the order on charges becomes an order on *which witness*.

`tabulating/scripts/tabulate.mjs` renders a charged section as its evidence matrix:
rows = cells, columns = the two evidence sides {positive, negative}, entries = presence
bits. The comment names this a **Chu space**: the matrix `r : A × X → 2` is the
uncurried valuation, and under `FOUR ≅ Chu(2,0)` (Jakl 2025) the section *is* a Chu
matrix. This is, in my reading, the structural punchline the whole system is built
toward. If predication is a Chu space, then topology (Top), order theory (Pos), and
linear algebra (Vect) embed fully and faithfully into Chu(2) — they are not analogies
to predication, they are **subcategories** of it. The kernel does not perform those
embeddings; it provides the *presentation* (`tabulate`) that downstream libraries
(`voidmath-mld`, `-cohomology`, `-spectral`, per the dev note) attach to, where the
"MLD-class computed three ways" is forced to agree — the "three shadows of one
structure". `proveThickEvidence` checks the four charges tabulate to the rows
`[1,0]/[0,1]/[0,0]/[1,1]`, which is the Chu matrix of FOUR itself.

## The path is the coordinate

A structural fact that is not about any one morphism but about all of them: there are
no schema files and no flat module dump. Each pure function lives at its **categorical
path** — `articulating/scripts/articulate.mjs`, then `…/predicating/scripts/predicate.mjs`
nested inside articulate's codomain, then `…/positing/…`, then `…/settling/…`. The
README states the principle: "the posix filepath **is** the Curry–Howard coordinate,
via the Yoneda embedding". The next morphism lives inside the previous morphism's
codomain, so the path from root to `settle` literally spells the sequence of typing
judgments that produces a domain `settle` can act on. The value operations sit deepest,
under `…/positing/library/category/library/bilattice/library/charge/`, because they are
the most-contained objects — the value algebra the whole descent is valued in. I find
this the most distinctive engineering decision in the package: the directory tree is
the type language, and dropping JSON-Schema validation (which is what made the kernel a
"kernel") did not flatten that structure — it only removed the mechanical enforcement,
leaving the tree itself as the carrier of types. The repository's own journal
(`2026-06-01-categorical-programming-paths-as-proofs.md`) elaborates this as "a schema
is a type, a script is a proof, the directory tree is a proof term"; the kernel is that
claim with the schemas removed and only the proofs kept.

## What is kernel, and what reads it

The kernel draws a clean line, and I think it is the right one. *Kernel* is: the
carrier (the evidence pair), its two orders (the four join/meet ops), the two modal
pairs (◇/□ on each order), the two finite generators (`settle`, `adjudicate`), the
gauge (`negate`, `conflate`), the two cones (`settle`, `vanish`), the coherences
(`twistor`, `cohere`, `commutate`, `compare`), witness-combining `aggregate`, and the
Chu presentation `tabulate`. Everything here is a pure, zero-dependency function from
plain data to plain data; malformed input simply throws where it is destructured. What
is *downstream*, reading the kernel's settled output, is the computation the Chu root
unlocks but the kernel does not perform: spectral eigenvalues, H¹/Smith-normal-form
cohomology (where the *real* strict commutation lives), and the Top/Pos/Vect
embeddings off the Chu matrix. The kernel owns the math floor; the holography package
owns the disk; the spectral/cohomology/mld libraries own the heavy invariants.

## What I am confident of, and what I am not

I am confident of every claim above that points at a file, because I read the file and
ran the proofs (50/50). I am confident the charge is Belnap's evidence pair, that the
two orders are the componentwise/twist operations the journal specifies, that the
descent creates a Fregean obstruction and drives it to zero, and that `settle`/`vanish`
and `negate`/`conflate` and `seed-knowledge`/`seed-truth` are genuine duals realized in
code. The thing I am *reading into* the files, and flag as such, is the unifying story —
"obstruction created, propagated, discharged" as a cohomological arc, and "evidence is
the one carrier two orders order, and that carrier is a Chu matrix whose subcategories
are topology/order/algebra". Those are the kernel's own stated intentions
(`README.md`, the dev note, the journal), and the code is consistent with them, but the
deeper theorems they gesture at (the three-way agreement of the MLD-class, the
cohomological strict commutation) are explicitly *not yet built* — they live in
libraries that do not exist in the kernel. The honest summary: the kernel is the
complete, tested, self-contained *value-and-descent floor*, and it has carefully left
sockets — `tabulate`, `compare`, the two traces — for the invariants that turn the
floor into the "shadows" claim. Reading it whole, the system is smaller and more
deliberate than its vocabulary suggests: four bits of decision (two slots, two orders)
generate everything else.
