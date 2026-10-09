---
type: concept
class: framing
depends-on: [predication-substrate, scope]
see-also: [application-sublocale]
---

# Sublocale as application

The framing under which an *application* — a MUD, an ERP, a publishing system, a knowledge base — is not a separate codebase but a [sublocale](../objects/application-sublocale.md) of a single predicated computer: a particular [scope](scope.md) plus a nucleus that projects out the application's predicate vocabulary, the closure rules that operate within that vocabulary, and the boundary conditions for predications crossing into and out of the scope. Different applications are different nuclei on the same predication graph.

Three engineering consequences:

- **Code reuse is not a goal; it is a structural fact.** Two applications that share predicate vocabulary share the same closure rules, the same persistence, the same audit. They live in the same substrate because the underlying predications are the same; the nucleus is *what is shown* to the application's user, not what is *stored*.
- **Inter-application interaction is automatic.** A predication created by one application is visible to any other application whose nucleus admits the predicate. There is no inter-application API surface to maintain — the substrate *is* the surface, and the nuclei are the views. Two applications that need to interact decide which predicates they share; the rest is substrate.
- **Application boundary is a configuration choice, not an architectural one.** A nucleus is determined by which predicates it admits and which closure rules it includes. Adding a predicate to the application is a substrate-level edit to the nucleus specification, not a deployment. Because the nucleus is itself a substrate entity (per [self-representation](self-representation.md)), the application's specification is queryable and modifiable through the same operators that act on its content.

The compositionality is structural: the intersection of two nuclei is a nucleus, defining a third sublocale that runs on the intersection of the two applications' predicate vocabularies. This is the engineering content of "applications can be combined" — the combination is a substrate-level operation, not a glue layer.

The same pattern applies to ERPs, knowledge bases, content-management systems, MUDs, and any other application this corpus characterizes. What distinguishes one from another is its predicate vocabulary, its closure-rule subset, and its nucleus — not its codebase. The "application" *is* the (vocabulary, rule-subset, nucleus) triple recorded in the substrate.
