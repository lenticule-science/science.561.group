---
type: remark
class: taxonomic
title: Why the ISO/ASTM seven, and not six or eight, process families
description: "The ISO/ASTM 52900 taxonomy (reference) gives seven AM process families: vat photopolymerization, material extrusion, material jetting, binder jetting, powder bed fusion, sheet lamination, directed energy deposition."
---

# Why the ISO/ASTM seven, and not six or eight, process families

The ISO/ASTM 52900 taxonomy ([reference](./predication-iso-astm-52900-2021.md)) gives seven AM process families: vat photopolymerization, material extrusion, material jetting, binder jetting, powder bed fusion, sheet lamination, directed energy deposition. The number is not arbitrary but it is also not the only defensible partition.

The grouping rule the standard implicitly uses is *what is the dominant material-state-transition mechanism at the deposition step?*

| Process family | Material state going in | Mechanism at deposition |
|---|---|---|
| Vat photopolymerization | Liquid resin | Photochemical crosslinking |
| Material extrusion | Solid filament / pellet | Heat-driven phase change + flow |
| Material jetting | Liquid droplets | Photochemical crosslinking after impact |
| Binder jetting | Powder + liquid | Adhesive bonding (no fusion) |
| Powder bed fusion | Powder | Thermal fusion (laser/electron beam) |
| Sheet lamination | Solid sheet | Mechanical bonding (adhesive, ultrasonic) |
| Directed energy deposition | Wire or powder | Thermal fusion at the deposition point |

Note that "material jetting" and "vat photopolymerization" share a chemistry (photopolymer crosslinking) but are separated because the physical configuration is so different (droplet inkjet vs vat-and-platform). Conversely, LPBF and EBM are lumped together as PBF despite very different physics (laser vs electron beam, atmospheric vs vacuum).

A defensible six-family alternative would merge VPP and MJT (both photopolymer crosslinking; the standard separates them mostly for legal-IP reasons reflecting the historical Stratasys-vs-3D-Systems patent landscape). A defensible eight-family alternative would split DED into wire-fed (WAAM) and powder-fed (LMD) as different process classes; or split PBF into LPBF and EBM.

The seven-family taxonomy is the consensus because it: (a) maps cleanly to existing industrial process-control vocabulary, (b) groups processes that share regulatory pathways, (c) distinguishes processes whose tooling and operator skill sets are non-transferable. It is a *engineering-practical* taxonomy more than a physics-pure one. Any successor taxonomy would presumably extend rather than replace it.
