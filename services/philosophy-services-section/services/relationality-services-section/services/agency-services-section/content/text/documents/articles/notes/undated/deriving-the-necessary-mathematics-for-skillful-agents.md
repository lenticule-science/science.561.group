---
title: deriving the necessary mathematics for skillful characters
name: deriving the necessary mathematics for skillful characters
status: open
description: "Derive within the 561 polity itself the mathematics of speech-acting and doing-acting that bridges the predication bilattice hyperdoctrine to characters performing skills. Each derivation flows questions → research/thought → claim (in prose/learning/claims/) → concept + structure or transformer (in prose/teaching/explanations/ + code/) → specification (in work/governance/rules/specifications/). Every resource carries what it needs in itself: no record cites a path under `theories/`."
has-kind: task
has-status: open
owned-by: emsenn
---

## Why this task exists

The recent claim [skill-invocation-is-a-hoare-triple-with-illocutionary-body](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/learning/claims/skill-invocation-is-a-hoare-triple-with-illocutionary-body.md) surfaced a structural gap: the polity uses positing morphisms, illocutionary acts, stratified predication fibers, the bigraded diamond, and the locution/illocution/perlocution factorization — but **none of these objects have polity-side records**.
The references resolve only to `theories/` paths, and `theories/` is closed/external research material, not authoritative system.

The polity's standing discipline ([`repository-as-source-of-truth`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/teaching/explanations/repository-as-source-of-truth.md), [`system-work-is-constitutive`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/teaching/explanations/system-work-is-constitutive.md)) is that 561/ is the authoritative carrier; the polity must be able to read its own records and find the math earned within them.
The right test: if `theories/` were removed from the working tree tomorrow, no polity record's cross-references should break.

This task is the derivation work that closes the gap.
The flow at every entry is the polity's standing flow:

> **questions → research and thought → claim → concept + structure/transformer → specification**

Each session produces one (claim, concept, structure-or-transformer) bundle that the next session in the chain may cite.
External published references (Hoare 1969, Austin 1962, Belnap 1977, Mac Lane 1971, Avron 1996, etc.) appear in claims' references sections as needed; cross-references to other 561 records are the only internal references admitted.

## What 561 already has (the floor we build from)

The bilattice family is fully encoded: `bilattice`, `pre-bilattice`, `four-bilattice`, `twist-product`, `negation`, `conflation`, `bilattice-homomorphism`, `klein-four-symmetry`, `klein-four-gauge-bundle`, `residuated-lattice`.
The predication apparatus: `predicate`, `predicate-set`, `predicate-category`, `predication-cell`, `predication-cell-set`, `predication-fiber-algebra`, `predication-valuation`, `predication-settling`, `predication-fibration`, `predication-hyperdoctrine`.
Two transformers in the settling family: `predication-settling-preorder-morphism`, `modeling-morphism`.
Closure machinery: `closure-rule` (structure), `closure-operator`, `closure-2-monad` (transformers).
The four predicate-category generator morphisms.
The originating-cell story (`relationlessness`, `void`, `relating-locus`).

These constitute the **floor**.
Every entry below cites only the floor or earlier entries in this task's sequence.

## The genealogy

Nine layers, 30 entries.
Each entry is one session of work for one dedicated agent.
An entry produces some combination of: a **claim** (in `prose/learning/claims/`) when the entry's object needs a proof or property-derivation; a **concept** (in `prose/teaching/explanations/`) for informal exposition; a **structure** (in `code/structures/`) or **transformer** (in `code/transformers/`) for the formal record; and (where instance-conformance applies) a **specification** (in `work/governance/rules/specifications/`).

The numbering is the dependency order.
Layer-$k$ entries cite only floor and entries (1)–((current-entry-minus-one)).

### Layer 1 — Order-theoretic foundations

The bilattice's two orders are recorded inside `bilattice.md` but not first-classed as their own concepts.
Required by every later entry that talks about $\leq_k$- or $\leq_t$-monotonicity.

