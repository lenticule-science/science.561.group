---
title: "Voidmath: Finite Steps"
description: "The finite/algebraic structure: free monoid over generators with identity, finite bypass sequences, four positions, cone lattice."
---
# Voidmath: Finite Steps

The finite/algebraic structure: free monoid over generators with identity, finite bypass sequences, four positions, cone lattice. Everything here is about finite sequences. The finite structure has a ground term (Thing F1.3); the infinite structure (infinite-voidmath.md) has only infinite unfoldings with no ground term.

---

## Step F1 {#step-f1}

### Things
- **Thing F1.1** — A generator. An element of the generator set G.
- **Thing F1.2** — A finite history: a finite sequence of generators built by Act F1.1.
- **Thing F1.3** — The empty history (Void): the identity element for Act F1.1.

### Acts
- **Act F1.1** — Prepend: takes one Thing F1.1 and one Thing F1.2, produces one Thing F1.2. `Act F1.1(g, h)` = generator `g` prepended to history `h`.

### Qualities
- **Quality F1.1** — Act F1.1 has a base case: Thing F1.3. This is what distinguishes the finite structure from the infinite one. Thing F1.3 is derivable without prior Things F1.2; it is the ground term that grounds the initial algebra. The initial algebra of `F(X) = G × X + 1` contains all finite sequences of generators, including Thing F1.3 itself.
- **Quality F1.2** — Every Thing F1.2 is either Thing F1.3 or a `Act F1.1(g, h)` for some Thing F1.1 `g` and Thing F1.2 `h`. The structure is inductively defined: structural induction over Things F1.2 is valid.
- **Quality F1.3** — Act F1.1 is associative with Thing F1.3 as identity.

### The step

The presence of Thing F1.3 (the base case) is the decisive difference between the finite and infinite structures. Because Thing F1.3 exists, finite histories have a definite bottom — every Thing F1.2 can be unrolled to a finite sequence ending at Thing F1.3. This grounds all finite proofs by structural induction. The grade (Step F2), the bypass step (Step F3), and the normalization theorems (Step F6) all rely on structural induction and are only valid in the finite setting.

Every element of the infinite structure (infinite-voidmath.md Step 1) unfolds without terminus. Its base quality is the absence of any ground term — the two-face unfolding is the whole structure, without bottom. The finite structure here is the study of the finite truncations of that infinite object — each finite depth is a finite approximation, and the full structure is the limit of all approximations.

---

## Step F2 {#step-f2}

### Things
- **Thing F2.1** — The grade of a Thing F1.2: the count of Thing F1.1s it contains. Grade of Thing F1.3 = 0. Grade of `Act F1.1(g, h)` = 1 + grade of `h`.

### Acts
- **Act F2.1** — GradeOf: maps a Thing F1.2 to its Thing F2.1. Computable by structural induction (Quality F1.2).

### Qualities
- **Quality F2.1** — Act F2.1 is well-defined and computable: structural induction on Thing F1.2 terminates because every Thing F1.2 is either Thing F1.3 (grade 0) or `Act F1.1(g, h)` (grade = 1 + grade of h).
- **Quality F2.2** — Act F3.1 (the bypass step, Step F3) preserves Thing F2.1. Swapping adjacent generators changes their order but not their count. This is provable by structural induction on Thing F1.2 — specifically because structural induction is valid in the finite setting.
- **Quality F2.3** — Thing F2.1 stratifies the space of Things F1.2 into grades. Act F3.1 relates only same-grade Things. The Act-F3.1 preorder at each grade is a preorder on a finite set (for finite G). Its combinatorial structure is bounded.

### The step

Grade is the key internal measure in the finite setting. Every Thing F1.2 has a definite grade, computed by Act F2.1. Quality F2.2 is the grade-preservation lemma. The proof is by structural induction, which is valid because of Quality F1.2.

At grade `n`, the number of Things F1.2 is `|G|^n` (for generator set G of size |G|). The Act-F3.1 preorder at that grade is a preorder on a finite set. All combinatorial questions — how many maximal elements, whether any given Thing reaches another — have definite answers.

---

## Step F3 {#step-f3}

