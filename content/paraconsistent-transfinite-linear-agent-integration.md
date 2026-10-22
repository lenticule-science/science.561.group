---
title: "Paraconsistent, Transfinite, Linear Logic for Concurrent AI Agent Integration: An Audit"
summary: "An audit of a four-valued, ordinal-settling, resource-sensitive logic for coordinating concurrent AI agents: what is proved, what is only defined or open."
date-created: 2026-10-16
type: paper
status: active
visibility: public
tags: [paraconsistent-logic, agent-orchestration, belnap-four, calm-theorem, linear-logic, formal-verification]
keywords: [paraconsistent logic, Belnap four-valued logic, bilattice, logics of formal inconsistency, consistency operator, linear logic, CALM theorem, CRDT, sheaf cohomology, closure ordinal, agent orchestration, landing, pins]
abstract: "The 561 Group's research premise is a paraconsistent, transfinitely valued linear logic for coordinating concurrent AI agents. We audited that premise against its own Lean 4 formalization (Obsmetrologia), its prose theories and the outside literature. The premise is smaller than advertised: the library has a Belnap-bilattice-valued residuated algebra, a Chu-space duality, a settling dynamics and a small sheaf layer, but no consequence relation, no sequent calculus and no consistency operator; 'transfinite' names the number of settling stages rather than a set of ordinal values; and 'linear' holds only weakly. What survives is sufficient. Claims merge by knowledge-order join and need no coordinator; operations that assert absence or order (advancing a pin, landing, choosing among contested claims, reading 'settled') are non-monotone and need one owner. We derive that 'settled' is itself a non-monotone query, identify the missing bridge from 'both' to action as the consistency operator of logics of formal inconsistency, and propose that the acknowledgment (ACK) of the group's prose plays that role. Every derived requirement is labelled Inferred, not Proved. We list ten formal gaps ranked by how much they block."
references:
  belnap1977:
    type: chapter
    title: "A useful four-valued logic"
    author: [{family: Belnap, given: Nuel D.}]
    editor: [{family: Dunn, given: J. Michael}, {family: Epstein, given: George}]
    issued: {date-parts: [[1977]]}
    container-title: "Modern Uses of Multiple-Valued Logic"
    publisher: Reidel
  ginsberg1988:
    type: article-journal
    title: "Multivalued logics: a uniform approach to reasoning in artificial intelligence"
    author: [{family: Ginsberg, given: Matthew L.}]
    issued: {date-parts: [[1988]]}
    container-title: "Computational Intelligence"
    volume: "4"
  fitting1991:
    type: article-journal
    title: "Bilattices and the semantics of logic programming"
    author: [{family: Fitting, given: Melvin}]
    issued: {date-parts: [[1991]]}
    container-title: "Journal of Logic Programming"
    volume: "11"
    page: "91-116"
  arieliavron1996:
    type: article-journal
    title: "Reasoning with logical bilattices"
    author: [{family: Arieli, given: Ofer}, {family: Avron, given: Arnon}]
    issued: {date-parts: [[1996]]}
    container-title: "Journal of Logic, Language and Information"
    volume: "5"
    issue: "1"
    page: "25-63"
  carnielli2007:
    type: chapter
    title: "Logics of formal inconsistency"
    author: [{family: Carnielli, given: Walter}, {family: Coniglio, given: Marcelo}, {family: Marcos, given: Joao}]
    issued: {date-parts: [[2007]]}
    container-title: "Handbook of Philosophical Logic, 2nd edition, vol. 14"
    page: "1-93"
  sep-paraconsistent:
    type: entry-encyclopedia
    title: "Paraconsistent logic"
    author: [{family: Priest, given: Graham}, {family: Tanaka, given: Koji}, {family: Weber, given: Zach}]
    issued: {date-parts: [[2025]]}
    container-title: "Stanford Encyclopedia of Philosophy"
    URL: "https://plato.stanford.edu/entries/logic-paraconsistent/"
  sep-linear:
    type: entry-encyclopedia
    title: "Linear logic"
    author: [{family: Di Cosmo, given: Roberto}, {family: Miller, given: Dale}]
    issued: {date-parts: [[2023]]}
    container-title: "Stanford Encyclopedia of Philosophy"
    URL: "https://plato.stanford.edu/entries/logic-linear/"
  easterbrookchechik2001:
    type: paper-conference
    title: "A framework for multi-valued reasoning over inconsistent viewpoints"
    author: [{family: Easterbrook, given: Steve}, {family: Chechik, given: Marsha}]
    issued: {date-parts: [[2001]]}
    container-title: "Proceedings of ICSE 2001"
    page: "411-420"
  amb2011:
    type: paper-conference
    title: "The cohomology of non-locality and contextuality"
    author: [{family: Abramsky, given: Samson}, {family: Mansfield, given: Shane}, {family: Barbosa, given: Rui Soares}]
    issued: {date-parts: [[2012]]}
    container-title: "Proceedings of QPL 2011, EPTCS 95"
    URL: "https://arxiv.org/abs/1111.3620"
  hellerstein2020:
    type: article-journal
    title: "Keeping CALM: when distributed consistency is easy"
    author: [{family: Hellerstein, given: Joseph M.}, {family: Alvaro, given: Peter}]
    issued: {date-parts: [[2020]]}
    container-title: "Communications of the ACM"
    volume: "63"
    issue: "9"
    page: "72-81"
    URL: "https://arxiv.org/abs/1901.01930"
  ameloot2013:
    type: article-journal
    title: "Relational transducers for declarative networking"
    author: [{family: Ameloot, given: Tom J.}, {family: Neven, given: Frank}, {family: Van den Bussche, given: Jan}]
    issued: {date-parts: [[2013]]}
    container-title: "Journal of the ACM"
    volume: "60"
    issue: "2"
  shapiro2011:
    type: report
    title: "Conflict-free replicated data types"
    author: [{family: Shapiro, given: Marc}, {family: Preguica, given: Nuno}, {family: Baquero, given: Carlos}, {family: Zawirski, given: Marek}]
    issued: {date-parts: [[2011]]}
    publisher: INRIA
    number: "RR-7687"
