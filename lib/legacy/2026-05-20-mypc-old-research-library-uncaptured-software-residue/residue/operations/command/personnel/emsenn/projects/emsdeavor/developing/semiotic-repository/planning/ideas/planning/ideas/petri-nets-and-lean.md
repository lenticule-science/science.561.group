---
title: "Petri nets and Lean for Semioverse Workflows"
aliases:
  - "Petri nets and Lean for Semioverse Workflows"
  - "petri nets and lean for semioverse workflows"
date-created: 2026-01-08T00:00:00
---


This note sketches how Petri nets and the Lean proof assistant can strengthen the math-to-tech pipeline for interactive and [agential semioverse](../../../../mathematics/objects/universes/agential-semioverse/index.md) models.

## Petri nets in brief
- **Places** hold tokens that stand for Things (documents, permissions, artifacts).
- **Transitions** fire when input places have the needed tokens; firing consumes/produces tokens to model state change.
- **Markings** are snapshots of the current state of the [interactive semioverse](../../../../mathematics/objects/universes/interactive-semioverse/index.md) (which Things exist/are enabled).
- **Why use them**: capture concurrency, resource use, blocking, and reachability of closures (can this interaction finish?).

### Operational intuition (from a skills lens)
- Treat **skills as transitions** and **artifacts/permissions as places**. A transition is enabled exactly when its input places have the needed tokens.
- The execution semantics are local and model-free: consume input tokens, produce output tokens. That locality makes subnets safely composable.
- Classic analyses you get “for free”:
  - **Reachability**: can we ever reach a “done” marking?
  - **Boundedness**: can any place grow without bound (uncontrolled queues)?
  - **Liveness**: do we deadlock, or can intended skills keep firing eventually?
- State-space/coverability graphs let you check these mechanically for small nets, or approximate for larger ones.

## Lean in brief
- Lean is a proof assistant with a small trusted kernel; proofs are programs checked by the kernel.
- We can encode small Petri nets and prove invariants (safety, boundedness) and reachability for specific firing sequences.
- Lean can act as an external validator for LLM or human-proposed interaction plans: reject plans that are not reachable or violate invariants.

## Mapping to the semioverse
- **Tokens ↔ Things**: skill definitions, agent credentials, documents, audit entries.
- **Places ↔ states/contexts**: “skill X ready,” “agent Y authorized,” “artifact Z produced.”
- **Transitions ↔ interactions**: execute skill, issue MCP tool call, persist audit row.
- **Markings ↔ [footprints](../../../../mathematics/objects/universes/interactive-semioverse/terms/footprint.md)**: the current [interactive semioverse](../../../../mathematics/objects/universes/interactive-semioverse/index.md) [footprint](../../../../mathematics/objects/universes/interactive-semioverse/terms/footprint.md); closure is a target marking.

## Minimal pipeline
1. **Define a typed Petri net** for skills/resources/agents (colored tokens carrying agent/skill ids; places for availability/lock states).
2. **Generate the net** from `skill-manifest.json` + agent ACLs (one transition per skill invocation pattern; places for required resources/permissions).
3. **Export to Lean** (small incidence matrix + token types).
4. **Check in Lean**:
   - Well-formedness (no orphan places/transitions).
   - Safety/boundedness of key places (e.g., “exclusive lock” cannot exceed 1 token).
   - Reachability for a proposed plan (sequence of transitions) against a start marking.
5. **Use results**: if Lean discharges the proofs, mark the plan as safe/reachable; otherwise surface the counterexample/blocked place.

## Practical cautions
- Keep the base net small: start with resource/permission places and execution/logging transitions. Avoid over-modeling every field.
- Prefer **colored nets** only where types matter (agent/skill ids); otherwise simple places/transitions suffice.
- Use Lean for **structural checks and plan validation**, not to block all runtime execution; fail soft when proofs are unavailable.

## Next documentation targets
- A tiny example net (2 skills, 1 agent) with a Lean encoding and a reachability proof.
- A recipe to export from the manifest to Lean data, so MCP/engine pipelines can be certified pre-flight.