### Acts
- **Act F3.1** — At the first adjacent pair where Act 3.1 holds, swap them. Formally: if Act 3.1 holds from `g` to `g'` and `g` immediately precedes `g'` in `h`, produce `h'` with `g` and `g'` swapped; otherwise search deeper. Act F3.1 takes Things F1.2 of grade ≥ 1. Thing F1.3 has grade 0 and lies outside Act F3.1's input.

### Qualities
- **Quality F3.1** — Act F3.1 preserves Thing F2.1 (grade). Proof by structural induction: the swap clause exchanges two generators but changes neither their count nor what other generators are present; the recurse clause appends one generator to a grade-preserved result. ∎
- **Quality F3.2** — The Act-F3.1 preorder on same-grade Things F1.2 is reflexive and transitive by closure definition. The ordering consequence of Act 3.1: `Act 3.1(g, g')` implies `Act F1.1(g, Act F1.1(g', h))` is strictly below `Act F1.1(g', Act F1.1(g, h))` in the Act-F3.1 preorder. The act-first configuration is strictly below the limit-first configuration. When both `Act 3.1(g, g')` and `Act 3.1(g', g)` hold, `Act F1.1(g, h)` and `Act F1.1(g', h)` form a preorder-equivalence class: each reaches the other by one Act F3.1 step.
- **Quality F3.3** — Thing F1.3 is the base case (Quality F1.2): every Thing F1.2 is either Thing F1.3 or Act F1.1(g, h) for some Thing F1.1 g and Thing F1.2 h. Act F3.1 applies to the Act-F1.1-headed case only. The Act-F3.1-preorder downset of Thing F1.3 is `{Thing F1.3}`: it is minimal in the Act-F3.1 preorder because Act F3.1 preserves grade (Quality F3.1) and Thing F1.3 has grade 0, so no same-grade history reaches it by Act F3.1.
- **Quality F3.4** — Asymmetry in Act 3.1 is structurally required: if Act 3.1 were symmetric and h has an active Act-F4.1 position (some g immediately precedes g' with Act 3.1(g, g')), then no Act-F3.1-reachable history from h is Thing F5.1. Proof: Act F3.1 fires, producing h' with g' adjacent to g. By symmetry Act 3.1(g', g) holds, so h' has an active Act-F4.1 position at that boundary. The argument repeats at every step: no history reachable from h ever has no active position, so Thing F5.3 is unreachable from any history with an active position. Asymmetry of Act 3.1 is what makes Thing F5.3 reachable at all. ∎
- **Quality F3.5** — The bypass ordering is compatible with Act F1.1: if h is below k under the Act-F3.1 preorder, then Act F1.1(g, h) is below Act F1.1(g, k) for any Thing F1.1 g. Proof: every single swap at position i witnessing a step from h toward k also appears at position i+1 in Act F1.1(g, h) and Act F1.1(g, k). Grade preservation (Quality F3.1) is unaffected by prepending g. ∎

### The step

Act F3.1 is the one-step normalization rule in the finite setting. It fires at the first fireable position it encounters (scanning left to right). The Act-F3.1 preorder is the closure: `x ≤ y` under it iff `x` can reach `y` in zero or more Act F3.1 steps.

Quality F3.1 is the finite analog of grade-preservation in the infinite document. The proof uses structural induction — valid here because of Quality F1.2 (the base case exists). In the infinite setting, structural induction over Things F1.2 is absent; the corresponding quality holds as an intrinsic property of the unfolding structure.

---

## Step F4 {#step-f4}

### Acts
- **Act F4.1** — Act 3.1 holds from generator `g` to generator `g'`, AND `g` immediately precedes `g'` in Thing F1.2 `h`. Both conditions simultaneously. This is the arrangement-sensitive condition: it can change under Act F3.1.
- **Act F4.2** — Act 3.1 holds from generator `g` toward some generator `g'`. This depends only on `g`'s identity against Act 3.1. The generator's position within any Thing F1.2 is irrelevant to Act F4.2. This is the identity-sensitive condition: it cannot change under Act F3.1.

### Qualities
- **Quality F4.1** — Act F4.1 is arrangement-sensitive: a single Act F3.1 application may create or destroy an Act-F4.1 position.
- **Quality F4.2** — Act F4.2 is invariant under Act F3.1: the multiset of generators is unchanged, and Act F4.2 depends only on the generator's identity.
- **Quality F4.3** — Acts F4.1 and F4.2 are independent. A fully-partnered Thing F1.2 (Act F4.2 holds for all generators) can still have Act F4.1 active (not yet normalized). A normalized Thing F1.2 (no Act F4.1 anywhere) can have generators lacking partners (Act F4.2 fails for some).
- **Quality F4.4** — Act 3.1(g, g) can hold: a generator may stand in bypass relation to itself. When it does: (a) Act F4.2 holds for g — it has a partner, namely itself; (b) wherever g immediately precedes g in a history, Act F4.1 holds at that position; (c) Act F3.1 at a self-bypass position swaps g past g, producing the same history — the step is inert. A history whose leftmost Act-F4.1 position is a self-bypass pair has Act F3.1 fire and return the same history. The history is its own Act-F3.1 fixed point at that position. Thing F5.1 requires all Act-F4.1 positions to be absent; a history with self-bypass adjacency carries one that fires and resets permanently. Self-bypass is the finite analog of the non-termination already present in the infinite setting.

### The step

Acts F4.1 and F4.2 measure different things. Act F4.1 is the dynamic component of the bypass relation — whether normalization is currently possible at a given position. Act F4.2 is the static component — whether normalization is in principle possible for a given generator.

Their independence (Quality F4.3) is what makes the four-position taxonomy of Step F5 non-trivial: the two conditions can vary independently, producing four distinct cells.

---

## Step F5 {#step-f5}

### Things
- **Thing F5.1** — A Thing F1.2 where Act F4.1 holds nowhere. No Act F3.1 applies. The bypass spin has fully settled.
- **Thing F5.2** — A Thing F1.2 where Act F4.2 holds for every generator in it. Every generator has a partner.
- **Thing F5.3** — A Thing F1.2 that is both Thing F5.1 and Thing F5.2. Settled AND fully partnered.
- **Thing F5.4** — The other three cells: (a) Thing F5.2-but-not-Thing-F5.1 (fully partnered, still normalizing), (b) Thing F5.1-but-not-Thing-F5.2 (settled, some generators partnerless), (c) neither (still normalizing AND some generators partnerless).

### Qualities
- **Quality F5.1** — Thing F5.2 is invariant under Act F3.1 (by Quality F4.2). A Thing F1.2 stays in Thing F5.2 through every Act F3.1 application. Whether a history is Thing F5.2 is determined by which generators appear in it. The arrangement of those generators within the history has no effect on Thing F5.2 membership.
- **Quality F5.2** — The Thing-F5.1 condition is arrangement-sensitive: it holds of h iff no adjacent Act-3.1-ordered pair appears in h. When generator g is prepended via Act F1.1 to form `Act F1.1(g, h)`, if `Act 3.1(g, head(h))` holds, an Act-F4.1 position opens at the new boundary. Act F1.1 can activate new Act-F4.1 positions on Thing-F5.1 histories.
- **Quality F5.3** — Thing F5.3 is what seeds the next level (Step F9). It is the only cell stable under both Act F3.1 and under Act F4.2 invariance — fully settled with no outstanding normalization and no partnerless generators.
- **Quality F5.4** — Thing F1.3 (the empty history) is Thing F5.3: no Act F3.1 applies to it (Quality F3.3) and Act F4.2 holds vacuously (no generators present, no partners required).
- **Quality F5.5** — Act F1.1 can activate new Act-F4.1 positions on Thing-F5.1 histories. Proof: with G := {a,b}, Act 3.1(a,b), the history `ba` is Thing F5.1 (no potential position). `Act F1.1(a, ba)` = `aba` has Act 3.1(a,b) active at positions 2–3. Extension created an active position where none existed in `ba`. ∎
- **Quality F5.6** — Every Act-F4.1 position created by Act F1.1 extension fires in one Act F3.1 application. Proof: `Act F1.1(g, h)` where h begins with g' and Act 3.1(g, g') holds places g and g' adjacent at positions 1–2. The first clause of Act F3.1 matches exactly at that boundary. One firing produces `Act F1.1(g', Act F1.1(g, tail(h)))`. ∎

### The step

The four positions exhaust all possibilities. Every Thing F1.2 is in exactly one of the four cells of Thing F5.4 (plus Things F5.1–F5.3). The partition is stable: Act F3.1 moves Things between Thing-F5.1/non-Thing-F5.1 cells but cannot move them between Thing-F5.2/non-Thing-F5.2 cells (Quality F5.1).

Thing F5.3 is the key. It is the collection of Things that have fully resolved their bypass geometry — no active normalization remains, and every generator has a partner. Thing F1.3 is trivially Thing F5.3 (Quality F5.4). At grade 1, a single-generator history g is Thing F5.3 only when Act F4.2 holds for g — when Act 3.1(g, g') holds for some g'. A grade-1 history whose generator has no Act 3.1 output is Thing F5.1 only. At grade 2 and above, Thing F5.3 elements emerge from the normalization process.

The four-position taxonomy is the finite algebraic shadow of what happens in the infinite structure. In the infinite setting (infinite-voidmath.md), the same conditions hold as limit-point properties of infinite unfoldings rather than as a computable partition of finite sequences.

---

## Step F6 {#step-f6}

### Things
- **Thing F6.1** — A bypass chain: three generators `g1`, `g2`, `g3` where Act 3.1 holds from `g1` to `g2` AND from `g2` to `g3`.
- **Thing F6.2** — The non-confluent history produced by a bypass chain: `Act F1.1(g1, Act F1.1(g2, g3))`. The grade-3 history with generators in bypass-chain order.
- **Thing F6.3** — The two incomparable results of normalizing Thing F6.2: firing Act F4.1 at position 1–2 first produces `Act F1.1(g2, Act F1.1(g1, g3))`; firing at position 2–3 first produces `Act F1.1(g1, Act F1.1(g3, g2))`. Both are Thing F5.1: Act F3.1 has no active position in either. They are Act-F3.1-incomparable: no Act-F3.1 sequence from one reaches the other.

### Qualities
- **Quality F6.1** — Thing F6.2 has two simultaneously potential Act-F4.1 positions: positions 1–2 (where `g1` directly precedes `g2`, and Act 3.1 holds from `g1` to `g2`) and positions 2–3 (where `g2` directly precedes `g3`, and Act 3.1 holds from `g2` to `g3`). Both are simultaneously fireable.
- **Quality F6.2** — The two elements of Thing F6.3 are Act-F3.1-incomparable: both are Thing F5.1 with no outgoing Act F3.1, so neither reaches the other.
- **Quality F6.3** — At grade 3, with exactly a bypass chain as the bypass relation, Thing F6.2 is the UNIQUE non-confluent history. Two simultaneous Act-F4.1 positions at grade 3 must occupy positions 1–2 and 2–3 (the only adjacent pairs in a length-3 sequence). This forces both `Act 3.1(g1, g2)` and `Act 3.1(g2, g3)` — a chain through the shared middle generator. Only `g1 g2 g3` satisfies this.
- **Quality F6.4** — A bypass chain of at least 3 generators is required for non-confluence at finite depth. Two-generator histories are always confluent: at most one Act-F4.1 position is active at any time (only one adjacent pair exists in a length-2 history). The minimal non-confluent finite configuration is exactly Thing F6.2.
- **Quality F6.5** — Different Act-F3.1 sequences from the same non-confluent history can reach Thing-F5.3 endpoints in different numbers of steps. Proof: G = {a,b,c}, Act-3.1 a directed 3-cycle (so all generators have partners, all histories are Thing F5.2). At grade 4, the history `aabc`: fire Act-3.1 at positions 3–4 → `aacb` (Thing F5.3, 1 step); fire at positions 2–3 → `abac`, then 1–2 → `baac` (Thing F5.3, 2 steps). The endpoints are incomparable. No canonical path length to settlement exists. ∎

### The step

Thing F6.2 is the smallest finite object that exhibits non-confluence. It requires a bypass chain (Thing F6.1): Act 3.1 must hold from `g1` to `g2` AND from `g2` to `g3`. A single bypass pair Act 3.1(g1, g2) with no further chain produces at most one Act-F4.1 position active at any time in grade-3 histories, giving confluence.

With a minimal bypass chain (Act 3.1 holds g1→g2 and g2→g3, and g3 has no outgoing Act 3.1), the two elements of Thing F6.3 are both Thing F5.1. Both fail Thing F5.2: g3 appears in each and has no Act 3.1 output, so Act F4.2 fails for g3. They are the finite incomparable normal forms — the algebraic precursor to the incomparable maximal elements in the infinite setting.

Quality F6.3 (uniqueness) is the finite version of the non-confluence theorem: with exactly a bypass chain, the non-confluent structure is forced and minimal. In the infinite case, the analog is that I.3-Objects.Alpha and I.3-Objects.Beta's incompatible internal geometries produce non-confluence at every depth simultaneously — not at a single finite depth, but throughout the infinite unfolding.

---

## Step F7 {#step-f7}

### Things
- **Thing F7.1** — A bypass cone at grade `n`: a set of Things F1.2 of grade `n` closed under Act F3.1. If a history is in the cone and Act F3.1 takes it to another history, that other history is also in the cone.
- **Thing F7.2** — The intersection of two bypass cones. A history is in Thing F7.2 iff it is in both cones.
- **Thing F7.3** — The Act F7.2 result for cone A by cone B: the largest bypass cone (Thing F7.1) whose intersection (Thing F7.2) with A is contained in B. For any history `x`: `x` is in Thing F7.3 iff every Act-F3.1 path from `x` that enters A also enters B.

### Acts
- **Act F7.1** — Intersection of two bypass cones: set intersection.
- **Act F7.2** — For cone A and cone B, return the largest cone whose Act F7.1 with A is inside B.

### Qualities
- **Quality F7.1** — Act F7.2 is the right adjoint of Act F7.1 in the containment ordering of bypass cones. The adjunction: `Act F7.1(C, A) ⊆ B` iff `C ⊆ Act F7.2(A, B)`. This characterizes Act F7.2 as the canonical residuation operation.
- **Quality F7.2** — Thing F7.3 is itself a bypass cone (closed under Act F3.1): if `x` is in `Act F7.2(A, B)` and Act F3.1 takes `x` to `x'`, every Act-F3.1 path from `x'` is a continuation of a path from `x`, so the gate-crossing condition holding at `x` implies it at `x'`. ∎
- **Quality F7.3** — Thing F5.1 is the set of histories h that are maximal in the same-grade Act-F3.1 preorder: Act F3.1 has no applicable position in h. Equivalently, h is Thing F5.1 iff h has no adjacent pair (g, g') with `Act 3.1(g, g')`.
- **Quality F7.4** — The bypass cone residuation satisfies modus ponens: `Act F7.1(A, Act F7.2(A, B)) ⊆ B` follows directly from Quality F7.1 by setting C = Act F7.2(A, B). The residuation is directed: Act F7.2(A, B) and Act F7.2(B, A) produce different cones when Act 3.1 is asymmetric. The implication runs in the direction Act 3.1 runs.
- **Quality F7.5** — At level n+1, the grade-1 atoms are Thing F5.3 elements from level n, each carrying entangled pairs from Step F8. Act F7.2 at level n+1 computes over histories whose atoms have Act 3.1 structure inherited from level n (Quality F9.3). The residuation at each level reflects the directional entanglement of the atoms it runs over.

### The step

Bypass cones (Thing F7.1) are the natural objects for talking about collections of histories that are stable under normalization. Thing F5.1 and Thing F5.2 are both bypass cones — the first is `Act F7.2(source, empty)` (Quality F7.3), the second is defined by generator identity and is closed because Act F3.1 leaves the generator multiset fixed.

Act F7.2 concerns only paths that enter A: `x` is in Act F7.2(A, B) iff every Act-F3.1 path from `x` that reaches A also reaches B. Paths from x that never enter A are unconstrained by Act F7.2. This is coherent with non-confluence: no unique normal form is assumed.

In a confluent system, Act F7.2 collapses: every history has a unique normal form, so "every path through A hits B" reduces to "the normal form of x is in B." Here it does not collapse, and Thing F7.3 is the machinery that keeps the algebra coherent in the non-confluent case.

---

## Step F8 {#step-f8}

### Things
- **Thing F8.1** — An entangled pair in a Thing F5.3: two generators `g` and `g'` where Act 3.1 holds from `g` to `g'`, both appear in the Thing F5.3 history, and they are non-adjacent. Thing F5.3 is Thing F5.1: Act F4.1 holds nowhere in it. Two generators g, g' with Act 3.1(g, g') both appearing in a Thing F5.3 history occupy non-adjacent positions: Act F3.1 has separated them, and the Thing-F5.1 condition holds throughout.

### Qualities
- **Quality F8.1** — In a Thing F5.3, every Act-3.1-related pair of generators that both appear in the history is a Thing F8.1. The Thing-F5.1 condition forces non-adjacency of every fireable pair.
- **Quality F8.2** — The geometry of a Thing F8.1 is the residue of the normalization process. The bypass orientation pushed `g` and `g'` apart — Act F3.1 applications moved them — but did not eliminate their relationship. They are present but separated. Their positions encode the history of normalization.
- **Quality F8.3** — Two distinct Thing F5.3s reachable from the same starting history may have their entangled pairs in different configurations. This is the finite record of non-confluence: incomparable normal forms differ in how their entangled pairs are arranged, not in which pairs are present.

