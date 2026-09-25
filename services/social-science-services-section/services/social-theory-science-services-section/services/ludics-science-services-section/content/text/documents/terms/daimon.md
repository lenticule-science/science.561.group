---
name: "Daimon"
aliases: ["†", "the daimon"]
description: "Jean-Yves Girard's terminal action in ludics, written †, by which a design may end a branch of play by giving up rather than answering — a licensed incompleteness, not a failure, that lets designs be partial without being ill-formed."
instance-of: ludics-primitive
date-created: 2026-08-27
references:
  girard2001:
    authors: ["Jean-Yves Girard"]
    title: "Locus Solum: From the Rules of Logic to the Logic of Rules"
    publication: "Mathematical Structures in Computer Science 11(3)"
    year: 2001
    note: "301-506. Introduces the daimon (dagger, †) as a designated terminal action available to either player at any locus."
  girard2011:
    authors: ["Jean-Yves Girard"]
    title: "The Blind Spot: Lectures on Logic"
    publication: "European Mathematical Society Publishing House"
    year: 2011
title: Daimon
---

The daimon, written † (dagger), is a special terminal action in Jean-Yves
Girard's ludics: at any point where a design owes a response, it may
instead play † and end that branch of play immediately, without
answering the challenge it was posed. Unlike a stuck or malformed
computation, a branch ending in † is a fully legitimate stopping point —
the daimon is not an error state but a licensed way of declining to
continue.

The daimon is what lets a design remain *partial* — silent on cases it
has not yet decided how to answer — without ceasing to be a well-formed
design. Girard needed this because ludics builds designs interactively,
locus by locus, rather than certifying a finished object against a
fixed formula in one pass; without some way to close off an
unfinished branch, no design could ever be presented before it was
complete on every possible line of play. The daimon supplies that: it
lets "I have nothing further to say here" be a move in its own right,
distinct from both a valid completed answer and an outright failure to
interact.

This has a direct consequence for orthogonality (the convergence
relation that gives designs their meaning): a design that reaches † in
an interaction is treated as having converged at that point, regardless
of what the opposing design still had to offer. The daimon is,
informally, the ludics analogue of conceding a game rather than being
checkmated — a recognized way to end the interaction that the formal
system itself sanctions, rather than a breakdown the formalism merely
tolerates.