## Starter exercise for this repo
- Pick a narrow flow (e.g., “ingest → validate → normalize → publish”).
- Draw places for each artifact/permission: `raw_record`, `schema_available`, `validated_record`, `write_permission`, `published_record`.
- Draw transitions/skills: `ingest`, `validate`, `normalize`, `publish`.
- Ask three questions:
  1. Is `published_record` reachable?
  2. Is any place unbounded (queues that can blow up)?
  3. Does any transition become permanently disabled (hidden deadlock)?
- Adjust by adding missing resources, splitting transitions, or inserting joins until reachability, boundedness, and liveness look good; then implement that net as your pipeline spec.

## Worked micro-example (text only)
- Places: `raw`, `validated`, `published`, `perm_write`.
- Transitions: `validate` (inputs: `raw`; outputs: `validated`), `publish` (inputs: `validated`, `perm_write`; outputs: `published`).
- Questions to answer:
  1) Reachability: with one token in `raw` and one in `perm_write`, is `published` reachable? Yes: fire `validate`, then `publish`.
  2) Boundedness: can any place blow up? Not in this net; no transitions produce `raw`, so queues cannot grow.
  3) Liveness: deadlock if `perm_write` missing—`publish` stays disabled. So the spec tells you to provision `perm_write` or redesign the flow.

### Place invariants (conserved resources)
- Build the incidence matrix `C` (rows = places, cols = transitions, entries = produced − consumed).
- A **place-invariant** is a non-negative vector `w` with `wᵀ · C = 0`. The weighted token sum `S = Σ wᵢ · m(Pᵢ)` is conserved across all firings.
- Use invariants to show conserved resources (budget, permissions, work units). If `S` is bounded initially, it stays bounded—evidence against unbounded queues.
- To find invariants: compute the left-nullspace of `C`, keep non-negative integer vectors, scale to smallest integers, and interpret each as a conservation law.

#### Tiny invariant example
- Net: places `P1,P2`; transition `t` consumes 1 from `P1` and produces 1 to `P2`.
- Incidence matrix `C` (rows=P1,P2; cols=t): `[-1; +1]`.
- Solve `wᵀ·C = 0`: `-w1 + w2 = 0` ⇒ `w1 = w2`. Pick `w = (1,1)`.
- Conservation law: `S = m(P1) + m(P2)` never changes; tokens shift but total stays constant.

## Lean in practice (why and how)
- Use Lean to **check structure** (well-formed net, no orphan arcs) and **validate plans** (a firing sequence is reachable from a start marking).
- Minimal Lean encoding: a finite set of places/transitions, incidence matrices, start marking, and a definition of enabled/firing. Prove:
  - Safety invariants (e.g., a lock place never has more than one token).
  - Reachability of a proposed plan (given a list of transitions, show each is enabled stepwise).
- Workflow: export a small net from the manifest/ACLs, run canned Lean proofs, and surface pass/fail plus counterexamples to agents.

## Further reading
- **Foundations**: Carl Adam Petri, *Kommunikation mit Automaten* (1962; English translations circulate).
- **Core textbooks**: Tadao Murata, *Petri Nets: Properties, Analysis and Applications* (reachability, liveness, boundedness, invariants); James L. Peterson, *Petri Net Theory and the Modeling of Systems* (semantics-focused).
- **Analysis depth**: Wolfgang Reisig & Grzegorz Rozenberg (eds.), *Lectures on Petri Nets I & II* (state-space, coverability, invariants); Wolfgang Reisig, *Understanding Petri Nets* (pedagogical).
- **Workflows / skills-as-transitions**: Wil van der Aalst & Kees van Hee, *Workflow Management: Models, Methods, and Systems* (workflow nets, soundness); van der Aalst’s process-mining work for mapping executions back to net structure.
- **Engines / operational thinking**: Gerard J. Holzmann, *Modeling and Analysis of Communicating Systems* (not Petri-specific but aligned operationally).
- **Agent/structure bridges**: Colored and hierarchical Petri nets; see *Colored Petri Nets* for typed tokens when artifacts carry structured data.
