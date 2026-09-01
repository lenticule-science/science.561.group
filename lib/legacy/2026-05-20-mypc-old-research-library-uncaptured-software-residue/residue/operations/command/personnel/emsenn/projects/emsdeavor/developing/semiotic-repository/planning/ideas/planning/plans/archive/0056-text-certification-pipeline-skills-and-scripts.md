---
title: "Text Certification Pipeline Skills and Scripts"
date-created: 2026-03-09T00:00:00
authors:
  - claude
status: draft
priority: high
depends-on: [53]
goal: "005"
milestone: ""
appetite: "medium"
---

## Summary

Define and stage a bounded implementation plan for a certification
pipeline that moves short markdown text through structured extraction and
validation layers: markdown to YAML via spaCy, YAML to RDF, RDF through
SHACL constraints, and SHACL results into Lean judgments that certify
or reject the text.

## Motivation

The repository already has parts of the semantic pipeline, but it does
not yet have an end-to-end path that turns short natural-language text
into a formal certification outcome. Without this path, agents can
extract and transform text, but they cannot produce a stable, checkable
"certified or not" result in one reproducible workflow.

This plan closes that gap by defining skills for repeatable agent
execution and scripts for deterministic transformation and validation.
It also creates a clear contract between statistical NLP (spaCy),
semantic graph validation (SHACL), and formal proof tooling (Lean).

## Scope

In scope:
- Short text inputs authored in markdown
- spaCy-driven extraction to structured YAML
- Deterministic YAML-to-RDF transformation
- SHACL validation and machine-readable validation reports
- Lean-side encoding of certification criteria and outcomes
- Skills that orchestrate the scripts end-to-end

Out of scope:
- Long-form document ingestion
- Domain-specific ontology expansion beyond what this pipeline needs
- Replacing existing semantic pipeline infrastructure

## Approach

### Phase 1: Data contract and certification criteria

Define a minimal schema for short-text YAML outputs and the RDF shape
that must be produced from that schema. Define the certification states
and failure classes that Lean will consume.

### Phase 2: Script layer

Create scripts for each deterministic transform:
1. `markdown-to-yaml-spacy`
2. `yaml-to-rdf`
3. `validate-rdf-shacl`
4. `shacl-report-to-lean-input`
5. `lean-certify-text`

Each script accepts file input, writes explicit artifacts, and exits with
well-defined status codes.

### Phase 3: Skill layer

Create a skill set that runs the scripts in sequence, handles expected
failure modes, and records outputs as repository artifacts. Skills
should delegate deterministic work to scripts and reserve model
inference for extraction judgments that cannot be deterministic.

### Phase 4: Pilot and hardening

Run the full pipeline on a small corpus of short markdown samples,
confirm reproducible certify/reject outcomes, then document operational
usage for future agents.

## Steps

1. Write a certification pipeline specification note that defines input,
   output, and pass/fail semantics.
2. Implement spaCy extraction from markdown snippets to YAML conforming
   to the agreed schema.
3. Implement YAML-to-RDF transformation and fixture-based checks.
4. Implement SHACL validation and normalized report output.
5. Implement Lean-facing encoding and a certify/reject checker.
6. Create a skill that orchestrates all scripts and captures artifacts.
7. Run pilot samples and record observed failure classes and fixes.

## Done when

- [ ] A short markdown sample can pass through all stages without manual
      intervention.
- [ ] SHACL violations produce structured failure outputs consumed by
      the Lean stage.
- [ ] Lean stage emits a deterministic certification result for each
      sample.
- [ ] At least one skill can run the full pipeline end-to-end.
- [ ] Pipeline documentation specifies artifact paths and exit codes for
      every stage.

## Dependencies

- Existing RDF generation and ontology infrastructure in the repository
- Existing SHACL shapes relevant to the target text domain
- Lean environment and repository conventions for machine-checkable
  judgments

## Log

**2026-03-09** — Created from prompt to add a plan for skills and
scripts that move short markdown text through spaCy, RDF, SHACL, and
Lean to certify or reject text.
