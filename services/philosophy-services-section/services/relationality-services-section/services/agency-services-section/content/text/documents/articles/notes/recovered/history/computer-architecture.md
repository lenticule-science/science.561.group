# The architecture the theory implies — @561-group/computer

> Status: design only. This document derives the layered architecture that
> @561-group/computer's OWN theory (`docs/dev/journal/2026-06-04-what-kind-of-computer-this-is.md`
> and `docs/dev/notes/`) implies, and organizes the extracted tooling (the eavt/datom/triple data
> tower, the one `jcs`, the read→fold→settle substrate, posix-holography, TTMS/TFAS, the
> typed-resource-catalog, predicate-algebra, the projection packet — and the incoming
> process/federation/webapp-game pieces) into layers with theory-grounded boundaries. Claims are
> cited to the files; where this doc reasons beyond the files it says so.

## 0. The one frame

The repo's journal states the machine in one sentence: *this is a paraconsistent, non-boolean,
non-Turing computer, and the ordinary boolean Turing/von-Neumann machine is its degenerate shadow —
what you get by projecting it down its axes* (journal §0). The recurring move is **degeneracy /
projection**: the boolean is the shadow of the charge, the RDF triple is the degeneracy of the
datom, classical computing is the degeneracy of this (journal:16-17). The architecture's job is to
hold all the axes — paraconsistent values, linear evidence, aperiodic settling, typed-path
addressing, modal worlds — *as the substrate*, not as a library over a boolean machine
(journal:189-191).

So the layers below are not a stack of conveniences. Each is load-bearing structure that, if
removed, collapses the machine into its classical shadow. The test the journal gives for whether
you are still building *this* computer: **did you keep the evidence, hold the contradiction, and
avoid the clock and the winner-takes-all?** (journal:191-193).

## 1. The architectural laws

These are derived directly from the journal and notes; they govern every layer.

1. **The substrate is a charge, not a boolean.** The atom is `value=[believesTrue,believesFalse]`
   over a lossless carrier `[posWitnesses,negWitnesses]` (journal §1, citing `math/bilattice/charge`).
   Two independent bits, the Belnap–Dunn FOUR bilattice. Operations act *bitwise on the pair*; nothing
   crushes it to one bit. Boolean is a read-time projection only: *compute in knowledge; decide in
   truth; never confuse the two* (journal §1:38-39).
2. **Evidence is linear.** Witnesses are never discarded and never freely duplicated; they are
   *unioned* on the fold (journal §2). No weakening, no contraction. Re-rolling `{pos,neg}` or
   overwriting are the two named regressions (journal:64-66).
3. **The world is its append-only folded trace.** State is an append-only trace of `{e,a,v,t}`; the
   current value is the *fold* of the trace; the per-predicate "functional" lens (`supersede`) is a
   read-time latest-`t` projection, never a destructive write (`substrate.mjs:9-12,52`).
4. **Contradiction ⊤ is held; ⊥ is first-class.** A cell told both its predicate and its converse
   settles to ⊤ and is *kept* (`substrate.mjs:99-101`). ⊥ (undecided) is *forced* into the value
   algebra by Rice's theorem (journal §1:42-46; `what-is-the-theory-of-computing.md:14,29`). Negative
   evidence is the *converse predication*, never a polarity field (`substrate.mjs:104-106`).
5. **Address = type = name = location, one act.** The directory tree IS the type language:
   `library/X` = X is a term, bare `X` = a morphism, `hacking/X` = admitted without derivation, and
   `/hacking/` depth = open-derivation depth (TRC README; journal §4). The path is the resource's
   categorical identity under the Yoneda embedding of the POSIX path category (journal §4:99).
6. **Routing is conformance.** A specific kind is reached only by *restriction* (a MUST predicate)
   and affixed structure only by *extension*; each node owns its `restrict.mjs`; routing a path to its
   deepest inhabited kind IS validating it (TRC README).
7. **The runtime settles, it does not tick.** Advance is by Knaster–Tarski least-fixed-point closure,
   monotone in knowledge, stratified across four regimes `articulate/aperiodic → predicate/transfinite
   → posit/scott-continuous → settle/finite` (journal §3; TRC README). A "tick" is a transaction
   boundary, not a heartbeat (journal:80-86).
8. **Content is identity via one jcs.** `id = sha256(jcs(value))` (`datom.mjs:13,45`). Exactly one
   RFC-8785 canonicalize exists, already at the `./json` export; never hand-roll, never
   `JSON.stringify` for identity (node-packages note:14,66-69; journal:163).
