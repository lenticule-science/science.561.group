---
type: concept
class: thermal-transition
symbol: T_g
depends-on: []
---

# Glass transition

The temperature $T_g$ at which an amorphous (or amorphous regions of a semi-crystalline) polymer transitions between a glassy, rigid solid and a rubbery, soft state. Below $T_g$ the polymer chains are kinetically frozen — molecular motion is restricted to bond vibration; mechanical behavior is brittle-elastic. Above $T_g$ chain segments have rotational and translational freedom; the polymer is rubbery, viscoelastic, and capable of permanent deformation.

$T_g$ is *not* a melting transition — it is a kinetic freezing transition, observable as a step in heat capacity (DSC) or a step in storage modulus (DMA). A semi-crystalline polymer has both a $T_g$ (for its amorphous regions) and a $T_m$ (for its crystalline regions); an amorphous polymer has only a $T_g$.

For fabrication purposes, $T_g$ is the **service-temperature ceiling**. A part used above its $T_g$ deforms under load, creeps, and loses dimensional stability. The printable-material selection question reduces to "what is the maximum temperature this part will see in service, and what polymer has $T_g$ above that?"

| Polymer | $T_g$ (°C) | $T_m$ (°C, if semi-crystalline) | Service ceiling (rough) |
|---|---|---|---|
| PLA | $\sim 60$ | $\sim 175$ | $50$°C |
| PETG | $\sim 80$ | (amorphous) | $65$°C |
| ABS | $\sim 105$ | (amorphous) | $90$°C |
| ASA | $\sim 105$ | (amorphous) | $90$°C |
| PA6 (nylon) | $\sim 50$ (dry) / $\sim 0$ (wet) | $\sim 220$ | depends on humidity |
| PC | $\sim 145$ | (amorphous) | $120$°C |
| PEEK | $\sim 145$ | $\sim 343$ | $250$°C continuous |
| PEI / Ultem | $\sim 215$ | (amorphous) | $170$°C |

The "service ceiling" column is set $\sim 10$–$15$°C below $T_g$ to account for the fact that $T_g$ is broadly defined (a $20$°C transition window, not a sharp point) and that load-bearing applications need margin.

**Annealing.** Heating a semi-crystalline polymer to between $T_g$ and $T_m$ for a sustained period drives crystallization in regions that didn't crystallize during fast cooling. Annealed PLA increases its effective service temperature from $\sim 50$°C to $\sim 110$°C and gains $30$–$50\%$ tensile strength, at the cost of $1$–$3\%$ dimensional shrinkage. Useful for functional PLA parts that need heat resistance.

For amorphous polymers (PETG, ABS, ASA, PC), annealing redistributes residual stress but does not change $T_g$ — service ceiling is fixed at the polymer's intrinsic $T_g$.
