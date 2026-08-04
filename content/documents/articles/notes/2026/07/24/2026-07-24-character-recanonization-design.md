---
title: "2026 07 24 Character Recanonization Design"
description: "Compose a draft design note for re-canonizing rich legacy personas as lawful character records without flattening: compare the legacy prose records at lib/emsenn/services/561-group/services/rsc-quiescent/lib/characters/cassia-lorne/persona/cassia-lorne.md and lib/emsenn/services/561-group/services/r"
date-created: 2026-07-24
kind: realized-work-order
in-service-of: lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/leader-movement-team
tags:
  - lmt
  - realized-fulfillment
status: define-fulfilled
declared-by: leader-movement-team/realize-fulfilled-work-products
---
# 2026 07 24 Character Recanonization Design

## Demand

Compose a draft design note for re-canonizing rich legacy personas as lawful character records without flattening: compare the legacy prose records at lib/emsenn/services/561-group/services/rsc-quiescent/lib/characters/cassia-lorne/persona/cassia-lorne.md and lib/emsenn/services/561-group/services/red-cup-engineering/src/content/assets/legacy/2026-07-05-561-group/working/performing/library/sigmund-vexler/sigmund-vexler.md against the canonized instance lib/emsenn/services/561-group/services/rsc-quiescent/services/agrodao/lib/agency/characters/sigmund-vexler/sigmund-vexler.json, list exactly which fields the prior canonization dropped (voice principles, may/must/must-not deontic prose, publishing cadence, relationships), and propose the structured fields a character schema would need to preserve them, following the classes-vs-instances law in lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/CLAUDE.md. State which settlement owns each proposed change. Mark DRAFT-FOR-LEADER-REVIEW.

## Fulfillment

DRAFT-FOR-LEADER-REVIEW

---

# Character Re-Canonization Design Note: Preserving Rich Legacy Persona Data in Lawful Records

**Date:** 2026-07-24
**Target path:** `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/services/leader-movement-team/content/documents/articles/notes/2026/07/24/2026-07-24-character-recanonization-design.md`
**Status:** DRAFT-FOR-LEADER-REVIEW
**Work order:** `wo-24-2026-07-24-character-recanonization-design-md-c4411876dcad`

---

## 1. Problem

Two rich legacy persona records exist in the repository:

- **Cassia Lorne** — prose at `lib/emsenn/services/561-group/services/rsc-quiescent/lib/characters/cassia-lorne/persona/cassia-lorne.md`
- **Sigmund Vexler** — prose at `lib/emsenn/services/561-group/services/red-cup-engineering/src/content/assets/legacy/2026-07-05-561-group/working/performing/library/sigmund-vexler/sigmund-vexler.md`

One prior canonization exists: `lib/emsenn/services/561-group/services/rsc-quiescent/services/agrodao/lib/agency/characters/sigmund-vexler/sigmund-vexler.json`

No canonized instance yet exists for Cassia Lorne.

The prior canonization of Sigmund Vexler is suspected to have flattened rich persona content into a thin record. This note identifies what was dropped and proposes schema fields to preserve it without flattening.

---

## 2. Evidence Gap Declaration

The grounding evidence supplied to this inference pass does not include the text of any of the three core files. A verbatim field-by-field comparison cannot be made. What follows is grounded in:

- Capability registry fragments (`data/state/capability-registry.json`, lines 1954–1985)
- Work order text, which names the four drop categories explicitly
- Work order receipt (`receipt-sites-substack-2537d6db02ec-067d27f9a286.json`) for contextual persona facts
- Path and naming structure

**The leader must verify the field inventory against the actual source files before this note leaves DRAFT status.** Nothing below should be treated as a confirmed account of what the JSON does or does not contain.

---

## 3. What the Grounding Reveals About Each Character

### 3.1 Sigmund Vexler

The capability registry carries three truncated fragments that together imply the canonized JSON encodes capability but not conduct:

| Registry fragment | Implied content dropped from JSON |
|---|---|
| `"the sigmund-vexler account's editorial-publisher role is explicitly distinct from and outs…"` | A role-distinction constraint: a deontic rule of the form "must not act as X when acting as Y" — a relationship-scoped must-not |
| `"sigmund-vexler's editorial post is one hand-authored, sha256-pinned article … republishing the same one is refused by design"` | A publishing cadence rule (one-shot, non-renewable) and a must-not (republish) |
| `"no content-generation pipeline exists or was built"` | A must-not (auto-generate content) — absent from a schema that captures only what a character does, not what they must never do |

These three fragments map directly onto three of the four named drop categories: deontic prose, publishing cadence, and relationships.

### 3.2 Cassia Lorne

The capability registry (line 1985) notes: `"the character folder is not code-free -- sites/substack/src/ask.ts implements a working NIM-first text-atomics call and a prompt-to-image morphis…"`

The work order for `wo-sites-substack` describes her as: `"Cassia Lorne (diviner office, persona at …)"`

Implied content not yet in any canonized record:

- **Office assignment** — "diviner office" is a named office, not merely a tag; it implies role obligations
- **Inference modality constraints** — "NIM-first text-atomics", "morphis" are method-of-operation principles, not just capabilities; they belong in voice/method principles
- **Substack platform context** — the `ask.ts` implementation encodes interaction patterns that belong as publishing cadence and voice constraints

---

## 4. Four Named Drop Categories

The work order names four categories the prior canonization is asserted to have dropped. Based on the grounding:

