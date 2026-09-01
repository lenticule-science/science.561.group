---
type: question
class: scoping
status: open
explores:
  - knowledge-theory
  - knowledge-system
  - theory-stratum
see-also:
  - ../../../../../_index.md
  - ../../_index.md
---

# Should "knowledge theory" be an explicit layer between information theory and knowledge systems?

The corpus currently lives with this stack:

- `science/information/` — information theory at the top.
- `science/information/theories/knowledge-systems/` — the theory of knowledge systems directly underneath.
- subtheories of knowledge-systems (predicated, markdown-vault, the intersection, formal-concept-analysis).

A reasonable alternative would interpose a `knowledge-theory/` directory between `information/` and `knowledge-systems/`, on the grounds that "what knowledge is" (knowledge theory proper, drawing on epistemology, philosophy of science, sociology of knowledge, theories of justification) is one investigation, while "what a *system* that handles knowledge looks like" (knowledge-systems theory, drawing on library science, information architecture, knowledge organization) is a more concrete investigation that depends on the abstract one.

The 561 corpus has so far chosen *not* to interpose that layer. The current `knowledge-systems/_index.md` explicitly does double duty — it carries both the abstract "what is knowledge" framing and the concrete "what is a knowledge system" framing in one place. The question is whether that conflation is sustainable or whether it will eventually need to be unfolded into two layers.

## Why it matters

If the conflation is sustainable, the corpus saves a layer of nesting (and the deep paths the corpus already uses get no deeper). If the conflation is not sustainable, the corpus is hiding a structural commitment behind a directory choice, and notes that should belong to "knowledge theory" proper (about justification, the warrant for a claim, the social conditions of knowledge production) end up either misclassified under "knowledge-systems" or scattered.

The question is also a *test case* for the corpus's general policy on intermediate stratum layers. The same pressure exists between `science/communication/` and any future `signal-systems/`, between `engineering/computing/` and `engineering/computing/theories/architecture/`, and so on. Whatever this question's answer says about *when* a stratum earns its own directory is precedent.

## Sub-questions

1. **What goes in "knowledge theory" that wouldn't go in "knowledge-systems"?** Is there a body of investigation (Goldman, Kitcher, the social epistemology tradition; Polanyi on tacit knowing; the philosophy-of-science tradition on theory change) that the corpus needs to engage with that doesn't fit comfortably as a subtheory of knowledge-systems?
2. **What goes in "knowledge-systems" that wouldn't go in "knowledge theory"?** Is the line clean, or do most putative "knowledge-systems" notes carry implicit knowledge-theoretic claims?
3. **What does the precedent set?** If `knowledge-theory/` becomes its own layer, does `signal-theory/` become its own layer above `signal-systems/`? Does `proof-theory/` become its own layer above `proof-systems/`? The corpus should be able to predict its own future structural decisions from this one.
4. **What is the cost of *not* splitting?** Concretely: which questions, if any, become harder to ask cleanly because there is no `knowledge-theory/` to host them? If we cannot name even one such question, the conflation is sustainable.
5. **What is the cost of splitting?** Path depth, contributor cognitive load, and the risk that the new layer becomes a near-empty staging area that fails the [theory discipline](../specifications/theory-discipline.md).

## What an answer would look like

A defended decision: either "no, the conflation is sustainable, and here is the rule that keeps it from drifting" (with the rule stated in `knowledge-systems/_index.md`), or "yes, split the layer, and here is the migration that does it" (with a migration plan that respects the [no-bulk-migration](../specifications/term-to-typed-migration.md) constraint).

The answer should also state the general precedent: under what conditions does a stratum layer earn its own directory in this corpus.

## What is at stake in the wrong answer

Conflating prematurely produces an over-loaded `knowledge-systems/` that quietly hides epistemological claims as architectural ones. Splitting prematurely produces an empty `knowledge-theory/` directory that signals more discipline than the corpus has actually accumulated. Either error is recoverable, but each costs a migration to recover from.
