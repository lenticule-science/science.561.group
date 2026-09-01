---
name: "algorithm"
aliases:
  - "algorithm"
date-created: 2026-01-01
tags: []
---

An **algorithm** is a finite, unambiguous sequence of instructions that transforms inputs into outputs. The instructions must be precise enough that a machine (or a person following them mechanically) can execute them without judgment or interpretation.

Three properties distinguish an algorithm from a vague set of directions. First, it must **terminate**: after a finite number of steps, the procedure halts and produces a result. An infinite loop is not an algorithm. Second, each step must be **definite**: there is no ambiguity about what to do next at any point. Third, it must be **effective**: every step can actually be carried out in a finite amount of time using available resources.

A recipe for sorting a list of numbers illustrates the idea. One approach (selection sort) works as follows: scan the entire list, find the smallest number, move it to the front. Then scan the remaining list, find the next smallest, and place it second. Repeat until the list is sorted. This procedure is finite (it terminates after as many passes as there are elements), definite (each step specifies exactly what to do), and effective (comparing two numbers and swapping positions are operations any computer can perform).

Algorithms differ in how efficiently they use time and memory. Sorting a list of one million numbers with selection sort requires roughly one trillion comparisons, while more sophisticated algorithms (like merge sort) accomplish the same task with roughly twenty million comparisons. The study of these differences — [algorithm](algorithm.md) analysis and computational complexity — is central to computer science.

The concept predates modern computing. The word "algorithm" derives from the name of the ninth-century Persian mathematician Muhammad ibn Musa al-Khwarizmi, whose work on arithmetic procedures circulated widely in medieval Europe. Euclid's method for computing greatest common divisors, described around 300 BCE, is one of the oldest known algorithms still in use.

## Related terms

- [function](function.md) — a named operation that implements an algorithm
- [data structure](data-structure.md) — a way of organizing data that algorithms operate on
- [program](program.md) — a complete set of instructions, typically composed of multiple algorithms
- [variable](variable.md) — a named reference to data that an algorithm manipulates
