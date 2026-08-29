---
diagrams: relational-machine
notation: mermaid-class-diagram
level: set-level
---

# Relational Machine — Set-Level Mathematical Structure

**Note:** This is an abstract RelationalMachine diagram — it describes the mathematical structure (Heyting algebras, nuclei, fibers, limits) at the theory level, not any concrete system.

Set notation.
Heyting posets as base objects.
Every node is a set or function between sets.
Texture using `spec/skills/texture-diagrams.md`.

```mermaid
classDiagram
    direction LR

    class M {
        <<monoid — history base>>
        M(Sigma,I): congruence classes of Sigma* under ab~ba for (a,b) in I
        I subset Sigma x Sigma: symmetric, irreflexive
        op star: M x M to M — concatenation of classes
        unit: epsilon — empty class
        order: t leq t' iff exists u such that t star u = t'
    }

    class H_t {
        <<Heyting algebra per history>>
        carrier: H_t for each t in M
        order: leq_t on H_t
        ops: meet, join, implication, top, bottom
        sigma_t: H_t to H_t — nucleus: extensive, idempotent, meet-preserving
        Delta_t: H_t to H_t — nucleus: extensive, idempotent, meet-preserving
        MUST: sigma_t compose Delta_t = Delta_t compose sigma_t
        rho: H_{t'} to H_t for t leq t' — Heyting algebra hom, contravariant in M
    }

    class H_star_t {
        <<retract of H_t>>
        carrier: H*_t = Fix(sigma_t) intersect Fix(Delta_t) = Im(pi_t)
        pi_t = sigma_t compose Delta_t: H_t to H*_t — retraction
        iota: H*_t to H_t — inclusion, right inverse of pi_t
        pi_t compose pi_t = pi_t
        inherits Heyting structure from H_t via iota
    }

    class Gamma {
        <<set-theoretic limit>>
        Gamma(H) = lim over M^op of H_t
        elements: compatible families (s_t) with s_t in H_t
        compatibility: rho_{t,t'}(s_{t'}) = s_t for all t leq t'
        output of step a at h: sections new in Gamma(H*) after h to a star h
    }

    H_star_t --|> H_t : iota — sub-Heyting-algebra inclusion
    H_t --> H_star_t : pi_t = sigma compose Delta — retraction
    H_t --> M : H_t indexed by t, rho contravariant in leq
    Gamma --> H_t : limit over M^op, extracts compatible families
    Gamma --> H_star_t : output restricted to settled sections
```

---

## Correspondence

| Math node | System node | Notes |
|---|---|---|
| (Σ, I) | RelationalMachinePort | Step vocabulary and independence relation |
| ι : U → T | RelationalMachineInterface | Patch site foot — where steps enter |
| γ_t : X(t) → X(s★t) | RelationalMachineSteppingMap | Advances carrier state by one step |
| H_t | DataStore | The fiber at current t is what the DataStore holds |
| H_star_t + pi_t | Engine | pi_t = sigma compose Delta is what the Engine computes |
| Gamma | Observation Layer | The limit construction is what the Observation Layer runs |

---

## Open texture points

- M: independence relation I needs set-level property stated beyond symmetric+irreflexive
- H_t: restriction maps rho on elements not yet spelled out (what does it do to a specific element?)
- Gamma: peer connection — section-preserving map between two machines not yet a node

---

## Specced