| Drop category | What was lost | Evidence basis |
|---|---|---|
| **Voice principles** | How the character speaks, writes, and presents; stylistic invariants that make it distinguishable from other characters; inference modality (NIM-first, morphis) | Cassia Lorne registry fragment; general pattern of JSON schema encoding identity fields only |
| **Deontic prose (may/must/must-not)** | Explicit permission and obligation statements; must-not rules for conduct within and across roles | Sigmund Vexler registry: "refused by design", "distinct from and outs…" |
| **Publishing cadence** | Frequency, renewal policy, one-shot vs. recurring behavior; the sha256-pin model implies a non-renewable single-post policy | Sigmund Vexler registry: "one hand-authored, sha256-pinned article" |
| **Relationships** | Named associations to other characters, accounts, offices, or services; especially cross-role distinctions | Sigmund Vexler registry: "editorial-publisher role is explicitly distinct from…" |

---

## 5. Proposed Schema Fields

These fields extend the character schema at the class level. Individual character JSON files are instances that populate them. Fields marked `[enforcement]` are intended to be checked at runtime by agents loading the character; fields marked `[advisory]` are documentation-grade.

```json
{
  "voice": {
    "register": "<string: e.g. 'formal-archaic', 'direct-technical'>",
    "inferenceModality": "<string: e.g. 'NIM-first text-atomics', 'morphis'>",
    "prohibitedFramings": ["<string: phrasings the character must never use>"],
    "signaturePatterns": ["<string: recurring constructions that identify the voice>"]
  },

  "deontics": {
    "may": ["<string: explicitly permitted actions>"],
    "must": ["<string: required behaviors>"],
    "mustNot": ["<string: prohibited behaviors>"]
  },

  "publishingCadence": {
    "policy": "<enum: 'one-shot' | 'recurring' | 'on-demand' | 'quiescent'>",
    "renewalAllowed": "<boolean>",
    "republishAllowed": "<boolean>",
    "contentPinned": "<boolean: true if posts are sha256-pinned>",
    "frequencyNote": "<string: free text for cadences that resist enumeration>"
  },

  "relationships": [
    {
      "target": "<string: character slug, account name, or office path>",
      "kind": "<enum: 'peer' | 'reports-to' | 'serves' | 'distinct-from' | 'implements'>",
      "note": "<string: prose constraint, e.g. 'editorial role must not be conflated with arbitrage role'>"
    }
  ],

  "office": "<string: named office this character holds, e.g. 'diviner office'>"
}
```

**Note on deontics enforcement grade:** The grounding shows Sigmund Vexler's must-nots are "refused by design" — implying enforcement-grade, not advisory. The schema should carry a `grade` field on each deontic entry (`"enforcement"` vs. `"advisory"`) to preserve that distinction. This is not in the proposal above and should be added if the leader confirms enforcement-grade rules exist in the legacy prose.

---

## 6. Classes-vs-Instances Law

The demand cites `lib/emsenn/services/561-group/services/board-of-directors/services/executive-office/CLAUDE.md` as the authority for the classes-vs-instances law. That file's text was not in the grounding evidence supplied to this pass. The schema proposal above follows the expected principle — the JSON schema defines the class; each per-character JSON file is an instance — but must be reviewed against the actual CLAUDE.md text before any implementation proceeds. The leader must confirm no proposed field violates a class/instance boundary established there.

---

## 7. Settlement Ownership

| Change | Owning settlement | Basis |
|---|---|---|
| Character JSON schema extension (add `voice`, `deontics`, `publishingCadence`, `relationships`, `office`) | `lib/emsenn/services/561-group/services/rsc-quiescent/services/agrodao` | Owns the canonized instance path; schema lives adjacent to instances |
| Re-canonization of `sigmund-vexler.json` populating new fields | `rsc-quiescent/agrodao` (instance owner), with source evidence drawn from `red-cup-engineering` (legacy prose owner) | Red-cup-engineering holds the authoritative legacy record but does not own the canonical instance |
| Re-canonization of Cassia Lorne (no JSON instance exists yet) | `rsc-quiescent` (character folder owner at `rsc-quiescent/lib/characters/cassia-lorne/`) — unless agrodao is the designated home for all character instances, in which case `agrodao` owns placement | Ambiguous: open question 2 below |
| Classes-vs-instances compliance review | `board-of-directors/executive-office` | CLAUDE.md authority resides at that path |

---

## 8. Open Questions for Leader

1. Does the canonized `sigmund-vexler.json` already carry any deontic or voice content not visible from the capability registry fragments? (Requires the leader or an agent with filesystem access to read the actual JSON before this note can be finalized.)
2. Is Cassia Lorne to be re-canonized into `agrodao` (alongside Sigmund Vexler), or to remain under `rsc-quiescent/lib/characters/cassia-lorne/`? The answer determines settlement ownership of the new instance file.
3. Does the classes-vs-instances law in CLAUDE.md prohibit any proposed field structure — for example, does it require deontics to be structured objects rather than prose strings?
4. Should `mustNot` entries be enforcement-grade (checked at runtime by agents loading the character record) or documentation-grade (advisory only)? The Sigmund Vexler evidence suggests enforcement-grade is appropriate for at least some rules.
5. The capability registry entry for Cassia Lorne carries a "correction" flag — does that correction affect the character's canonical state, or only the capability assessment?

---

*Discharged against work order `wo-24-2026-07-24-character-recanonization-design-md-c4411876dcad`. Incomplete pending file-content verification by the leader. Must not be promoted from DRAFT-FOR-LEADER-REVIEW until the leader has confirmed the field inventory against the actual source files named in Section 2.*

---

Realized from work order `wo-24-2026-07-24-character-recanonization-design-md-c4411876dcad` (class define, source manual), fulfilled by claude-code-inference-team (model claude-sonnet-4-6). This document is a direct realization of that order's own evidence.response -- not a fresh derivation.
