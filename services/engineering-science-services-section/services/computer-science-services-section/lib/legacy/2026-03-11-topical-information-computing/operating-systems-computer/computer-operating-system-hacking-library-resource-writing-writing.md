---
title: "Writes"
description: "Writing is a relation O writes R — operation O writes to resource R — asserting that O modifies R in place: R exists before O and after O, but its state has changed. The defining structure: writing is destructive modification — the resource's identity persists (it is still R) but its content changes. Writing is not consumption (the resource persists after writing) and not production (the resource existed before writing). Writing corresponds to exclusive write access in separation logic (full ownership that changes the pointed-to value), to transitions that modify a Petri net place's token count, and to the write effect in effect type systems."
defines: Writes
related: Reads, Takes, Consumes, Produces, SeparationLogic, EffectType, StateTransition
date-created: 2026-03-20
---

## Formal definition

**Writing** is a relation $O \text{ writes } R$:

$$(O : \mathrm{Operation},\; R : \mathrm{ResourceType})$$

holding when $O$ modifies an instance $r : R$ in place — $r$ exists before $O$ and after $O$, but its value has changed from some pre-state $r_0$ to a post-state $r_1 = O(r_0)$.

**Two invariants.** $O \text{ writes } R$ iff:

1. **Persistence with change**: $r$ exists both before and after $O$ — writing is not destruction (which would remove $r$) and not creation (which would bring $r$ into existence from nothing).
  The resource's identity persists; its content changes.

2. **Exclusive access**: $O$ requires exclusive control of $r$ during execution — no other concurrent operation may read or write $r$ during $O$'s write.
  This is the separation condition: a write to $r$ requires full ownership of $r$, not merely a fractional read share.

## Separation logic: exclusive write

Peter O'Hearn, John Reynolds, Hongseok Yang (*Local Reasoning about Programs that Alter Data Structures*, 2001): in separation logic, writing to location $x$ requires **full ownership** $x \mapsto v$ (the heap points-to assertion with no sharing):

$$\{x \mapsto v\}\; [x] := w\; \{x \mapsto w\}$$

After the write, $x$ points to $w$ instead of $v$.
The full-ownership requirement ($x \mapsto -$, not $x \xmapsto{q} -$ for fractional $q$) is the formal content of exclusive write access: no other holder of a fractional share can permit concurrent modification.

The **frame rule** ensures locality: writing to $x$ does not affect any $y \neq x$ in the frame $R$:

$$\frac{\{P\}\; [x] := w\; \{Q\}}{\{P * R\}\; [x] := w\; \{Q * R\}} \text{ when } x \notin \mathrm{fv}(R)$$

## Effect types: write effects

Lucassen and Gifford (*Polymorphic Effect Systems*, 1988): an operation type $A \xrightarrow{\{\mathrm{writes}(r)\}} B$ writes to region $r$.
Operations with write effects are not idempotent — calling twice from the same initial state may produce different results (if the first write changed the state the second call reads).

Talpin and Jouvelot (*Polymorphic Type, Region and Effect Inference*, JFP 2(3), 1992) give the explicit write typing rule.
For a reference $e_1 : \mathrm{ref}^r(\tau)$ and new value $e_2 : \tau$:

$$\frac{\Gamma \vdash e_1 : \mathrm{ref}^r(\tau) / \varepsilon_1 \qquad \Gamma \vdash e_2 : \tau / \varepsilon_2}{\Gamma \vdash e_1 := e_2 : \mathbf{unit} / \varepsilon_1 \cup \varepsilon_2 \cup \{\mathrm{writes}(r)\}}$$

The effect $\mathrm{writes}(r)$ accumulates in the caller's effect set.
Effect sets propagate upward: if $f$ calls $g$ and $g$ writes to $r$, then $f$'s type records $\mathrm{writes}(r)$ unless $r$ is locally allocated and not observable from outside $f$.

**Linear logic formulation**: writing is $A \multimap A'$ — the old resource $A$ is consumed and the new resource $A'$ (with updated content) is produced.
This captures the destructive nature of writing precisely: the old value ceases to exist; the new value is a fresh linear resource.
The separation logic mutation rule $\{x \mapsto v\}\ [x] := w\ \{x \mapsto w\}$ is the heap-model realization of this: the old $x \mapsto v$ resource is consumed and $x \mapsto w$ is produced.

The **effect lattice** orders effects: $\mathrm{reads}(r) \leq \mathrm{writes}(r)$ — writing implies reading (one must read before modifying).
A function with only write effects still implicitly reads; effect type systems typically treat writes as subsuming reads.

## Open questions

- Whether writing (exclusive modification) is the categorical dual of reading (shared observation) in some category of resource interactions — whether the categories of "operations with read effects" and "operations with write effects" are dual categories in a formal sense.
