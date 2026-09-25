---
title: "Predicated Astronomy"
description: "An astronomy in which celestial bodies, instruments, and observations are modeled as a predication settling: bodies are entities, observable properties are predicates, instrument-mediated evidence is bilattice-valued, instrumental capabilities bound the knowledge order, and the observation history of an object is a settling trajectory."
component-of: astronomy
---


A scientific research program: the astronomical theory of *predicated astronomy* — celestial bodies, instruments, and the observation record as a [predication settling](../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md) whose entity set is the union of celestial bodies and observation events, whose predicates are observable properties (apparent magnitude in a filter, spectral type, parallax, radial velocity, transit depth, polarization, time-tagged photon arrival), whose value bilattice records the evidence accumulated about each (body, property, observation-event) cell across all instruments and epochs that have observed it, and whose closure rules are the calibration relations between instruments plus the physical models that link distinct observables to underlying physical properties.

Predicated astronomy is not "catalog astronomy with categorical decoration." It is a claim about *what kind of structure the observed universe is*: a settling whose state at any moment is the totality of evidence accumulated about every body, by every instrument, in every observation. The standard activities of astronomy — cross-matching catalogues, propagating photometric calibration, fitting spectral energy distributions, discovering transients, debiasing exoplanet demographics — appear as standard moves in the settling: knowledge-order joins, closure-rule applications, fiber restrictions, and morphisms between predicate fibers.

The reformulation is most informative where the framing of standard astronomy strains against the framing of standard probability theory:

- **Selection effects.** Surveys do not observe the underlying population; they observe a subset selected by instrumental and observational sensitivity. In predicated astronomy this is structural: the observed sub-settling is the [restriction](../../../glossary/terms/selection-effect-as-fiber-restriction.md) of the true astronomical settling to predicates the instrument can evaluate. Inferring population statistics from the observed sub-settling is the inverse problem of recovering a parent settling from a sub-settling, with explicit closure-rule machinery for the recovery.
- **Multimessenger fusion.** A gravitational-wave event, an electromagnetic transient counterpart, and a neutrino detection together constitute richer evidence about a single astrophysical event than any one alone — but combining them requires reconciling instruments with fundamentally different evidence semantics. In predicated astronomy this is a [bilattice meet across heterogeneous predicate fibers](../../../../../../../content/text/glossary/terms/multimessenger-fusion.md).
- **Instrumental capability.** Each instrument bounds what it can detect — a 30-cm telescope cannot see a faint quasar, a 10-metre interferometer cannot resolve a stellar surface in the visible. The capability of an instrument is structurally a sub-bilattice of admissible values; the totality of instruments at a given epoch bounds the [observable settling](astronomical-settling.md) at that epoch.

This subtheory and the parent astronomy entries describe the same activity from different angles: the parent gives the empirical and methodological content; this subtheory gives the predication-categorical apparatus and proposes new structural questions the parent cannot phrase.

## Convention

This research subtheory follows the predication-categories research-directory convention. Every note is a Markdown file with YAML frontmatter; one entity per file; filenames are active lower-kebab-case slugs.

```yaml
---
type: concept | definition | morphism | theorem | conjecture | question | example | narrative | reference
class: body | instrument | observation | predicate | calibration | symmetry | invariant | ...
status: draft | sketch | proved | open | refuted
depends-on: [...]
realizes: [...]
see-also: [...]
---
```

## Layout

- `concepts/` — astronomical-semantic anchors that recur across the program (observer-instrument, observation cell, calibration link).
- `objects/` — definitions of astronomical-categorical structures (the astronomical settling, the instrument fiber, the celestial-body entity set).
- `morphisms/` — the astronomical moves: photon-arrival reindexing, calibration propagation, cross-matching, transient-detection promotion.
- `theorems/` — claims linking predicated structure to standard astronomical practice.
- `examples/` — worked structural readings of standard astronomical objects and procedures.
- `questions/` — open structural questions the predicated framing makes phrasable.

## Relation to predicated cosmology

[Predicated cosmology](../../../cosmology/theories/predicated-cosmology/_index.md) and predicated astronomy are sibling theories with different scopes: predicated cosmology models the universe as a single settling whose predicates are bulk physical observables; predicated astronomy models the observation record as a settling whose predicates are properties of individual bodies measured through specific instruments. They share the underlying [predication-categorical apparatus](../../../../humanities/theories/math/theories/categories/theories/predication-categories/_index.md) and connect through several bridges:

- The [stellar-evolution example](stellar-evolution-as-predicated-settling.md) currently lives under predicated cosmology because the stellar-structure equations and the cosmological closure-rule system are tightly coupled in that argument; the *observational* counterpart — stellar classification as a predicated settling on the HR diagram — lives here in [stellar-classification-as-predicated-settling](../../../glossary/terms/stellar-classification-as-predicated-settling.md).
- Selection effects in cosmological surveys (Planck's mask, DESI's target selection, JWST's pointing strategy) are jointly cosmological and astronomical and have natural readings in both subtheories.