9. **Memory is a linear-logic proposition.** EAVT read as `Entity × ⟨Predicate,Object⟩ → charge` is
   exactly a Dialectica object `(U,X,α)` and a Chu space over FOUR; the Chu dual is the linear
   negation `(−)^⊥` (journal §2:53-59; `dialectica-category.md`).
10. **Federation is the tensor ∥; merge is G-Set union + fold; no coordinator.** Disjoint-union event
    logs, no causality between polities (`concurrent-game-system.md:161`); CALM + paraconsistency makes
    merge coordination-free, disagreement absorbed as ⊤ (journal:172-175).
11. **Math never imports computer.** The math is `@561-group/math`'s, imported by name; nothing here
    re-implements it (package.json description).
12. **Effect's runtime stays out of the stateless core** (node-packages note:80-82).

## 2. The layers

The computer is a strict dependency DAG: `L0 ← L1 ← L2 ← L3 ← L4 ← L5 ← L6 ← L7 ← L8 ← L9`, with
`math` (L0) importing nothing from computer.

### L0 — Kernel (imported, not built here)
The pure paraconsistent mathematics: the FOUR bilattice, the charge atom over its lossless carrier,
the involutions `negate`/`conflate`, `joinKnowledge`, Chu/Dialectica over FOUR, the `void` aperiodic
monad (`saturate`/`twistor`/`precipitate`/`estrange`), and the four-regime descent to a Knaster–Tarski
fixed point. **Theory:** Eff over Kleene's K₁ supplies computable evidence and forces ⊥ via Rice;
FOUR is the image of Ω_Eff under the double-negation nucleus (`what-is-the-theory-of-computing.md:74`).

### L1 — Schema (canonical dataclasses)
One source of truth for the shape of every value that crosses a boundary: charge, evidence-carrier,
`{e,a,v,t}` eavt row, `{e,a,v,tx,op}` datom, `{s,p,o}` triple, cell, charged-cell, folded section,
settled section `{affirmed,denied,contradicted}`, TFAS address, subscription frame. Authored as
**TypeBox** schemas that *are* JSON Schema and infer as TS types (`Static<typeof T>`), validated by
the **Ajv** already in the tree. The paraconsistent structure is encoded structurally so a
boolean-only shape is not derivable by accident. **Theory:** TypeBox is JSON-Schema-native with zero
impedance against Ajv (node-packages note:11,36-45); the degeneracy tower is a forgetful projection
chain (`triple.mjs:3-7`).

### L2 — Identity (one jcs, one hash)
The single RFC-8785 `jcs` (already the `./json` export) and the sha256 addresses `rowId`/`datomId`/
`tripleId` built on it. Everything above addresses by content through here. **Theory:** content
identity via one blessed canonicalize (node-packages note:66-69); `id = sha256(jcs(value))`
(`datom.mjs:13,45`); Yoneda identity-by-content (journal §4:99).

### L3 — Trace algebra (read→fold→settle, pure)
The general eavt trace algebra: G-Set `dedupe`, the `supersede` read-lens, `relate`/`relateFrom`,
reified-row identity, `fold` (trace → settled section of charged cells via `joinKnowledge`, evidence
unioned, ⊤ held), `settle` (supersede then fold), `section` (project to
`{affirmed,denied,contradicted}`). Datom's transactional `currentValue` sits beside it for the
last-writer fragment. Entirely pure — no `node:fs` (`substrate.mjs`). **Theory:** the world is its
folded trace; supersede is a read-lens not a write; negative evidence = converse predication; EAVT as
a Dialectica/Chu object (journal §2; `substrate.mjs:96-186`).

### L4 — Membrane (POSIX ↔ voidmath, the only I/O)
The `node:fs` ↔ kernel membrane: read a POSIX file as a voidmath articulation and write it back;
descend the file taxonomy by content-sniff + JSON-Schema validation; append/read/settle eavt logs on
disk. The *only* layer that touches the filesystem. Returns `Result`, never throws. **Theory:** read =
articulate — lift a path into the utterance, return the cell; no higher than POSIX (TRC README).

### L5 — Catalog (the typed POSIX taxonomy)
Voidmath over the POSIX path carrier: the directory tree AS the type language. Owns the
`path→object→attribute→file` chain (`cell→fiber→presheaf→sheaf`) and the file taxonomy off the
sheaf-end; each node owns its `restrict.mjs` MUST-predicate; `witness` routes a path to the deepest
kind it inhabits. Hosts the canonical data-shape nodes (eavt/datom/triple/json/schema) at their typed
paths. Carries epistemic status via `/hacking/` depth. **Theory:** routing IS conformance;
restriction/extension are the only moves; path-as-judgment under Yoneda (TRC README; journal §4).

