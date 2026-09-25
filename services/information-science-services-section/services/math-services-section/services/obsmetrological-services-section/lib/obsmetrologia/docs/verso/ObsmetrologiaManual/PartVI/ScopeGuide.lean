import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
A first pass at the Obsmetrologia scope guide. This is deliberately prose-first:
scope is a mathematical obligation before it is a filing system.
-/

#doc (Manual) "Scope guide" =>

# Scope Guide

The scope guide answers one question for every proposed document, Lean module,
frontier note, certificate, or recovered construction:

> Why does this belong inside Obsmetrologia?

For a conventional library, the answer is often "because mathematicians use this."
For Obsmetrologia that answer is too loose. Obsmetrologia is not collecting mathematics by
topic. It is unfolding a generative foundation and then recovering familiar
mathematics from within that unfolding.

## Scope Tests

A work item is in foundation scope when it introduces, clarifies, or derives one
of the primitive generated strata of Obsmetrologia. These documents must say what free
data is admitted, what operation is being generated, and what later material
depends on it.

A work item is in recovery scope when it explains how a familiar mathematical
discipline appears inside the Obsmetrologia chain. These documents must name the
received concept, name the Obsmetrologia construction that generates it, and be honest
about what has not yet been recovered.

A work item is in frontier scope when it explores a plausible extension, bridge,
certificate, example, or conjectural formalization whose final shape is not yet
settled. These documents must carry explicit status and provenance. Frontier
work is welcomed, but it should not masquerade as foundation.

A work item is in provenance scope when it records where an idea, certificate,
term, example, or agent contribution came from. These documents make the project
auditable without forcing unfinished mathematics into the normative manual.

## Out Of Scope

Material is out of scope when it only imports an external mathematical topic by
association. "This resembles category theory" is not enough. "This recovers a
category-like construction from predication and settling" is the beginning of an
in-scope claim.

Material is also out of scope when it gives a useful software convenience while
hiding the mathematical generation. Convenience belongs in engineering docs
unless it also teaches the mathematics.

## Review Questions

Every new scope document should answer:

1. What is being generated here?
2. What earlier Obsmetrologia objects does it require?
3. What later Obsmetrologia objects does it make possible?
4. Is this foundation, recovery, frontier, or provenance?
5. Which Lean modules currently witness the claim?
6. Which prose pages should a reader visit first?
7. What would make the claim more formal, more faithful, or more complete?
