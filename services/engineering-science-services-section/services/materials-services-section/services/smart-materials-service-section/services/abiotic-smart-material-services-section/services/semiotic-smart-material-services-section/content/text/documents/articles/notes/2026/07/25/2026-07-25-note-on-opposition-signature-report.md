---
title: "The Opposition Signature: Rigidity Percolation and Coupled Transport Constriction"
description: "States the coupled-readout signature by which rigid-phase growth simultaneously raises shear modulus and constricts ionic conductivity through one process, with phi_c and the modulus envelope flagged as assumptions."
date-created: 2026-07-25
kind: research-note
keywords:
  - rigidity-percolation
  - ossification
  - device-readout
  - zeolite
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

This analysis models the physical mechanics and digital simulation of the dual-phase siloxane-zeolite vitrimer system [1]. It formalizes the "opposition signature" as a fundamental state variable of the substrate, contrasting the rigidity matroid — whose rank function, independence test, and hereditary redundancy law differ from the graphic matroid's — against the graphic-matroid connectivity model [15, 17].

## Key Findings

1. **Rigidity Onset (+122% Modulus Increase)**: Across the assumed rigidity threshold ($\phi_c = 0.20$; see the sourcing note in §2), corresponding to the Phillips-Thorpe coordination limit of $\langle r \rangle_c = 2.4$, the shear modulus ($G'$) rises steeply from $48\text{ kPa}$ to $100\text{ kPa}$ [5, 15, 28]. This represents the transition from a floppy₍₂₎, flowing matrix to an over-constrained, stressed-rigid₍₂₎ network [5, 15]. The rise is steep but continuous: generic rigidity percolation measured on the 2D triangular lattice is a *continuous, second-order* transition in its own distinct universality class (Jacobs & Thorpe, *Phys. Rev. Lett.* **75**, 4051, 1995; *Phys. Rev. E* **53**, 3682, 1996).
2. **Coupled Transport Decay (-46% Conductivity Drop)**: As the rigid zeolite phase volume fraction grows from $0.0$ to $0.35$, the ionic conductivity ($\sigma$) drops from $10.0\text{ mS/cm}$ to $5.4\text{ mS/cm}$ [8]. Because transport occurs strictly in the floppy matrix complement, growing the rigid domains constricts and re-routes the ion pathways [8].
3. **The "Opposition Signature" coupling**: A single physical process—the growth/ossification of the rigid phase—simultaneously drives mechanical rigidity up and transport conductivity down [8]. This inverse relationship serves as the primary system-level signature for reading and writing state [9].

---

## Technical Derivation & Material Parameters

### 1. Rigidity vs. Connectivity Matroids
Traditional network percolation models evaluate connectivity using the **graphic matroid's cycle rank**:
$$b_1 = |E| - |V| + c$$
whose rank function on $|V|$ vertices in $c$ components is $|V| - c$, and where each redundant contact increases the rank by exactly one [15].

Physical mechanical rigidity is governed by the **rigidity matroid** — the matroid of the rigidity matrix at a generic configuration, which exists in every dimension. Three concrete discriminants separate it from the graphic matroid [15, 16]:

* **The rank functions differ.** Graphic rank is $|V| - c$; the generic 2D (Laman) rank of a rigid body in the plane is $2|V| - 3$. The two matroids assign different ranks to the same edge set.
* **Independence is tested by the pebble game, not union-find.** Union-find decides only whether an edge closes a cycle. The $(2,3)$-pebble game decides whether an edge is an independent *constraint*, which union-find cannot see.
* **Laman's condition is hereditary, so redundancy is nonlocal.** Every subgraph on $n'$ vertices must carry at most $2n' - 3$ edges. Because the condition quantifies over all subgraphs, no per-site or per-vertex count detects redundancy; a locally sparse network can be globally over-constrained.

The *order* of the rigidity transition is not one of these discriminants. Generic rigidity percolation on the 2D triangular lattice was measured as **continuous / second-order**, with its own distinct universality class (Jacobs & Thorpe, *Phys. Rev. Lett.* **75**, 4051, 1995; *Phys. Rev. E* **53**, 3682, 1996) — a result that overturned the earlier mean-field expectation. First-order behaviour belongs to the Bethe-lattice / mean-field treatment (attributed to the Moukarzel-Duxbury-Leath line; *this attribution is unverified in this repository*). A test that read a continuous rise as evidence *against* the rigidity matroid would therefore report failure on a correct result, and no such test is used here.

The mechanical/electrical opposition itself does not depend on the transition order and is unaffected: rigidity rises while conduction is constricted regardless of whether the rise is continuous or abrupt.

### 2. Constraint Counting (Phillips-Thorpe Threshold)
* **Matrix phase (Siloxane, $\text{Si–O}$ backbone)**: Mean coordination number $\langle r \rangle = 2$, placing it well below the critical threshold $\langle r \rangle_c = 2.4$. It remains floppy and ion-permissive [5].
* **Rigid phase (Zeolite framework)**: Mean coordination number $\langle r \rangle = 4$, making it over-constrained and stressed-rigid [5].
* **Composite coordination**: $\langle r \rangle(\phi) = 2(1 - \phi) + 4\phi = 2 + 2\phi$
* **Rigidity Threshold**: Setting $\langle r \rangle(\phi) = 2.4$ yields a critical volume fraction of **$\phi_c = 0.20$ (20 vol% zeolite)** [5].

**Sourcing note on $\phi_c$.** The value $\phi_c = 0.20$ is an *assumption* of this model, not a derived or measured threshold. It follows only from the assumed linear rule of mixing $\langle r \rangle(\phi) = 2 + 2\phi$ applied to the Phillips-Thorpe coordination limit. Constraint counting fixes a threshold in *mean coordination*, not in volume fraction; converting one to the other additionally requires a joint law over sites, and a correlated placement crosses the coordination threshold at a very different density than an independent one. This model assumes the linear single-site conversion above. No critical fraction is available from the repository's Lean library: `Percolation.lean` states in its own header that the critical fraction is an unbuilt frontier — "The red frontier this opens (not built): the *critical fraction*". The shear-modulus profile tabulated below ($45\text{–}120\text{ kPa}$) is likewise an assumed illustrative envelope, not a derived or measured curve.

### 3. Coupled Transport Equation
Ionic transport occurs exclusively in the floppy PDMS complement ($1 - \phi$) [8]. We model the resulting constriction using a Bruggeman/Archie's-type power law:
$$\sigma(\phi) = \sigma_max \cdot (1 - \phi)^m$$
where $m = 1.8$ represents the tortuosity and cementation exponent as the rigid domains (tiled via space-filling gyrobifastigium $J_{26}$ geometry) block the ionic paths [9].

---

## Data Summary

| Rigid Fraction ($\phi$) | Mean Coordination ($\langle r \rangle$) | Shear Modulus $G'$ (kPa, assumed) | Ionic Conductivity $\sigma$ (mS/cm) | Phase Regime |
|-------------------------|------------------------------------------|--------------------------|-------------------------------------|--------------|
| **0.00**                | 2.00                                     | 45.0                     | 10.00                               | Fully Floppy₍₂₎ Matrix |
| **0.10**                | 2.20                                     | 46.5                     | 8.28                                | Floppy₍₂₎ Matrix / Dispersed Filler |
| **0.19**                | 2.38                                     | 47.9                     | 6.89                                | Pre-Threshold Critical₍₂₎ state |
| **0.20 (Threshold)**    | 2.40                                     | **100.0**                | 6.74                                | Isostatic Rigidity₍₂₎ Percolation [5, 15] |
| **0.30**                | 2.60                                     | 110.0                    | 5.37                                | Stressed-Rigid₍₂₎ Spanning Cluster [5, 15] |
| **0.40**                | 2.80 | 115.3                    | 4.14                                | Heavily Ossified / High-Rigidity₍₂₎ [6] |
| **0.50**                | 3.00                                     | 120.0                    | 3.03                                | Brittle / Compressed Sclerotium [6, 41] |

---

## Digital Simulation & EDA Engine Architecture

An EDA simulator modeling this material system must replace standard Union-Find connectivity algorithms with a **pebble game algorithm**, which decides independence in the generic 2D (Laman) rigidity matroid [15]. The generic rigidity matroid exists in every dimension — it is the matroid of the rigidity matrix at a generic configuration — but only in the plane does a combinatorial characterization (Laman's condition) exist to run the pebble game against; in 3D that characterization is open, Laman's count failing there on the double-banana counterexample. The engine therefore solves the planar matroid on each crossbar layer. By dynamically tracking whether incoming thermal or mechanical bonds are independent or structurally redundant — a nonlocal question, since Laman's condition is hereditary over every subgraph — the simulation engine can predict both local and global ossification states [15].

This ensures that:
* The **mechanical solver** (Shear Modulus $G'$) and **transport solver** (Conductivity $\sigma$) are coupled via the single state variable of **ossification fraction $\phi$** [7, 8].
* The simulation accurately replicates the **"opposition signature"**, allowing computational designs to use local Joule heating (via electrodes) to write state (devitrifying/re-dissolving rigid domains) and impedance sweeps to read it [9].

*Source: Grounded in the "Union Self-Conception Corpus" (specifically the design note "Ossification as the State Variable: Rigidity Percolation in a Two-Phase Ionic Substrate" [1, 2]).*
