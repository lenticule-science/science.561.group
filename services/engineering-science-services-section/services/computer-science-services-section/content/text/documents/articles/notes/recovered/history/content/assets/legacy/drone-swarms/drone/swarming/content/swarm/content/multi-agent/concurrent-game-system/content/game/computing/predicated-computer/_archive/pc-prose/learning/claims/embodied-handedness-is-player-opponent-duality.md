---
name: embodied handedness is player opponent duality
description: The asymmetric-handedness four-tuple (recv, send, actuate, observe) of an embodied participant is Player/Opponent duality (−)⊥ in CGS; symmetric peers are the special case, asymmetric participants are the generic case.
status: draft
---

# Embodied handedness is Player/Opponent duality in CGS

**Claim.** The asymmetric-handedness four-tuple
$$h(p) \;=\; (\mathrm{recv},\ \mathrm{send},\ \mathrm{actuate},\ \mathrm{observe})$$
that characterizes an embodied participant in the predicated-drone-swarm sub-theory is Player/Opponent duality $(-)^\perp$ in $\mathbf{CGS}$ (concurrent games with symmetry). A morphism $A \to B$ in $\mathbf{CGS}$ is a strategy on $A^\perp \| B$ — Player plays Opponent-style on the input arena $A$ (the environment dictates) and Player-style on the output arena $B$ (Player commits). Concretely:

- $\mathrm{recv}$ corresponds to the Opponent-side of $A$ (the participant receives from environment).
- $\mathrm{send}$ corresponds to the Player-side of $B$ (the participant transmits to environment).
- $\mathrm{observe}$ corresponds to Opponent-style sensor-reads against $A$.
- $\mathrm{actuate}$ corresponds to Player-style effects projected into $B$.

The asymmetry is *not* a quirk of embodied participants distinguishing them from symmetric-peer disembodied agents; it is the generic shape of a morphism in $\mathbf{CGS}$. Symmetric peers — participants with $\mathrm{recv} = \mathrm{send}$ and $\mathrm{observe} = \mathrm{actuate}$ — are the special case, not the default.

## Argument

The predicated-drone-swarm sub-theory frames embodied handedness as the structural departure from the AOP (agentic-orchestration-platform) parent's symmetric-peer assumption. The sub-theory's load-bearing concept is that embodied participants have asymmetric coordinates: drones with different airframes, sensors, and bandwidth budgets have different handedness; the asymmetry is structural, not a tuning parameter (see [`embodied-handedness`](../../../theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/concepts/embodied-handedness.md)).

The categorical home of this asymmetry was already in the corpus, but unnamed: $\mathbf{CGS}$ is $*$-autonomous, and the dualizing operation $(-)^\perp$ swaps Player and Opponent labels of an arena. A morphism $A \to B$ being a strategy on $A^\perp \| B$ is exactly the structural shape of asymmetric handedness: the strategy plays Opponent-style on its input (receiving from environment dictating moves) and Player-style on its output (committing to moves that environment receives). The four-tuple's coordinates partition by which side of the duality they sit on:

- *Opponent-side coordinates* (`recv`, `observe`): the participant takes input from environment; environment is Player on $A$.
- *Player-side coordinates* (`send`, `actuate`): the participant commits output to environment; environment is Opponent on $B$.

The sub-theory's [`predicated-drone-collective-fails-classical-stigmergy`](../../../theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/theorems/predicated-drone-collective-fails-classical-stigmergy.md) theorem says drone collectives fail classical stigmergy precisely because they violate symmetric-handedness (the classical stigmergy assumption that all participants exchange comparable signals symmetrically). The corrected reading: classical stigmergy assumed the special-case symmetric peers; embodied collectives are at the generic Player/Opponent-asymmetric case in $\mathbf{CGS}$, and the substrate-side coordination layer is what carries what classical stigmergy would otherwise have provided.

## Significance

The structural fact that the agentic-drone-swarm framework's "generic embodied participant" coincides with the generic morphism in $\mathbf{CGS}$ is what makes the framework's categorical home well-founded. The framework was developed for drones (the predicated-drone-swarm sub-theory); the categorical home now visible (post the `theory-of-computing.md` claim) makes clear that the framework was reaching for a structural object already named in the theory of computing.

The coordination-cohomology consequence: per [`coordination-across-handedness-asymmetric-participants`](../../../theories/engineering/theories/tech/theories/computing/theories/continuous-computation/theories/artificial-intelligence/theories/agents/theories/agentic-orchestration-platforms/theories/predicated-agentic-orchestration-platform/theories/predicated-drone-swarm/theorems/coordination-across-handedness-asymmetric-participants.md), each handedness-asymmetric edge in a commitment graph contributes one generator to $H^1_{\chi_\sim}$ (the frame-disagreement sector). The asymmetry surfaces structurally in the frame-disagreement cohomology, not in the safety-critical sectors. *Asymmetry is recorded, not refused.* The structural shape of this — that Player/Opponent dualization generates frame-disagreement cohomology — is what the equivariant cohomology decomposition names.

## Position

Connects the predicated-drone-swarm sub-theory's `embodied-handedness` concept to the theory-of-computing's Player/Opponent duality in $\mathbf{CGS}$. The categorical home was unspecified in the sub-theory; the present claim supplies it. Surfaced in the FAdRS-swarms survey, §6.5; promoted here to standalone claim.
