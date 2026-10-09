---
title: "Emergency Repair Discipline: Reconciliation Is Itself a Capability the Union Has Not Yet Admitted"
description: "The theoretical claim: a completeness check that structurally cannot return success (the capcell-pdk's assertCapCellComplete, which only ever throws) enforces repair-before-addition at the level of one capability, but the same discipline has no reflexive form yet — nothing on disk assays whether a *definition* of completeness is itself complete. Two independently authored, non-cross-referencing Capability Cell schemas coexist in red-cup-engineering as the concrete evidence: the discipline holds one level down and fails one level up, and the missing piece is nameable as an ordinary unadmitted capability, not a metaphor."
date-created: 2026-07-24
kind: research-note
keywords:
  - capability-cell
  - capcell
  - emergency-repair-discipline
  - reflexivity
  - independent-conformance
status: design
declared-by: claude-interactive-session-supplying-leader-movement-team
---


## The claim

"Emergency repair discipline" is not a metaphor borrowed from biology; it names a specific,
checkable engineering property: **a system enforces repair-before-addition when encountering a
broken or duplicated definition of a capability triggers reconciliation of the existing
definition(s), never authorship of a new parallel one.** The claim this note argues is narrower
and more useful than "the repo has good hygiene": the discipline is enforced *within* one
Capability Cell's own completeness check, by construction, but has no enforcement at the level of
*the completeness check itself* — nothing yet assays whether a definition of "what counts as a
complete cell" is itself unique, current, and non-duplicated. That gap is not hypothetical; it is
instantiated on disk right now, by two schemas that define "Capability Cell" incompatibly and do
not know about each other.

## 1. Why the one-level-down enforcement is real, not aspirational

A completeness check enforces repair-before-addition only if it is structurally unable to be
satisfied by self-report — otherwise "repaired" collapses to "someone said so." The PDK's gate
avoids that failure mode by leaving out the success case entirely.
`assertCapCellComplete` (`capcell-pdk-services-section/services/capcell-manifest-fabrication-service/src/fabricate-local-capcell.mjs:264-270`)
has exactly two branches and no third:

```
if (bundle.manifest.missing.length > 0) {
  throw new CapCellUnrealizedError(bundle.manifest.missing, bundle.manifest);
}
throw new CapCellIndependentConformanceRequiredError(bundle.manifest);
```

Supplying full evidence for all 11 required body facets and all 14 required provider capabilities
does not make the function return; it changes which typed error is thrown
(`test/capcell-manifest-fabrication.test.mjs:109-116` fixes exactly this — the "everything present"
case is tested by asserting the *second* throw, never a return value). Mechanically, this means a
capability's own author cannot ever produce, from inside the function, a state that certifies
itself done — `capcell-profile-v1.rml:25`'s "independent conformance must rederive body
completeness, dependency closure, market availability, customer invocation, and receipt identities"
is not a policy sitting next to permissive code; the code cannot return true, so the rederivation
is not optional to skip. That is the discipline working: repair (closing the gap named by
`missing`) is the only path forward, and "forward" still terminates in a refusal, not a claim.

The blockchain-services-section's independently authored assay
(`blockchain-services-section/lib/capability-cell.mjs:47`) enforces a weaker version of the same
shape — `disposition` is `"admitted"` only when a `defects` array is empty, otherwise the literal
string `"cut-required"` — but this one *can* return a clean success value, because it checks
directory population, not independently-witnessed evidence. The two assays sit at different
strengths of the same discipline: one is unconditionally-refusing, one is conditionally-admitting.
Neither states which strength governs "Capability Cell" as a term, because—

## 2. The discipline has not yet been applied to itself, and that is the actual finding

`blockchain-services-section/content/schemas/blockchain-capability-cell.schema.json` and
`capcell-pdk-services-section/content/schemas/capcell-spec.schema.json` are two closed
(`additionalProperties: false`) schemas for the same term, "Capability Cell," authored
independently, overlapping partially (`book`/`appendOnlyReceipt`, `agentCard`/`a2aAgent`,
`offer`/`marketOffer`, `account`/`chainSmartAccount` are plausibly the same concept under different
names) and diverging partially (`activityPubActor` and `x402Offer` are required facets in the PDK
vocabulary with no corresponding field the blockchain schema's closed `organs` object could even
hold without a breaking change). Four separately-owned `AGENTS.md`/`README.md` files
(`blockchain-services-section/AGENTS.md:10-22`,
`web-services-section/.../capability-marketplace-services-section/AGENTS.md:9-15`,
`web-services-section/.../a2a-rmn-task-client-service/AGENTS.md:3-8`,
`capcell-pdk-services-section/README.md:8-16`) each restate "one bounded operation per cell, no
embedded private copies of shared faculties" independently, none deferring to a shared source.

