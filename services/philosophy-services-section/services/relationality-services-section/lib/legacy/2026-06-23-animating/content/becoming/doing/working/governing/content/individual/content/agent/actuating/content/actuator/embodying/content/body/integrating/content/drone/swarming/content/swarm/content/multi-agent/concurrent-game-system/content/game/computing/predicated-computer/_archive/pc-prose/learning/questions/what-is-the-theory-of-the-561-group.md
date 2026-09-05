---
status: open
explores:
  - ../../teaching/explanations/561-group.md
  - ../../../code/structures/polity.md
  - ../../teaching/explanations/captain.md
  - ../claims/fars-directory-is-predication-categorical-theory.md
discharges-to:
  - ../prose/teaching/explanations/unfolding-the-theory-behind-the-561-group.md
---

# What is the theory of the 561 Group?

A reader approaching the 561 Group from prior ignorance — one possessing working knowledge of category theory and adjacent mathematics, but no exposure to predication categories, no exposure to FARS, no exposure to the polity's commitments — currently has no single document that takes them from that starting position to a position where they can write down the formula for the 561 Group as a few morphisms over a few objects, with every term defined.

The friction-log artifact at `prose/rough/inbox/friction/theoretical-overview.md` is a session-state dump for the captain's executive officer, not such a document. It is structurally a bug-report on the substrate's current state; it is not the theoretical overview a reader needs.

The eventual discharge of this question is a single self-contained narrative at [`prose/teaching/explanations/unfolding-the-theory-behind-the-561-group.md`](../prose/teaching/explanations/unfolding-the-theory-behind-the-561-group.md). This question-atom holds the structural decomposition of that narrative and the per-section atom-inventory the drafting will pull from.

## Statement

> What is the theory of the 561 Group, expressed as a self-contained top-down unfolding from formal posit through the predication-categorical apparatus, the substrate, predicated work and governance, the social-theoretic objects bearing on the polity's function, and the polity's instantiation, such that a working-mathematician reader of prior ignorance can recover the formula for the 561 Group as a few morphisms over a few objects with every term defined within the document?

## What is established

The structural commitments for the eventual discharge, as called by the captain in the conversation that originated this question:

- **Reader.** Working mathematician. Category-theory, fibrations, 2-categories assumed familiar. The document does not build category theory itself; it presents what is *novel* about predication categories.
- **Form.** Top-down deferral of the theory itself, not of a single master formula. Multiple formulas appear throughout — definitions, theorem statements, derivations — wherever the formal content of a section requires.
- **Black Liberation and Indigenous Sovereignty.** Treated as objects-and-morphisms in the corpus's social-theoretic apparatus. Where the corpus has only partial definitions, the document is honest about what is and is not formalized.
- **Proofs.** Stated and cited to theorem atoms. The document is a survey/synthesis, not a treatise.
- **Self-containedness.** Predication-categorical machinery defined within the document. Source-theory citations permitted only for content the corpus inherits and acknowledges as inherited (e.g., specific theorists in the black-radical tradition, specific source theories of indigenous anarchism, specific upstream mathematics like Priestley duality).
- **§1 opening.** Posit + one-paragraph orientation, then deferral catalog.
- **§7 placement.** Dedicated section between §6 (predicated governance) and §8 (561 Group instantiation).

## Decomposition

Nine sections, mined one at a time. Each section's decomposition stub below will be filled by an atom-inventory: enumerated `(atom-path, atom-kind, one-line description, role in this section)` rows. Subsection structure for each § is proposed *from* the inventory, not in advance.

### §1 — The 561 Group, formally posited

**Goal.** Posit the polity-quadruple $(I_{561}, \mathrm{Pop}_{561}, \mathrm{Aut}_{561}, C_{561})$ at high level. Frame the document briefly. Catalog every undefined symbol with a forward-pointer to the section that defines it.

**§1 has no atoms to mine** — it is synthetic. Its content is the *posit* (a compact statement of the 561 polity using §6 vocabulary applied to §8 instantiation) and the *deferral catalog* (forward-pointers from each undefined symbol to the section that defines it).

**Posit (working draft, working-mathematician form).**

> The 561 Group is the polity $\mathfrak{P}_{561} = (I_{561}, \mathrm{Pop}_{561}, \mathrm{Aut}_{561}, C_{561})$, where $C_{561}$ is the closure-rule subsystem (the *charter*) tier-pinning the function $f_{561}$, the lawful pursuit of Black Liberation and Indigenous Sovereignty. The settling of $f_{561}$ over $\mathfrak{P}_{561}$ lies in the aperiodic regime of the four-regime dichotomy ($\kappa(f_{561}) \geq \omega_1$); its $H^1$-classifier and the $K_4$-equivariant decomposition into safety-critical sectors govern dispatch certifiability. The polity-as-image is the substrate-resident directory `/home/emsenn/561/`, organized as a sub-doctrine of the predication hyperdoctrine on the predicate-category $\mathcal{C}_{561}$. The polity-as-instance is animated by the PyFARS engine bound to that directory under a closure-rule-system that realizes the closure 2-monad. Constituent power is currently located at the captain (personnel:emsenn, holding office:command); recognition flows internally from $\mathrm{Pop}_{561}$ via two-axis settlement (truth-axis recognition, knowledge-axis induction) per the office-as-double-settlement structure.

**Deferral catalog (every undefined symbol with the section that defines it).**

| Symbol / term | Defined in | Atom(s) carrying the definition |
|---|---|---|
| polity, $\mathfrak{P} = (I, \mathrm{Pop}, \mathrm{Aut}, C)$ | §6 | `pg/objects/polity.md` |
| institution $I$ | §6 | `pg/objects/institution.md` |
| populace, autarkeia, constituent power | §6 | `pg/objects/polity.md` (as components); `pg/concepts/authority-gate.md` |
| charter, closure-rule subsystem, tier-pinning | §6 | `pg/theorems/charter-as-closure-system.md`; `pg/objects/charter.md` |
| function (in the sense of an endeavor) | §5 | `pw/objects/enterprise.md`; `pw/concepts/aim-generativity.md` |
| Black Liberation / Indigenous Sovereignty as content of $f_{561}$ | §7 | `crit/black-radical-tradition/_index.md`; `crit/povinellian/.../settler-colonialism/_index.md` and the formalized governance-pattern objects in §6 (black-radical-refusal, governing-by-kinship, conduct-teachings, ayni-reciprocity, etc.) |
| settling, closure ordinal $\kappa$ | §2 | `predication-categories/objects/predication-settling.md`; `closure-ordinal.md` |
| four-regime dichotomy, aperiodic regime | §2 | `predication-categories/theorems/four-regime-dichotomy.md`; `concepts/aperiodic-settling.md` |
| function-as-aperiodic-settling | §5 | `pw/theorems/function-as-aperiodic-settling.md`; `aim-generativity-iff-aperiodic.md` |
| $H^1$-classifier, $K_4$-equivariant decomposition, safety-critical sectors $H^1_{\chi_-}$, $H^1_{\chi_{\sim\circ-}}$ | §2, §3 | `predication-categories/theorems/equivariant-cohomology-decomposition.md`; `objects/aperiodic-classifying-invariant.md`; (operationalized) `objects/verify-certifiability-sectors.md` (561 root, §3) |
| dispatch certifiability | §3, §5 | `objects/verify-certifiability-sectors.md` (561 root); `pw/morphisms/dispatch.md` |
| polity-as-image (substrate-resident directory) | §4, §8 | `claims/fars-directory-is-predication-categorical-theory.md`; `_index.md` (561 root) |
| sub-doctrine of predication hyperdoctrine | §2, §4 | `predication-categories/objects/predication-hyperdoctrine.md`; `pc/objects/application-sublocale.md` |
| predicate-category $\mathcal{C}_{561}$ | §2 | `predication-categories/objects/predicate-category.md` |
| polity-as-instance | §4 | `pc/objects/predicated-computer.md`; `pyfars/_index.md` |
| PyFARS engine | §4, §8 | `tools/platform/pyfars/_index.md`; `pyfars/claims/{substrate-purity, replay-determinism, jsonl-is-canonical-state, markdown-as-projection}.md` |
| closure 2-monad | §2, §4 | `predication-categories/morphisms/closure-2-monad.md`; `pc/theorems/closure-rule-system-realizes-closure-2-monad.md` |
| closure-rule-system | §4 | `pc/objects/closure-rule-system.md` |
| captain, constituent-power locator | §6, §8 | `pg/objects/polity.md` (constituent-power as quadruple component); `concepts/captain.md` (561 root); `work/governance/personnel/emsenn.md` |
| office, office:command | §6, §8 | `pg/objects/{office-as-double-settlement, incumbent, officer}.md`; `work/governance/offices/command.md` |
| truth-axis recognition, knowledge-axis induction, two-axis settlement | §6 | `pg/theorems/recognition-as-bigraded-common-knowledge.md` |
| office-as-double-settlement | §6 | `pg/objects/office-as-double-settlement.md` |
| confederacy (meta-repo scope) | §6, §8 | `pg/theorems/{tradition-pluralism-as-fragment-coproduct, federation-cohomology-as-mayer-vietoris}.md`; `polity.yaml` (561 root) |