---

# Paraconsistent, Transfinite, Linear Logic for Concurrent AI Agent Integration: An Audit

Concurrent AI agents can be coordinated with a logic that holds contradictory reports as a value instead of crashing on them. In the 561 Group's audited design, claims merge by a knowledge-order join and need no coordinator, while every operation that asserts absence or order, such as advancing a pointer, landing work or reading "settled", is non-monotone and needs exactly one owner. The audit found that the supporting formal logic is smaller than its premise, and that this smaller core is enough for the job.

## What is the premise being audited?

The 561 Group's working premise is a "paraconsistent, transfinitely valued linear logic", built in a Lean 4 formal-mathematics library called Obsmetrologia from Fregean predication, Belnap's four values and Chu spaces. The research question was practical: what does this logic, together with the Group's prose theories, actually say about scoping, dispatching, integrating, verifying and landing the work of many concurrent software agents? The audit checked each claim against the library source, against the prose theory, and against outside literature on bilattices, inconsistency management, distributed consistency, sheaves and linear logic.

Each statement carries a status label, used throughout this article.

| Label | Meaning |
|---|---|
| Proved | A Lean theorem whose statement was read in source with a proof term present (the auditors did not build the Lean), or a published theorem |
| Defined | A definition with no theorem about it |
| Law | A statement of a Group theory document with no Lean proof of the engineering reading |
| Hypothesis, Open, Sketch | The source's own labels |
| Inferred | Derived by the auditors; not a result in any source |
| Disputed, Unknown | A conflict between sources; something not found |

## What does the logic contain, as built?

Measured against its own source, the premise is a Belnap-bilattice-valued residuated algebra with a Chu-space duality, a settling dynamics and a small sheaf layer. It is not yet a logic in the technical sense: there is no consequence relation, no sequent calculus, no cut elimination, no exponentials and no consistency operator.

### What are the four values?

Belnap's FOUR is the twist product of the two-element Boolean lattice [@belnap1977; @ginsberg1988; @fitting1991]. A reading has two Boolean slots, "told true" and "told false". The four readings are:

- ⊥ₖ: told nothing.
- t: told true.
- f: told false.
- ⊤ₖ: told both, a held contradiction.

Two orders sit on them. The knowledge order ≤ₖ is slotwise: ⊥ₖ is below t and f, which are below ⊤ₖ. The truth order ≤ₜ puts f below ⊥ₖ and ⊤ₖ, which are below t. Negation swaps the slots. In the library, the lattice laws, distributivity, interlacing and involutive negation are Proved by finite exhaustion. This is the standard structure Belnap designed for a machine told things by several sources, and the Group's premise is a faithful reading of that literature [@belnap1977; @easterbrookchechik2001]. No deployed orchestration of AI agents on Belnap or bilattices was found, so there is no direct precedent (Unknown, for the 2020 to 2026 literature searched).

### Is it linear?

