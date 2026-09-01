---
id: produces
description: "Production is a relation O produces R — operation O produces resource R — asserting that O creates a new instance of R where no instance existed before: R did not exist as input to O, but R exists as O's output. The defining structure: production is creation — the operation brings a new resource into existence. Production is the counterpart to consumption: consumption destroys a resource; production creates one. Production corresponds to the postset t• of a Petri net transition (newly deposited tokens), to the right-introduction rules of linear logic (proofs that construct resources), and to the allocation operation in separation logic (creating new heap cells)."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  operation: relational-universe-morphism
  output-type: relational-universe
output: relational-universe-morphism
ast:
  resource-creation:
    - operation
    - output-type:
        - creation-ex-novo:
            - operation
            - output-type
---

# Produces

## Formal definition

**Production** is a relation $O \text{ produces } R$:

$$(O : \mathrm{Operation},\; R : \mathrm{OutputType})$$

holding when $O$ creates a new instance of $R$ — $R$ did not exist (as $O$'s input) and comes into existence as $O$'s output.

**One invariant.** $O \text{ produces } R$ iff:

1. **Creation ex novo**: $O$ brings a new instance $r : R$ into existence; $r$ is $O$'s output and was not supplied as $O$'s input. Production is not transformation (which takes an existing resource and modifies it) and not retrieval (which returns a pre-existing resource that the operation accessed). The produced resource is genuinely new.

## Girard: linear logic construction

Jean-Yves Girard (*Linear Logic*, 1987): in linear logic, the **right-introduction rules** construct resources. The tensor introduction $\otimes R$:

$$\frac{\Gamma \vdash A \quad \Delta \vdash B}{\Gamma, \Delta \vdash A \otimes B}$$

constructs a new resource $A \otimes B$ from separate resources $A$ and $B$. This is production: the $A \otimes B$ resource is new; the $A$ and $B$ resources that went into it are consumed.

The **1-introduction**: $\vdash \mathbf{1}$ — the unit resource can be produced from nothing. This is the limiting case of production: creating a unit resource requires no inputs. Production from nothing (no consumed inputs) is the formal analogue of allocation.

**Par** ($A \wp B$): the multiplicative disjunction. $\frac{\Gamma, A, B \vdash \Delta}{\Gamma, A \wp B \vdash \Delta}$ consumes the par to produce $A$ and $B$ separately. Par is the formal structure of a producing operation that "splits" one resource into two.

## Petri nets: postset token deposit

Carl Adam Petri (*Kommunikation mit Automaten*, 1962): when a Petri net transition $t$ fires, it deposits tokens in its **postset** $t\bullet = \{p \in P \mid (t, p) \in F\}$. Token deposit is the Petri net model of production: new tokens (resources) appear in output places where they did not exist before the firing.

The **net balance** of a transition: $|\bullet t|$ tokens consumed from inputs; $|t\bullet|$ tokens produced in outputs. Production-only transitions (no input places, $\bullet t = \emptyset$) are **sources** — they produce resources unconditionally. In workflow nets, the source place $p_s$ is the initial producer: it has a token in $M_0$ representing the workflow case being initiated.

## Separation logic: heap allocation

Peter O'Hearn, John Reynolds, Hongseok Yang (2001): the allocation command $x := \mathbf{alloc}(v)$ **produces** a new heap cell:

$$\{\mathrm{emp}\}\; x := \mathbf{alloc}(v)\; \{x \mapsto v\}$$

Starting from an empty heap, allocation creates a new heap cell $x$ pointing to value $v$. The new cell $x \mapsto v$ is produced — it did not exist before the allocation. The points-to assertion is new evidence in the post-state.

## Open questions

- Whether production (creating from nothing) and consumption (destroying) form a symmetric pair in some formal sense — whether there is a duality between the introduction rules (production) and elimination rules (consumption) that makes $O \text{ produces } R$ dual to $O' \text{ consumes } R$ in the same way that conjunction-introduction is dual to conjunction-elimination.
- Whether the total production and consumption of resources in a closed system must be balanced (conserved), and whether this conservation corresponds to the balance between introduction and elimination rules in a proof-theoretically normalizable derivation.
