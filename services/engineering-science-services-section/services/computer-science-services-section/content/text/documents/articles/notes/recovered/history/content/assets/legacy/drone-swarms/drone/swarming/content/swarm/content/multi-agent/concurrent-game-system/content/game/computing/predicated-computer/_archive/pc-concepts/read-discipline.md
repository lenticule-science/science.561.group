---
type: concept
class: discipline
depends-on: [traversal, witness]
see-also: [closure-rule, settling-as-computation]
---

# Read discipline

The substrate's commitment that *reads of substrate content do not drive computation*. Substrate operations decide what to do based on the substrate's own algebra — the closure rules cascading through the predication graph, the operator specifications composing predications — not by reading content and branching on the result. Reads exist at the substrate's I/O surfaces, where they produce outputs the substrate's caller will consume; reads do not exist inside the substrate's own decision paths.

The discipline is the engineering content of "the substrate is not a database." A database's primitive operations are read-and-decide: the program reads a row, branches on the row's value, writes a different row. A predication substrate's primitive operations are *cascade*: claims enter, closure rules match, derived claims emerge, settlement reaches fixed-point. There is no read-and-branch step interposed between admission and settlement. The substrate's algebra is the entirety of its decision-making.

## What the discipline rules out

A substrate operation that needs to decide "does claim X exist?" and act on the answer is not admissible substrate content. Specifically:

- **Reducers and event-translators MUST NOT branch on substrate content.** A reducer's job is to translate its event payload (and the bytes that payload references) into claims and hand them to the substrate's admission primitive. If a reducer needs to know whether a claim exists, the architecture is wrong: the conditional belongs in a closure rule the substrate already carries, where its outcome cascades through the substrate's value-domain rather than gating an `if` in runtime code.
- **No primitive lookup-and-decide.** The substrate has no primitive whose contract is "return whether claim X exists" used by an operator that branches on the result. Such a primitive collapses the substrate's algebra into imperative database access.
- **No primitive iteration over fibers for decision-making.** A substrate operation cannot fold over a fiber's contributions to compute a Boolean and act on the Boolean. Folding and counting belong to the meta-theory; the *computational* primitives are the substrate's value-domain operations and closure-rule cascades.
- **No primitive comparison outside the algebra.** Equality, ordering, and similarity within substrate operations are computed by the substrate's value-domain, not by runtime comparison primitives that branch on their result.

The substrate's response to "I want to know whether to do X based on whether Y holds" is to declare a closure rule: a rule whose premises express *Y holds* and whose conclusion does *X*. Admission of the rule, then admission of any claim that lets the rule's premises match, then settlement, produces *X* without an imperative branch. The conditional is in the closure rule, not in runtime code.

## What the discipline admits

Two narrow shapes of read are permitted:

- **Output-producing walks at the substrate's I/O surfaces.** When the substrate produces a response — a JSON-RPC reply, a file written to disk, a CLI rendering, an MCP message returned to a caller — walking the substrate's content to construct that output is lawful. The output *is* the substrate's witnessing returned to its caller. Per [interfacer](interfacer.md), the compose operation of an interfacer is the substrate-level realization of this walk.
- **Internal walks inside the primitives that implement the substrate's algebra.** The bodies of operations like match-against-pattern, find-contradictions, query-fiber necessarily traverse substrate content to do their job. Such traversal is the primitive itself, not a use of it. These walks are bounded to the substrate's algebra implementation; they do not surface as decision points in higher-level operations.

The discipline forecloses the "general query" temptation. Predication is not a database lookup primitive; treating it as one violates the substrate's value-domain semantics, and the violation accumulates as runtime logic the substrate is unaware of.

## Engineering consequences

- **The substrate's behavior is determined by its content.** Two substrates with identical predication-graph content behave identically under the same input messages, regardless of host runtime. There is no hidden runtime state that depends on read-and-branch decisions.
- **Replay is a function of content alone.** Per [source-of-truth](source-of-truth.md), replaying a substrate's event log reconstructs its state. If reads gated decisions, replay would have to reconstruct read order alongside event order; the discipline makes replay depend on event order alone.
- **Closure rules carry the conditionals.** Anything that looks like an `if` in a runtime conditional belongs in a closure rule whose premises encode the conditional's antecedent and whose conclusion encodes its consequent. The substrate's closure machinery applies the rule when its premises match; the conditional is substrate content.
- **Witnessing is the answer.** Per [witness](witness.md), what the substrate returns is a configuration of cells in the relevant fiber, not a primitive label. A caller who wants a single label computes it from the witnessing configuration; the substrate's job is to return the configuration.
- **Reads are auditable.** Output-producing walks are themselves substrate operations producing witnesses. An auditor can reconstruct any past output by replaying the substrate's content and re-walking under the same configuration.

## Position in the substrate

Read discipline is the substrate's *what-not-to-compute* commitment. It is the structural complement of [settling-as-computation](settling-as-computation.md): settling is what the substrate computes; reading is what the substrate exposes. The two are dual disciplines — the substrate's algebra runs forward by cascade; the substrate's surface runs outward by walk.

The pattern composes with [closure-rule](closure-rule.md) (conditionals belong in closure rules, not in read-and-branch logic), with [traversal](../morphisms/traversal.md) (the lawful walk primitive at substrate boundaries), with [interfacer](interfacer.md) (the compose operation realizes output-producing walks), and with [witness](witness.md) (what reads return is a witnessing configuration, not a primitive value).