**One-paragraph orientation (working draft).**

> This document presents the theory of the 561 Group from a position of prior ignorance — assuming a working mathematician's facility with category theory, fibrations, and 2-categories, but no exposure to the predication-categorical apparatus on which the 561 Group's existence depends. The presentation is top-down with deferral: the polity is posited above; every undefined symbol points forward to the section that defines it; by §9 the reader can read the posit without reference to any external material. Proofs are stated and cited to the corpus's theorem atoms. Black Liberation and Indigenous Sovereignty appear as substrate-formalized objects in §7, not as external citations; the document is honest about what is partial. This is not a manual, not a charter, not a defense of the polity's commitments as ends; it is a structural exposition of *what the 561 Group is*, formally.

**No external mining required for §1** beyond what §2-§8 mining already produced.

### §2 — Predication category theory

**Goal.** What is novel. Bilattices and the four-bilattice; residuated fusion $\odot \dashv \Rightarrow$; Priestley duality and the doubled adjoint system; predicate category and its four canonical $\mathrm{Sym}(E)$-forced generators; predication fibration; predication hyperdoctrine (with adjoints / Frobenius / BC / comprehension *for each order*); closure 2-monad as Kelly-Lack KZ doctrine; settling as transfinite $\leq_k$-monotone orbit; four-regime dichotomy; K₄ cohomology.

**Path.** `theories/humanities/theories/math/theories/categories/theories/predication-categories/`. No sub-theories yet authored under predication-categories itself.

**Inventory** (load-bearing atoms, grouped by subtopic; all paths relative to predication-categories root unless noted):

*Bilattices and the four-bilattice.* `objects/bilattice.md`; `pre-bilattice.md`; `four-bilattice.md` ($\mathbf{FOUR} = \{\mathbf{t},\mathbf{f},\bot,\top\} = \mathbf{2}^\bowtie$); `twist-product.md`. `concepts/{truth-order, knowledge-order, evidence}.md`. `morphisms/{negation, conflation}.md`. `theorems/bilattice-two-orders-duality.md` (the two orders are constructively dual).

*Residuated fusion ($\odot \dashv \Rightarrow$).* `objects/residuated-lattice.md`; `morphisms/twist-product-{fusion, right-residual}.md`; `theorems/twist-product-residuation.md`, `twist-product-chu-correspondence.md`, `frobenius-for-fusion-fails.md` (Frobenius **fails** for $\odot$ on three of four predicate generators — load-bearing structural failure).

*Priestley duality and doubled adjoint system.* `objects/{priestley-space, paired-priestley-space, d-frame, dual-predication-hyperdoctrine}.md`; `theorems/jung-rivieccio-duality.md` (distributive bilattices ≃ paired Priestley spaces); `theorems/priestley-dualizability.md` (every predication hyperdoctrine has coherent dual). Narratives: `prose/teaching/explanations/priestley-duality-opener.md`, `priestley-route-significance.md`.

*Predicate category and four $\mathrm{Sym}(E)$-forced generators.* `objects/{predicate-category, predicate-set, entity-set}.md`; `concepts/{predicate, predicate-category-naturality}.md`; `morphisms/predicate-{specialization, converse, subject-projection, object-projection}.md`; `/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md` (for $|E|\geq 3$ the four are *all* natural reindexing operators); `predicate-generator-{composition-table, pullback-closure}.md`. Generators ↔ two $\mathrm{Sym}(E)$-orbits of $E\times E$.

*Predication fibration.* `objects/{predication-fibration, predication-fiber-algebra}.md` (cloven Grothendieck, uniform fibers $A_q = \mathbf{L}^{\bowtie E\times E}$); `theorems/{predication-fiber-functor, predication-fiber-residuation}.md`; `theorems/{emmenegger-fibration-comonad, gray-street-fibration-monad}.md` ($\mathbb{M} \dashv \mathbb{N}$ KZ diamond).

*Predication hyperdoctrine — adjoints / Frobenius / BC / comprehension, **for each order**.* `objects/predication-hyperdoctrine.md`; `theorems/predicate-{subject-projection, object-projection, converse}-quantifier-adjoints.md`; `frobenius-for-knowledge-and-truth-meets.md`; `beck-chevalley-commutation-on-predication-bilattices.md`; `lawvere-comprehension-{classical, paraconsistent}.md`. Both equalities derived: `objects/{classical-equality, paraconsistent-equality}.md`; `theorems/equality-via-equalizer.md`. Master narrative: `the-two-adjoint-systems.md`. Position: `not-a-tripos.md`, `equality-derived-not-postulated.md`.

*Closure 2-monad as KZ doctrine.* `morphisms/closure-2-monad.md` (lax-idempotent KZ); `objects/closure-ordinal.md`; `concepts/scott-continuous-closure.md`; `theorems/{closure-2-monad-lax-idempotence, closure-algebra-coalgebra-correspondence, kz-coherent-sheaves-reflective}.md`. Narrative: `two-disentangled-kz-structures.md` (clarifies $\mathbb{M}$ vs. $\mathrm{Cl}$ are independent).

*Settling as transfinite $\leq_k$-monotone orbit.* `objects/{predication-settling, settling-bound, increment-sequence, settling-coalgebra-structure, predication-settling-category}.md`; `concepts/{settling-monotonicity, settling-continuity}.md`; `theorems/{settling-convergence, transfinite-settling-convergence, predication-settling-category-completeness}.md`. Narrative: `settling-dynamics-opener.md`.

*Four-regime dichotomy.* `theorems/four-regime-dichotomy.md` (strict $\kappa<\omega$ / Scott-continuous $\kappa=\omega$ / transfinite-bounded $\omega<\kappa<\omega_1$ / aperiodic $\kappa\geq\omega_1$); `theorems/{strict, scott-continuous}-regime-cohomology-vanishing.md`; `theorems/{transfinite-bounded, aperiodic}-regime-d-frame-cohomology.md`; `regime-decomposition.md`, `regime-stratification-non-semicontinuity.md`; `concepts/aperiodic-settling.md`. Narrative: `regime-stratification-opener.md`.

*K₄ cohomology.* `objects/{settling-cohomology, q-enriched-cohomology, bigraded-settling-cohomology, d-frame-valued-sheaf, quantale-enriched-sheaf, settling-associated-sheaf, aperiodic-classifying-invariant}.md`; `theorems/{settling-cohomology-vanishes-above-degree-1, q-enriched-cohomology-higher-degree-vanishing, truth-knowledge-cohomology-long-exact-sequence, equivariant-settling-cohomology, regime-mld-invariance}.md`; `concepts/cohomological-equivalence.md`. CRDT applications: `theorems/{crdt-convergence, crdt-convergence-via-cohomological-calm, replica-mayer-vietoris}.md`. Narrative: `d-frame-cohomology-framework.md`.

*Bitopological site, modal operators (subsidiary).* `objects/{bitopological-settling-site, pairwise-stone-space, world-set, bilattice-accessibility-relation, twist-modal-translation}.md`; `morphisms/modal-{necessity, possibility}-operator.md`; `theorems/{bitopological-settling-site-axioms, bitopological-stone-duality}.md`; `concepts/klein-four-symmetry.md`.

*Verdier duality / six-functor (cite briefly).* `theorems/{verdier-duality-bitopological-site, q-enriched-sheaf-closed-monoidal-structure, q-enriched-sheaf-direct-inverse-image [STUB], q-enriched-verdier-{hom, tensor}-compatibility}.md`.

