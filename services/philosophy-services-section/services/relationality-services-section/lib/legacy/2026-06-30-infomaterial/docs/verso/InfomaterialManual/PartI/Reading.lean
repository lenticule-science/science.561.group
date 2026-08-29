import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Reading paths as proofs" =>

# Reading Paths as Proofs

Infomaterial should be read as a generative descent. The important question is usually
not "what familiar branch of mathematics is this?" but "which earlier act generates
the structure I am looking at?"

The spine is:

* *mark* — the atomic floor.
* *utterance* — a token and a claim, paired as the unit of admission.
* *articulating* — the act that opens an articulation cell.
* *predicating* — the act that turns a potential articulation cell into an oriented
  predication position.
* *positing* — the act that gives predications bilattice-valued standing.
* *settling* — the closure process that runs posited content to a fixed point.

This order matters. Category theory, order theory, equality, modal structure,
cohomology, and aperiodic classification are not imported as external foundations.
They are recovered as derived comparisons of the generated structures at the stage where they
first become lawful.

## Generated-by, not is-a

The most important reading rule is the corpus rule: parent and child are related
by *generated-by*, not by *is-a*. A path is not a topical classification. It is a
proof trace. If one node sits below another, the claim is that the upper node must
exist for the lower node to be generated.

That is why the ordinary habit of filing mathematics by resemblance fails here.
Lattices do not live wherever the word "lattice" sounds useful. They live where
order, meet, and join have been generated. Modal operators do not live in a general
bucket called modal logic. They live where the relevant closure and adjoint
structure has been generated.

The manual should teach this rule repeatedly because it is the practical gateway
to the whole project.

## The documentation surfaces

Infomaterial has several documentation surfaces because they answer different questions.

* The *Lean library* is the source of formal truth. A green build means the
  declarations type-check.
* The *blueprint* is the frontier map. It records statements, dependencies, and
  whether a statement has been formalized.
* This *Verso manual* is the foundations narrative. It should explain the objects
  and their intended readings in prose that stays close to the formal library.
* Development notes and archived content are provenance. They may contain useful
  discovery history, but they are not the normative account.

The manual should therefore contain durable explanations: vocabulary, motivating
examples, comparisons with familiar mathematics, and descriptions of what has and
has not been proved. Speculative claims belong in the blueprint as frontier nodes
before they become foundational prose.

## Faithfulness

The governing discipline: a statement claims exactly what its Lean proves — no more.
Where the genuine result is out of reach of the dependency-free core, the claim is
stated at full strength and left an open hole, never faked by defining the target to
equal what is already in hand.

There are three useful statuses for prose:

* *Derived* means the manual is describing a declaration that exists and is proved
  in the Lean library.
* *Modeled* means the library contains a precise core-only model of a larger
  mathematical idea, with the scope of the model stated explicitly.
* *Frontier* means the statement is part of the intended mathematical direction
  but is not yet a proved Infomaterial theorem.

Good documentation keeps those statuses visible. The reader should never need to
guess whether a paragraph is a theorem, a model, or a research intention.
