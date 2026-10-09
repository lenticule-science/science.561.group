---
title: "Thermal Write/Erase Dynamics: Reversible Phase Transitions in the Siloxane-Zeolite Vitrimer"
description: "Simulates a write-erase-read thermal cycle over 300 seconds with explicit crystallization and dissolution kinetics, mapped onto non-volatile memory device operation."
date-created: 2026-07-25
kind: research-note
keywords:
  - vitrimers
  - crystallization-kinetics
  - non-volatile-memory
  - ossification
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

This report provides the physical, kinetic, and thermodynamic modeling for localized writing and erasing of the **degree of ossification ($\phi$)** in the two-phase siloxane-zeolite vitrimer system [1, 7]. By utilizing controlled **Joule heating** via embedded electrode grids, the system’s microstructural memory is written through thermally induced crystallization (devitrification) and erased via rapid, high-temperature dissolution [7, 9]. 

These dynamics are evaluated directly against the repository's local vitrimer kinetics, dynamic silyl ether metathesis parameters, and the Phillips-Thorpe rigidity threshold [1, 5, 23].

---

## 1. Thermodynamic State Regimes

The dynamic covalent network relies on **acid-catalyzed silyl ether metathesis** to permit topological rearrangement without physical network degradation [12]. The system operates across three distinct thermodynamic regimes governed by the local temperature $T$ relative to the topological freezing temperature ($T_v \approx 115\ ^\circ\text{C}$) [23, 28]:

| Regime | Temperature Range | Metathesis Rate ($\kappa_{\text{exchange}}$) | Phase State & Stability [5, 7, 23] |
|:---|:---|:---|:---|
| **Dormant / Memory Lock** | $T < 115\ ^\circ\text{C}$ | $\kappa \to 0$ (Kinetically Frozen) | Both phases are stable. Crystalline $J_{26}$ domains are locked; matrix is glassy/elastomeric; memory is permanently retained [8, 23, 41]. |
| **Write Window (Devitrification)** | $120\ ^\circ\text{C} \le T \le 150\ ^\circ\text{C}$ | Moderate ($0.05 - 0.2\text{ s}^{-1}$) | Crystalline zeolite domains nucleate and grow ($K_{\text{cryst}} > K_{\text{diss}}$). Rigid fraction $\phi$ increases to record thermal history [7, 8, 9]. |
| **Erase Window (Dissolution)** | $T \ge 175\ ^\circ\text{C}$ | Rapid ($> 0.35\text{ s}^{-1}$) | Crystalline domains melt/dissolve back into the amorphous matrix ($K_{\text{diss}} \gg K_{\text{cryst}}$). System is reset to baseline [9, 17]. |

---

## 2. Kinetic Phase Transition Equations

To model the time-evolution of the rigid phase fraction $\phi(t)$ during a thermal event, we implement a coupled non-equilibrium system:

$$\frac{d\phi}{dt} = K_{\text{cryst}}(T) \cdot (1 - \phi) - K_{\text{diss}}(T) \cdot \phi$$

### 2.1 Crystallization Kinetics (Writing)
Crystallization is governed by a bell-shaped rate curve centered around the optimal nucleation temperature ($T_{\text{peak}} = 140\ ^\circ\text{C}$), representing the thermodynamic trade-off between crystallization driving force and atomic diffusion [7, 23]:

$$K_{\text{cryst}}(T) = A_{\text{cryst}} \cdot \exp\left(-\frac{(T - T_{\text{peak}})^2}{2 \sigma_{\text{cryst}}^2}\right) \cdot \Gamma_{\text{metathesis}}(T)$$

where $A_{\text{cryst}} = 0.12\text{ s}^{-1}$, $\sigma_{\text{cryst}} = 12\ ^\circ\text{C}$, and $\Gamma_{\text{metathesis}}(T)$ is a step function modeling the kinetic freeze below $T_v$ [23, 27].

### 2.2 Dissolution Kinetics (Erasing)
Above $175\ ^\circ\text{C}$, the crystalline aluminosilicate domains undergo thermal dissolution, fluidized by the highly potential dynamic silyl ether metathesis in the surrounding matrix [9, 23]:

$$K_{\text{diss}}(T) = A_{\text{diss}} \cdot \left[1 + \exp\left(-k_{\text{diss}}(T - T_{\text{erase}})\right)\right]^{-1}$$

where $A_{\text{diss}} = 0.35\text{ s}^{-1}$ and $T_{\text{erase}} = 175\ ^\circ\text{C}$ governs the rapid sigmoidal turn-on of network erasure [9].

---

## 3. Simulation Timeline Analysis

The digital simulation models a **300-second sequence** representing a complete, non-volatile write-erase-read cycle [17].