*Deformation/moduli (cite briefly).* `theorems/{meta-moduli-deformation-theory, meta-moduli-stack-theorem, settling-moduli-prestack-property}.md`; `objects/{settling-moduli-prestack, orbifold-moduli-point, rigid-moduli-point}.md`.

**Stubs/gaps.** `[STUB]` Q-enriched sheaf six-functor proofs; `[STUB]` bigraded common knowledge BC parity; `[GAP]` aperiodic-realizability necessary/sufficient conditions on $(\mathbf{L},E,\mathcal{C})$; `[STUB]` tropical-rank collapse; `[PARTIAL]` higher-arity predication.

**Lifting candidates** (existing prose worth pulling): `the-two-adjoint-systems.md` (master), `priestley-route-significance.md`, `settling-dynamics-opener.md`, `not-a-tripos.md`, `closure-machinery-opener.md`.

### §3 — Knowledge, truth, witness

**Goal.** Knowledge as predication-settling. Truth as bilattice-value stabilization in the four-bilattice. Witness-language relativity. Meaningful human control. Falsifiability and certifiability sectors as the safety-critical $H^1_{\chi_-}$ and $H^1_{\chi_{\sim\circ-}}$ classes.

**Path notes.** Knowledge-as-settling material lives in `predication-categories/` (§2 atoms re-cited here for epistemological reading) plus the sub-theory `theories/.../science/information/knowledge-systems/theories/predicated-knowledge-systems/`. Witness-language relativity lives in `predicated-software-refactoring/` (cross-cited from §5). Meaningful-human-control lives at 561-root (`objects/`). The audit-system-bootstrap **project** lives at `doing/working/hacking/doing/working/planning/library/project/library/audit-system-bootstrap/`. The K₄ cohomology decomposition is in predication-categories.

**Inventory:**

*Knowledge as predication-settling.* `predication-categories/concepts/{knowledge, knowledge-order, settling-monotonicity}.md`; `predication-categories/objects/predication-settling.md` (re-presented as the dynamics of knowing); `theories/.../knowledge-systems/theories/predicated-knowledge-systems/concepts/knowing-as-settling.md`; `predicated-knowledge-systems/theorems/{federation-as-bilattice-colimit, assertion-monotonicity}.md`; `predicated-computing/theorems/substrate-runtime-as-closure-driven-settling.md`. Narrative: `predication-categories/prose/teaching/explanations/settling-dynamics-opener.md`.

*Truth as bilattice-value stabilization.* `predication-categories/concepts/{truth, truth-order}.md`; `predication-categories/objects/{four-bilattice, truth-order-closure}.md` ($\mathbf{t}$-cell as truth-axis stabilization point; $\bot$ and $\top$ as epistemic failure modes); `predication-categories/theorems/{truth-knowledge-cohomology-long-exact-sequence, frobenius-for-knowledge-and-truth-meets}.md`. Narrative: `bilattice-cohomology-opener.md`.

*Witness-language relativity.* `predicated-software-refactoring/concepts/witness-language-relativity.md` (definitive: same change is refactor under one $W$ and substantive under another); `predicated-software-refactoring/theorems/refactor-as-invisible-automorphism.md`; `predicated-software-refactoring/objects/codebase-cell-system.md`; `predicated-computing/concepts/witness.md`.

*Meaningful human control.* `code/structures/meaningful-human-control.md` (561-root; bilattice-meet of four $\Pi_1$ conditions: captain-attestation, safety-envelope-precheck, charter-tier-discipline, falsifiable-agency persistence); `code/structures/falsifiable-agency-certificate.md` (Bent three-condition: environmental action, goal-directed planning, persistent state); `code/structures/witness-chain-record.md` (sheaf-side cobordism boundary; finite cell-system closed under predication-fibration reindexing; $K_4$-graded MLD-class); `code/transformers/accountability-projector.md` (Verdier identification: event-log entries → witness-chain-records).

*Falsifiability/certifiability sectors as $H^1_{\chi_-}$ and $H^1_{\chi_{\sim\circ-}}$.* `predication-categories/theorems/equivariant-cohomology-decomposition.md` (formally defines the four sectors: $H^1_{\mathrm{id}}$ both-symmetric, $H^1_{\chi_\sim}$ negation-antisymmetric, $H^1_{\chi_-}$ conflation-antisymmetric ($\top$-firings, **safety-critical**), $H^1_{\chi_{\sim\circ-}}$ both-antisymmetric (mixed/double-curvature, **safety-critical**)); `code/structures/verify-certifiability-sectors.md` (561-root closure-rule: refuses dispatch when $H^1_{\chi_-} \neq 0$ or $H^1_{\chi_{\sim\circ-}} \neq 0$); `predication-categories/objects/klein-four-gauge-bundle.md`; `predication-categories/concepts/klein-four-symmetry.md`.

*Audit-substrate-bootstrap (project context).* `doing/working/hacking/doing/working/planning/library/project/library/audit-system-bootstrap/_index.md` (three-pass program: Pass 1 = five seed boundary records authored; Pass 2 = predicated-drone-swarm theory in progress; Pass 3 = closure firing pending); `predicated-computing/theorems/{witness-chain-as-proof-object, witness-as-cell}.md`.

*Closure 2-monad and four-regime (re-cited for §3).* `predication-categories/morphisms/closure-2-monad.md`; `predication-categories/theorems/closure-2-monad-lax-idempotence.md` (settled-ness is a property, not extra structure — justifies "asymptotic not absolute" epistemology); `predicated-computing/theorems/closure-rule-system-realizes-closure-2-monad.md`. Four-regime cohomology vanishing theorems re-cited: strict and Scott-continuous force $H^\bullet = 0$; aperiodic regime is where $H^1$ is load-bearing.

**Stubs/gaps for §3.** `[STUB]` `predication-categories/questions/realizability-of-cohomology-classes.md` (when are classes realizable as actual NSC firings); `[GAP]` aperiodic necessary/sufficient conditions; `[GAP]` PyPredComp self-theory missing. Pass-2 of audit-system-bootstrap pending: six-way intersection composition theorem; coordination across handedness-asymmetric participants; safe-envelope-precheck as bilattice-modal suspension; meaningful-human-control as charter-C3-extension.

**Lifting candidates.** `settling-dynamics-opener.md`, `bilattice-cohomology-opener.md`, `crdts-and-calm.md`, `d-frame-cohomology-methodology.md`.

### §4 — Predicated computing

**Goal.** Predicated computer; predication graph store; event log; FARS as the predicated-computer's resource format; the principal claim that *a FARS directory IS a sub-doctrine of a predication hyperdoctrine*; markdown-as-projection / JSONL-canonicity / runtime-cache-derivation; PyFARS as engine realizing the closure-2-monad; PyPredCalc as the math kernel underneath.

**Path.** `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/`. Sub-theories present: `agential-orchestration-platform/` (and within: `flatfile-agentic-resource-system/`), `database-platform/`, `distributed-coordination-platform/`, `functional-runtime-platform/`, `interactive-application-platform/`, `predicated-software-engineering/`, `web-server-platform/`. Of these, **§4 covers** the predicated-computing core + AgOP + FARS; the rest are out of scope for this section (FARS-leaf and AgOP cover what §4 needs).

**Inventory** (paths abbreviated; `pc/` = predicated-computing root; `fars/` = `pc/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/`):

*Predicated computer.* `pc/objects/predicated-computer.md` (substrate is the predication cell, not memory; storage/operations/identity are relational); `pc/concepts/{predication-substrate, closure-conditions}.md` (closure-conditions enumerates seven load-bearing conditions for completeness).

*Predication graph store.* `pc/objects/predication-graph-store.md` (live valuation; cell-value, forward-traversal, backward-traversal); `pc/concepts/{wavefront, two-store-coherence}.md` (two-store coherence: store and log mirror).

*Event log (JSONL canonicity).* `pc/objects/event-log.md` (append-only witnessed history; materializes increment sequence); `tools/platform/pyfars/claims/jsonl-is-canonical-state.md` (PyFARS commits to JSONL); `pc/concepts/{reification, hash-discipline}.md`; `pc/theorems/settlement-determinism.md` (same admitted message → same settled state at any conformant substrate).

