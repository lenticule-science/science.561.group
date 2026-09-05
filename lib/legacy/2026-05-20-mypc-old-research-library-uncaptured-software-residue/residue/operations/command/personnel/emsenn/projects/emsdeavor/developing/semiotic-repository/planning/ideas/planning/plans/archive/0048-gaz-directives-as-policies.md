---
title: "Rewrite GAZ directives as policies in personal/projects/groundhog-autonomous-zone/"
date-created: 2026-03-08T00:00:00
authors:
  - emsenn
  - claude
status: draft
priority: medium
depends-on: []
goal: "006"
---

## Summary

Extract the CIIA directive system from the GAZ triage vault and
rewrite its directives as policies in a new
`personal/projects/groundhog-autonomous-zone/` project directory,
following the same policy format used by the emsemioverse. This
formalizes the GAZ's contribution as a derivation source and makes its
directive architecture reusable.

## Motivation

The GAZ's CIIA directive system is a direct antecedent of the
emsemioverse's policy architecture, now documented as a derivation
source in `semiotic-endeavor/texts/gaz-directives-as-practice-derivation.md`.
The directives currently live in triage as raw Obsidian vault exports.
Rewriting them as policies makes the derivation relationship concrete
and places the GAZ as a first-class project alongside the emsemioverse.

The GAZ directive system contains design patterns (hierarchical
contradiction resistance, override-with-comprehension, composable
directive templates) that the emsemioverse uses but has not yet
explicitly formalized as standing commitments. Extracting these as
policies clarifies which patterns come from the GAZ and which are
novel to the emsemioverse.

## Steps

1. **Create the GAZ project directory** at
   `personal/projects/groundhog-autonomous-zone/` with an index.md
   describing the GAZ as a project.

2. **Create a policies directory** at
   `personal/projects/groundhog-autonomous-zone/policies/`.

3. **Audit the CIIA directive content** in triage. Files to process:
   - `triage/Groundhog Autonomous Zone/met/ciia/Holistic Wellness CIIA.md`
   - `triage/Groundhog Autonomous Zone/log/2023-12-19 2225h.md` (base CIIA)
   - `triage/Groundhog Autonomous Zone/log/2023-12-15 2227h.md` (foundation prompt)
   - `triage/Groundhog Autonomous Zone/log/2023-12-17 1407h.md` (CIIA implementation)
   - `triage/Groundhog Autonomous Zone/enc/def/conversational information interface.md`

4. **Extract directive patterns** from the CIIA system and write each
   as a policy file:
   - Hierarchical directive non-contradiction
   - Override requires demonstrated understanding
   - Single function constraint (one primary directive)
   - Contradiction detection as rule (not guideline)
   - Composable directive templates
   - Identity-as-directive (philosophical orientation encoded as rule)

5. **Cross-reference with emsemioverse policies**. For each GAZ policy,
   note which emsemioverse policy it corresponds to or extends. Add
   `derived-from` frontmatter linking back to the GAZ policy.

6. **Process remaining GAZ triage content**. After extracting
   directives, evaluate what other GAZ content (logs, definitions,
   etc.) should move to the project directory vs. remain in triage.

## Done when

- [ ] `personal/projects/groundhog-autonomous-zone/index.md` exists
- [ ] `personal/projects/groundhog-autonomous-zone/policies/` contains
      policy files extracted from the CIIA directive system
- [ ] Each policy follows the same format as emsemioverse policies
- [ ] Derivation text references the new policy locations
- [ ] Emsemioverse policies that derive from GAZ patterns have
      `derived-from` cross-references

## Dependencies

- GAZ triage content must exist (it does)
- GAZ derivation text must exist (created this session)

## Log

**2026-03-08** — Created. GAZ derivation text written first at
`semiotic-endeavor/texts/gaz-directives-as-practice-derivation.md`.
Conceptual dependency map updated with X7 (GAZ directives).
