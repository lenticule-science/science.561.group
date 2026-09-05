---
title: Reiki Practitioner and Lineage System
description: Data model for tracking Reiki practitioners, attunements, symbols, and sessions with visibility predicates and provenance-aware consent bindings.
date-created: 2026-04-05
type: note
name: reiki-practice-system
keywords:
  - reiki-practice
  - practitioner-level
  - attunement
  - lineage
  - visibility-predicate
specialization: project
serves: paradigm-applications
goal:
  - paradigm-applications
campaign: prove-the-paradigm
serves-system: application
scope: application
absorbs: [operations/engineering/triage/content/relationality/triage/triage/ideas-for-concept-computers/knowledge/structure/reiki-system-program.md]
entity-types: [practitioner, session, attunement, symbol, lineage]
channels: [reiki-practice]
requires-from-substrate: [entity-type-declaration, channel-registry, predicate-based-visibility, fiber-query]
scaling-path: [single-practitioner, multi-practitioner, lineage-tree-view, cross-practitioner-pattern-analysis]
paradigm-features: [bilattice-confidence, lineage-as-morphism-chain, consent-as-predicate, fiber-pattern-detection]
---

**practitioner**: name, level (I/II/III/Master), lineage-ref, attunement-history. Level changes only via attunement events.
**session**: practitioner-ref, date, duration, symbols-used (list of symbol-refs), recipient (self or other-ref), reported-effects. Confidence on reported-effects is bilattice-valued — ⊥ (unassessed), t (practitioner reports positive), f (practitioner reports none), ⊤ (conflicting reports).
**attunement**: teacher-ref, student-ref, level, date, lineage-ref. The ordering event — teacher must hold level ≥ student's target level. Creates a directed edge in lineage (doesn't reverse).
**symbol**: name, level-required (I/II/III/Master), tradition (Usui/Karuna/other), description.
**lineage**: ordered chain of attunement-refs tracing from current practitioner back through teachers. Queryable as a path in the attunement graph.

Privacy: `visible-to:` predicate on sessions and attunements (not ACL — predicate). Default: visible to practitioner + lineage-teachers. Override per-entity. Consent withdrawal = new message superseding the visibility predicate.

Absorbed from triage source: the reiki-system-program.md modeled attunements/symbols/sessions/practitioners as "computer recognitions" with provenance and consent/policy bindings, linked to contexts and outcomes, persisted via storage/snapshot operators. That design maps directly: recognition = entity, provenance = sender+lineage-chain, consent = visibility-predicate, storage = FARS flatfile, snapshot = EAVT graph generation.