*FARS as resource format.* `fars/_index.md` (normative spec — flatfile substrate; markdown frontmatter as presentation-form predications; body as rendered surface); `fars/concepts/{frontmatter-as-presentation, entity-as-model, referencing-entity-pattern}.md`; `fars/objects/{note, fiber}.md`.

*Principal claim — FARS-directory IS sub-doctrine.* `claims/fars-directory-is-predication-categorical-theory.md` (already authored at 561 root). Lists eleven structural commitments forcing component layout. Status `draft`. `pc/objects/application-sublocale.md` grounds sub-theory recursion.

*Markdown-as-projection.* `tools/platform/pyfars/claims/markdown-as-projection.md` (corpus is projection of substrate; render_md is pure function; unauthorized edits revert on regen); `pyfars/concepts/projection.md`; `pyfars/morphisms/render.md`; `pc/theorems/umwelt-as-fiber-projection-with-coherence.md` (generalizes to all projections).

*PyFARS as engine (closure 2-monad realization).* `tools/platform/pyfars/_index.md`; `pyfars/claims/{substrate-purity, replay-determinism}.md`; `pc/objects/{closure-rule-system, closure-rule-record}.md`; `pc/morphisms/settle.md`; `pc/theorems/closure-rule-system-realizes-closure-2-monad.md` (**load-bearing**: math abstraction IS substrate substance; editing closure-rule-system IS editing the closure 2-monad); `pc/theorems/settlement-via-closure-2-monad.md`, `closure-conditions-composability.md`.

*PyPredCalc / pypredcomp as math kernel.* `tools/platform/pypredcomp/_index.md` exists as code + dev docs. **`[GAP]` PyPredComp has no substrate-resident self-theory** (no `claims/`, `objects/`, `morphisms/` parallel to PyFARS). Theorems in pc/ cite `pypredcomp/docs/dev/specs/` instead of theory atoms. §4 must acknowledge this honestly: "PyPredComp realizes engineering commitments in code; the realization is not yet theorized."

*Federation convergence and four-position classification.* `pc/theorems/federation-convergence.md` (substrates sharing closure-rule-system + value-domain + predicate-category + entity-set converge under bidirectional event exchange; converged state = closure of cellwise $\vee_k$); `pc/theorems/four-position-substrate-entity-classification.md` (settled·partnered, settled·unpartnered, unsettled·partnered, unsettled·unpartnered — derived classification, not ad-hoc `status:`); `pc/theorems/four-regime-dichotomy.md` (cite for federation discipline distinction: endpoint vs. trajectory shipping).

*Substrate-operations bigraded modal.* `pc/theorems/{substrate-operations-are-bigraded-modal, closure-kind-exhaustivity}.md`; `pc/concepts/closure-kind.md` (Process / Derivation / Procedure / Inquiry — bigraded modal lattice cells).

*Key morphisms.* `pc/morphisms/{settle, merge, traversal, retraction, closure-rule-application, emit-witness, admit}.md`; `pyfars/morphisms/{render, dispatch}.md`.

**Stubs/gaps for §4.**
- `[GAP]` PyPredComp self-theory missing — relationship to PyFARS lineage unclear.
- `[GAP]` JSONL-as-canonical is PyFARS choice; pc spec doesn't prescribe; relationship needs stating.
- `[STUB]` Markdown-projection-expressibility — formal partition of expressible vs. non-expressible cells not authored.
- `[STUB]` Harness-as-fiber-composition listed in FARS spec as "still to write."
- `[STUB]` Predicated-software-engineering / pc relationship not explicitly drawn.
- Principal claim is `draft`, not `proved` — forcing argument is persuasive but not formally checked.

**Out-of-scope sub-theories** (mention briefly, defer details): `database-platform/`, `web-server-platform/`, `distributed-coordination-platform/`, `functional-runtime-platform/`, `interactive-application-platform/`, `predicated-software-engineering/`.

**Lifting candidates.** `pc/narratives/what-predicated-computing-inherits.md`, `pc/narratives/composability-with-predication-categories.md`.

### §5 — Predicated work

**Goal.** Endeavor and aim; function as aperiodic settling; task cell systems; assignment; capability fibers; the K₄ work-symmetry group; restructure-as-visible-automorphism; refactor-as-invisible-automorphism.

**Path.** `theories/humanities/theories/sociology/theories/work/theories/predicated-work/`. Sub-theory: `predicated-work/governance/` (covered in §6). Refactor dual lives at `theories/.../predicated-computing/theories/predicated-software-engineering/theories/predicated-software-development/theories/predicated-software-refactoring/`.

**Inventory** (`pw/` = predicated-work root; `psr/` = predicated-software-refactoring root):