### L6 — Addressing (term ⇄ typed-filepath)
**TFAS**: the lossless, type-parametric codec between terms (`creatures/ada`) and typed filepaths.
Zero dependencies. **TTMS**: pins type=`jsonl`, logs append-only EAVT datoms at a term's path,
dual-filed at the subject (`e`) and predicate (`a`) anchors, read folded — term-addressed memory =
TFAS coordinates + L4 bytes + L3 fold. **Theory:** worlds = typed paths; allocation = introducing a
value at a world (journal §5); dual-filing makes the POSIX tree the index (journal §4:100,107-114).

### L7 — Interpretation (rules-as-data)
The memory interpreter: a settled section + a predicate-knowledge memory, applying rules
(`negates`/`functional`/`believe`) that alias kernel morphisms, projecting to
`{affirmed,denied,contradicted}`. No disk. The rule algebra IS data — a predicate's functionality is
read from cells, not config. **Theory:** projection onto truth at decision-time (journal §1:38);
functionality-as-parameter (`substrate.mjs:38-48`).

### L8 — Projection (dataform → display)
**SHP**: consume a subject and its charged cells and emit a self-contained RFC-7992 HTML packet,
carrying evidence in `data-*` attributes. Zero dependencies. The read-only API target for the
charged-cell atom. **Theory:** the display is a lossy read; never drop witnesses (linearity at the
display end).

### L9 — Federation, process, realtime (the incoming envelope)
The ambient *-autonomous structure that composes whole subsystems: **federation** as the tensor ∥
(disjoint-union logs from any replica, merged by G-Set union + fold, ⊤ held, no coordinator); a
**process/strategy model** from swarm (concurrent strategies over event structures, with
receptivity/innocence/symmetry-invariance as the composition axioms); **realtime** subscription frames
over the settled trace; the **webapp-game engine** host. This is the only layer where Effect's runtime
may live. **Theory:** federation = tensor ∥ (`concurrent-game-system.md:161`); composition =
parallel-composition-plus-hiding preserving the three axioms (`concurrent-game-system.md:175`); CALM +
paraconsistency (journal:172-175).

## 3. How the bits compose

- **Data tower (degeneracy):** `datom {e,a,v,tx,op} → eavt {e,a,v,t} → triple {s,p,o} → pair → unary`,
  each a forgetful projection of the one above (`triple.mjs:3-7`), all canonicalized through the one
  `jcs`, stored as jsonl. `datom` is the last-writer/transactional fragment (`currentValue`); `eavt`
  is the paraconsistent held-contradiction fragment (`fold`). Pick the row by the job (`datom.mjs:8-9`).
- **Substrate fold (the one metacircle):** `eavt-read` (L4) → `supersede` (L3 read-lens) → `fold` (L3
  joinKnowledge per cell, evidence unioned, ⊤ held) → `section` (L3 projection). Ingest ≡ merge:
  folding in another replica's articulated rows IS reconciliation (`substrate.mjs:96-186`; journal:179).
- **Substrate fold as a Dialectica object:** the folded section IS a Chu/Dialectica object
  `Entity × ⟨Predicate,Object⟩ → charge` over FOUR; the Chu dual is `(−)^⊥`; `negate`/`conflate` are
  the Klein-four gauge (journal §2:53-59). L3 is the operational fold; L0/math is its categorical
  license. This is what makes L9's merge a *-autonomous tensor, not an ad-hoc union.
- **Process / runtime (aperiodic):** the four-regime descent runs over the path carrier (L5) and the
  trace carrier (L3); a transaction is one settle to a least fixed point. L9 strategies compose by
  parallel-composition-plus-hiding, settling to the least fixed point of strategy refinement. Re-settle
  from any point is deterministic — replayability (journal:179-181).
- **Memory / addressing (address=type=name=location):** L6 TFAS encodes a term to a typed catalog
  path (L5); TTMS writes append-only datoms there via L4, dual-filed; reads fold via L3. The POSIX tree
  IS the index (`find . -path '*/hacking/*'` queries unproven theorems) — no B-tree (journal §4).
- **Federation (tensor ∥):** each replica keeps its own append-only logs at canonical term-addresses;
  merge = G-Set union (idempotent/commutative/associative by content id from L2) + re-fold (L3). Same
  fact from two replicas → one cell; genuine disagreement → ⊤ with both witnesses, never deadlock.