Under §1's own logic, this is exactly the state a completeness check exists to catch and refuse —
except one level up: **there is no third schema, no third assay, whose job is "is the current set
of Capability Cell definitions itself non-duplicated and reconciled?"** The repair-before-addition
discipline that the PDK enforces mechanically for *one cell's* evidence has no analogue enforcing
it for *the definition of a cell*. Nothing throws `SchemaDuplicationUnrealizedError`. Nothing's
`disposition` goes to `cut-required` because two schemas exist. The gap is not "someone forgot to
reconcile two files" — it is that reconciling them is itself an unassayed, unadmitted capability:
no office, no schema, no test names "detect and repair a duplicated Capability Cell definition" as
a thing that must pass before a third cell may be added to either vocabulary.

The mesh law comes closest to naming this directly:
`blockchain-services-section/content/meshes/eip155-5615610-capability-cell-mesh.rml:17` states its
`currentCut` as "Only the trace-chain node is admitted as a new direct cell in this cut; embedded
and foreign capabilities remain explicit migration obligations until their own cell assays pass" —
repair-before-addition, stated as law, at the level of *cells*. No file states the equivalent
sentence at the level of *cell definitions*. That is the actual, specific, checkable gap this note
is naming: the discipline is one level short of being applied to itself.

## 3. What this predicts and what would close it

If the claim in §2 is right, it predicts a concrete failure mode: any future work that needs to
check "is this a valid Capability Cell" has to pick one of the two vocabularies by convention
(whichever the author happened to read), silently, because no admitted record says which is
canonical or how they map. That is a live risk, not a stylistic complaint — a package could pass
the blockchain assay's `organs` check and fail the PDK's `REQUIRED_BODY_FACETS` check, or vice
versa, and there is no third authority to appeal to.

Closing it does not require new theory; it requires the existing discipline applied reflexively:
someone (content-librarian's lane, by this settlement's own roster, since it owns "every term the
firm uses has exactly one place it is defined") writes the mapping or picks the canonical schema,
and an assay is admitted that fails closed when a second, non-equivalent "Capability Cell" schema
is introduced without updating that mapping. Until that exists, "passes the cell assay" is
ambiguous between two non-equivalent checks, and every note (including this one) that uses the
phrase "Capability Cell" without saying which schema it means is trading on an unresolved term.

## Verified vs. interpretive

**Verified** (checkable at the cited file:line): the `assertCapCellComplete` control flow and its
two-branch, no-return-success shape (`fabricate-local-capcell.mjs:264-270`); the test that exercises
the "everything present" case against the second throw
(`capcell-manifest-fabrication.test.mjs:109-116`); the blockchain assay's `disposition` logic
(`lib/capability-cell.mjs:47`); the two schemas' field lists and their overlap/divergence
(`blockchain-capability-cell.schema.json`, `capcell-spec.schema.json`); the four independent
`AGENTS.md`/`README.md` restatements; the mesh's `currentCut` sentence
(`eip155-5615610-capability-cell-mesh.rml:17`).

**Interpretive** (this note's own argument, not a claim any single source file makes): that the
one-level-down/one-level-up framing in §§1–2 is the right way to characterize what "emergency
repair discipline" should mean; that reconciling the two schemas is properly content-librarian's
lane rather than engineering-process-group's; and that this generalizes beyond Capability Cells to
any term this settlement defines in more than one place. An earlier draft of this note also
asserted a cryptographic cross-face binding and a bound/absent/contradictory tri-state per face —
no schema or code read for this rewrite implements either; that proposal describes a capability
that is `Unrealized`, not a fact about what exists today, and is dropped from the claim here rather
than restated as settled.

## Open

- **Unreconciled, with an owner named by roster but not yet dispatched**: the two Capability Cell
  schemas. content-librarian owns "every term has exactly one place it is defined"; this is that
  duty's own backlog, not a new one.
- **Unrealized**: an admitted assay whose job is detecting a duplicated/diverged capability
  *definition*, the reflexive form of §1's per-cell discipline.
- **Unasked**: whether the blockchain assay and the PDK fabricator are meant to check the same
  artifact at different lifecycle stages (scaffold, then evidenced market bindings) rather than
  being simple duplicates — no file states which, and the answer changes what "reconciliation"
  even means here.

## References

- `capcell-pdk-services-section/services/capcell-manifest-fabrication-service/src/fabricate-local-capcell.mjs:264-270` (completion gate)
- `capcell-pdk-services-section/test/capcell-manifest-fabrication.test.mjs:109-116` (fixes the no-success-branch behavior)
- `capcell-pdk-services-section/content/contracts/capcell-profile-v1.rml:24-25`
- `blockchain-services-section/lib/capability-cell.mjs:4-49`
- `blockchain-services-section/content/schemas/blockchain-capability-cell.schema.json:6-29`
- `capcell-pdk-services-section/content/schemas/capcell-spec.schema.json:1-55`
- `blockchain-services-section/content/meshes/eip155-5615610-capability-cell-mesh.rml:15-17`
- `blockchain-services-section/AGENTS.md:10-22`, `web-services-section/.../capability-marketplace-services-section/AGENTS.md:9-15`, `web-services-section/.../a2a-rmn-task-client-service/AGENTS.md:3-8`, `capcell-pdk-services-section/README.md:8-16`