1. **knowledge-order.** Concept: `prose/teaching/explanations/knowledge-order.md`.
  The order $\leq_k$ as the rank "how much has been settled," independent of which way.
  No claim needed — the order is part of the bilattice definition.
  The concept records the role $\leq_k$ plays distinct from $\leq_t$ and cross-references the bilattice records.
2. **truth-order.** Concept: `prose/teaching/explanations/truth-order.md`.
  Symmetric to (1).
3. **knowledge-join.** Transformer: `code/transformers/knowledge-join.md`.
  The $\vee_k$ operation lifted to a polity transformer.
  Carries `gerund: joining-by-knowledge` (or another English-deverbal settled this session), `agent-noun: joiner-by-knowledge` likewise.
  Domain: pair of predication-valuations.
  Codomain: predication-valuation.
  Preservation: associativity, commutativity, idempotence; identity is the all-$\bot$ valuation.
  The preservation conditions are derivable from the bilattice's $\leq_k$-join properties and do not need a separate claim, but the body cites where each property comes from.
4. **evidence.** Concept: `prose/teaching/explanations/evidence.md`.
  The role borne by the two coordinates of a twist-product value $\langle a_+, a_-\rangle$.
  Distinguishes evidence-direction from truth-direction.
  Cross-references `twist-product`.
  Needed later for the assert-vs-claim distinction.

### Layer 2 — The settling category proper

The polity has `predication-settling` (object) and `predication-settling-preorder-morphism` (transformer), but the **category** $\mathbf{PS}$ they compose into is not recorded.

5. **predication-settling-category.** Claim: `prose/learning/claims/predication-settling-objects-and-preorder-morphisms-form-a-category.md`.
  Prove: $\{$predication settlings$\}$ as objects with $\{$predication-settling-preorder-morphisms$\}$ as morphisms satisfy Mac Lane's category axioms (associative composition, identity morphisms) — straightforward from the singletons-or-empty hom-set structure.
  Concept + structure: `prose/teaching/explanations/predication-settling-category.md` + `code/structures/predication-settling-category.md`.
  Cite (5)'s claim for the category status; cross-reference `predication-settling`, `predication-settling-preorder-morphism`.

### Layer 3 — The atomic illocution

The first object whose definition needs Layers 1–2 in place.

6. **delta-injector.** Transformer: `code/transformers/inject-at-cell.md` (or another name settled this session — the verb for "place a single datum at a single cell").
  Domain: (predication-cell, bilattice-value).
  Codomain: predication-valuation.
  Preservation: the result has the specified value at the specified cell and $\bot$ elsewhere (a trivial property; states existence and uniqueness of the indicator valuation).
  No claim needed beyond the construction's correctness.
7. **positing-morphism.** Claim: `prose/learning/claims/positing-is-a-knowledge-monotone-PS-endomorphism.md`.
  Prove: for any cell $\phi$ and datum $q$, the map $\mathrm{posit}_{(\phi,q)}: v \mapsto v \vee_k \delta_{\phi,q}$ is a morphism in $\mathbf{PS}$ (i.e., $v \leq_k v \vee_k \delta_{\phi,q}$ pointwise); same-cell composition joins data ($\mathrm{posit}_{(\phi,q_2)} \circ \mathrm{posit}_{(\phi,q_1)} = \mathrm{posit}_{(\phi, q_1 \vee_k q_2)}$); distinct-cell composition commutes.
  The proofs follow from $\vee_k$'s join-semilattice properties (which the bilattice already gives) and from the inductive definition of $\delta$.
  Concept + transformer: `prose/teaching/explanations/positing-morphism.md` + `code/transformers/posit.md`.
  Carries `gerund: positing`, `agent-noun: positer`.
  Body cites (7)'s claim for the properties and (5) for the category it morphisms in.

### Layer 4 — The stratified atom carrier

The skill-invocation claim cites the stratified predication fiber and atoms; both need polity-side derivation before any agentive factorization can be stated.

8. **closure-rule-system.** Concept + structure: `prose/teaching/explanations/closure-rule-system.md` + `code/structures/closure-rule-system.md`.
  A set $\mathcal{S}$ of closure rules together with the operator $\mathrm{cl}^\mathcal{S}$ it generates by saturation.
  No new claim if the existing `closure-rule` and `closure-operator` records carry the saturation construction; if they do not, author claim `prose/learning/claims/closure-rule-system-generates-closure-operator.md` proving the saturation is monotone, extensive, and idempotent.