Only weakly. Fusion ⊙, residual ⇒ and par ⅋ are Defined from the twist product, and the adjunction a ⊙ b ≤ₜ c iff a ≤ₜ b ⇒ c is Proved for every integral commutative residuated lattice. Fusion is commutative with a unit; its associativity was not found among the proved lemmas (Open). The tensor unit is ⊤ₖ, not t. By hand-derivation (Inferred), contraction A ≤ₜ A ⊙ A fails only at ⊥ₖ, so a FOUR-valued resource is not consumed by use: the model validates contraction at t, f and ⊤ₖ and therefore cannot enforce "exactly once". Exactly-once content exists only in a separate counting carrier (`Record`, a pair of natural numbers) and in an integer ledger. The name "∗-autonomous" overstates what is built, which is the tensor-hom adjunction plus involutive negation, not a dualizing object.

### Where does paraconsistency live?

In the values and the dynamics, not in inference. ⊤ₖ is the top of the knowledge order ("more information", not "everything follows"). It is Proved that the liar closure a ↦ a ∨ₖ ¬a has fixed points exactly ⊥ₖ and ⊤ₖ, so a settled liar is never t or f. But paraconsistency in the technical sense is a property of a consequence relation [@sep-paraconsistent], and no such relation exists in the library. "Contradiction does not explode" is therefore a statement about values, not about entailment. The library also lacks the controlled-explosion operator that a research memo calls Cons(A).

### What does "transfinite" mean here?

It names the number of settling stages, not a set of ordinal truth values. The ordinal type in the library is a countably cofinal tree ordinal; uncountable cofinality is "a genuine boundary of this dependency-free ordinal encoding". Over FOUR, every inflationary map settles by stage 3 (Proved), so every FOUR settling is in the strict, finite regime. Values beyond FOUR exist only in a counting carrier extended with ω, where one limit point is exhibited. The ordinal-indexed settling orbit is marked not ready: the missing construction is the limit-case countable join. The honest description is transfinitely indexed settling over finitely or ω-boundedly valued readings.

### What does the sheaf layer actually prove?

A sheaf here assigns local claim valuations to patches of a cover and asks whether they glue. It is Proved that merge of valuations is the least upper bound, the sheaf is separated, and the Čech datum glues: first cohomology H¹ vanishes for every datum, with no regime hypothesis. The prose table saying H¹ is nonzero in transfinite and aperiodic regimes is Disputed against the Lean, and the Group's own theory calls it "a table, not a theorem". The gluing theorem is strong but cheap: it certifies that agreeing overlaps give a unique global section, but it never fails, so it cannot certify that scopes overlap safely. Nonzero obstruction classes appear only in smaller separate models (a six-term exact sequence on a graded complex, and a cover-nerve count where H¹ rank is zero iff the nerve is a forest). The converse, that a cycle actually obstructs a monotone global section, is Open.

### What about convergence?

It is Proved that merging a list of readings depends only on the set of inputs, that a re-merged delta is absorbed, that any two valuations are confluent at their join, and that a closure operator satisfies cl(cl(X) ∨ₖ Y) = cl(X ∨ₖ Y). This is the lattice-merge shape of state-based CRDTs [@shapiro2011]. The claimed biconditional "H¹ = 0 iff confluence iff monotone" is Open; the file itself says it cannot be witnessed because the lattice model makes both sides unconditional.

## What survives the audit?

Three results are solid and match outside theory. First, claims merge by join and closure after a merge equals serial gathering, which is the lattice-merge shape of CRDTs; the CALM theorem says monotone computation of this kind needs no coordination [@hellerstein2020; @ameloot2013]. Second, a contradiction is a held value, not a crash: Belnap's design [@belnap1977; @arieliavron1996]. Third, local sections that agree on overlaps glue uniquely.

## How should agent work be partitioned?

This section is Inferred throughout: it is a consequence drawn from the audit, not a result stated in any source.

### What is the claim/decision partition?

Operations split by monotonicity in the knowledge order.

| Class | Operations | Mechanism |
|---|---|---|
| Monotone (no coordinator) | record a claim, an observation, a test result for a (commit, environment) pair, a proposal, an objection, a receipt, a lease request, a dispatch signal, a supersession record | append-only attributed records joined in ≤ₖ; threshold reads only |
| Non-monotone (one owner per cover) | advance a pin; land to the main branch; choose among contested claims; grant an exclusive lease; enforce revocation; read "settled"; compute "latest"; reclaim superseded records | a single writer that fixes an epoch; compare-and-swap for irreversible effects |

