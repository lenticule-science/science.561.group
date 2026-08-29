---

title: "Accord"
description: "An Accord is a sheaf F: T^op → Set over the history site — the type of observations. A section F(t) at history t is an Observation. The sheaf condition says local observations at different histories cohere into global ones."
defines: Accord
related: Observation, Proposition, RelationalHistoryFiberDoctrineLanguage
component-of: relational-universe
fiber-of: relational-universe
base: relational-history-site
element-of: relational-history-fiber-doctrine-language
date-created: 2026-03-19
---

## Formal definition

An **Accord** is a sheaf over the history site:

$$F : T^{\mathrm{op}} \to \mathbf{Set}$$

satisfying the sheaf condition for the commutation topology $J$: for every covering sieve $S \in J(t)$, every matching family $\{x_s \in F(s)\}_{s \in S}$ has a unique amalgamation $x \in F(t)$ with $F(i)(x) = x_s$ for all $i : s \to t$ in $S$.

The **sections** of $F$:
- A **local section** at $t$ is an element $x \in F(t)$ — an [Observation](../../../terms/observation.md) of type $F$ at history $t$
- A **global section** is an element of $\Gamma(F) = F(\mathbf{1}) = \lim_{T^{\mathrm{op}}} F$ — a compatible family $\{x_t \in F(t)\}_{t \in T}$ cohere across all restriction maps

**Restriction maps.** For each morphism $f : s \to t$ in $T$ (prefix extension $s \leq t$), the restriction $F(f) : F(t) \to F(s)$ sends a section at $t$ to its restriction at $s$. An Observation at $t$ restricts backward consistently.

**Accord as type.** An Accord $F$ is the *type* of which [Observations](../../../terms/observation.md) are *terms*. Multiple observations of the same Accord at the same history $t$ are multiple elements of $F(t)$. The Accord defines what kind of evidence is being accumulated; the observations are its instances.

## What this is

Every claim in a relational system is grounded by looking for an Observation of the appropriate Accord type that backs it. The framework's recognition predicate over the claim is settled by checking whether the claim is consistent with the accumulated observations across the relevant histories. The claim is recognition-settled when the Accord-backed evidence is sufficient to fix the claim's recognition position.

The name: an accord is an agreement — a coherent arrangement in which local data at different histories are in agreement (satisfy the matching family condition). When observations "accord" with one another, they cohere into a global picture.

## In a rule-based normative system

In a rule-based normative system, Accords are the **typed observation spaces** from which evidence is drawn:

- A version-controlled history is an Accord over the history monoid: each revision is a section recording a snapshot of the system state
- A specification file is an Accord section: an observation of type "spec content" at a particular history
- A session log entry is a section of the memory Accord at the session history

Different Accords are different types of evidence. The grounding claim evaluation procedure checks, for each claim, which Accord it appeals to and whether a section of that Accord at the relevant history backs the claim.

## Open questions

- Whether the correct target category for Accords is $\mathbf{Set}$, $\mathbf{HA}$, or the category of nuclear algebras — the answer determines whether Accord sections are raw data or already-structured propositions.
- Whether every $H_t$ is itself the sections of some Accord — whether the fiber doctrine is a functor $T^{\mathrm{op}} \to \mathbf{HA}$ that is a sheaf.