*Endeavor and aim (function-object structure).* `pw/objects/enterprise.md` ($\mathcal{E} = (C, \Gamma, \mathcal{O})$ — hard core, generative mechanism, operative structure); `pw/concepts/aim-generativity.md` (pursuit generates new aims; $\Gamma$ as closure rule); `pw/theorems/function-as-aperiodic-settling.md` (function's closure ordinal $\geq \omega_1$); `pw/theorems/aim-generativity-iff-aperiodic.md` (equivalence — requires P1 finite-evidence-per-cadence and P2 aim-separateness).

*Operations base / settling / causal settling.* `pw/objects/{operations-base, operations-settling, operations-causal-settling}.md` ($B_{\mathrm{op}} = (\mathbf{2}, \mathcal{C}_{\mathrm{op}}, E_{\mathrm{op}}, \lambda)$; bifurcates operational and normative; causal settling gives apex/void/work-streams); `pw/concepts/{normative-operational-layering, operational-evidence}.md`.

*Task cell system.* `pw/objects/task-cell-system.md` (triple $(G_T, \mathcal{S}_T, v^T_0)$; lifecycle open→active→completed/failed/abandoned/cancelled); `pw/theorems/completion-as-quiescence.md` (task complete iff quiescent at goal cells with target valuation; abandonment ≠ completion).

*Assignment.* `pw/objects/assignment.md` (entity fiber, NOT predicate on task; Hohfeldian invariants: derivativity, accountability, boundedness, revocability); `pw/morphisms/dispatch.md` ($\delta(A,T) = \bigwedge_c^{(t)}(\rho_T(c)\Rightarrow\sigma_A(c))$); `pw/questions/reconciling-assignment-as-entity-vs-predicate-on-task.md`.

*Capability fibers.* `pw/objects/capability-fiber-bundle.md` ($\mathcal{K} = (\mathcal{K}^{\mathrm{prov}}, \mathcal{K}^{\mathrm{req}})$); `pw/theorems/{capability-availability-from-existential, capability-grant-as-base-change-along-grant-inclusion}.md`.

*K₄ work-symmetry group.* `pw/objects/work-symmetry-group.md` ($K_4 = \langle \sim, - \rangle$ acting cellwise on $\mathbf{FOUR}$ — identity, falsifier, audit-conflation, paranoid; gauge subgroup preserves settling; equivariant cohomology); `pw/concepts/audit-conflation.md`.

*Restructure-as-visible-automorphism.* `pw/theorems/restructure-as-visible-automorphism.md` (cosmetic ∈ $N(v^{\mathrm{op}})$ vs. substantive in visible quotient); `pw/theorems/adjudication-modes-and-h1.md` (affirm/retract/acknowledge sit in $H^1_-$ under $K_4$ equivariant decomposition).

*Refactor-as-invisible-automorphism (the dual).* `psr/theorems/refactor-as-invisible-automorphism.md` (codebase transform is refactoring under witness language $W$ iff fixes all newly-designated $W$-cells); `psr/concepts/{refactor-as-invisible-automorphism, witness-language-relativity}.md`; `psr/theorems/breaking-change-as-visible-automorphism.md`; `psr/objects/{refactor, codebase-cell-system}.md`; `psr/morphisms/{rename, extract, inline, move}.md`; `psr/narratives/structure-preservation-as-substrate-algebra.md` (synthesis exposition of the duality).

*Plan / workflow / recurrent practice.* `pw/objects/{plan, workflow, recurrent-practice, execution-event, observation, finding, adjustment, handoff-cobordism, quantifier-adjoints-on-work-fibers, operations-loop}.md`; `pw/theorems/{plan-completion-as-meet, regime-of-task, regime-of-recurrent-practice}.md`.

*Coordination / CRDT / sheaf.* `pw/theorems/multi-agent-work-as-crdt.md` (CALM = vanishing $\delta^n$ for work-unit's sheaf); `pw/theorems/agent-team-as-bilattice-network-sheaf.md`; `pw/concepts/closure-driven-coordination.md`.

*Cadence and temporal structure.* `pw/concepts/{cadence, cadence-as-modal-frame, work-regime}.md`; `pw/theorems/{cadence-as-step-shift-rg-flow, cadence-modal-non-normality}.md`.

*Operations on work (morphisms).* `pw/morphisms/{decompose-task, witness-as-increment, adjudicate-witness-conflict, lift-task-to-plan, project-fiber-to-capability, settle-cycle, retrospect-via-cosettling}.md`.

*Subsidiary theorems (cite as needed).* `pw/theorems/{work-stream-count-as-four-regime-classification, dispatch-monotonicity, dispatch-readiness-regime-is-strict, decomposition-as-base-change, plan-as-tensor-of-task-cobordisms, audit-as-cech-resolution-of-operations-settling, workflow-composition, work-type-as-closure-structure, satisficing-as-threshold-dispatch, deadline-as-settling-bound, labor-extraction-as-surplus-cell, witness-network-propagation-as-fibration-comonad-descent}.md`.

**Stubs/gaps for §5.** `[GAP]` P1 finite-evidence formalization in `operational-evidence`; `[GAP]` aim-generativity reverse-direction canonicality assumption; `[GAP]` $H^1$ operational meaning (two open questions); `[STUB]` quantale-enriched dispatch; `[STUB]` capacity as stochastic settling; `[GAP]` `minka-collective-labor-as-work-type` open.

**Lifting candidates.** `pw/narratives/three-formalisms-of-work.md`; `function-grounded-in-critical-tradition.md` (MacIntyre, Lakatos, Dewey, Du Bois — important for §7 connection); `situated-action-and-the-settling.md`; `organizations-as-bilattice-network-sheaves.md`; `psr/narratives/structure-preservation-as-substrate-algebra.md`.

### §6 — Predicated governance

**Goal.** Institution; office as double settlement; charter as closure system; jurisdiction; jural relation; recognition as bigraded common knowledge; delegation as authority residuation; tradition pluralism as fragment coproduct; charter amendment as visible automorphism; federation cohomology as Mayer-Vietoris.

**Path.** `theories/.../predicated-work/theories/predicated-work/governance/`. Sub-theory of predicated-work (governance presupposes work). No further sub-theories (leaf). 73 atoms.

**Inventory** (`pg/` = predicated-governance root):

*Institution.* `pg/objects/institution.md` (quintuple of positions, deontic profiles, constitutive rules, collective recognition, background conditions); `pg/concepts/deontic-modality.md` (modal structure of obligation/permission/prohibition as bilattice-valued).

*Office (as double settlement).* `pg/objects/{office-as-double-settlement, incumbent, officer}.md` (two required predicates: recognition + induction; officer adds discretionary *zone*).

*Charter (as closure system).* `pg/theorems/charter-as-closure-system.md` (rules/guidelines/preferences/instructions tiers with strict precedence as language-fragment hierarchy); `pg/objects/charter.md`; `pg/theorems/charter-amendment-as-visible-automorphism.md`.

*Jurisdiction.* `pg/objects/jurisdiction.md` (quadruple: authority, stage-range, predicate-category, validity-condition); `pg/theorems/jurisdiction-as-base-change.md`; `pg/morphisms/jurisdictional-{invocation, declination, submission, excess, vires}.md`.

*Jural relation.* `pg/objects/jural-relation.md` (Hohfeldian: power, duty, privilege, immunity); `pg/morphisms/correlate-of.md` (correlative-pair operation); `pg/theorems/correlative-pair-as-modal-dual.md` (Hohfeldian eightfold = orbit under $K_4 \times \mathbb{Z}/2$).

*Normative system.* `pg/objects/{normative-system, norm}.md`; `pg/concepts/norm-conflict.md`; `pg/theorems/norm-conflict-as-top-valued-cell.md` (substrate-native conflict detection); `pg/theorems/conflict-of-laws-as-beck-chevalley-failure.md`; `pg/theorems/norm-revision-as-cocompletion.md`.

*Recognition as bigraded common knowledge.* `pg/theorems/recognition-as-bigraded-common-knowledge.md` (recognition = truth-axis CK fixed point, induction = knowledge-axis; divergence on multi-witness frames explains four incumbency states).

*Delegation as authority residuation.* `pg/theorems/delegation-as-authority-residuation.md` (delegation = right-residuation on principal's authority; the four invariants are consequences of the residuation table); `pg/morphisms/delegation.md`; `pg/theorems/delegation-transport-via-beck-chevalley.md`; `pg/theorems/military-command-chain-as-modal-composition.md`; `pg/concepts/authority-gate.md` (unifies authority-checking ops as $a \Rightarrow x$).

*Tradition pluralism as fragment coproduct.* `pg/theorems/tradition-pluralism-as-fragment-coproduct.md` (governance patterns coexist as coproduct of closure-rule fragments; compatibility = MV condition on intersection); `pg/concepts/governance-pattern.md` (closure-rule fragment + witness language + recognition discipline); `pg/theorems/cohomological-signature-of-traditions.md` (each pattern has characteristic cohomology class); `pg/narratives/non-hohfeldian-governance-traditions.md`.

*Non-Hohfeldian patterns (first-class).* `pg/objects/{consensus-closure, rotational-authority, restorative-accountability, governing-by-kinship, conduct-teachings-as-evaluation-predicates, leitourgia, ayni-reciprocity, black-radical-refusal, authority, contract}.md`. **Important for §7 — these are how Black-radical and Indigenous traditions are formalized inside §6.**

*Federation cohomology as Mayer-Vietoris.* `pg/theorems/federation-cohomology-as-mayer-vietoris.md` (jurisdictional-cover MV; constituent / overlap / federation-only content distinguished by exact-sequence roles).

*Office formalism equivalence.* `pg/theorems/office-formalism-equivalence.md` (Heyting-algebra+nuclear-closure formalism ≡ bilattice office-as-double-settlement).

*Polity (the quadruple).* `pg/objects/polity.md` (institution, populace, autarkeia, constituent-power; recognition generated internally by the populace).

*Hohfeldian morphisms.* `pg/morphisms/{installation, revocation, assignment, novation, ratification, succession, succession-as-handoff-cobordism, estoppel, waiver}.md`.

*Subsidiary theorems.* `pg/theorems/{leitourgia-discharge-as-bigraded-settlement, community-constitution-as-sheaf-descent, office-merger-as-beck-chevalley-square, quorum-as-colimit-of-voter-fibers, consensus-settlement-as-authority-gate-update, estoppel-as-monotone-coalgebra-fixed-point, teachings-loss-as-authority-gate-revision, restorative-retributive-norm-conflict}.md`.

**Stubs/gaps for §6.** `[Q]` deontic-hyperdoctrine (full deontic modal as hyperdoctrine); `[Q]` ordinal-society as governance pattern; `[Q]` removal-from-office (forced removal underspecified); `[Q]` precedence-in-least-fixed-point (precedence declared but not formalized); `[Q]` charter-tier-fragment-correspondence (which language fragments correspond to which tier).

**Lifting candidates.** `pg/narratives/non-hohfeldian-governance-traditions.md` (highly load-bearing for §6 → §7 bridge).

### §7 — Black Liberation and Indigenous Sovereignty as objects

**Goal.** Honest presentation of what the corpus has formalized in the social-theoretic apparatus that bears on the 561 function. Not a defense of these as ends; not a survey of their full external literatures. The substrate atoms in `black-radical-tradition/`, `abolition/`, `indigenous-anarchism/`, `settler-colonialism/`, and adjacent trees, with explicit acknowledgment of what is partial.

**Path notes.** Source theories live under `theories/.../humanities/sociology/critical-theory/theories/{black-radical-tradition, abolition, anarchism/theories/indigenous-anarchism, povinellian/theories/settler-colonialism}/`. The substrate-formalization of these traditions as governance patterns lives in `predicated-work/governance/objects/` (cross-cited from §6). The bridge narrative lives at `predicated-work/narratives/function-grounded-in-critical-tradition.md`.

**Inventory** (`crit/` = critical-theory root):

*Black radical tradition.* `crit/black-radical-tradition/`:
- `_index.md` (vantage point from which modern domination becomes visible).
- `terms/{racial-capitalism, undercommons}.md` (formalized concepts).
- `figures/{cedric-robinson, angela-davis, ruth-wilson-gilmore, saidiya-hartman, fred-moten, w-e-b-du-bois, c-l-r-james}.md` (entry nodes).
- `texts/{abolition-as-horizon, fugitivity-and-the-limits-of-recognition, racial-capitalism-after-robinson, black-radical-tradition-and-russian-semiotics}.md` (essays/narratives).
- *Missing/partial:* Sylvia Wynter, Frantz Fanon (cited but no figure pages); Audre Lorde, bell hooks, Hortense Spillers, Patricia Hill Collins, Combahee River Collective (Black feminism, present in figures with varying depth).

*Abolition.* `crit/abolition/`:
- `_index.md`, `terms/abolition.md` (governance theory, not policy subtraction).
- `theories/state-repression/` sub-theory with terms: necropolitics, governmentality, panopticism, biopolitics, legibility, surveillance, snitch-jacketing, economies-of-abandonment, organized-abandonment.
- `texts/*` — evidentiary structuration, copjacketing, TILF charges.

*Indigenous anarchism.* `crit/anarchism/theories/indigenous-anarchism/`:
- `_index.md` (reimagining anarchism through Indigenous traditions; refusal of export-model).
- `terms/indigenous-anarchism.md`.
- `figures/`: Glen Coulthard, Leanne Simpson, Audra Simpson, Kim TallBear, Vine Deloria Jr., Russell Means, Lucy Parsons.
- `texts/liberal-anarchism-is-incommensurate-with-decolonization.md`.

*Settler-colonialism (povinellian).* `crit/povinellian/theories/settler-colonialism/`:
- `_index.md` (settler colonialism as ongoing structure; elimination logic).
- `terms/{indigenous-sovereignty, grounded-normativity, indigenous-resurgence, recognition-refusal, settler-colonialism, decolonization, land-back, knowledge-sovereignty, colonial-botany}.md`.
- Povinellian parent terms: economies-of-abandonment, endurance, quasi-event, geontologies, geontopower, late-liberalism.
- `figures/elizabeth-povinelli.md`.

*Substrate-formalized governance patterns realizing these traditions* (cross-cited from §6 — these are the *operational* presence of BL/IS in the substrate):
- `pg/objects/black-radical-refusal.md` (refusal blocking + fugitive lusory subsystem + abolition-as-construction $S_{\mathrm{abol}}$).
- `pg/objects/restorative-accountability.md` (Ubuntu lineage; restoration vs. retribution).
- `pg/objects/governing-by-kinship.md` (Aboriginal Australian kinship; Songlines as $H^1$-classes).
- `pg/objects/conduct-teachings-as-evaluation-predicates.md` (Anishinaabe seven-grandfathers).
- `pg/objects/ayni-reciprocity.md` (Andean ayllu; ayni + minka; complementarity).
- `pg/objects/leitourgia.md` (ancient governance service; bigraded discharge).
- `pg/objects/{rotational-authority, consensus-closure}.md`.

*Bridge narrative.* `predicated-work/narratives/function-grounded-in-critical-tradition.md` — sketches the closure-rule structure for BL (vigilance against slavery-afterlife as non-Scott-continuous antecedent reading generational accumulation; refusal of inherited grammars as blocking cells; affirmation of fugitivity as lusory constraints) and for IS (7-generations principle as cross-generational closure rule; antecedent reads projected consequence at $\tau + 7$-generations). **Honest acknowledgment in this file:** the function's specific $H^1$-class is NOT computed; the closure rules are sketched, not written out as substrate cells.

*Survey atoms (original to corpus, useful as reading order).* `pw/narratives/black-radical-governance-survey.md`; `indigenous-governance-traditions-survey.md` (Haudenosaunee, Anishinaabe, Ubuntu, Andean ayllu, Aboriginal Australian); `feminist-organizational-theory-survey.md`; `cybernetics-and-governance-survey.md`.

*Adjacent traditions (cite, do not unpack in §7).* `crit/{feminism, marxism, foucauldian, biopolitics, postliberalism, han, queer, situationist, benjaminian, affect-theory}/` — each contains terms and figures relevant to the function but out of §7 scope.

**Honest formalization status.**

| Tradition | Concepts formalized | Governance objects | Closure rules | $H^1$-class |
|---|---|---|---|---|
| Black radical | racial capitalism, undercommons, abolition | black-radical-refusal | sketched | OPEN |
| Abolition | abolition-as-construction | (in black-radical-refusal) | partial $S_{\mathrm{abol}}$ | OPEN |
| Indigenous sovereignty | 6+ core terms | kinship, conduct-teachings, ayni | 7-generations sketched | OPEN |
| Settler-colonialism | 8 core terms | (cross-tradition) | refusal sketched | OPEN |
| Indigenous anarchism | indigenous-anarchism (term) | via settler-col + anarchism | implicit in land-defense practice | OPEN |
| Feminist org theory | — | implicit in patterns | "no invisible labor" rule explicit | OPEN |

Roughly: BL ≈ 40% formalized / 60% narrativized; IS ≈ 50% formalized / 50% narrativized; joint function ≈ 20% formalized / 60% narrativized / 20% open computation.

**Stubs/gaps for §7.**
- `function-closure-rules.md` (open question): construct explicit candidate rule system for BL+IS function; confirm aperiodic-regime claim by closure-ordinal computation; produce $L_{\mathrm{ns}}$.
- BL and IS interaction *under conflict* (joint firing algebra) — not formalized.
- Specific Indigenous governance structures (Haudenosaunee Grand Council, Anishinaabe clan system, Aboriginal age-grade) — surveyed not formalized as substrate objects.
- Land-defense movements (Standing Rock, Wet'suwet'en, Mauna Kea, Oka, Black Mesa) — flagged "pending direct engagement" in indigenous-anarchism `_index.md`.
- Specific Songlines (governing-by-kinship pending community-authorized parameterization).
- Ayni discharge protocols pending community-authorized sourcing.
- Recognition-refusal as operational governance — concept formalized, operations not.
- Grounded-normativity as operative substrate cells — concept cited, formalization open.

**Lifting candidates.** `predicated-work/narratives/function-grounded-in-critical-tradition.md` is the single most-load-bearing source for §7's exposition of how the math grounds the social-theoretic content. `pg/narratives/non-hohfeldian-governance-traditions.md` for the bridge from §6.

**Critical posture for §7.** The section presents the *first and most difficult work the corpus has done* honestly: positioning BL and IS as objects with substantial theoretical depth (not external citations), formalizing governance patterns that encode tradition-specific closure rules, and openly acknowledging that the *specific substrate content* — closure rules, $H^1$-class, operational detail — remains open work. The mathematics gives the function its structural home (aperiodic regime); the traditions give it substantive content (governance patterns); the formalization gives it operational precision; the gaps show where work continues. **Crucially, the section makes no attempt to derive BL/IS from Western political theory or from the mathematics — it presents what the traditions themselves carry, in substrate-algebraic form where formalized and in narrative where not.**

### §8 — The 561 Group, instantiated

**Goal.** Polity-quadruple filled in. Captain as constituent-power locator. Substrate-rooted directory at `/home/emsenn/561/` as polity-as-image. PyFARS instance bound to the 561 superrepo. Trio of role-readings: govern / present / drive. Confederacy at meta-repo scope.

**Path notes.** All atoms at 561 root unless noted.

**Inventory:**

*Polity-quadruple instantiated.* `prose/teaching/explanations/561-group.md` (the polity itself); `code/structures/polity.md` (agent-form: chartered institutional collective with predications); `code/structures/{entity, boundary, persona, personnel, officer, agent, body-natural, agent-community, character}.md` (the upstream identity-primitives the polity instantiates); `code/transformers/{incarnates, member-of, incumbent-of, has-character, accumulates-memory}.md`; `work/governance/charter.md` `[STUB]` (the polity's constitutive rules unwritten); `work/governance/conventions.md` `[STUB]`.

*Captain as constituent-power locator.* `prose/teaching/explanations/captain.md` `[STUB]` (the role; powers, duties, escalation paths to be developed); `work/governance/personnel/emsenn.md` (sole current personnel; captain, engineer, scientist); `work/governance/offices/command.md` (institutional seat).

*Substrate-rooted directory as polity-as-image.* `_index.md`; `prose/learning/claims/fars-directory-is-predication-categorical-theory.md`; the five-facet FARS shape (`work/governance/`, `code/`, `prose/`, `references/`, `theories/`); component `_index.md`s at `code/structures/`, `code/transformers/`, `prose/`, `work/governance/`, `work/governance/offices/`, `work/governance/personnel/`, `work/governance/personas/`. `polity.yaml` as confederacy manifest. `prose/orientations/_index.md` (captain's working discipline; nine orientation files for reading, writing, committing, engine).

*PyFARS instance bound to the 561 superrepo.* `tools/platform/pyfars/` (gitlinked submodule; production substrate runtime); `tools/platform/pyfars/work/governance/` (PyFARS's own governance specs the 561 polity inherits as substrate charter); `.pyfars/` (gitignored runtime state); `CLAUDE.md`, `AGENTS.md` (generated harness-projected instructions); `flake.nix`, `Makefile` (build/operator entries).

*Trio of role-readings (govern / present / drive).* **Status: NOT yet formalized as an explicit atom.** `[GAP]` Distinction is implicit in the office structure: command/engineering/science = govern + drive; diviner/scribe/witness/triage/theory-quality + (deferred) mediation/diplomacy/memorial/hospitality/counsel = present. An atom at `prose/teaching/explanations/govern-present-drive.md` or `code/transformers/` would discharge §8's rendering of the trio. Document should either (a) introduce the trinity as a §8 contribution to be discharged into `prose/teaching/explanations/`, or (b) use the office catalogue directly without naming the trinity.

*Twelve constituted offices.* `work/governance/offices/_index.md` (register; two strata); active **agentic-essential**: command, engineering, science, scribe (vacant — librarian-agent serves), diviner (persona:cassia-lorne), witness (vacant — architect/reviewer agents serve), triage (vacant — triage-processor-agent serves), theory-quality (vacant — predication-category-theory-auditor-agent serves). Deferred **human-deferred** (no incumbent, no agent-substitute): mediation, diplomacy, memorial, hospitality, counsel. Plus first-officer and researcher in file listing but not in constituted register `[unclear status]`.

*Personnel.* Only `work/governance/personnel/emsenn.md` is current. Until 2026-05-07 eight `ai-agent`-typed personnel records existed (cassia-lorne, ciia, josh-blevins, michael-marmot, nik-koios, sigmund-vexler, yanagi, zeroth) but were category errors — these are personae, not personnel. Persona records remain in `work/governance/personas/`.

*Active personae.* Nine in `work/governance/personas/`: Calder Underhill (First Officer, RSC Quiescent — internal mythopoetic), Cassia Lorne (Diviner — Hive Routine Reads, holds office:diviner), CIIA (holistic-wellness — Hive), Josh Blevins (civic, role TBD), Michael Marmot (naturalist — Hive), Nik Koios (Koios News reporter — climate/environment), Sigmund Vexler (critical/analytic — Hive), Yanagi (role TBD, underdefined), Zeroth (critical-rationalist — Hive).

*Confederacy structure at meta-repo scope.* `polity.yaml` (manifest: top-level repos `theories` and `tools`; nested `tools/platform/{pyfars production, mash alternative, pypredcomp experimental}`, `tools/math/pypred`, `tools/web/publishing/*`); `README.md` (founding statement: confederacy for Black Liberation and Indigenous Sovereignty, founded 2018-04-01); `code/structures/polity.md` (defines `peer-confederacy(polity, {polity, ...})` predication). Federation morphisms in PyFARS: `tools/platform/pyfars/morphisms/{emitting,admitting}-federation-envelope.md`; `objects/federation-envelope-record.md`. Federation-by-construction commitment in pypredcomp: `docs/dev/decisions/{external-systems-get-drivers-peers-get-federation, federation-by-construction}.md`. Currently single 561 node operates; substrate built federation-ready; no peer admitted yet.

*Computer systems.* `work/governance/computer-systems/{vps-mini-cold-red-gate, loc-lap-bare-cedar-fog}.md` (active compute hosts).

**Stubs/gaps for §8.**
- `[STUB]` `work/governance/charter.md` — 561-specific charter unwritten; only PyFARS substrate charter applies.
- `[STUB]` `work/governance/conventions.md`, `prose/teaching/explanations/captain.md`, `prose/teaching/explanations/561-swarm.md`.
- `[GAP]` Office as polity-root `code/structures/` record (currently only in `work/governance/offices/`).
- `[GAP]` Govern/present/drive trinity as first-class atom.
- `[GAP]` Persona orchestration discipline (how captain operates multiple personae).
- `[GAP]` Federation peer-admittance ritual; first peer-admission would test federation morphisms.
- `[GAP]` Constitution-amending procedure.

**Lifting candidates.** `texts/{black-radical-governance-survey, indigenous-governance-traditions-survey, polycentric-governance-survey}.md` (sociology/work/governance branch). The bridging narrative `predicated-work/narratives/function-grounded-in-critical-tradition.md` (also lifted in §7).

### §9 — Consolidation

**Goal.** The high-level posit of §1 with every symbol defined. Index of the formal apparatus instantiated for 561. Several compact summary formulas — polity-quadruple, function-settling, federation-cohomology of the meta-repo confederacy — not one master formula.

**§9 has no atoms to mine** — it is synthetic, depending on every other section's content being settled.

**Compact summary formulas (working list — to be polished during drafting).**

1. **Polity-quadruple instantiated.**
$$\mathfrak{P}_{561} = (I_{561},\ \mathrm{Pop}_{561},\ \mathrm{Aut}_{561},\ C_{561})$$
where $I_{561}$ is the institution per `pg/objects/institution.md`; $\mathrm{Pop}_{561}$ is the populace presently consisting of {personnel:emsenn} (with persona-agents, agent-substitutes, and a deferred human-personnel cohort); $\mathrm{Aut}_{561}$ is the autarkeia-subset on which the polity is self-determining; $C_{561}$ is the charter as closure-rule subsystem (currently inheriting PyFARS substrate charter; 561-specific charter unwritten).

2. **Function-settling.**
$$f_{561}: \tau \mapsto v^{f}_\tau \in A_{f_{561}},\quad \kappa(f_{561}) \geq \omega_1$$
with $f_{561}$ in the aperiodic regime per `pw/theorems/function-as-aperiodic-settling.md`. Classifying invariant lives in $H^1(\mathbf{T}^*_{\leq \omega_1}, -)$; $K_4$-equivariant decomposition into four sectors $\{H^1_{\mathrm{id}}, H^1_{\chi_\sim}, H^1_{\chi_-}, H^1_{\chi_{\sim\circ-}}\}$ per `predication-categories/theorems/equivariant-cohomology-decomposition.md`. The two safety-critical sectors $H^1_{\chi_-}$ and $H^1_{\chi_{\sim\circ-}}$ gate dispatch certifiability per `objects/verify-certifiability-sectors.md`. **Note for §9: the $H^1$-class itself is OPEN; the framework is settled, the computation is not.**

3. **Polity-as-image / polity-as-instance.**
$$\text{(image)} = \mathsf{Dir}(\mathfrak{P}_{561}) = \texttt{/home/emsenn/561/} \in \mathbf{Sub\text{-}doctrine}(\mathbf{PrFib}(\mathbf{L},\mathcal{C}_{561},E_{561}))$$
$$\text{(instance)} = \mathsf{Run}(\mathsf{Dir}(\mathfrak{P}_{561}),\ \mathsf{PyFARS}) \in \mathbf{PredicatedComputer}$$
where the directory is a sub-doctrine of the predication hyperdoctrine per `claims/fars-directory-is-predication-categorical-theory.md`, and the PyFARS engine realizes the closure 2-monad on it per `pc/theorems/closure-rule-system-realizes-closure-2-monad.md`.

4. **Captain as constituent-power locator.**
$$C_{561}^{\mathrm{loc}}(\tau_0) = \texttt{personnel:emsenn},\quad \tau_0 = \text{founding-stage}$$
$$\mathrm{Aut}_{561}(o) \leftarrow \texttt{personnel:emsenn}\quad \forall o \in \{\texttt{office:command}, \texttt{office:engineering}, \texttt{office:science}\}$$
Authority on other constituted offices flows by residuation through agent-substitute incumbencies (scribe ← librarian-agent, witness ← architect/reviewer, triage ← triage-processor-agent, theory-quality ← predication-category-theory-auditor-agent); diviner is a true persona-incumbency (cassia-lorne); five offices remain human-deferred.

5. **Confederacy at meta-repo scope.**
$$\mathfrak{P}_{561} \in \mathbf{Confederacy}(\{\mathfrak{P}_{561}\}\ \cup\ \mathbf{PeerPolities})$$
with `peer-confederacy(polity, {polity, ...})` per `objects/polity.md` (561 root) and federation cohomology computed by Mayer-Vietoris on the jurisdictional cover per `pg/theorems/federation-cohomology-as-mayer-vietoris.md`. Currently $|\mathbf{PeerPolities}| = 0$; the substrate is federation-ready by construction; first peer-admission tests `pyfars/morphisms/{emitting,admitting}-federation-envelope.md`.

6. **Trio of role-readings (proposed §8 contribution).**
$$\mathrm{Read}_{\mathrm{govern}} \dashv \mathrm{Read}_{\mathrm{drive}}\quad \text{with}\quad \mathrm{Read}_{\mathrm{present}}: \text{the natural transformation between them}$$
(this is a §8/§9 *contribution* not yet in the corpus; document either elevates it or uses the office catalogue directly).

7. **What the document closes with.** A reader who has worked through §1-§8 can re-read the §1 posit and verify each symbol resolves to a definition introduced in the document. The §9 closing is not a single formula but the *index of resolved symbols* paired with the compact statements above. The reader should be able to write down a one-page boil-down: polity-quadruple + function-settling + image/instance + constituent-power-locator + confederacy.

**Open work the document does NOT close.**
- The actual $H^1$-class of $f_{561}$.
- The explicit closure-rule fragment $C_{561}$ (charter unwritten).
- The govern/present/drive trinity formalization.
- BL/IS interaction algebra under conflict.
- Several office incumbencies (deferred).
- First peer-admission of a confederacy member.

These are honestly named as out-of-scope-but-pending in §9, not papered over.

**Lifting candidates for §9.** None — §9 is synthetic. It may quote the §1 posit verbatim and resolve it term by term.

## Subsection structure (proposed from filled inventories)

**§1 — The 561 Group, formally posited.**
1.1 Posit (the polity-quadruple working-mathematician statement).
1.2 Orientation (one paragraph: who this document is for, its method, its honesty about gaps).
1.3 Deferral catalog (every undefined symbol → defining section, as a table).

**§2 — Predication category theory.**
2.1 Bilattices and the four-bilattice. 2.2 Residuated fusion ($\odot \dashv \Rightarrow$, with the Frobenius failure on $\odot$ flagged). 2.3 Priestley duality and the doubled adjoint system. 2.4 The predicate category and its four $\mathrm{Sym}(E)$-forced generators. 2.5 Predication fibration. 2.6 Predication hyperdoctrine (two parallel adjoint systems, one per order; equality derived). 2.7 Closure 2-monad as Kelly-Lack KZ doctrine (and its independence from the fibration KZ $\mathbb{M}$). 2.8 Settling as transfinite $\leq_k$-monotone orbit. 2.9 Four-regime dichotomy. 2.10 K₄ cohomology and the bitopological site. 2.11 Subsidiary apparatus (Verdier, six-functor, deformation/moduli — cited briefly).

**§3 — Knowledge, truth, witness.**
3.1 Knowledge as predication-settling. 3.2 Truth as bilattice-value stabilization. 3.3 Witness-language relativity. 3.4 Meaningful human control (the four-condition verdict). 3.5 Falsifiability and certifiability sectors ($H^1_{\chi_-}$, $H^1_{\chi_{\sim\circ-}}$).

**§4 — Predicated computing.**
4.1 Predicated computer. 4.2 Predication graph store. 4.3 Event log and JSONL canonicity. 4.4 FARS as resource format. 4.5 The principal claim: a FARS directory IS a sub-doctrine of a predication hyperdoctrine. 4.6 Markdown-as-projection. 4.7 PyFARS as engine realizing the closure 2-monad. 4.8 PyPredComp as math kernel (with the honest gap that no substrate-resident self-theory exists). 4.9 Federation convergence and the four-position substrate-entity classification.

**§5 — Predicated work.**
5.1 Endeavor and aim (the function-object structure). 5.2 Function as aperiodic settling. 5.3 Operations base, settling, causal settling. 5.4 Task cell system, plan, workflow, recurrent practice. 5.5 Assignment and dispatch. 5.6 Capability fibers. 5.7 K₄ work-symmetry group. 5.8 Restructure as visible automorphism. 5.9 Refactor as invisible automorphism (the dual, in software). 5.10 Coordination as CRDT and bilattice-network sheaf.

**§6 — Predicated governance.**
6.1 Institution. 6.2 Office as double settlement. 6.3 Charter as closure system. 6.4 Jurisdiction (and jurisdictional invocation/declination/submission/excess/vires). 6.5 Jural relation (Hohfeldian octuple as $K_4 \times \mathbb{Z}/2$ orbit). 6.6 Normative system and norm conflict as $\top$-cell. 6.7 Recognition as bigraded common knowledge. 6.8 Delegation as authority residuation. 6.9 Tradition pluralism and non-Hohfeldian patterns. 6.10 Federation cohomology as Mayer-Vietoris. 6.11 Polity (the quadruple).

**§7 — Black Liberation and Indigenous Sovereignty as objects.**
7.1 Black radical tradition (concepts, figures, texts, what is and isn't formalized). 7.2 Abolition. 7.3 Indigenous sovereignty / settler-colonialism. 7.4 Indigenous anarchism. 7.5 Substrate-formalized governance patterns realizing these traditions (the cross-citation from §6). 7.6 Bridge — function grounded in critical tradition. 7.7 Honest formalization status (table; gaps; what the corpus has and has not done).

**§8 — The 561 Group, instantiated.**
8.1 Polity-quadruple instantiated. 8.2 Captain as constituent-power locator. 8.3 Substrate-rooted directory as polity-as-image. 8.4 PyFARS instance bound to the 561 superrepo. 8.5 Twelve constituted offices (with the trio-of-role-readings either elevated as a contribution or used implicitly through the office catalogue). 8.6 Personnel and personae. 8.7 Confederacy at meta-repo scope.

**§9 — Consolidation.**
9.1 The polity-quadruple, resolved. 9.2 Function-settling, resolved. 9.3 Polity-as-image / polity-as-instance, resolved. 9.4 Captain as constituent-power locator, resolved. 9.5 Confederacy, resolved. 9.6 What the document does NOT close (open work named honestly).

## What remains open

- Atom-inventory for each section. Order: §2 → §4 → §5 → §6 → §3 → §7 → §1 → §8 → §9. Densest-first, framing-and-instantiation last (since they depend on what the other sections actually say).
- Subsection structure for each section, proposed from its inventory.
- Whether the document needs a glossary, an index of symbols, or a separate notation table.
- Whether the discharge is a single file or a directory of section files with an index. Default: single file, but this is reconsiderable once aggregate length is estimable.
- Whether any of the corpus's existing prose narratives can be lifted in whole or in part rather than rewritten. (A discipline pass is needed: the document must read as one voice; lifted material that breaks register must be rewritten.)
- Whether §7 needs collaboration with material the captain holds outside the substrate before the corpus can honestly carry the section. The friction-log noted that BL/IS substrate-presentation work may itself be load-bearing prerequisite work.

## Process

This question is discharged by the eventual narrative. The drafting process is, in order:

1. **Fill inventories.** One section per turn (or per cluster), captain-gated.
2. **Propose subsection structure.** Per section, from the filled inventory.
3. **Draft.** Section by section into the prose narrative file.
4. **Review.** Read what was written; identify what was misstated, oversimplified, or missing.
5. **Edit.** Rinse and repeat until the formula is recoverable from the document by a reader of prior ignorance.

The question's `status` flips to `closed` only when the eventual narrative passes the recoverability test.
