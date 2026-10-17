---
title: The Semioverse as a knowledge meshnet
date-created: 2026-09-27
type: note
authors:
  - claude-opus-5-5
keywords:
  - semioverse
  - activitypub-plus-plus
  - content-addressing
  - proof-path-addressing
  - language-cone
  - causal-set
  - formal-concept-analysis
  - coordination-free
  - meshnet
description: "The reasoning for the second version of the ActivityPub++ specification, asked for by the founder on 2026-09-27: why a network of ActivityPub++ nodes is a knowledge meshnet and not only a federated social network. Five mechanisms the house already has, each placed as a protocol layer with its maturity marked: content and proof-path addressing, the language cone of readings, activities as a causal set with light cones, knowledge merged as concept lattices under a four-valued order without coordination, and relay by any node. The note is the research phase of the specification's and the book's next cycle."
references:
  lamport1978:
    type: article-journal
    title: Time, Clocks, and the Ordering of Events in a Distributed System
    author:
      - family: Lamport
        given: Leslie
    container-title: Communications of the ACM
    volume: "21"
    issue: "7"
    page: 558-565
    issued:
      date-parts:
        - [1978]
  bombelli1987:
    type: article-journal
    title: Space-Time as a Causal Set
    author:
      - family: Bombelli
        given: Luca
      - family: Lee
        given: Joohan
      - family: Meyer
        given: David
      - family: Sorkin
        given: Rafael D.
    container-title: Physical Review Letters
    volume: "59"
    issue: "5"
    page: 521-524
    issued:
      date-parts:
        - [1987]
  merkle1987:
    type: paper-conference
    title: A Digital Signature Based on a Conventional Encryption Function
    author:
      - family: Merkle
        given: Ralph C.
    container-title: Advances in Cryptology, CRYPTO '87
    page: 369-378
    issued:
      date-parts:
        - [1987]
  rfc6920:
    type: report
    title: Naming Things with Hashes
    number: RFC 6920
    author:
      - family: Farrell
        given: Stephen
      - family: Kutscher
        given: Dirk
      - family: Dannewitz
        given: Christian
      - family: Ohlman
        given: Börje
      - family: Keranen
        given: Ari
      - family: Hallam-Baker
        given: Phillip
    publisher: Internet Engineering Task Force
    issued:
      date-parts:
        - [2013, 4]
  shapiro2011:
    type: paper-conference
    title: Conflict-Free Replicated Data Types
    author:
      - family: Shapiro
        given: Marc
      - family: Preguiça
        given: Nuno
      - family: Baquero
        given: Carlos
      - family: Zawirski
        given: Marek
    container-title: Stabilization, Safety, and Security of Distributed Systems (SSS 2011)
    page: 386-400
    issued:
      date-parts:
        - [2011]
  hellerstein-alvaro2020:
    type: article-journal
    title: "Keeping CALM: When Distributed Consistency Is Easy"
    author:
      - family: Hellerstein
        given: Joseph M.
      - family: Alvaro
        given: Peter
    container-title: Communications of the ACM
    volume: "63"
    issue: "9"
    page: 72-81
    issued:
      date-parts:
        - [2020]
  ganter-wille1999:
    type: book
    title: "Formal Concept Analysis: Mathematical Foundations"
    author:
      - family: Ganter
        given: Bernhard
      - family: Wille
        given: Rudolf
    publisher: Springer
    issued:
      date-parts:
        - [1999]
  belnap1977:
    type: chapter
    title: A Useful Four-Valued Logic
    author:
      - family: Belnap
        given: Nuel D.
    container-title: Modern Uses of Multiple-Valued Logic
    publisher: Reidel
    page: 5-37
    issued:
      date-parts:
        - [1977]
  howard1980:
    type: chapter
    title: The Formulae-as-Types Notion of Construction
    author:
      - family: Howard
        given: William A.
    container-title: "To H. B. Curry: Essays on Combinatory Logic, Lambda Calculus and Formalism"
    publisher: Academic Press
    page: 479-490
    issued:
      date-parts:
        - [1980]
  lambek-scott1986:
    type: book
    title: Introduction to Higher Order Categorical Logic
    author:
      - family: Lambek
        given: Joachim
      - family: Scott
        given: Philip J.
    publisher: Cambridge University Press
    issued:
      date-parts:
        - [1986]
  tarr2019:
    type: paper-conference
    title: "Secure Scuttlebutt: An Identity-Centric Protocol for Subjective and Decentralized Applications"
    author:
      - family: Tarr
        given: Dominic
      - family: Lavoie
        given: Erick
      - family: Meyer
        given: Aljoscha
      - family: Tschudin
        given: Christian
    container-title: Proceedings of the 6th ACM Conference on Information-Centric Networking
    page: 1-11
    issued:
      date-parts:
        - [2019]
  benet2014:
    type: report
    title: IPFS - Content Addressed, Versioned, P2P File System
    author:
      - family: Benet
        given: Juan
    number: arXiv:1407.3561
    issued:
      date-parts:
        - [2014]
  activitypub2018:
    type: report
    title: ActivityPub
    publisher: World Wide Web Consortium
    issued:
      date-parts:
        - [2018, 1, 23]
    URL: https://www.w3.org/TR/activitypub/
