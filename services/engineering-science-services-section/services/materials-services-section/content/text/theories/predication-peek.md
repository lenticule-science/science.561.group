---
type: object
class: high-performance-engineering-polymer
depends-on: [glass-transition, crystallinity, hygroscopicity]
title: PEEK (poly-ether-ether-ketone)
description: A semi-crystalline aromatic thermoplastic of the polyaryletherketone (PAEK) family.
---

# PEEK (poly-ether-ether-ketone)

A semi-crystalline aromatic thermoplastic of the polyaryletherketone (PAEK) family. The benchmark "high-performance" polymer: continuous service to 250°C, mechanical properties approaching aluminum, chemical resistance approaching PTFE, biocompatibility approved for spinal implants. Used in aerospace cabin components, oil-and-gas downhole tools, medical implants, and high-temperature electronics.

## Properties

| Property | Value | Notes |
|---|---|---|
| $T_g$ | 143°C | High; service envelope set by $T_g$, not melting |
| $T_m$ | 343°C | Highest of common FFF polymers |
| Tensile strength | 90–100 MPa (semi-crystalline) | 70–80 MPa amorphous |
| Modulus | 3.6 GPa | Up to 12 GPa for CF-filled |
| Density | 1.32 g/cm³ | |
| CTE (below $T_g$) | $0.5 \times 10^{-4}$ /°C | Among the lowest for unfilled polymers |
| Continuous service temp | 250°C | Short-term to 320°C |
| Cost (filament) | 200–800 USD/kg | Order of magnitude above engineering polymers |

## Why FFF-PEEK is hard

PEEK is the most demanding FFF feedstock in commercial use:

1. **Nozzle temperature 380–420°C.** Above the limit of standard hot-ends; requires all-metal hot-end with PEEK-rated heater cartridge and high-temp PT100 thermistor. Brass nozzles oxidize at this temperature; tungsten carbide or titanium-coated steel required.

2. **Bed temperature 130–180°C.** Above the limit of most desktop printers. PEI build sheet works; glass with PEI primer; or specialty Ultem build plates.

3. **Chamber temperature ≥90°C, preferably 130°C.** Crystallinity of the printed part depends critically on cooling rate through the crystallization window ($T_g$ to $T_m$):
   - *Cool below $T_g$ in <10 s:* amorphous PEEK. Weak (~70 MPa), transparent, glassy. Like un-quenched glass.
   - *Cool at 1–10 °C/min through 200–300°C:* semi-crystalline (~30% crystallinity). Strong (~95 MPa), opaque tan, the "real" PEEK.
   The chamber must be hot enough and cool slowly enough to land in the second regime. Open-ambient FFF produces amorphous PEEK with mediocre properties; only enclosed, actively-controlled chambers (Apium P220/P400, Roboze ARGO, Intamsys FUNMAT HT) reliably produce semi-crystalline PEEK.

4. **Drying discipline.** Hygroscopic; requires drying at 150°C for ≥4 h before printing, kept dry during print. Wet PEEK at 400°C undergoes rapid hydrolytic chain scission.

5. **Machine cost.** A PEEK-capable FFF printer is $20k–$200k. The gap from $300 desktop FFF is two orders of magnitude in capital cost.

## Why use it

- **Aerospace cabin and ducting.** FAR 25.853 fire-rating compliance; weight savings vs aluminum.
- **Spinal implants.** PEEK-OPTIMA (Invibio) is FDA-cleared and EU CE-marked; printed PEEK implants are an active research area, with first FDA-cleared 3D-printed PEEK implant in 2020 (Curiteva).
- **Oil-and-gas downhole.** Chemical resistance and 250°C service temperature.
- **Semiconductor wafer-handling.** Ultra-high purity (no plasticizers, no phthalates), low outgassing.

## Carbon-fiber-reinforced variant (PEEK-CF)

PEEK with 10–30% chopped carbon fiber. Property changes:

- *Tensile strength:* up to 130 MPa.
- *Modulus:* up to 12 GPa (in fiber direction).
- *CTE:* drops to $0.2 \times 10^{-4}$ /°C in fiber direction.
- *Warping:* nearly eliminated by fiber anchoring.

PEEK-CF is the dominant high-performance FFF feedstock for aerospace fixturing and tooling.

## Open frontier

- **Crystallinity control as a process variable.** Currently uncontrolled in most FFF-PEEK setups; the chamber program implicitly determines crystallinity. A printer that *measures* and *controls* crystallinity (via in-situ DSC or IR spectroscopy) would unlock PEEK as a fully designable AM material.
- **Continuous-fiber PEEK.** Markforged FX10 (2024) and Anisoprint Composer A4 print continuous CF in PEEK matrix. Property approaches CFRP prepreg.

## References

- Vaezi, M., Yang, S. (2015). "Extrusion-based additive manufacturing of PEEK for biomedical applications." *Virtual and Physical Prototyping* 10.
- Wang, P., Zou, B., Ding, S., Li, L., Huang, C. (2021). "Effects of FDM-3D printing parameters on mechanical properties and microstructure of CF/PEEK and GF/PEEK." *Chinese Journal of Aeronautics* 34.
- Yang, C., Tian, X., Li, D., Cao, Y., Zhao, F., Shi, C. (2017). "Influence of thermal processing conditions in 3D printing on the crystallinity and mechanical properties of PEEK material." *Journal of Materials Processing Technology* 248.
