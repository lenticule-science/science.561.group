---
title: "Work Domain Terms: Layer Separation Plan"
description: Classifies 35 work domain terms by layer (general concepts, FARS mathematics, operational specs) and provides reorganization steps grounded in disciplinary research.
date-created: 2026-04-01
type: note
name: work-domain-layer-separation-context
keywords:
  - work-terms
  - work-ontology
  - fars-mathematics
  - secondary-intensions
  - term-classification
  - disciplinary-grounding
specialization: analysis
serves: work-domain-layer-separation
---

## What this is

`library/.../sociology/theories/work/terms/` contains 35 files that conflate three layers:
1. **General work ontology** — organizational concepts (task analysis, management theory, philosophy of action, operations research)
2. **FARS mathematical formalizations** — free algebras, initial algebras, nuclear quartet morphisms, pointed presheaves, coalgebras
3. **Operational format specs** — markdown templates and file structure conventions

A reader looking up "what is a task?" should get the organizational concept grounded in Annett & Duncan, not an initial algebra. FARS math belongs in `operations/engineering/fars/`, not sociology.

## Principles

1. Terms are secondary intensions. Extended analysis → texts.
2. **The nuclear quartet stays in work** as a 2×2 (meaning-settled × execution-settled). The nuclear formalization (σ/Δ) is documented in FARS.
3. Split, don't delete. Every FARS formalization is real research — move it to where readers expect it.
4. Ground general versions in external disciplines. Missing additions: Dreyfus (skill acquisition), Schön (reflective practitioner), PMI/PMBOK, BPMN, Bratman, Fayol.

## Classification

### Already clean — no changes (8 terms)
work, process, procedure, derivation, inquiry, method, practice, task. All have proper disciplinary grounding.

### Need splitting — general + FARS math (6 terms)
- **work-unit** — general concept stays; free algebra to FARS
- **skills** — Dreyfus/ACT-R/Schön stays; triple (k,A,f) + quartet morphisms to FARS
- **objective** — SMART+OKR stays; five nuclear propositions with proofs become a FARS text
- **plan** — STRIPS/PDDL/Bratman/partial-order stays; FARS params/AST frontmatter moves
- **workflow** — DAG concept stays in term; Petri net analysis becomes `work/texts/`
- **operation-item** — split three ways: general concept / math / format spec

### Move to FARS entirely (6 terms)
serving, focus, macrofocus, mesofocus, microfocus, refocusing — FARS mathematical research.

### Need rewriting as general terms (2 terms)
- **project** — almost entirely FARS-specific; rewrite grounded in PMI/PMBOK
- **enrollment** — needs evaluation

## Research findings: Non-FARS sources

### Skill (general)
- Dreyfus & Dreyfus (1980/1986) — five-stage model (novice → expert); skill is NOT a rule
- ACT-R (Anderson 1983/1993) — procedural memory, production system
- Schön (1983) — reflection-in-action; "know more than they can put into words"
- Robotics skill libraries — parameterized, reusable capability

### Work Unit
- Annett & Duncan (1967) — HTA "operation" as atomic unit; p×c rule
- PMI/PMBOK WBS — work package as lowest level

### Workflow
- WfMC (1995) — workflow definition
- BPMN (OMG, 2004/2011) — ISO 19510
- Petri nets (1962) — soundness = every started case completes

### Plan
- Bratman (1987) — plans as commitments; coordination over time/others/nesting
- STRIPS (Fikes & Nilsson 1971), PDDL (Ghallab et al. 1998)
- McAllester & Rosenblitt (1991) — partial-order planning

### Project
- PMI/PMBOK — "temporary endeavor undertaken to create a unique product, service, or result"
- endeavor → project → task → work-unit hierarchy

### Objective
- Doran (1981) — SMART
- Grove/Doerr — OKR

## Steps

1. **Create texts directory** for work domain
2. **Split skills.md** — general (Dreyfus/ACT-R/Schön) stays; FARS triple moves
3. **Split work-unit.md** — general (Annett & Duncan, PMI) stays; free algebra moves
4. **Split objective.md** — trim to general content (four-tuple, SMART, OKR); proofs to FARS text or `work/texts/nuclear-reading-of-objectives.md`
5. **Clean plan.md frontmatter** — replace FARS frontmatter with library frontmatter; body stays
6. **Rewrite project.md** — general secondary intension grounded in PMI; distinguish from endeavor/program/enterprise
7. **Split operation-item.md** — general subsumed by work+work-unit+workflow; math to FARS; format spec to engineering infrastructure
8. **Move FARS-only terms + extract philosophical content**:
   - Move serving, focus, macrofocus, mesofocus, microfocus, refocusing to FARS
   - Write brief `library/terms/serving.md` (top-level); officium/leitourgia/diakonia as philosophy/theology text
   - Extract focus phenomenology (Gurwitsch 1964, Husserl, James) to phenomenology text
9. **Extract nuclear quartet formalization to triage** — general 2×2 lattice stays; σ/Δ notation + nuclear pair algebra to triage for proper placement. Note connection to predication-paper adjunction.
10. **Update cross-references**

## Parallel groups

- Step 1 first
- Steps 2, 3, 5, 6, 7, 8 parallel
- Step 4 depends on Step 1
- Step 7 depends on Step 3
- Step 9 parallel with 2-8
- Step 10 last

## What this produces

~15 clean general terms: work, process/procedure/derivation/inquiry, task, work-unit, workflow, plan, project, objective, method, practice, skill. Each grounded in real disciplinary theory. FARS formalizations live in `operations/engineering/projects/fars/` as research grounding general concepts in the relational universe framework.

## Open questions — resolved

1. **Workflow and Petri nets** — Petri net content becomes a `work/texts/` text; workflow term stays as general secondary intension.
2. **Nuclear quartet status** — σ/Δ formalization moves to triage for proper placement; general 2×2 stays in work.
3. **Serving as general concept** — yes, top-level `library/terms/serving.md` like vessel.md.
4. **Focus as phenomenology** — yes, philosophy text; FARS math stays in FARS.
