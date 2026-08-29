---
name: MEMORY
---

Accumulated cross-session knowledge for the proof/ department. Things learned that
are not actionable (those go to PLANS) but that should inform all future work.
Append only; never delete entries.

---

## 2026-03-16 — constructor rename: FML → Proposition, sat/ktr → Saturate/Transfer

All 7 core Lean files renamed: `FML V` → `Proposition V`, `sat` → `Saturate`,
`ktr` → `Transfer`, `sat_step` → `saturate_step`, `ktr_step` → `transfer_step`,
`steps_sat` → `saturating_steps`, `steps_ktr` → `transferring_steps`,
`ktrCount` → `transferCount`, `sound_sat_*` → `sound_saturate_*`,
`sound_ktr_*` → `sound_transfer_*`.

Files affected: `Fml0.lean`, `Normalization.lean`, `NormalizationStrong.lean`,
`NormalizationCompleteness.lean`, `Soundness.lean`, `SyntacticRelationalUniverse.lean`,
`Initiality.lean`. All skill files updated to match.

---

## 2026-03-16 — plans file renamed: PLANS_PROOF.md → PLANS.md

Renamed to match math/ and spec/ naming convention (`dir/PLANS.md` not
`dir/PLANS_DIR.md`). All 10 skill files and 2 other files updated. Use
`proof/PLANS.md` in all references.

---

## 2026-03-16 — ProofSkillObjectTypes spec written

`spec/proof-skill-object-types.md` defines typed objects for proof/ skill chains:
`Sorry` (file+line+category+witness+comment), `GoalType` (Lean type string),
`ProofTerm` (Lean term string), `MathContent` (unit_id+statement+proof_sketch+
depends_on), `BuildResult` (status+message). Skill domain/codomain declarations
use these types.

---

## 2026-03-16 — department structure completed

Added `SOUL.md`, `MEMORY.md`, `INBOX.md` to bring proof/ in line with the six
context files required by `spec/agent-loop.md`. The `§Incoming` section was
removed from `PLANS.md`; all cross-department messages now arrive in `INBOX.md`.
