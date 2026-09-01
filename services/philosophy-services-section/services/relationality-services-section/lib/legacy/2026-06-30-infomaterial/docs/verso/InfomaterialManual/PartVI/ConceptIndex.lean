import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

/-!
The concept index is the human-facing complement to generated Lean API docs.
-/

#doc (Manual) "Concept index" =>

# Concept Index

Lean API documentation is organized around declaration names. That is necessary,
but not enough for a foundational program. Readers also need to enter by idea,
by received mathematical vocabulary, by corpus term, and by frontier question.

The concept index is the place where those entryways meet.

## Entry Shape

Each concept entry should contain:

* the preferred Infomaterial term,
* aliases and near-misses,
* the generative role of the concept,
* the corresponding Lean declarations or modules,
* the manual chapters that teach it,
* the received mathematical ideas it recovers or refuses,
* the current proof status,
* the frontier questions that attach to it.

## Example Entry: Mark

Preferred term: mark.

Role: the atomic free data of the Infomaterial library.

Do not explain a mark as a set, type of points, proposition, token, symbol, or
object unless the local construction explicitly recovers that view. A mark is
where the formalization begins.

Likely reader path: marks, utterances, articulating recursion, predication.

## Example Entry: Settling

Preferred term: settling.

Role: the closure process by which independent positive and negative evidence is
allowed to stabilize into a regime of comparison.

Do not explain settling as ordinary truth evaluation. Settling comes after
positing and evidence, and the order seen there is a generated measurement.

Likely reader path: predication, positing, settling, recovered order.

## Index Discipline

The concept index should not become a glossary of slogans. Each entry should
help a reader move: from word to construction, from construction to Lean, from
Lean to examples, and from examples to the open frontier.