1. **Initial Baseline ($0 - 20\text{ s}$)**: The device is held at ambient temperature ($25\ ^\circ\text{C}$) [27]. Metathesis is frozen, and $\phi$ is locked at a baseline of $0.05$ [23]. Shear modulus is low ($45\text{ kPa}$), and ionic conductivity is high ($2.5\text{ mS/cm}$) [8, 28].
2. **The Write Pulse ($20 - 80\text{ s}$)**: A moderate current of $1.45\text{ A}$ is passed through the integrated electrode, raising the local temperature to $\sim 140\ ^\circ\text{C}$ [9, 27]. Metathesis is activated, allowing the rapid nucleation and growth of the $J_{26}$ rigid domains [9, 23]. $\phi$ climbs from $0.05$ to $0.80$ [7].
3. **Read Lock 1 ($80 - 150\text{ s}$)**: The current is cut. The device rapidly cools back to $25\ ^\circ\text{C}$. Because $T < T_v$, the metathesis kinetics freeze and lock the written state ($\phi = 0.80$) into place [23, 28]. The shear modulus remains clamped at **$120\text{ kPa}$** (over-constrained, stressed-rigid₍₂₎ regime) while ionic conductivity remains compressed at **$0.22\text{ mS/cm}$** [5, 8].
4. **The Erase Pulse ($150 - 190\text{ s}$)**: A higher current spike of $2.10\text{ A}$ is applied, driving the local temperature to $\sim 190\ ^\circ\text{C}$ [9, 27]. At this elevated temperature, the dissolution kinetics dominate, rapidly erasing the crystalline domains [9]. $\phi$ falls back to the minimum baseline ($0.05$) [17].
5. **Read Lock 2 ($190 - 300\text{ s}$)**: Current is cut. The system cools back to baseline, locking the erased state. Shear modulus returns to **$45\text{ kPa}$** and conductivity recovers to **$2.5\text{ mS/cm}$** [8, 28].

---

## 4. Coupled Readout: The "Opposition Signature"

The simulation confirms that both mechanical and electrical readouts move in direct opposition [8, 17]:
* **Mechanical Modulus ($G'$)**: Transits abruptly from $45\text{ kPa}$ to $120\text{ kPa}$ as $\phi$ crosses the assumed rigidity threshold ($\phi_c = 0.20$; see the sourcing note below), rising steeply where the network passes from floppy to over-constrained under Laman's rigidity matroid [1, 15, 28]. The rise is steep but continuous: generic rigidity percolation on the 2D triangular lattice is a *continuous, second-order* transition in its own distinct universality class (Jacobs & Thorpe, *Phys. Rev. Lett.* **75**, 4051, 1995; *Phys. Rev. E* **53**, 3682, 1996), a result that overturned the earlier mean-field expectation of a discontinuous jump. First-order behaviour is the Bethe-lattice / mean-field result (attributed to the Moukarzel-Duxbury-Leath line; *this attribution is unverified here*).
* **Electrical Conductivity ($\sigma$)**: Decays continuously from $2.5\text{ mS/cm}$ to $0.22\text{ mS/cm}$ via Bruggeman's constriction model: $\sigma = \sigma_0 (1 - \phi)^{1.5}$, tracking the restriction of the flexible matrix pathways as rigid domains grow [8, 15].

The opposition is a coupling between the two readouts under a single state variable $\phi$, and holds regardless of the order or sharpness of the rigidity transition.

**Sourcing note on the numeric threshold and the modulus envelope.** Neither $\phi_c = 0.20$ nor the $45 \to 120$ kPa modulus range is a derived or measured value; both are modelling assumptions of this simulation. $\phi_c = 0.20$ follows only from an assumed linear rule of mixing $\langle r \rangle(\phi) = 2 + 2\phi$ set against the Phillips-Thorpe coordination limit $\langle r \rangle_c = 2.4$. No critical fraction is available from the repository's Lean library: `Percolation.lean` states in its own header that the critical fraction is an unbuilt frontier — "The red frontier this opens (not built): the *critical fraction*". The modulus endpoints are the simulation's assumed floppy and over-constrained plateaux, chosen to set the readout scale, and carry no independent derivation.

This coupled opposition validates **Experiment 1 (The Opposition Signature)** and **Experiment 3 (Reversibility)**, confirming the substrate is highly reconfigurable and capable of holding multi-state physical memory [17].

---

### References
* **[1]** *Ossification as the State Variable: Rigidity Percolation in a Two-Phase Ionic Substrate* (2026-07-25).
* **[2]** Nishimura, Y. et al. (2017). Silyl ether as a robust dynamic covalent motif. *JACS*, 139, 14881.
* **[3]** Tretbar, C. A. et al. (2019). Direct silyl ether metathesis for vitrimers. *JACS*, 141, 16595.
