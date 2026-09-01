---
id: relational-machine-c4-diagram
description: "C4 container diagram of the relational machine: Frontier, State Store, Normalization Kernel, and Observation Layer, with their mathematical correspondences."
---

# Relational Machine — C4 System Architecture

C4 notation. Current level: Container.
Texture using `spec/skills/texture-diagrams.md`.

```mermaid
C4Container
    title Relational Machine — Container Level

    Person(agent, "Agent", "User or networked peer")
    System_Ext(peer, "Peer Machine", "Another relational machine — same structure")
    System_Ext(setworld, "Observable Set", "Set-valued outputs")

    System_Boundary(rm, "Relational Machine") {
        Container(frontier, "Frontier", "I/O Membrane", "Receives step s in Sigma; extends current history t to s star t")
        Container(state, "State Store", "Fiber H_t", "Holds Heyting algebra at current history t; retract H*_t is the settled sub-algebra")
        Container(kernel, "Normalization Kernel", "Nucleus engine", "Applies pi_t = sigma_t compose Delta_t to H_t; produces H*_t = Im(pi_t) as a single retraction")
        Container(obs, "Observation Layer", "Global sections Gamma", "Computes Gamma(H*_{h'}) minus Gamma(H*_h); emits newly settled sections")
    }

    Rel(agent, frontier, "sends step s", "s in Sigma")
    Rel(peer, frontier, "sends step s", "step exchange via geometric morphism")
    Rel(frontier, state, "updates history", "t becomes s star t; loads fiber H_{s star t}")
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
| Frontier | M | The star operation IS extending history — Frontier executes it |
| State Store | H_t | The fiber at current t is what the State Store holds |
| Normalization Kernel | H_star_t + pi_t | pi_t = sigma compose Delta is what the Kernel computes |
| Observation Layer | Gamma | The limit construction is what the Observation Layer runs |

---

## Open texture points

- Frontier: needs Component-level detail — step receiver vs history updater
- State Store: needs Component-level detail — fiber loader vs H* retract
- Normalization Kernel: needs Component-level detail — sigma pass, Delta pass, convergence check
- Observation Layer: needs Component-level detail — diff computation vs section emitter
- Peer Machine connection: geometric morphism between two machines not yet a Container

---

## Specced
