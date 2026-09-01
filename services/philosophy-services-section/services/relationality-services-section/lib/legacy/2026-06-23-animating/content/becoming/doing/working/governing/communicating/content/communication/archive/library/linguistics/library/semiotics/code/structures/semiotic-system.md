---
type: definition
class: structure
status: sketch
depends-on:
  - teaching/explanations/sign-relation.md
  - teaching/explanations/sign-vehicle.md
  - teaching/explanations/sign-object.md
  - teaching/explanations/interpretant.md
  - teaching/explanations/code.md
  - teaching/explanations/semiosphere.md
realizes:
  - teaching/explanations/sign-relation.md
see-also:
  - ../morphisms/specialization.md
  - ../morphisms/translation.md
  - ../morphisms/codeswitching.md
  - ../examples/peircean-system.md
  - ../examples/saussurean-system.md
  - ../examples/hjelmslevian-system.md
  - ../examples/lotmanian-system.md
  - ../../../../information/theories/knowledge-systems/theories/predicated-knowledge-systems/objects/predicated-knowledge-system.md
---

# Semiotic system

A **semiotic system** is a tuple $\mathcal{S} = (V, O, I, K, R, \Sigma)$ where:

- $V$ is the *sign-vehicle inventory* — the set of perceptible items the system admits as candidate sign-vehicles. The choice of $V$ is what distinguishes natural-language systems (phonemes/morphemes/words) from visual systems (compositional elements), gestural systems, formal systems, etc.
- $O$ is the *sign-object range* — the set of objects (entities, states, types, further signs) the system can index. Some systems restrict $O$ severely (formal calculi); others admit $O$ open-ended (natural language).
- $I$ is the *interpretant repertoire* — the set of admissible interpretants the system's [interpretant chains](teaching/explanations/interpretant.md) range over. Includes the identity interpretant (the sign-vehicle stands for itself, terminating the chain in a single step) when the system admits it.
- $K \subseteq V \times O \times \mathcal{P}(I)$ is the *code* — the system's licensed pairings of sign-vehicles with sign-objects, equipped per pairing with the set of interpretants the pairing admits. The code structure is per [code](teaching/explanations/code.md).
- $R$ is the *rule system* — the syntagmatic and paradigmatic rules governing combination ([syntagm](teaching/explanations/syntagm.md)) and substitution ([paradigm](teaching/explanations/paradigm.md)). Includes the system's own derivation rules for connotative iteration.
- $\Sigma$ is the *semiosphere context* — the [semiosphere](teaching/explanations/semiosphere.md) within which the system operates, supplying the cultural-historical horizon against which interpretants are made and contested.

A *state* of $\mathcal{S}$ is the population of asserted sign-acts — the actual sign-vehicles deployed at definite occasions with their interpretants-on-record. The system's *competence* is the licensed sign-relations the code admits; the system's *performance* is the asserted state.

## What this object is

A semiotic system is the discipline's *named structural object*: the unit at which sign-processes are studied as a coherent whole rather than as isolated sign-acts. The six components are the irreducible parameters by which one system differs from another; degenerate values of any component yield degenerate systems (e.g., $|I| = 1$ gives a dyadic system that has lost the Peircean third place; $\Sigma = \star$ gives an a-historical system).

The standard worked instances are:

- **The Peircean system** — see [peircean-system](../examples/peircean-system.md). Triadic, open-chain interpretant, no closed encyclopedia.
- **The Saussurean system** — see [saussurean-system](../examples/saussurean-system.md). Dyadic at the sign-vehicle ↔ sign-object face, with the system itself supplying the implicit third place.
- **The Hjelmslevian system** — see [hjelmslevian-system](../examples/hjelmslevian-system.md). Form-substance split on each face; connotative iteration as a primitive.
- **The Lotmanian system** — see [lotmanian-system](../examples/lotmanian-system.md). Semiosphere as primitive; translation across boundary as the system's load-bearing operation.

## What this object is not

A semiotic system is not:

- A natural language. A natural language is a particular semiotic system (one whose $V$ is phonemic, $O$ is propositional, etc.) and not the substrate-level structure that *all* semiotic systems realise.
- A code in isolation. The code $K$ is one of six components; a system is the code *together with* its inventory, range, repertoire, rules, and semiosphere.
- A communication channel. A channel is a transport for sign-vehicles; a system is the standing-for structure that makes the transported items signs in the first place.

## Substrate reading

A semiotic system is a [predicated knowledge system](../../../../information/theories/knowledge-systems/theories/predicated-knowledge-systems/objects/predicated-knowledge-system.md) under the identification:

- $V$ ↔ the predicate-category $\mathcal{C}$.
- $O$ ↔ the entity-set $E$.
- $I$ ↔ the per-fiber interpretant-repertoire, structured by the closure operator's iterates.
- $K$ ↔ the asserted-cell relation, structured per the value-domain $\mathbf{L}$ (typically $\mathbf{L} = \mathbf{2}$ for codes that admit only present/absent licensing; $\mathbf{L} = \mathbf{2} \otimes \mathbf{2}$ when the code admits contestation).
- $R$ ↔ the closure-rule system $\mathcal{S}$.
- $\Sigma$ ↔ the scope-family $\Sigma$ on the substrate.

The two structures are *the same five-component-plus-history thing read in two registers*. The bridge is what the [composability narrative](teaching/explanations/composability-with-predicated-knowledge-systems.md) commits to as load-bearing, not as analogy.