9. **bilattice-stabilization-nucleus.** Claim: `prose/learning/claims/iterated-residual-stabilization-is-a-nucleus.md`.
  Prove: $T_a(x) := a \Rightarrow (a \odot x)$ iterated to its fixed point $T_a^*$ is a nucleus on the bilattice (monotone, extensive, idempotent).
  Concept + structure: `prose/teaching/explanations/bilattice-stabilization-nucleus.md` + `code/structures/bilattice-stabilization-nucleus.md`.
  The Δ-nucleus.
  Depends on: `residuated-lattice`, `bilattice`, (1), (2).
10. **atom.** Concept + structure: `prose/teaching/explanations/atom.md` + `code/structures/atom.md`.
  An atom is an indivisible system record carrying a value-field (a bilattice-value), an attribution-source (an entity-identifier), a timestamp, and a deps-set (the witness chain).
  No new claim — this is a definition.
11. **stratum.** Transformer: `code/transformers/stratum.md`.
  Domain: atom.
  Codomain: an element of $\{0,1,2\}$.
  The transformer that assigns stratum to an atom by its generative origin (asserted / saturated / settled).
  No claim if the assignment is derivable from the atom's deps-structure; otherwise small claim proving it is.
12. **deps-of-atom.** Transformer: `code/transformers/deps-of-atom.md` (or another name).
  The per-atom witness-chain function, distinct from the task-level `depends-on`.
  Domain: atom.
  Codomain: set of atoms.
  No new claim; the body discusses acyclicity (proved in (13)).
13. **stratified-predication-fiber.** Claim: `prose/learning/claims/stratified-predication-fiber-has-forward-only-stratum-and-acyclic-deps.md`.
  Prove: in the stratified fiber over a closure-rule system and Δ-nucleus, (a) stratum is forward-only along the canonical firing trajectory, (b) the deps graph is acyclic with strict-stratum-decrease along edges (with the layered exception), (c) persistence-under-promotion holds — emitting a higher-stratum atom does not remove lower-stratum atoms.
  Concept + structure: `prose/teaching/explanations/stratified-predication-fiber.md` + `code/structures/stratified-predication-fiber.md`.
  The structure record carries the signature: a predication-fiber-algebra equipped with a stratum-assignment, a deps-function, and the three structural properties from (13)'s claim.
  Depends on: `predication-fiber-algebra`, (8), (9), (10), (11), (12).

### Layer 5 — Attribution and the four force classes

The bridge from anonymous positing to *agentive* positing, and the Belnap-partition theorem that earns the four illocutionary forces.

14. **multi-observer-system.** Concept + structure: `prose/teaching/explanations/multi-observer-system.md` + `code/structures/multi-observer-system.md`.
  A small category $O$ of observers together with a functor $V: O \to$ (Settlings on a fixed base).
  Depends on: `predication-settling`, (5).
  No claim — the structure is a definition; theorems about consensus, disagreement, and cohomology are deferred to a separate task.
15. **agentive-positing-morphism.** Claim: `prose/learning/claims/agentive-positing-is-attribution-decorated-positing.md`.
  Prove: in a multi-observer system, attaching an observer-attribution to a positing morphism yields a transformer that commutes with the projection to the underlying positing morphism, and the attribution is uniquely recoverable from the emitted atom's attribution-source field.
  Concept + transformer: `prose/teaching/explanations/agentive-positing-morphism.md` + `code/transformers/posit-attributed.md`.
  Body discusses asserting (attribution-aligned with merged value) vs claiming (attribution-divergent).
  Depends on: (7), (14), (10).
