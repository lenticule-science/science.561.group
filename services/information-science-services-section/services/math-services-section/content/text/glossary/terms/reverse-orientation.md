---
type: term
term-kind: morphism
class: involution
depends-on: [directed-graph, edge]
symbol: D^{op}
---

# Reverse orientation

The **reverse orientation** of a [directed graph](./directed-graph.md) $D = (V, E)$ is the digraph $D^{\mathrm{op}} = (V, E^{\mathrm{op}})$ with $E^{\mathrm{op}} = \{(v, u) : (u, v) \in E\}$. Every edge is flipped; the vertex set is unchanged.

## Signature

$$(\,\cdot\,)^{\mathrm{op}} : \mathbf{Digrph} \to \mathbf{Digrph}, \quad D \mapsto D^{\mathrm{op}}.$$

## Definition / Construction

On the source-target maps, $s_{D^{\mathrm{op}}} = t_D$ and $t_{D^{\mathrm{op}}} = s_D$. The reverse is a self-inverse functor: $(D^{\mathrm{op}})^{\mathrm{op}} = D$.

## Invariants

- *Idempotent in the involutive sense*: $(\,\cdot\,)^{\mathrm{op}} \circ (\,\cdot\,)^{\mathrm{op}} = \mathrm{id}$.
- *Acyclicity-preserving*: $D$ is a [DAG](./dag.md) iff $D^{\mathrm{op}}$ is.
- *In-degree / out-degree swap*: $\deg^-_{D^{\mathrm{op}}}(v) = \deg^+_D(v)$ and vice versa.
- *Reachability swap*: $u \rightsquigarrow_{D^{\mathrm{op}}} v$ iff $v \rightsquigarrow_D u$.

## Composition

The reverse functor is its own inverse and commutes with [transitive closure](transitive-closure.md): $(D^+)^{\mathrm{op}} = (D^{\mathrm{op}})^+$.

## Position

Reverse orientation is the elementary symmetry of directed graphs: every theorem about directed graphs has a *dual* obtained by applying $(\,\cdot\,)^{\mathrm{op}}$ throughout. In category-theoretic language, $D^{\mathrm{op}}$ is the underlying-graph version of the opposite category construction. The [topological sort](topological-sort.md) of $D^{\mathrm{op}}$ is the reverse of the topological sort of $D$.
