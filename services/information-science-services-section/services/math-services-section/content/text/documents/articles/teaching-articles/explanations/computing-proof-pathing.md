---
title: "Placing a Concept by Its Generating Morphism"
description: "The procedure for locating any concept on the generative proof-path — ask which morphism of articulate → predicate → posit → settle generates it — and the roadmap for unfolding the rest of the library onto the spine: mathematics, the language and speech-act base, the agency/work/governance base, and the knowledge-encoding base."
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["generative-unfolding", "knowledge-organization", "curry-howard", "roadmap", "speech-acts", "agency", "governance", "knowledge-encoding", "articulating", "predicating", "positing", "settling"]
type: explanation

---


This is a guide.
It assumes you accept that a filepath is a Curry–Howard proof term and that a concept belongs under the morphism that **generates** it (see the generative unfolding). Here is the procedure for deciding *which* morphism, and the roadmap for unfolding the remaining library onto the spine.

## The procedure

The generator is the chain the corpus's predicated-computing research derives, each stage a restriction of the last:

> **articulate → predicate → posit → settle**

To place a concept, ask the four questions in order and stop at the first that is the concept's *essence*, not merely something it uses:

1. **Is it a relation as such — the bare fact of things standing in relation, before anything is said of them?** Then it is at **articulate** (relation). Directed graphs, raw adjacency, the utterance itself.
2. **Is it something *said of* the related — a predicate, a structure of composing arrows, a type?** Then it is at **predicate** (predication). Categories, sets (extensions of predicates), algebra, types, number (initial algebra), finite structures.
3. **Does its essence require *value or evidence* to enter — standing, charge, measure, degree?** Then it is at **posit** (positing). Many-valued and paraconsistent logic, probability (valuation), the bilattice.
4. **Is it about *closure to a fixed point* — limits, order, convergence, gluing, iteration?** Then it is at **settle** (settling). Order theory, topology (closure operator), analysis (continuity), dynamical systems, sheaves, cohomology.

Two cautions. First, *uses* is not *is*: algebraic geometry uses algebra but is generated at settle (sheaves over spaces); probability uses sets but is generated at posit (valuation). Place by what the concept fundamentally *is*, the deepest morphism whose product it is. Second, **do not manufacture depth**: create a generative segment only when you can name the morphism that earns it and there is real material to carry; an unearned segment is a lie about a type, exactly as a provenance segment is.

When the morphism is genuinely contested, leave the material in its interim topical (Library of Congress) home and record the contest, rather than forcing a placement you cannot prove.

**Derive from the research, not from source code.** The library's categorization is established from the *contents of the research library* — its surveys, claims, references, and explanations — together with first-class reasoning from established scholarship. It is never derived from any program's source code. The corpus holds detailed research on its own generative theory (predication categories, the four settling regimes, the illocutionary-body account of speech acts, the category of work-acting); read *that* to place a concept. A `.mts`/`.ts` file is an implementation of the theory, not the authority for it, and a path that cites code as its justification is filing on the wrong ground.

## State of the unfolding

- **Mathematics — allocated.** The pure structures are on the spine: category theory and type theory at *predicate*; set theory, algebra (with linear algebra), number theory, combinatorics at *predicate*; probability and statistics at *posit*; the value logics at *posit*; order theory, topology, analysis, dynamical systems, algebraic topology, algebraic geometry, and sheaf theory at *settle*. A few interim residents remain under `science/mathematics/` (`mathematical-communication`, `mathematics-subject-classification`) pending the bases below.
- **Knowledge-encoding — home opened.** `encoding`, the sibling branch to predication, now carries the categorical-filepath theory (the codec lattice `path → object → … → eavt`). This is the corpus's own method and the natural home for knowledge representation, library science, ontology, and classification.

## Roadmap: the remaining bases

The generator does not stop at mathematics. It is evaluated *at concrete bases* by restriction — at the base of language and at the base of agency — and each base re-runs `articulate → predicate → posit → settle` over its own marks. These are the next branches off relation.

### The language base (speech acts, grammar, reference)

No sign, parse, or grammatical reading is primitive at the root — the corpus treats each as admitted and settled, never given. Language is **relation evaluated where the marks are linguistic**. The unfolding repeats:

- *articulate* → the utterance, the speech act as bare linguistic relation; phonology and the token string.
- *predicate* → grammar and syntax (a Lambek/ordered predication — see the structural rules — where a verb is `np \ s / np`), parts of speech, semantic frames as natural transformations over the parse.
- *posit* → **illocutionary force and felicity**: a speech act admits *value* (assertion, command, promise, their satisfaction conditions). The corpus's own research grounds this precisely — a performed act is a Hoare triple `{P} B {Q}` whose positing body is one of four illocutionary force-classes indexed by the four-valued bilattice (with abstention itself an act). Austin 1962 and Searle 1969, both held in the library, are the primary sources; force is positing at the language base.
- *settle* → reference, presupposition resolution, discourse closure (how local readings glue into a coherent shared meaning).

`mathematical-communication` (proof panels, pedagogy) and the broader linguistics/semantics/semiotics material migrate onto this branch. Speech-act material is ready to move first, at *posit*.

### The agency base (agents, work, governance)

Agency is **relation evaluated at the base of action**: an agent is a fixed point of *becoming*, so agency is fundamentally a *settling* phenomenon. This is derived from the corpus's research — most directly its survey of *the category of work-acting* and the illocutionary-body account of a performed act — together with first-class reasoning, not from any program's source. The unfolding:

- *predicate* → the agent's perspective: the roles and capabilities a self can carry, the boundary of what it knows.
- *posit* → preference, value, and force over actions; an act emits a charge on the same four-valued bilattice the speech-act research uses — work-acting and speech-acting are the same positing read at the base of deeds rather than words.
- *settle* → **becoming**: an agent is a settled history; collective settling is **governance** (many agents' claims closing to a shared fixed point) and **work** (directed agency, labour as applied becoming over a domain).

Agency moves in at *settle*; work and governance are its collective restriction. This base is where the social-science material (politics, governance, economics-as-collective-valuation, work) eventually unfolds — the hardest derivations, to be done deliberately, and always from the research the library already holds.

### The knowledge-encoding base (representation, library science, ontology)

`encoding` is open. Knowledge-representation, ontology, controlled vocabularies, and library/information science unfold here as restrictions of the codec lattice — each a way of writing a relation down as an addressable term. Classification schemes (UDC, LCC, MSC) live here as the *vocabularies of tags*, never as directories.

## Working rule

Proceed in substantial heartbeats, one base or sub-branch at a time. Derive the generating morphism before moving anything; move serially (one git index); write the node landing with its taxonomy tags; leave un-canonicalized material in `_archive`; repair links; verify the path round-trips; commit and push. The categorical proof tree is the durable composition of its morphisms: every directory you open must be a morphism you can prove generates what lies beneath it, and removing or flattening that segment destroys part of the proof.