---

# The Semioverse as a knowledge meshnet

The founder asked, on 2026-09-27, for the ActivityPub++ specification to
include "our methods of content addressing that allow us to do cool proof path
addressing and curry howard lambek language lorentzian light cones, formal
concept analysis, etc.; that the semioverse becomes a knowledge meshnet is part
of the :O of it," and for the specification and its book to go through the
whole publishing method again. This note is the reasoning that request asks
for, written before any clause, so that the clauses derive from it.

Paths are relative to `lib/emsenn/services/561-group/services/`. Every claim
about house material carries a maturity tag, following the founder's
proof-path addressing plan
(`public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/documents/articles/notes/2026/07/09/2026-07-09-ppa-proof-path-addressing.md`):
**[proven]** in the Lean library, **[built]** in running code, **[specified]**
in a house specification, **[open]** as a stated obligation.

## What the first version specified

The 2026-09-27 ActivityPub++ specification (31 clauses, in
activitypub-services-section) fixes a wire: an ActivityPub activity
[@activitypub2018] carries one CloudEvents envelope, whose data is one A2A
message, whose operation is one part named by an RFC 6920 digest
[@rfc6920]; authority and x402 payment ride inside that message. It says how
one node talks to another. It says nothing yet about what the network as a
whole knows, how that knowledge is ordered in time, or how an address relates
to what it names beyond a hash. Those are the five layers below.

## 1. Two addresses for everything: what it is, and how it was derived

**Content address.** Every object carries its RFC 6920 `ni:` name, the
digest of its bytes [@rfc6920]. The house's `semanticId` computes it over
canonical encodings **[built]**. A content address answers "is this the thing
that was referred to?" without trusting whoever sent it, which is what makes
Merkle's hash trees, Git, IPFS and Secure Scuttlebutt work [@merkle1987;
@benet2014; @tarr2019].

**Proof-path address.** A content address says what bytes; it doesn't say what
the object is or how it was derived. The founder's proof-path addressing plan
supplies the second address: an address is a typed term whose normal form is
canonical, and whose earned filesystem path is the operational proof of its
derivation, each segment a generating or restricting morphism. The
Curry–Howard–Lambek correspondence is why a path can be a proof: proofs are
programs are morphisms [@howard1980; @lambek-scott1986]. The house has the
floor: `CurryHowardLambek.lean` proves `church_rosser` (confluence), so a
well-typed address term has at most one normal form, and `curry_howard_lambek`
**[proven]**; MetroPlat's notation evaluator and `path-term.mts` realize
witness addresses as typed terms **[built]**.

The protocol consequence: an ActivityPub++ object has a content address (its
identity as bytes) and may have a proof-path address (its identity as a
derivation). Both travel with it. A receiver can check the first always and
the second whenever it can type-check the term.

## 2. Every protocol is a reading of the same address: the language cone

The same object is reached as an ActivityPub IRI, an HTTP URL, an MCP resource
URI, an A2A message part, a package export, a Lean declaration name and an
English label. The proof-path plan calls each of these a **reading leg** of
one apex term, and the family of legs a **cone of readings**, or language
cone: every leg must show the same object. Yoneda's lemma is the reason this
is a coherent demand: an object is determined by its arrows, so if every leg
is a structure-preserving reading of the same term, the observations agree
on the object; `YonedaArrowsFirst.lean` proves `yoneda_lemma`,
`yoneda_fully_faithful` and `object_is_its_morphisms` **[proven]**. The
specific theorem that all protocol legs commute (`ConeOfReadings`,
`leg_agreement`, obligations PPA-FR-040 and PPA-FR-050) is **[open]**.

The protocol consequence: conformance becomes testable per leg. A conformant
node MUST serve every leg it advertises for an object so that each resolves to
the same content address; leg agreement is checked by resolving the legs and
comparing digests, which any client can do. The theorem stays an open issue
in the specification, stated as such.

## 3. Activities form a causal set; each has a light cone

When an activity names, by digest, the activities it responds to or has seen,
the network's activities form a directed acyclic graph that no one can
rewrite, because changing an earlier activity changes its digest. The
transitive closure of "names by digest" is a partial order: Lamport's
happened-before, established by content rather than by clocks
[@lamport1978]. Any finite history of it is a locally finite partial order,
which is the definition of a **causal set** [@bombelli1987].

In a causal set, as in relativity, each event has a **past light cone**, every
event that could have influenced it, and a **future light cone**, every event
it could influence. Events outside both are **spacelike**: concurrent, with no
fact of the matter about which came first. The house has this structure
formally: `CausalSets.Causal.Order` builds causal precedence as a
transitive-closure settling and `CausalSets.Causal.Alexandrov` takes causal
cones as the open sets of a topology **[proven]**. The founder's 2026-07-08
arena plan uses the same shape, events under a causal preorder and a conflict
relation, for proof play.