This resolves a tension in the Group's theory between a sole-writer tick and partially ordered histories: the writer sequences decisions, and claims commute. It also explains why a pointer needs a writer: writing a pointer asserts the absence of a better candidate, which is a non-monotone assertion.

### Why is "settled" a non-monotone query?

A cell is "settled" when it reads exactly t. But a later contrary claim moves t to ⊤ₖ, so the answer to "is it settled?" can flip from yes to no as information grows. A query whose answer can be retracted by adding information is non-monotone, and by the CALM boundary it requires coordination. Settlement therefore needs an owner who fixes an epoch and says "as of this epoch, the cell reads t". The contrasting threshold reads, "at least told true" and "is contested", are monotone and need no owner. This consequence is derived in the audit and not stated by any source.

### How does a pin, a pointer to a version of a dependency, advance?

A git history is a directed acyclic graph, not a join-semilattice; two heads that are not ancestors of each other have no join without a merge commit. The structure that is a join-semilattice is the frontier: a grow-only set of candidate heads, with a head dropped only when an ancestry record subsumes it. Recording a candidate or a test claim about it is monotone. Collapsing the frontier to the single head a parent pins is non-monotone and belongs to the pin's one owner. For nested pins the order is bottom-up: a parent's candidates draw only on child heads the child's owner has landed and acknowledged, the owner tests the combined set once, and advances the pin by consuming a one-per-epoch pin-advance token. Test verdicts inherited across n pin hops carry a stage index n so an integrator can tell direct from inherited evidence. Two agents "bumping twice" produce one idempotent claim; two different heads for one cell is a ⊤ₖ and routes to the owner.

### Which resources are linear?

| Class | Items |
|---|---|
| Linear (exactly once) | write capability on a path set; pin-advance token; a landing slot and its ACK; the right to resolve a given ⊤ₖ cell; credential delegation (moved, not copied) |
| Affine (may lapse) | a task lease with expiry |
| Reusable | published, content-addressed artifacts; specifications; accepted receipts; test results |
| Fractional | read access to a section: many readers, one writer |
| Additive | choice among alternative plans |
| Tensor | disjoint-footprint tasks held together |

Two cautions. In the built algebra none of the linear rows is enforced, because the carrier is idempotent. And a linear resource in a logic does not make a `git push` linear: the platform must be the only route to the resource, so linearity lives in a mediator and the logic specifies its invariants.

### How is a task's scope defined?

A scope is a patch, a Boolean mask over claim cells, in a cover of the settled world. Narrowing a scope is a mask meet, so a child holds only a sub-mask of its parent. By the frame rule of separation logic, a task proved within its footprint is independent of everything outside it provided footprints are disjoint; only tasks with overlapping footprints need sequencing, by the owner of the smallest section containing both. This is not computable while the section tree is not actually a tree, which the corpus acknowledges as a defect.

## What is the consistency operator, and why is ACK that operator?

The most important gap between the logic and action is one the paraconsistent literature names. Logics of formal inconsistency (LFIs) encode "this formula is consistent" in the object language with an operator ∘; explosion is blocked when a contradiction is present, but recovered "in a controlled way" for formulas asserted consistent [@sep-paraconsistent; @carnielli2007]. That is how a system moves from "both" back to ordinary classical action where consistency has been established.

The Group's prose already has the matching object: an acknowledgment (ACK), an attributed assertion by a different party, over an independent channel, that a cell is settled for use. The audit identifies ACK(c) with ∘c (Inferred). Then acting, whether landing, advancing a pin or deploying, requires ∘ on every cell the action depends on, and the audit trail of ∘ is the ACK record. Producer and acknowledger must differ: a second model of the same class re-reading the same artifact is a correlated draw and does not qualify as an independent party.

## When is a judge required?

The Group's hypothesis was that parallel agents need a judge "exactly where H¹ ≠ 0". The audit finds this not supported as stated. In the closest published setting, a cohomological obstruction is sufficient but not necessary for global inconsistency [@amb2011]. The supportable claim: a judge is required (a) at every non-monotone step, (b) wherever a ⊤ₖ cell remains unresolved in the scope an action depends on, and (c) at least where a cover-nerve cycle or other obstruction measure is positive [@hellerstein2020]. A judge's decision is a recorded utterance with a handling class (ignore, defer with a re-evaluation trigger, circumvent, ameliorate, resolve) and an owner. It is never settled by arrival order, hash tie-break or vote.

## How does a requirement settle?

