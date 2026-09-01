---
name: stable-envelope
type: concept
status: sketch
---

The intersection of the necessary and possible aspects of a flowed recognition:

$$\text{Env}_F(a) = \text{Necessary}(\text{Flow}(a)) \land \text{Possible}(\text{Flow}(a))$$

The emergent container of coherence within which a state's motion remains consistent with structural stability.

## What it is

The stable envelope of state $a$ under [Flow](flow.md) is the overlap of two bounding regions:

- **Necessary aspect**: what must hold globally after flowing (closure of the flow).
- **Possible aspect**: what can hold locally after flowing (interior of the flow).

The envelope captures the range within which a recognition can vary under flow while remaining active under both closing and opening. Neither pure necessity (too rigid) nor pure possibility (too free) — *the bandwidth of stable variation*.

## Why it matters

The stable envelope is *where conservation lives*.

**Conservation Law.** Every conserved observable on a state factors through its active envelope. If $I$ is an invariant observable, then $I = I' \circ \text{Env}_F(a)$. Every measurable quantity preserved under evolution can be measured by restricting to the stable envelope.

The envelope also governs **transport**: when a state moves under Flow from $a$ to $F(a)$ and is related to $b$ via $F(f)$, the active envelope of $a$ maps into the stable envelope of $b$. Coherence is carried intact.

## The relational action

The Relational Action

$$S[F_t, a] = \int_{\text{time}} \text{coherence intensity on } \text{Env}_F(F_t(a))$$

accumulates coherence intensity measured on the stable envelope of the evolving state. The actual evolution extremizes this action — the physical path is the one that maximizes accumulated self-consistency.

## Note on formalization

In the Lean development:

```lean
def StableEnvelope (a : Rel) : Rel := close (flow.toFun a) ⊓ open_.toFun (flow.toFun a)
```

The Conservation Law factorization and the transport condition are not yet formalized.
