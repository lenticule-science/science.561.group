---
diagrams: distributed-relational-machine-runtime
notation: c4
level: container
---

# Relational Machine — C4 System Architecture

**Note:** This is a [DistributedRelationalMachineRuntime](distributed-relational-machine-runtime.md) diagram — it describes the concrete system with containers, agents, and MCP, not the abstract RelationalMachine.

C4 notation.
Current level: Container.
Texture using `spec/skills/texture-diagrams.md`.

```mermaid
C4Container
    title Relational Machine — Container Level

    Person(agent, "Agent", "User or networked peer")
    System_Ext(peer, "Peer Machine", "Another relational machine — same structure")
    System_Ext(setworld, "Observable Set", "Set-valued outputs")

    System_Boundary(rm, "Relational Machine") {
        System_Boundary(ib, "Input Boundary") {
            Container(port, "RelationalMachinePort", "(Sigma, I)", "Typed step vocabulary; independence relation I — defines which steps commute")
            Container(iface, "RelationalMachineInterface", "Step intake", "Exposed boundary where agents submit steps; foot of the patch site inclusion")
            Container(stepping, "RelationalMachineSteppingMap", "gamma_t", "Advances carrier: X(t) to X(s star t) for each history t")
        }
        Container(state, "DataStore", "Fiber H_t", "Holds Heyting algebra at current history t; retract H*_t is the settled sub-algebra")
        Container(kernel, "Engine", "Nucleus engine", "Applies pi_t = sigma_t compose Delta_t to H_t; produces H*_t = Im(pi_t) as a single retraction")
        Container(obs, "Observation Layer", "Global sections Gamma", "Computes Gamma(H*_{h'}) minus Gamma(H*_h); emits newly settled sections")
    }

    Rel(agent, iface, "sends step s", "s in Sigma")
    Rel(peer, iface, "sends step s", "step exchange via geometric morphism")
    Rel(iface, stepping, "passes validated step")
    Rel(stepping, state, "updates history", "t becomes s star t; loads fiber H_{s star t}")
    Rel(state, kernel, "provides H_t")
    Rel(kernel, state, "writes H*_t", "via pi_t = sigma_t compose Delta_t")
    Rel(state, obs, "exposes H*_t")
    Rel(obs, setworld, "global sections", "compatible families over M")
    Rel(obs, agent, "returns output", "newly settled sections")
```

---

## Correspondence

| System node | Math node | Notes |
|---|---|---|
| RelationalMachinePort | (Σ, I) | The step vocabulary and independence relation |
| RelationalMachineInterface | ι : U → T | The patch site foot — where external steps enter T |
| RelationalMachineSteppingMap | γ_t : X(t) → X(s★t) | The coalgebra map advancing carrier state by one step |
| DataStore | H_t | The fiber at current t is what the DataStore holds |
| Engine | H_star_t + pi_t | pi_t = sigma compose Delta is what the Engine computes |
| Observation Layer | Gamma | The limit construction is what the Observation Layer runs |

---

## Open texture points

- Input Boundary: Port/Interface/SteppingMap decomposition is done at Container level; Component-level detail for each still needed
- DataStore: needs Component-level detail — fiber loader vs H* retract
- Engine: needs Component-level detail — sigma pass, Delta pass, convergence check
- Observation Layer: needs Component-level detail — diff computation vs section emitter
- Peer Machine connection: geometric morphism between two machines not yet a Container

---

## Specced
