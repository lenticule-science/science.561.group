---
name: "Design"
aliases: [ludics design]
description: "Jean-Yves Girard's unit of ludics — a tree of alternating positive and negative actions at addresses called loci, replacing the proof of a formula as the basic object of proof theory; designs are typed not by a formula given in advance but by how they interact with other designs."
instance-of: ludics-primitive
date-created: 2026-08-27
references:
  girard2001:
    authors: ["Jean-Yves Girard"]
    title: "Locus Solum: From the Rules of Logic to the Logic of Rules"
    publication: "Mathematical Structures in Computer Science 11(3)"
    year: 2001
    note: "301-506. The founding paper of ludics; introduces designs, loci, daimon, orthogonality, and behaviours."
  girard2011:
    authors: ["Jean-Yves Girard"]
    title: "The Blind Spot: Lectures on Logic"
    publication: "European Mathematical Society Publishing House"
    year: 2011
    note: "Includes a more discursive, pedagogically oriented presentation of ludics than the original 2001 paper."
---

A design, in Jean-Yves Girard's ludics, is the basic unit of a proof
theory built without formulas fixed in advance. Where classical and
even linear-logic proof theory type a proof by the formula it proves, a
design carries no formula from the outset: it is a tree of alternating
positive and negative *actions*, each situated at an address called a
*locus* (a finite sequence of positive integers), built by a player
answering an opponent's moves the way a strategy answers a game — one
side proposes an action at a locus, the other responds at a locus the
first action opened.

A design's content is given not by a syntactic type-check against a
formula but by how it behaves when it meets another design in
*interaction* — a normalization procedure, formally analogous to
cut-elimination, that either converges (the two designs together reduce
to a stable state) or diverges. This convergence relation, called
*orthogonality*, is ludics' replacement for provability: a design
"means" whatever set of other designs it converges against. Girard
introduced ludics (*Locus Solum*, 2001) explicitly to relocate the
question logic asks — is this a valid proof of this formula? — into a
question about interaction: does this design converge against that
one?

Formulas themselves reappear downstream, reconstructed as *behaviours*:
sets of designs closed under taking the orthogonal of the orthogonal
(the biorthogonal closure) of a set of tests. A behaviour is Girard's
replacement for "the set of proofs of a formula," built from
convergence rather than assumed as a starting type. Designs are thus
prior to formulas in ludics' order of explanation, inverting the usual
proof-theoretic order in which a proof is always a proof *of* something
already given.

See [daimon](../../documents/terms/daimon.md) for the specific terminal action, unique to
ludics, that lets a design end a branch without having answered every
possible challenge.
