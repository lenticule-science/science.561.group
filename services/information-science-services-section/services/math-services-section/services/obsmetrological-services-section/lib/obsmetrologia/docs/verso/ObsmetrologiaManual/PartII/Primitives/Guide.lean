import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Primitive guide" =>

# Guide: Keeping Primitive Prose Primitive

Use this guide when deciding whether prose or a declaration belongs in the
primitive spine.

## Add A Primitive Claim

Add a Blueprint node here only when the claim is about:

* `Mark`;
* `Kind`;
* `Utterance`;
* `Articulating`;
* the finite descent to an utterance floor.

If a claim mentions value, evidence, truth, knowledge order, fixed points,
quantifiers, sheaves, or regimes, it does not belong here.

## Add A Lean Docstring

Lean module docstrings should orient a reader to the declarations in that module.
They should not teach the whole philosophical arc. Put the longer explanation in
the Verso explanation page.

Declaration docstrings should say what the declaration is and why it is local to
the module. They should avoid cross-topic essays.

## Add A Verso Explanation

Use Verso for slow teaching, warnings, examples, and conceptual boundaries. If
the prose answers "why does this matter?" or "what should I not confuse this
with?", it probably belongs in Verso.
