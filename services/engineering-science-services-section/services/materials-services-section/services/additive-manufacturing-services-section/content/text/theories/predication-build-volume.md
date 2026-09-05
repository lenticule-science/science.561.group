---
type: object
class: machine-envelope
depends-on: []
---

# Build volume

The maximal axis-aligned box $V = [0, X_{\max}] \times [0, Y_{\max}] \times [0, Z_{\max}] \subset \mathbb{R}^3$ in which a given AM machine can deposit material. The build volume is the hardest constraint on AM design: a part that does not fit cannot be built, full stop.

Build volume is reported as $X \times Y \times Z$ in millimeters, conventionally with Z as the build axis. Typical desktop FFF machines: $200$–$300$ mm cube. Industrial FFF (Stratasys F900, BigRep): $914 \times 610 \times 914$ mm and larger. Desktop MSLA (Anycubic Mono X, Elegoo Saturn): $192 \times 120 \times 250$ mm and similar. Industrial PBF (EOS M400): $400 \times 400 \times 400$ mm.

When a part exceeds build volume, options are (in roughly preferred order):

1. **Reorient.** A diagonal orientation can fit a part up to $\sqrt{X^2 + Y^2 + Z^2}$ in maximum dimension within an $X \times Y \times Z$ envelope.
2. **Split and join.** Partition the part into sub-parts at clean joint geometry (dovetails, threaded inserts, glue lap-joints), print each separately, assemble. This is standard practice for cosplay props, large enclosures, architectural models.
3. **Move to a larger machine.** Print farms and service bureaus offer build volumes well beyond hobbyist scale.

The build volume's *usable* fraction is smaller than nominal: a margin near the build plate edges is conventionally avoided (poor first-layer adhesion at the plate corners, uneven first-layer due to plate flatness tolerances), and on FFF the topmost few millimeters may be inaccessible due to nozzle-to-Z-stop clearance. A practical rule is to design within $X - 10, Y - 10, Z - 5$ of the nominal envelope.

Build volume is independent of part complexity — geometry can be arbitrary within the envelope, with the only further constraint being whether [supports](./predication-support.md) can be removed from internal cavities.
