import ObsmetrologiaManual.DocSetup
import ObsmetrologiaManual.PartII.Primitives.Explanation
import ObsmetrologiaManual.PartII.Primitives.Tutorial
import ObsmetrologiaManual.PartII.Primitives.Guide
import ObsmetrologiaManual.PartII.Primitives.Reference

open Verso.Genre Manual InlineLean

#doc (Manual) "The admission boundary" =>

# Chapter 1: Mark, Utterance, Articulation

The descent begins with an austerity that should feel almost uncomfortable. A
mark is not an object. An utterance is not yet a proposition. Articulating is not
yet predication. The first chapter therefore has a negative burden as well as a
positive one: it must teach what has been admitted, and it must protect the reader
from importing later structure too early.

There are only two admissions of free data in the current foundation layer:

* `Obsmetrologia.Mark`;
* `Obsmetrologia.Articulating`.

`Obsmetrologia.Utterance` sits between them as the first structured carrier: a token
side and a claim side, ordered but not yet predicated. The token/claim distinction
is positional. It is not the subject/predicate/object structure of ordinary
grammar, and it is not a truth value. Those words are downstream.

## The closure this chapter asks for

The reader must cross from "there are marks" to "there is a recursive act of
articulating utterances" without smuggling in category, order, truth, or value.
That gutter is the point of the chapter. If it is not crossed cleanly, every later
recovery becomes circular.

The panels below give the first pass:

* an explanation of the primitive floor;
* a short walk through the declarations;
* a local guide for keeping primitive prose clean;
* a compact reference for the names a reader should recognize.

Treat the last three as study apparatus. The mathematical chapter is the
admission boundary itself: what free data the program permits, and why everything
else must wait.

{include 1 ObsmetrologiaManual.PartII.Primitives.Explanation}

{include 1 ObsmetrologiaManual.PartII.Primitives.Tutorial}

{include 1 ObsmetrologiaManual.PartII.Primitives.Guide}

{include 1 ObsmetrologiaManual.PartII.Primitives.Reference}
