---
type: object
class: feedstock
depends-on: []
title: Filament
description: "Spooled thermoplastic feedstock for FFF, manufactured to one of two nominal diameters: $1.75$ mm (standard for nearly all desktop printers since ~2013) or $2.85$ mm (legacy \"3 mm\", used by Ultimaker, LulzBot, and some industrial machines)."
---

# Filament

Spooled thermoplastic feedstock for FFF, manufactured to one of two nominal diameters: **$1.75$ mm** (standard for nearly all desktop printers since ~2013) or **$2.85$ mm** (legacy "3 mm", used by Ultimaker, LulzBot, and some industrial machines).

A spool of filament is characterized by:

- **Polymer base.** PLA, PETG, ABS, ASA, PA (nylon), PC, TPU, PEEK, PEI/Ultem, PEKK. See the [material-science](../../../../material-science/) sub-theory for the property comparisons.
- **Filler / additive.** Unfilled, glass-fiber-reinforced (GF, e.g. PA6-GF15), carbon-fiber-reinforced (CF, e.g. PETG-CF), wood-particle, metal-particle, glow-in-dark. Fillers improve stiffness or aesthetics at the cost of nozzle wear and brittleness.
- **Colorant.** Pigments (with possible mechanical-property impact — black PLA is often slightly stronger than natural; white pigments can introduce porosity).
- **Diameter tolerance.** Quality manufacturers spec $\pm 0.02$ mm; budget brands $\pm 0.05$ mm or worse. Tolerance directly affects extrusion-multiplier consistency.
- **Roundness tolerance.** Often un-specified; ovality $> 0.05$ mm causes flow variation that calibration cannot fix.
- **Spool weight.** $250$ g, $500$ g, $750$ g, $1$ kg standard; $2.5$ kg and $5$ kg for production. Spool weight excludes the spool itself.

**Storage.** All FFF filaments are at least slightly hygroscopic; some (PA, PC, PETG, TPU) absorb moisture aggressively from ambient air. Wet filament prints poorly: stringing, popping/hissing at the nozzle, weak layer adhesion, surface bubbling. Storage requirement:

- PLA, ABS, ASA: tolerable in open air for weeks; degraded after months. Store in a dry box (silica gel or rechargeable desiccant) at $\sim 15\%$ RH.
- PETG, PC, PVA: degrades within days of open-air exposure. Store dry and consider an active dryer.
- PA, TPU, PEEK: degrades within hours of open-air exposure. Print directly from a heated dry box (Polymaker PolyBox, Sunlu, Eibos).

**Drying.** Wet filament can be restored: $40$–$50$°C for PLA $4$h; $55$–$65$°C for PETG/ABS/ASA $6$–$8$h; $70$–$80$°C for PA $8$–$12$h; $80$°C+ for PC $10$h+. Use a filament-specific dryer or a food dehydrator; consumer ovens often run too hot at low setpoints and will deform spools.

A bad spool is the second most common cause of "my printer suddenly started failing" reports (after under-tightened belt or worn nozzle). Trying a known-good spool is a near-zero-cost diagnostic step.
