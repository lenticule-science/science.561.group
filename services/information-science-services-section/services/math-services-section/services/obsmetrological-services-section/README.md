# Obsmetrological Services Section

The organizational holding for the intended **Sovereign State Enterprise** of
Lenticule Science that serves itself, its mathematical territory, its nation,
and the wider union with services derived from Obsmetrologia.

Two roots realize the theory. The Lean proof root lives here
(`lib/obsmetrologia/Obsmetrologia/…` — Language's Marks-articulated-as-
Utterance grammar unfolding through Positing, Predicating, Settling, and
the wider modules), composed as the math app at `apps/metrologic`
(`@lenticule-science/metrologic`). The JS proof tree realizing that
grammar lives in semiotics custody:
`../../../semiotics-science-services-section/services/articulation-services-section`
(`@lenticule-science/articulating` — admitted marks, utterance, free
recursion, predication, positing, settling — with the nested loci
beneath it).

Related Lean research remains a distinct set of historical/formalization
projects in `lib/formalization/infomaterial/` and `lib/formalization/relmath/`.
They are mathematical research carriers, separate from the proof-assistant
tooling that checks them.

The Lean library has its own canonical carrier: the repository
`emsenn/obsmetrologia`, which is the sole Git owner of the Lean source. This
section consumes it as the Git submodule `lib/obsmetrologia`, pinned by
`lenticule-science/obsmetrological-services-section`; a service repository must
not vendor or independently commit copies of the proof tree. A transfer of the
carrier to `lenticule-science/obsmetrologia` is proposed in
`emsenn/obsmetrologia` issue #29 and has not happened. The `lib/obsmetrologia`
tree in this monorepo is a vendored copy being carried into the owner; it is
not the current source of truth, and proof changes land in
`emsenn/obsmetrologia`. The earlier monorepo-ownership correction (commit
`3b122bf9a5638b1a13351dc2993b87ddb2dd7beb`) is superseded by this topology.

No absence of an application from Obsmetrologia makes the application invalid.
Program-logic carriers that extend Obsmetrologia's own grammar live in the
primary mathematics package's Computing surface
(`lib/obsmetrologia/Obsmetrologia/Computing/`); application demand does not
authorize adding application code beyond that surface. Applications hire a
separately owned OSS service and cross the mathematical package boundary
through an explicit dependency or contract.

## Holdings

- **Obsmetrologia** — the Lean 4 library at `lib/obsmetrologia` (Lean
  `v4.31.0`, pinned in its `lean-toolchain`; `lake build` is the whole-library
  gate; `docs/blueprint/src/` is the Blueprint claim graph; `docs/verso/` is
  the type-checked ObsmetrologiaManual).
- **The proof line** — the section's own scripts, one transformation each:
  `scripts/draft-proof-work-order.mjs` is the pre-blueprint step, drafting the
  order that promotes one red frontier node (seat, axiom budget, corpus, and
  references carried from the seeding order; what only the proof settles left
  empty); `scripts/admit-proof-work-order.mjs` admits a proof work order from
  `content/work-orders/` through the artifact-fabrication admission service;
  `scripts/realize-blueprint-node.mjs` seats the order's blueprint node (red
  before the proof, green only against a receipt) and re-renders the seeding
  order's file without the promoted node; `scripts/audit-proof-
  realization.mjs` runs the four gates — targeted `lake build`, axiom budget,
  blueprint chart, Verso build — and writes the realization receipt. The
  censuses (`scripts/census-set-of-*.mjs`) price the whole library the same
  way.
- **Agency** — `lib/agency/`: the section's offices, characters, and
  incumbencies, org-owned and harness-neutral (the Claude and Codex harness
  policies name these same records and project their agents from them).
  `offices/obsmetrologia-consultant.json` answers from the record and may not
  edit the development, held by `characters/verity-reade.json`;
  `offices/mathematical-library-steward.json` extends it, only through the
  proof line, held by `characters/harriet-metz.json`; one incumbency per
  seat under `incumbencies/`, recognition and induction both `t`. The former
  OML micro-enterprise that held the steward office is legacy at
  `lib/legacy/2026-09-01-oml/`.

## Service portfolio

- **Nation — Computing surface** (`lib/obsmetrologia/Obsmetrologia/Computing/`):
  `CausalityPacket.lean`, `FormatsFour.lean`, and `HoareProgram.lean` are the
  primary mathematics package's own program-logic carriers — `HoareProgram`,
  its preservation theorem `HoareProgram.preserves_post` (no axioms), and its
  keratinous specialization's four theorems (`Quot.sound` only). Production
  MetroPlat's program contracts cite the two keratinous theorems from this
  module.
Everything the section says about its own state is derived: theorem and
axiom censuses, identification sites, regime instantiations, module strata,
and proof realization receipts land as dated JSON under `data/records/`, and
the theorem-facts trace under `data/state/`.

## Org

- **Over:** Lenticule Science (lab of the 561 Group).
- **Intended role:** Sovereign State Enterprise.
- **Current repository status:** the Lean library is carried by
  `emsenn/obsmetrologia` (canonical, sole Git owner of the Lean source) and
  pinned here as the submodule `lib/obsmetrologia` by
  `lenticule-science/obsmetrological-services-section`. A transfer to
  `lenticule-science/obsmetrologia` is proposed (`emsenn/obsmetrologia`
  issue #29), not done. The copy of `lib/obsmetrologia` in this monorepo is
  vendored and not authoritative.
- **Holds:** the Obsmetrologia library and the proof line that extends it.