- **Projection (settled → display/verdict):** L7 interprets to `{affirmed,denied,contradicted}`; L8
  projects to RFC-7992 HTML; L9 realtime wraps settle in subscription frames. Every projection is lossy
  by design — the charge trace stays the source of truth. *Compute in knowledge (L0–L6); decide in
  truth (L7–L9).*

## 4. Engineering choices

- **TypeBox** authors the canonical dataclasses (L1) as JSON-Schema objects inferring TS types; one
  schema validates (Ajv 2020-12) and types at once. No Zod, no hand-written types. Land schemas at
  their typed catalog paths so address=type holds for schemas too.
- **neverthrow** supplies `Result`/`ResultAsync` at the I/O boundary (L4) and validators; no throw.
  The current throwing constructors migrate to `Result` (`datom.mjs:25,29`; `substrate.mjs:115-117`).
- **ts-pattern** dispatches the FOUR states, the datom `op`, the routed file-kind, and the section
  buckets with `.exhaustive()` so a new value cannot be silently dropped.
- **canonicalize (RFC-8785)** — or the existing zero-dep hand-roll — behind the single `jcs` (L2),
  already imported as `#jcs` (`datom.mjs:16`, `triple.mjs`, `substrate.mjs:20`). Exactly one in the
  whole computer.
- **node:crypto** computes sha256 inside `rowId`/`datomId`/`tripleId` once, centrally (L2).
- **tinyglobby** for catalog filesystem walks (L5).
- **Effect's fiber runtime is forbidden below L9.** L0–L8 are pure functions on immutable shapes,
  portable to browser/worker/embedded. Effect (or its ~5kb `Micro`) is eligible only in the L9
  engine/orchestration if queues/refs/fibers are genuinely needed. A lint guard should fail if any
  L0–L8 module imports Effect, making the boundary mechanical.

## 5. The build plan (executed only when computer/ is idle)

1. Write this design doc into `docs/dev/notes/`.
2. Stand up `computer/schema/` (L1) TypeBox schemas at their typed paths; add TypeBox; validate
   existing shapes against new schemas. (medium risk)
3. Lock the L2 identity seam: assert one `jcs`, add a singularity guard test. (low)
4. Introduce neverthrow at L4 + the L1 validators; ts-pattern on the unions; thin adapters so nothing
   breaks in one move. (high)
5. Wire/assert the L3↔L4 pairing; add a read→fold→settle→section e2e proving ⊤ held + evidence unioned.
   (medium)
6. Formalize TTMS dual-filing (subject + predicate anchor); test reconstruction from either anchor.
   (medium)
7. Stand up the L9 federation seam: `federate = G-Set union + re-fold`, proving CRDT laws + ⊤-on-conflict.
   (medium)
8. Mine the swarm process model into an L9 strategy module — *only after L1–L7 are schema-typed and
   Result-wired* — replacing any incoming hand-rolled substrate with L3, never adapter-wrapping it. (high)
9. Add the L9 realtime/subscription wrapper + engine; confine Effect's runtime here. (high)
10. Author per-layer README/AGENTS docs and a top-level layer map (each per its typed-resource spec),
    stating each layer's role, single morphism pair, and allowed imports, freezing the seams. (low)

## 6. Open tensions (genuine, to resolve in build)

- **datom vs eavt — two folds, one tower.** The last-writer fragment (`currentValue`) silently
  re-imports "pick a winner" if used by default. Admit datom only at explicit interop boundaries with a
  recorded waiver; default to eavt everywhere (datom.mjs:6-9; journal:159).
- **Where is the *-autonomous symmetry realized?** Content-identity-by-jcs may suffice as the thin-
  symmetry quotient (commuting ops → same canonical row → same cell, journal:139-142), but non-commuting
  genuine causal deps (directed paths) have no representation beyond folding to ⊤. Decide whether an
  explicit coherence/symmetry module is needed.
- **Modal worlds / allocation are mostly inference.** Journal §5 is self-flagged as reasoning, owing a
  read of `math/type-theory` (journal:117,195-197). Typed-path=world is settled for addressing; the
  modal operators as allocation primitives are not yet derived. Decide: build on inference now or block
  the modal layer until the spec is read.
- **The Effect boundary at L9 will be pushed.** Govern it mechanically with an import-audit guard, not
  just documentation.
- **The incoming process model risks re-importing the drawer of gadgets.** If swarm code arrives with
  its own hand-rolled substrate, replace it with L3 — do not adapter-wrap it.
- **Bootstrap circularity** between L1 schemas and the L5 catalog (the schema for "what an eavt node
  IS" lives at the eavt node). Scaffold the path skeleton first, accept `/hacking/` placeholders until
  both settle.