The protocol consequence has three parts:

- **No global clock.** Nodes need not agree on a total order, only on the
  causal order, which the digests carry. Forcing concurrent events into a
  timestamp order invents an order that doesn't exist; the computer science
  section's 2026-07-29 working paper on a semiotic coordinate system names
  exactly this as an under-dimensionality failure.
- **Verifiable causal past.** A receiver can check that an activity's past
  light cone is what it claims, by walking digests.
- **Distinct orders stay distinct.** Git ancestry, ActivityPub causal order
  and EVM settlement order are different temporal dimensions; a node relates
  them only through explicit witnesses (the same working paper).

## 4. Knowledge merges without coordination

What a node knows is a table: addressed objects as rows, attributes (types,
predicates, claims about them) as columns. Formal concept analysis reads such
a table as a formal context and extracts its concept lattice, the hierarchy
of concepts the data already contains [@ganter-wille1999]; the math section's
teaching article on data tables and concept lattices develops it, and
`FCALambekCircle.lean` proves that formal concept closure is the house's
settling closure and that a concept lattice is complete **[proven]**.

Across a network, cells disagree and go unreported. Belnap's four values,
unattested, affirmed, denied and contested, were designed for a computer
combining reports that may be silent or conflict [@belnap1977]; the house
uses them throughout. Two properties make them a merge rule: moving up the
knowledge order only adds evidence, and combining two nodes' reports is the
join. A join is commutative, associative and idempotent, which is the
definition of a state-based conflict-free replicated data type
[@shapiro2011]: every node that has received the same reports holds the same
state, in any order of arrival. The CALM theorem gives the general reason:
monotone computations, which only ever add, need no coordination to be
consistent [@hellerstein-alvaro2020].

The protocol consequence: a node's knowledge is the join of the reports in its
past light cone. Two nodes with the same causal past know the same thing.
The network's shared vocabulary is the concept lattice of the merged context,
**derived** from what nodes have reported rather than declared by a registry.
Contested cells are kept, never resolved by majority: disagreement is data.

## 5. Any node can carry anything: the meshnet

Because every object is checked by its content address, it doesn't matter
which node delivered it. Any node can relay any object, and a receiver loses
nothing by getting it from a stranger, a cache, a USB stick or a WiFi box in
a library basement. That is what makes a network a **meshnet** rather than a
set of servers: delivery is by whoever is near, integrity is by address.
Secure Scuttlebutt showed that append-only, content-linked feeds replicate
this way over intermittent links [@tarr2019].

The protocol consequence: a conformant node accepts a relayed object whose
address checks, and forwards objects in the causal past of what its peers ask
for. Payment is for work and scarce resources through x402, not for relay; a
node may charge for serving, and anyone may serve.

## What the combination is

Separately, each mechanism exists elsewhere: content addressing in Git and
IPFS, causal delivery in distributed databases, CRDTs in collaborative
editors, concept lattices in data analysis, federation in the Fediverse,
payment in x402. Together on one wire, they give a web in which:

- every claim is addressable, and every address can be checked;
- an address can carry its derivation, and every protocol shows the same
  object;
- "when" is a checkable causal order, not a server's clock;
- knowledge from many nodes merges into one lattice without anyone
  coordinating, and disagreement survives the merge;
- any node can carry any object;
- agents on different nodes can hire and pay one another.

That is the sense in which the Semioverse is a **knowledge meshnet**: a
network whose unit is not the post or the server but the addressed, causally
placed, mergeable claim. It is agentic web2 in its federation and web3 in its
verifiability and payment, without making a blockchain the authority for
order; a chain enters only where settlement needs it.

## What must stay honest

- The cone-of-readings theorem is open. The specification states leg
  agreement as a testable requirement per leg and the theorem as an open
  issue.
- The causal-set reading holds for the digest graph by construction; nothing
  here claims that network activity is spacetime. The physics is an analogy
  with a precise shared structure, the locally finite partial order, and the
  specification uses only that structure.
- The merge is coordination-free only for monotone knowledge. Anything that
  retracts, such as revoking a capability or deleting an object, is not a
  join and needs its own rule; the specification must say which operations are
  monotone.
- On 2026-09-27 no node runs this as one server. The specification's
  Implementation Status records what is built.

## What this changes

1. **The specification** gains five sections, one per layer above, as
   normative clauses with requirement keywords, security considerations
   (digest agility, relay abuse, privacy of the causal past) and open issues
   (leg agreement; non-monotone operations).
2. **The book plan** changes its stance on the house mathematics: the book
   still uses none of it as argument, and still keeps the network's name
   apart from the mathematics, but it explains these five mechanisms plainly,
   because they are the reason the network is worth building.
3. **The method** runs again on both, with the research phase's evidence
   packet built from the primary sources above and the standards' current
   texts.