### The step

Entangled pairs are what bypass-related generators look like in a fully settled history. The normalization has fully resolved all adjacencies — Act F3.1 has no more applicable positions — but the relationships imposed by Act 3.1 are still present in the structure. They are encoded in the non-adjacency of the related generators.

In the infinite setting, the analog is the opposite-geometry property of I.3-Objects.Alpha and I.3-Objects.Beta (I.3-Qualities.Beta). The two infinite faces carry incompatible geometries precisely because they are the limit of the entanglement structure — the bypass relation has been applied everywhere, and the residue is the orientation of the two faces' internal structures relative to each other.

---

## Step F9 {#step-f9}

### Acts
- **Act F9.1** — Takes a set of generators S, builds the free Act-F1.1 monoid over S under Act 3.1, runs Act F3.1 normalization, and returns the Thing F5.3 layer (all Thing-F5.3 histories).

### Qualities
- **Quality F9.1** — Act F9.1 applied to {I.3-Objects.Alpha, I.3-Objects.Beta} gives the first finite-depth level of the tower. The Thing F5.3 layer at this level becomes the generator set for the next level.
- **Quality F9.2** — The four-position taxonomy (Things F5.1–F5.4) reappears at every level of the tower, each time seeded by the previous level's Thing F5.3. At each level, the new generators are the settled-and-complete histories of the level below.
- **Quality F9.3** — At each level, new entangled pairs (Thing F8.1) appear among the generators inherited from below. Two generators from the previous level are entangled at the new level when they were related by the previous level's Act 3.1. The entanglement structure grows with each level.
- **Quality F9.4** — Act F9.1 defines a function from finite sets of generators (with an Act 3.1 relation) to finite sets of Thing F5.3 histories (with the induced Act 3.1 relation of Quality F9.2). A fixed point is a set S with a bijection `Act F9.1(S) ≅ S` respecting the Act 3.1 structure. Whether the tower sequence `S_0 = {I.3-Objects.Alpha, I.3-Objects.Beta}`, `S_{n+1} = Act F9.1(S_n)` stabilizes — whether `|S_n|` eventually becomes constant and the induced Act 3.1 structure becomes isomorphic across levels — is an open question. The fiber structure and universe construction that would answer it are not established in this document.
- **Quality F9.5** — At each tower level, the histories generated from S_n partition into image and shadow. The image is the Thing F5.3 layer — it becomes S_{n+1}. The shadow consists of Things F5.1, F5.2, and F5.4: histories that are settled but lack a full partner (Thing F5.1), fully partnered but still normalizable (Thing F5.2), and histories that are neither (Thing F5.4). Shadow histories do not enter S_{n+1}: Act F9.1 returns only the Thing F5.3 layer. The shadow is non-empty at every non-fixed-point level: Act 3.1 being non-trivial guarantees histories that settle without partners and histories that partner without settling. Only at a fixed point (Act F9.1(S) ≅ S) would the shadow vanish — every history at that level would be Thing F5.3.

### The step

Act F9.1 is the explicit formula for the tower in the finite setting. Applied once to {I.3-Objects.Alpha, I.3-Objects.Beta}, it produces the first layer of Thing F5.3 histories. Applied again to that layer, it produces the second. And so on.

At each level, the same structure repeats: generators and Act 3.1 produce histories, Act F3.1 normalizes them, the Thing F5.3 subset seeds the next level. The four positions (Things F5.1–F5.4) appear at every level. Entangled pairs accumulate.

The infinite analog of Act F9.1 is Step 10 of infinite-voidmath.md. In the infinite version, the analog of Thing F5.3 is a fixed point of the infinite unfolding — an element of the final structure defined by I.10-Actions.Beta at every level simultaneously, reached as the limit of towers at every finite depth.