A requirement is an obligation attributed to an owning section. Its status reads off a single cell: ⊥ₖ unaddressed, t met, f refuted, ⊤ₖ contested. Derivation rules have positive antecedents in the knowledge order, so derivation is monotone; negation-as-failure is excluded or carries an explicit stage index. Settlement is the non-monotone read: the owner records an epoch at which the cell reads t with ∘ asserted, meaning a witness by the promiser and an ACK by a different party through an assay the promiser did not run. Where two sections claim one requirement, attribution is ⊤ₖ and the contest is resolved by recorded choice.

## What is the end-to-end flow?

Dispatch posts a signal on a section's board (monotone). An agent takes it by a lease claim, and a mediator grants an exclusive write capability on the claimed footprint (non-monotone, linear). The session works under a work order naming its judge and a machine-checkable done condition, with caps on turns and retries, and returns a proposal citing a commit. An independent assay the producer did not run yields the ACK. The pin's owner then performs the single non-monotone act: compare the expected base, test the set in the state it will land in, advance by consuming the token, record the epoch. A failing integration build returns to the specification stage as evidence against the specification, not the work order. See [Dispatching Concurrent AI Agents at Scale](/dispatching-concurrent-ai-agents-at-scale/) for the empirical industry evidence behind these gating steps.

## What requirements does this derive?

The audit derives twenty requirement candidates, every one Inferred and intended for ratification by the owning sections. Representative ones:

1. Classify every operation on shared agent state as monotone or non-monotone, and name a single owner for each non-monotone one.
2. Make claims, observations, proposals, objections and receipts append-only, attributed records; no mutable status field.
3. Gate actions only by threshold reads, or route a declared non-monotone read to its owner at a recorded epoch.
4. Give each pin a candidate frontier and one owner who collapses it after a tested-set gate.
5. Require ∘c on every cell an action depends on, minted only by an ACK from a distinct party and channel.
6. Check the landing and pin-advance protocols in an executable model (TLA+ or equivalent) for one writer, no lost update, no landing without ACK and deadlock freedom.
7. Cite the logic only at its proved strength: each use of "linear", "transfinite" or "H¹" carries its status label.

## Limits and open problems

The formal gaps, ranked by how much they block:

1. A carrier for repository facts (the commit DAG, the frontier) and a bridge from a session's actions to cells. Without it no pin, lease or landing has a formal object.
2. A consequence relation with designated sets and a consistency operator ∘.
3. The monotone/non-monotone classification stated as a theorem, including "exactly t" as non-monotone. Its converse can be imported from outside work [@ameloot2013].
4. A linear carrier: instantiate the twist product over a non-idempotent residuated lattice (a Łukasiewicz chain, for instance), prove fusion associativity and add exponentials. A sequent calculus with cut elimination is high difficulty.
5. An obstruction theory in which H¹ can be nonzero for the settling sheaf.
6. A well-formed site: the section tree must become a tree.
7. Space-level Chu structure: tensor, par and the MIX transform.
8. Authority and identity of writers: the formalism is anonymous about who may assert.
9. Ordinal-valued support (optional).
10. Drift between archive and live code, a precondition for any claim that a theorem exists.

Caveats on the audit itself. Nobody built the Lean, so "Proved" means a theorem statement with a proof term was read in source. "Not found" means not found in the files read plus targeted search. Several outside sources, including Belnap 1977, Ginsberg 1988, Fitting's papers and the LFI Handbook chapter, were read only through summaries or abstracts. No controlled evaluation of any of these approaches on software teams or AI agents was found, nor any application of FOUR to organizing concurrent coding agents, nor any sheaf-cohomology treatment of version-control pins. Linear-logic background: [@sep-linear].

## Related

- [Belnap's four-valued logic](/belnap-four-valued-logic/) and [bilattices and Belnap-Dunn logic](/bilattices-and-belnap-dunn-logic/) for the value domain.
- [Paraconsistent settling and comprehension](/paraconsistent-settling-and-comprehension/) for the settling dynamics.
- [The adjoint structure of predication on bilattice fibers](/adjoint-structure-of-predication-on-bilattice-fibers/) and [Nelson identity on four-valued truth](/nelson-identity-on-four-valued-truth/).
- [Obsmetrologia: formal mathematics in Lean 4](/obsmetrologia-formal-mathematics-in-lean-4/).
- [Dispatching concurrent AI agents at scale](/dispatching-concurrent-ai-agents-at-scale/) and [the MAPE-K autonomic computing loop](/mape-k-autonomic-computing-loop/).
- Sibling sites: [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/), [market.561.group](https://market.561.group/).
