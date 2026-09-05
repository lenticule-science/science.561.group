---
id: consumes
description: "Consumption is a relation O consumes R — operation O consumes resource R — asserting that O uses R exactly once in a way that destroys R: after O completes, R no longer exists in the state that preceded O's execution. The defining structure: consumption is linear use — R is the operation's input and R is used up by O; R cannot be used again after O. Consumption is the fundamental operation in linear logic (the linear implication A ⊸ B uses A to produce B, destroying A in the process) and in Petri net token semantics (a transition fires by consuming tokens from its input places). Consumption is strictly stronger than taking (which acquires a resource but may leave it accessible) and strictly different from reading (which accesses without destroying)."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  operation: relational-universe-morphism
  resource-type: relational-universe
output: relational-universe-morphism
ast:
  linear-consumption:
    - operation
    - resource-type:
        - use-exactly-once:
            - operation
            - resource-type
---

# Consumes

## Formal definition

**Consumption** is a relation $O \text{ consumes } R$:

$$(O : \mathrm{Operation},\; R : \mathrm{ResourceType})$$

holding when $O$ uses exactly one instance $r : R$ and $r$ does not exist (in its pre-execution form) after $O$ completes. The resource $r$ is consumed — it passes through $O$ and ceases to be available.

**One invariant.** $O \text{ consumes } R$ iff:

1. **Linear use**: $O$ uses exactly one instance of $R$ as an input, and that instance is unavailable (destroyed or transformed) after $O$ completes. The instance cannot be shared with another operation running in parallel, duplicated for later use, or referenced after $O$ returns. This is the **use-once** constraint: the resource is a linearly typed input to $O$.

## Girard: linear logic and resource consumption

Jean-Yves Girard (*Linear Logic*, 1987, *Theoretical Computer Science*) introduced **linear logic** as the logic of resource-sensitive computation. In classical and intuitionistic logic, propositions can be used any number of times: from $A$ and $A \Rightarrow B$, one can derive $B$ while retaining $A$ for future use. Linear logic eliminates this unbounded reuse: each proposition (resource) must be used **exactly once**.

**Linear implication** $A \multimap B$ (read: "$A$ leads to $B$"): consuming one instance of $A$ produces one instance of $B$. An operation of type $A \multimap B$ consumes $A$ and produces $B$; the $A$ no longer exists after the operation. This is the formal type of a consuming operation.

The **linear logic sequent** $A \vdash B$ means: from exactly one instance of $A$, derive one instance of $B$. Contrast with classical logic's $A \vdash B$, where $A$ is still available after deriving $B$.

**The exponential modality** $!A$ (read: "of course $A$", or "unlimited $A$"): restores classical behavior — $!A$ can be used any number of times. An operation $!A \multimap B$ reads $A$ non-destructively (can use $A$ as many times as needed). The difference: $A \multimap B$ consumes $A$; $!A \multimap B$ reads $A$.

**Tensor product** $A \otimes B$: having both $A$ and $B$ simultaneously. An operation $A \otimes B \multimap C$ consumes both $A$ and $B$ to produce $C$. Consumption is distributed: both resources are used up.

## Petri: token consumption in Petri nets

Carl Adam Petri (*Kommunikation mit Automaten*, 1962): in a Petri net $(P, T, F)$, a transition $t \in T$ **fires** by consuming tokens from its **preset** $\bullet t = \{p \in P \mid (p, t) \in F\}$ and depositing tokens in its **postset** $t\bullet = \{p \in P \mid (t, p) \in F\}$.

**Token consumption**: firing $t$ from marking $M$ removes one token from each input place: $M'(p) = M(p) - 1$ for $p \in \bullet t$, $M'(p) = M(p) + 1$ for $p \in t\bullet$, $M'(p) = M(p)$ otherwise. The tokens in $\bullet t$ are consumed — they no longer exist in the marking after $t$ fires.

Petri net token consumption is the canonical model of physical resource consumption: the token (the resource) is in the place (the repository) before the transition fires; after firing, the token is gone. This makes Petri nets the natural model for resource-consuming processes — manufacturing, chemical reactions, workflow steps.

## Separation logic: ownership and exclusive use

Peter O'Hearn, John Reynolds, Hongseok Yang (*Local Reasoning about Programs that Alter Data Structures*, 2001; O'Hearn *Resources, Concurrency and Local Reasoning*, 2004) developed **separation logic** to reason about programs that consume (modify or deallocate) heap resources:

The **points-to assertion** $x \mapsto v$: location $x$ owns the value $v$ — $x$ is the exclusive owner of this heap cell. **Separation conjunction** $P * Q$: the heap splits into two disjoint parts, one satisfying $P$ and one satisfying $Q$.

**Deallocation** is the canonical consuming operation on heap cells:

$$\{x \mapsto v\}\; \mathbf{free}(x)\; \{\mathrm{emp}\}$$

After $\mathbf{free}(x)$, the heap is empty ($\mathrm{emp}$): the resource pointed to by $x$ has been consumed — the memory is returned to the allocator and no longer accessible.

The **frame rule** $\{P\}\; C\; \{Q\} \Rightarrow \{P * R\}\; C\; \{Q * R\}$ expresses that consuming operations are **local**: if $C$ consumes $P$ (transforming it to $Q$), and $R$ is a separate portion of heap, then $C$ does not affect $R$. Consumption is precise: the operation consumes exactly what it owns, not more.

**BI logic foundation** (O'Hearn and Pym, *The Logic of Bunched Implications*, Bulletin of Symbolic Logic 5(2), 1999): separation logic's $*$ is the multiplicative conjunction of BI logic — a substructural logic combining classical conjunction/implication (with weakening and contraction) and linear conjunction/implication (without). Heap semantics is precisely the resource model for the multiplicative fragment: heaps are monoidal elements, disjoint union $\uplus$ is the monoidal product, and the empty heap is the unit. Consumption in separation logic is linear use in BI logic.

## Open questions

- Whether the linear logic consumption model (use-once) and the Petri net consumption model (token removal) are formally the same — whether there is a functor from Petri nets to the proof nets of linear logic that maps token consumption to linear consumption of propositions.
- Whether there is a hierarchy of consumption strengths: consuming-and-producing (metabolic, like biological processes), consuming-only (destructive), and pure-consuming (no output), and whether each corresponds to a different linear logic connective ($A \multimap B$, $A \multimap 1$, $A \multimap 0$ respectively).
- Whether consumption in the relational history corresponds to the transfer nucleus $\Delta_t$ — whether consuming a resource $R$ at history $t$ removes $R$ from the execution-settled fiber and whether this removal corresponds to a transition $t \to t'$ where $R \notin H^*_{t'}$.