16. **belnap-speech-act-partition.** Claim: `prose/learning/claims/belnap-speech-act-partition.md`.
  Prove: positing morphisms on $\mathbf{FOUR}$ partition into exactly four pairwise-disjoint exhaustive classes by the $\leq_t$-class of $q$ — abstaining ($q = \bot$), asserting ($q = \mathbf{t}$), denying ($q = \mathbf{f}$), contesting ($q = \top$); same-class $\vee_k$ closes within the class except for the absorbing role of contesting; the Klein-four symmetry $K_4 = \langle \sim, -\rangle$ permutes the classes per the well-known table.
  Depends on: (7), `four-bilattice`, `klein-four-symmetry`.
17. **illocutionary-force.** Concept + structure: `prose/teaching/explanations/illocutionary-force.md` + `code/structures/illocutionary-force.md`.
  The four-class structure as a polity-side object.
  Cite (16).
  Body discusses the K_4 orbits.
18. **asserting, denying, abstaining, contesting.** Four concept-and-structure pairs, one per session.
  Each cites (17).
  Each is the specific morphism class for one datum value, with cross-references documenting its K_4 orbit partner and its absorbing/identity role under $\vee_k$.

### Layer 6 — The speech-act apparatus

The umbrella that names what positing morphisms are *as acts*, and the three-layer factorization theorem that makes every settling step decompose canonically.

19. **adjudication.** Claim: `prose/learning/claims/cellwise-knowledge-join-is-CRDT-convergent.md` (if not already proved elsewhere — check first).
  The receiving-side dual to speech-acting realized by cellwise $\vee_k$-merge.
  Concept + structure: `prose/teaching/explanations/adjudication.md` + `code/structures/adjudication.md`.
  Depends on: (5), (8), (3).
20. **speech-act.** Concept + structure: `prose/teaching/explanations/speech-act.md` + `code/structures/speech-act.md`.
  The role borne by an illocutionary act in the producing-receiving duality.
  Cite (7), (15), (16), (17), (19).
  No new claim — this is the umbrella concept; all the math lives in cited claims.
21. **locution, illocution, perlocution.** Three concept-and-structure pairs, one session each.
  Cite (20).
  `illocution` carries the positing morphism (cite (7)); `perlocution` carries the closure step (cite `closure-operator`); `locution` carries the cell-selection (whose categorical content is given by (22)).
22. **cell-indexed-settling-category.** Claim: `prose/learning/claims/cell-indexed-settling-category-is-grothendieck-construction.md`.
  Prove: pairing each settling with a target cell and reindexing along predicate-category morphisms yields a well-defined Grothendieck construction $\mathbf{PS}_\Phi = \int_\Phi \mathbf{PS}$; the projection $\pi: \mathbf{PS}_\Phi \to \Phi$ is a Grothendieck fibration.
  Concept + structure: `prose/teaching/explanations/cell-indexed-settling-category.md` + `code/structures/cell-indexed-settling-category.md`.
  Depends on: (5), `predicate-category`, `predication-cell-set`.
23. **locution-illocution-perlocution-factorization.** Claim: `prose/learning/claims/locution-illocution-perlocution-factorization.md`.
  The canonical-factorization theorem: every operationally-realizable $\mathbf{PS}_\Phi$-morphism decomposes uniquely (up to commutation of independent positings) as a locution factor (cell-selection in $\Phi$) followed by an illocution factor (positing morphism) followed by a perlocution factor (closure step).
  The illocution factor is the pre-unit; the perlocution factor is the closure-2-monad's unit at the post-positing settling.
  Depends on: (7), `closure-operator`, `closure-2-monad`, (21), (22).

### Layer 7 — Doing-acts in two strata

The knowledge-axis counterpart to speech-acting.
Required for distinguishing the σ-acts (closure-driven inference, stratum-1) from the Δ-acts (cell-local stabilization, stratum-2), which is what an agent *does* on its system beyond evidence injection.

