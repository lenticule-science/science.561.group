---
type: object
class: machine-component
depends-on: []
realizes: []
---

# Build plate

The flat, heated surface on which the first FFF layer is deposited and to which the printed part remains anchored throughout the print. Build plate choice is the single largest determinant of [first-layer adhesion](../../teaching/explanations/adhesion.md) and one of the most frequently-upgraded printer components.

Surface options:

- **Borosilicate glass.** Smooth, flat, durable. Adhesion via glue stick (PVA), hairspray, or ABS slurry. PLA sticks to clean cold glass with no aid (sometimes too well — chips can break off the glass). Largely displaced by spring-steel plates.
- **PEI (polyetherimide), smooth.** Coated onto a flexible spring-steel sheet, removable from a magnetic bed. PLA, PETG, ASA, PA stick directly without aid; ABS sticks with brim and proper bed temp. The current de facto standard for desktop printers (Prusa, Bambu, Voron all ship PEI plates).
- **PEI, textured.** PEI with a powder-coated grain texture. Releases parts on cooling without intervention (textured surface reduces adhesion area at room temperature). The bottom-of-part surface inherits the texture (often desirable as a uniform aesthetic). Trade-off: less adhesion than smooth PEI for warpy materials.
- **PEX.** Similar to PEI; slightly different adhesion characteristics. Less common.
- **BuildTak / equivalent vinyl.** Adhesive vinyl applied to bed; replaceable annually. Good adhesion across many materials; eventually wears.
- **Garolite (G10 fiberglass-epoxy).** The PA-specific surface; PA sticks to garolite reliably, sticks poorly to anything else.
- **Magnetic spring-steel double-sided.** Carrier plate with smooth PEI on one side, textured PEI on the other; flip per material requirement.

Mechanical attributes:

- **Flatness.** Bed flatness $\leq 0.1$ mm across $200$ mm is the de facto requirement. A bed warped $0.3$ mm cannot be auto-leveled into a usable first layer. Glass beds are flatter than aluminum.
- **Heating.** Beds heat to $50$–$120$°C (some specialty beds to $150$°C+ for PC, PEEK). Heating uniformity is non-trivial; bed corners are typically $5$–$10$°C cooler than center, enough to cause corner-lift on warping-prone materials.
- **Thermal mass.** Heavy glass beds heat slowly ($5$–$15$ min to reach $100$°C); thin spring-steel sheets heat rapidly. Affects pre-heat workflow.
- **Removability.** Magnetic flex-plate systems (now standard) allow the user to flex the cooled plate and pop the part off — vastly easier than scraping a fixed bed.

Build plate maintenance:
- Clean periodically with isopropyl alcohol ($91\%$ or higher) to remove fingerprint oils and adhesion-helper residue. Detergent (Dawn dish soap + water) restores PEI when IPA stops being effective.
- Replace flex plates every $\sim 1000$–$2000$ print hours; PEI coatings degrade at scratch sites and create localized adhesion failures.

Build plate is the cheapest large QoL upgrade for older printers: an aftermarket magnetic PEI flex plate ($30$–$70$) on a printer that originally shipped with glass eliminates most first-layer adhesion problems and removes the need for adhesion aids.
