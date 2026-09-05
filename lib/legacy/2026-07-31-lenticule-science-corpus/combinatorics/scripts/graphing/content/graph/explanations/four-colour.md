---
type: theorem
status: sketch
depends-on: [planar-graph, graph, bipartition]
---

# Four-colour theorem

Every finite [planar graph](../objects/planar-graph.md) admits a proper vertex-colouring with four colours: there is a function $c : V \to \{1, 2, 3, 4\}$ such that every edge $\{u, v\}$ has $c(u) \neq c(v)$.

## Status: sketch (proof deferred to citation)

The theorem is *proved*, but the proof is computer-assisted and runs to thousands of pages of case analysis on reducible configurations. It is not reproved in the corpus. The two canonical proofs:

- **[Appel & Haken 1977](references/appel-haken1977.md)** — the original 1976 proof, refined and published 1977. Reduced the four-colour question to a finite list of $\sim 1900$ "unavoidable, reducible" configurations, then verified each by computer.
- **[Robertson, Sanders, Seymour & Thomas 1997](references/robertson-sanders-seymour-thomas1997.md)** — a substantial simplification reducing the configuration list to $633$ and producing a quadratic-time colouring algorithm. The standard modern reference.

Subsequent work has produced a fully formal proof in Coq (Gonthier 2008), so the theorem is also machine-verified — but even that proof is not reproduced here.

## Sketch of structure

The high-level argument is by *discharging*: assume a minimal counterexample (a planar graph that is not 4-colourable but every smaller planar graph is), apply Euler's formula $V - E + F = 2$ together with the bound $E \leq 3V - 6$ to derive a positive average vertex degree, redistribute "charge" from low-degree to high-degree vertices according to discharging rules, and verify that *every* configuration that can occur in the minimal counterexample has a *reducible* sub-configuration whose presence allows a 4-colouring of the full graph to be derived from a 4-colouring of a smaller planar graph. The combinatorial argument reduces the theorem to a finite check; the computer performs the check.

## Why this matters

The four-colour theorem is the canonical example in the corpus of a theorem whose *proof* is not corpus-shaped — it is a verification rather than a structural derivation, and the corpus is honest about that by recording it as `status: sketch` and pointing at the citations rather than reproducing them. It is also a proof whose machine-verifiability raised foundational questions about what counts as a mathematical proof; see [Appel–Haken 1977](references/appel-haken1977.md) and the subsequent literature.