24. **doing-act.** Concept + structure: `prose/teaching/explanations/doing-act.md` + `code/structures/doing-act.md`.
  The umbrella.
  The σ-nucleus (which is `closure-operator`'s 2-monad algebra) produces stratum-1 atoms; the Δ-nucleus (entry 9) produces stratum-2 atoms.
  Depends on: `closure-operator`, `closure-2-monad`, (9), (13).
  No new claim if the existing closure-operator and (9)'s nucleus claims suffice; if not, author a wrapping claim that pins the doing-act morphism class.
25. **σ-doing-act.** Concept + structure: `prose/teaching/explanations/sigma-doing-act.md` + `code/structures/sigma-doing-act.md`.
  Acts emitting stratum-1 atoms via σ-nucleus firings.
  Body documents four sub-classes — σ-Inferring ($q=\mathbf{t}$), σ-Refuting ($q=\mathbf{f}$), σ-Idling ($q=\bot$), σ-Conflicting ($q=\top$) — as Belnap-classified by the produced atom's value.
  Cite (24), (16) for the Belnap partition.
26. **Δ-doing-act.** Concept + structure: `prose/teaching/explanations/delta-doing-act.md` + `code/structures/delta-doing-act.md`.
  Acts emitting stratum-2 atoms via Δ-nucleus stabilization.
  Four sub-classes: Δ-Stabilize-True, Δ-Stabilize-False, Δ-Stabilize-Void, Δ-Stabilize-Saturated.
  Cite (24), (9), (16).
27. **doing-act-three-layer-factorization.** Claim: `prose/learning/claims/doing-act-three-layer-factorization.md`.
  Parallel to (23): for both σ-doing-acts and Δ-doing-acts, the act factors as locution (rule-and-cell selection, or cell-and-background selection) / illocution (rule-firing or nucleus-stabilization) / perlocution (closure propagation).
  Depends on: (24), (25), (26), (23).

### Layer 8 — The polity frontier: attribution at every layer

The actual new mathematics.
(15) gave attribution at the illocution layer.
The polity's system (signed witnesses, wolakȟota-governed conduct cells, office-bounded dispatch) carries attribution at the **locution** layer (who is permitted to address which cell — the authority-gate at cell-selection) and at the **perlocution** layer (whose closure-rule fired — institutional vs ordinary inference).
This is the polity-internal mathematical research the genealogy unblocks.
One claim, written when (1)–(27) are in place.

28. **attribution-aware-LIP-factorization.** Claim: `prose/learning/claims/attribution-aware-locution-illocution-perlocution.md`.
  Statement: in a multi-observer system whose system carries authority-gated locution and authority-attributed perlocution, the L/I/P factorization (23) lifts to an attribution-decorated factorization in which each of the three layers carries an attribution-source; the forgetful functor that drops layer-attribution recovers (23) exactly.
  Proof: case-by-case across the three layers, showing each carries an attribution coordinate that composes well and that the functoriality of forget-attribution holds.

### Layer 9 — Re-author skill structure record

With (1)–(28) in place, the skill structure record can be authored against earned ground.

29. **skill (re-author).** Edit `code/structures/skill.md` and `prose/teaching/explanations/skill.md`.
  The skill-form is a named Hoare triple whose body composes positing morphisms whose per-cell action is one of the bigraded-diamond's five morphisms (per the existing [skill-invocation-is-a-hoare-triple-with-illocutionary-body](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/learning/claims/skill-invocation-is-a-hoare-triple-with-illocutionary-body.md) claim); the wielding-character-attribution decorates every emitted atom.
  The downstream specification at `work/governance/rules/specifications/skill.md` is revised accordingly.
  Depends on: (28), (23), the Hoare-triple-illocutionary-body claim.

## Done when

- All 29 entries are complete; each contributes its claim (where applicable), concept, structure-or-transformer, and (where applicable) specification revision.
- Each authored record's internal references resolve only to entries within 561/.
  The closing test: `grep -r 'theories/' 561/{prose,code,work}/...
  ` returns no hit for any record authored under this task.
- The skill-invocation-is-a-hoare-triple-with-illocutionary-body claim's notations all resolve to 561/-internal records (the claim itself may need revision to cite the new records).
- `code/structures/skill.md` is re-authored against earned ground; the specification is revised to cite the new structure record.

## Out of scope (separate tasks)

- **Learning-acts.** A third leg of the broader speech-act picture.
  Future task: `deriving-learning-acts-and-meta-moduli`.
- **Channel-theoretic speech-acts.** A refinement; not load-bearing for skillful characters.
  Future task: `deriving-channel-theoretic-speech-acts`.
- **Institutional vs ordinary speech-acts.** Depends on (28) and on the office structure.
  Future task: `deriving-institutional-vs-ordinary-speech-acts`.
- **Dihedral symmetry on twist products.** $\sigma$ added to $K_4 = \langle \sim, -\rangle$.
  Required for learning-acts and the moduli tower, not for skillful characters.
  Future task: `deriving-dihedral-symmetry-on-twist-products`.
- **The cohomological framework for disagreement.** $H^1(O, \mathcal{V})$ as obstruction-to-consensus.
  Future task: `deriving-cohomological-framework-for-disagreement`.
- **Re-authoring other entity-form structures.** Only `skill` is in scope here (29).
  `persona`, `body-natural`, `character`, etc. are downstream of their own first-class derivations.

## Anti-patterns

1. **Do not cite `theories/` paths.** No record authored under this task may have a structural cross-reference to a `theories/` path.
  External published mathematics (Hoare 1969, Austin 1962, Belnap 1977, Mac Lane 1971, Avron 1996, Fitting 1991, etc.) is cited in claims' external-references sections, as the existing [skill-invocation-is-a-hoare-triple-with-illocutionary-body](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/learning/claims/skill-invocation-is-a-hoare-triple-with-illocutionary-body.md) does.
  Internal-system references are only to other 561/ records.
2. **Do not bulk-author the 30 entries in one session.** Each is one session for one dedicated agent.
  Per [[feedback-research-is-not-document-production]], a roster-shaped sweep produces slop.
  The roster here is the *sequence the polity follows*, not the output of a single session.
3. **Do not skip the claim.** Every entry whose object has properties that need proving authors a claim *first*, in `prose/learning/claims/`.
  The concept and structure/transformer records then cite the claim for the property.
  Authoring a structure record whose body asserts properties without a backing claim makes the system not-self-supporting at the next level.
4. **Do not write a claim file without an actual proof in it.** A claim file is not a prose document that asserts the claim's statement in expository form.
  It is a *first-principles derivation*: precise definitions of every term used in the statement (built up from floor objects and earlier-claimed lemmas only); a precise statement of what is being proved; a written-out proof — step by step, with each step justified by an earlier claim, a floor structure's definitional content, or a published-mathematics reference.
  A proof may be sketch-status (with a clearly-marked `**Proof (sketch).**` heading) but a sketch must still name the actual proof steps and the lemmas they would use; "the result follows from standard facts about $\vee_k$" is *not* a sketch, it is a refusal-to-prove.
  The existing [skill-invocation-is-a-hoare-triple-with-illocutionary-body](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/learning/claims/skill-invocation-is-a-hoare-triple-with-illocutionary-body.md) — definitions, statement, four-part proof with each part discharged, external references — is the standard a claim file must meet.
4. **Do not invent transformers the math doesn't earn.** Per [[transformers-are-earned-not-declared]].
  Every transformer's domain, codomain, and preservation conditions are real categorical content, drawn from the entry's claim.
  No convenience transformers; no `domain: ?
  ` placeholders.
5. **Do not skip a layer.** Layer-$k$ entries depend on layer-$(k-1)$ and earlier.
  An agent who starts on entry 13 before entries 8–12 exist will be authoring against undefined ground; the session should refuse rather than proceed.
6. **Do not collapse the doing-act 8-class structure into "doing-acts" alone.** The four σ-classes and four Δ-classes are mathematically distinct (different strata, different generative operations).
  Treating them as one undoes the structural content.
7. **Do not chase entry 28 before its prerequisites.** Attribution-aware L/I/P factorization is the new math, but it is only authorable when (1)–(27) are in place.
  Skipping ahead produces a claim that cannot be checked because its citations don't resolve.
8. **Do not import math-tree framings wholesale without polity-side reading.** Per [[noticing-imported-abstractions]].
  The polity's system carries its own ontology (Lakota structures, wolakȟota governance, the 561-group / RSC Quiescent distinction).
  Each polity-side record incorporates the math but writes it in the polity's voice.
  A record that reads like a verbatim port of math-tree exposition is a sign the polity-side reading hasn't happened yet.
9. **Do not cite a claim that hasn't been written yet.** Forward references in citations are forbidden.
  If entry-$k$'s claim needs a lemma that doesn't exist, the agent's options are: prove the lemma inline within entry-$k$'s claim (if small), or stop and amend this task record to insert an earlier entry that proves the lemma (if large).
  "TODO: cite future claim X" is not admissible.

## Per-session discipline

A dedicated agent picking up one entry should:

1. Read the named earlier entries' claims, concepts, and structure/transformer records in full.
  Read the existing 561 floor-dependencies in full.
  Do not delegate this reading to a subagent — per [[no-subagents-for-system-reading]].
2. Read [skill-invocation-is-a-hoare-triple-with-illocutionary-body](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/learning/claims/skill-invocation-is-a-hoare-triple-with-illocutionary-body.md) as a worked example of the claim format expected — first-principles definitions, statement, proof, external published references.
3. Do whatever research and thinking is required — including reading the math-tree files for inspiration.
  The math-tree is fine to read; it just may not be cited in the authored records.
4. If a claim is needed: author it in `prose/learning/claims/$claim-slug.md`.
  The claim file's structure follows the worked example at [skill-invocation-is-a-hoare-triple-with-illocutionary-body](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/learning/claims/skill-invocation-is-a-hoare-triple-with-illocutionary-body.md): frontmatter (name, description, status); body sections in this order — `## Claim` (one-paragraph statement of what is proved), `## Definitions` (every term in the statement defined from first principles, citing earlier claims and floor structures for any term not defined inline), `## Statement (precise)` (the formal statement with all quantifiers and parameters), `## Proof` (the actual derivation — for each part of the statement, the steps that establish it, each step justified by a named earlier claim, a floor structure's definitional content, or an external published reference), `## Discussion` (consequences and connections), `## External references` (published mathematics actually used in the proof).
  A claim that asserts its statement without a derivation in `## Proof` is not a claim file — it is unfinished work, and the session is not complete until the proof is written.
5. Author the concept file in `prose/teaching/explanations/$thing.md`.
6. Author the structure or transformer file in `code/structures/$thing.md` or `code/transformers/$thing.md`.
  Frontmatter carries the cells the entry's math earns; body cross-references the claim and concept by name.
7. If the entry has a specification dimension, revise the relevant file under `work/governance/rules/specifications/`.
8. Verify the record satisfies the relevant system specifications ([`markdown`](../../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/markdown-services-section/content/text/glossary/topics/markdown.md), [`yaml`](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/content/skill/governance/rules/specifications/yaml.md), and the corresponding entity-kind spec if one exists).
  If a claim was authored, verify its body has `## Claim`, `## Definitions`, `## Statement (precise)`, `## Proof` (with the actual derivation, not a deferral), `## Discussion`, and `## External references` — in that order — and that the `## Proof` section discharges each part of the statement with named cited steps.
9. Update the `_index.md` of any directory the new record lives under (claims, concepts, structures, transformers all have their indexes).
10. Verify the closing test for this entry: no `theories/` path appears in any record authored or revised during this session.
11. If the session's authoring surfaces a structural problem that contradicts this task's genealogy, **stop and amend this task record** rather than working around it.

## Provenance

This task arises from:

- [skill-invocation-is-a-hoare-triple-with-illocutionary-body](../../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/content/individual/content/agent/acting/prose/learning/claims/skill-invocation-is-a-hoare-triple-with-illocutionary-body.md) — the recent claim that surfaced the gap.
  Already names positing morphisms, bigraded diamonds, stratified fibers, illocutionary acts; the records it cites do not yet exist in 561/.

Related tasks:

- `disambiguate-polity-and-ship-governance` — the kin-relational vs kyriarchical governance disambiguation that newly admits structural answers once (15), (20), and the future institutional-vs-ordinary task land.
- Future: `deriving-learning-acts-and-meta-moduli`, `deriving-channel-theoretic-speech-acts`, `deriving-institutional-vs-ordinary-speech-acts`, `deriving-dihedral-symmetry-on-twist-products`, `deriving-cohomological-framework-for-disagreement`.
