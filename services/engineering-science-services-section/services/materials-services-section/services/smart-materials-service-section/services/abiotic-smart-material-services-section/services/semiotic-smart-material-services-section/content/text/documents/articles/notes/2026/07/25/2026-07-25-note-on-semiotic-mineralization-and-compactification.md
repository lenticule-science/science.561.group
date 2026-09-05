---
title: "Rock-Cycle Processes and Bonding Typology in the Semiotic Substrate"
description: "Igneous crystallization, metamorphic foliation, and weathering as the rock-cycle processes missing from the corpus's existing zeolite diagenesis, a bonding typology beyond covalent Si-O, and the corpus's diagenetic ladder read as an instance of Ostwald's step rule."
date-created: 2026-07-25
kind: research-note
keywords:
  - rigidity-percolation
  - ossification
  - zeolite
  - diagenesis
  - bonding-typology
  - polymorphism
  - rock-cycle
  - igneous-petrology
  - metamorphic-petrology
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

## Abstract

The corpus's diagenetic ladder (clinoptilolite → analcime → albite) is a special case of a
general nucleation law, Ostwald's step rule: a system crystallizing out of a metastable state
passes through a sequence of increasingly stable forms rather than jumping straight to the
most stable one, because the least stable form nucleates fastest even though it isn't the
endpoint. That's the real finding here — it means the ladder was never a bespoke zeolite
fact, and it predicts the same step-behavior for any term seated under time pressure, plus
genuine path-dependence: two records built from identical requirements but different
authoring histories can land on different stable structures, the same way SiO₂ ends up as
quartz or cristobalite depending on formation conditions. Everything else below sets that up:
a named bonding typology beyond the existing covalent Si-O register (ionic, metallic, van der
Waals), and the two rock-forming processes the corpus hasn't used yet — igneous
crystallization from melt, and metamorphic recrystallization without melting — plus
weathering, the decay process that's been missing entirely.

---

## 1. Three processes, one built

The corpus runs sedimentary diagenesis of a metastable parent glass
(`ossification-to-compactification-concept.md`) and rigidity percolation as the state
variable (`ossification-as-the-state-variable.md`). Real petrology has two more processes in
the cycle — igneous crystallization from melt, and metamorphic recrystallization without
melting — plus weathering, which supplies raw material for the others by breaking rock down.
None of the other three are here yet.

One thing worth being precise about before adding to it: the existing chain is *in-situ
alteration of a metastable parent* — volcanic glass or tuff altering to zeolite where it
sits, not eroded fragments deposited and cemented elsewhere. That's the dominant real pathway
for zeolite formation. Weathering (§4) isn't a hidden prerequisite the chain was missing — it
belongs to different material.

---

## 2. A bonding typology

The existing register uses covalent Si–O bonding — directional, saturating, rigid panels
with soft hinges. There are three other bonding regimes worth naming, because they're already
doing work in the corpus under other descriptions:

| bonding regime | physical character | coordination |
|---|---|---|
| covalent | shared, directional electron pair; saturates | fixed valence |
| ionic | electrostatic, non-directional; satisfied by charge balance | radius-ratio packing (Pauling's rules), not valence |
| metallic | delocalized electron sea, non-directional | high, close-packed |
| van der Waals / hydrogen | weak, long-range, easily broken and re-formed | not saturating |

**Metallic bonding is the fungible-value layer.** A delocalized electron sea doesn't care
which nucleus it's currently near — the bond survives arbitrary rearrangement because it was
never tied to a specific atom pair, which is why metals are ductile where covalent and ionic
solids are brittle. A WIT balance or an x402 price has the same shape: it doesn't care which
record it's attached to, and it flows under load without any single relationship breaking.

**Ionic bonding is untyped, content-addressed reference.** Coordination number is set by
packing (how many oppositely-charged neighbours physically fit — Pauling's radius-ratio
rule), not by orbital geometry or a fixed valence. A hash/CID reference has the same shape:
any record can point at any other with no schema constraining who addresses whom, and how
many references a record carries is a capacity fact, not a typed limit.

**Van der Waals / hydrogen bonding is the untyped, reversible connective tissue** — informal
cross-references, "see also" links, conversational context that no schema or EIP-712 seal
validates. This one matters mechanically, not just descriptively: it's the interlayer bond in
§3's sheet-mineral example, and interlayer bond weakness is the entire mechanism of cleavage.

Also worth correcting while naming this: real Si–O bonding isn't purely covalent — the
electronegativity difference between silicon and oxygen gives it substantial ionic character
too. The existing "rigid panel" framing was already a mixture, not a pure type, and mixtures
are the rule in mineralogy, not the exception.

---

## 3. Igneous genesis and metamorphic foliation

**Igneous.** Rock crystallizes directly from melt, and grain size tracks cooling rate: slow
cooling at depth gives large interlocking crystals (granite, gabbro); fast cooling at the
surface gives fine grain (basalt, rhyolite); near-instant quenching outruns crystallization
and freezes a glass with no long-range order at all (obsidian).

The corpus's ladder starts from parent glass — unsettled material seated later, over many
small passes. That's one genesis path, not the only one. A record authored in a single
sustained high-attention pass crystallizes directly the moment attention is withdrawn — no
glass phase, no later seating episode, the way magma crystallizes on cooling rather than
needing a separate diagenetic step afterward. Two genesis paths: sedimentary (deposited
unsettled, seated later over many cheap passes) and igneous (crystallized once, from a single
sustained pass — or, if attention is withdrawn too fast, quenched into an undifferentiated
glassy blob that *does* then need the ladder, for a different reason than the sedimentary
case).

The grain-size law transfers as a checkable claim: draft cadence should predict structural
granularity. Slow, iterated authoring (many small revision passes) should produce coarse,
well-organized records; a single fast unrevised pass should produce either fine, weakly-
differentiated fragments or an undifferentiated blob. Check it against the corpus's own git
history — commit frequency and size before a record settled, against the record's eventual
internal granularity.

**Metamorphic.** Existing rock recrystallizes under heat and pressure without melting.
Confining (lithostatic) pressure — uniform burial — gives recrystallization without preferred
orientation (marble, quartzite). Directed (differential) stress does something different:
platy minerals — mica, chlorite — grow with their weak cleavage planes perpendicular to the
compression direction, giving the rock a strong planar fabric, foliation, that intensifies
with grade (slate → phyllite → schist → gneiss). A foliated rock splits cleanly along its
foliation and resists splitting across it, because the easy-separation plane is exactly the
weak interlayer bond between strongly-bonded sheets. Graphite is the clean case: strong
covalent bonding within each carbon sheet, weak van der Waals bonding between sheets, so it
cleaves into flakes. Diamond — same element, fully covalent in three dimensions, no weak
plane — doesn't cleave that way, and is the hardest natural material instead of one of the
softest.

The corpus's burial pressure is already uniform/confining — that stays exactly as is. What's
missing is the directed case: pressure that comes disproportionately from one direction, e.g.
a record depended on almost entirely by one consumer rather than broadly. That predicts
foliation — the record's structure reorganizing so everything the dominant consumer needs
aligns along one axis, everything else perpendicular to it. The actionable claim: a foliated
record has a grain, and refactors should split along it, not across it. The proxy for
directional load is dependency in-degree skew by consumer, checkable against the corpus's own
dependency graph. Cutting across a real foliation produces fracture, not clean separation —
same should hold here.

Past some intensity, recrystallization stops being viable and the rock melts instead
(anatexis), re-entering the igneous cycle as fresh magma rather than reorganizing in place.
That gives three operations instead of one undifferentiated "change a settled thing": passive
uniform consolidation (built), directed in-place reorganization (this section), and full
melt-and-rewrite (§3's igneous path, re-entered).

Where to draw the diagenesis/metamorphism line is genuinely unsettled in real petrology —
conventionally placed around 150–200°C, but gradational rather than sharp. No reason to force
a cleaner line here than the source domain has.

---

## 4. Weathering

Rock breaks down in place by two independent mechanisms. Mechanical weathering — freeze-thaw,
thermal cycling — fragments rock without changing its chemistry: many small cycles, none
individually sufficient, accumulating to failure. Chemical weathering — hydrolysis,
oxidation, dissolution — alters composition in place without necessarily fragmenting anything.

The corpus has genesis and alteration of already-seated material, but nothing for how a
seated record ever returns to raw material, or degrades without anyone deciding to
recrystallize it — no existing note covers staleness or decommissioning. Weathering is the
site for that: mechanical weathering maps to disuse fragmentation (a deprecated interface hit
by stale clients, none individually justifying its keep, none individually breaking it,
cumulative failure — producing salvageable fragments, not alteration); chemical weathering
maps to in-place correction (content altered by exposure to new facts, without full
re-authoring).

Naming this isn't building it. If a decommissioning mechanism is wanted, that's a work item
for engineering-process-group or configuration-manager, not something to freelance from a
notes session.

---

## 5. Polymorphism and Ostwald's step rule

Polymorphs are identical in composition, different in structure — quartz, tridymite,
cristobalite, coesite, and stishovite are all SiO₂, stable in different pressure-temperature
fields. Graphite and diamond, same element, are the sharper case because they're mechanically
opposite (§3). Ostwald's step rule (1897) says a system crystallizing out of a metastable
state doesn't jump to its most stable polymorph — it passes through a sequence of
increasingly stable forms, because the least stable form usually has the lowest nucleation
barrier even though it isn't the endpoint. This is a different result from Ostwald ripening
(particle-size coarsening by dissolution and reprecipitation, formalized later by Lifshitz-
Slyozov and Wagner) — same surname, different phenomenon, worth keeping apart the way the
corpus already keeps its several same-named-but-distinct $H^1$'s apart.

The clinoptilolite → analcime → albite ladder was built as a zeolite-specific fact. Read
against the step rule, it's an instance of a general law: any system crystallizing out of a
metastable state takes the metastable-first route. That's a stronger reason for the ladder to
be true than "zeolites happen to work this way" — the ladder was correct for a bigger reason
than zeolites, and it just hadn't been named yet.

Two things follow. First: any term seated under time pressure, not just this specific
content, should pass through a metastable intermediate on the way to its best form — a record
that seats in one step is the case needing explanation, not the default. Second: the igneous
path (§3) and the sedimentary path can reach different stable structures from what reads as
identical starting content, purely because they nucleate along different sequences at
different rates — the same relation that lets identical SiO₂ end up as quartz or cristobalite
depending on formation conditions. Two records built from the same requirements but different
authoring histories landing on different final structures isn't a defect to reconcile — it's
polymorphism, and expecting convergence regardless of history is the assumption to drop.

---

## References

Ostwald, W. (1897). Studien über die Bildung und Umwandlung fester Körper. *Zeitschrift für
physikalische Chemie* 22, 289–330.

Lifshitz, I. M. & Slyozov, V. V. (1961). The kinetics of precipitation from supersaturated
solid solutions. *Journal of Physics and Chemistry of Solids* 19, 35–50.

Wagner, C. (1961). Theorie der Alterung von Niederschlägen durch Umlösen. *Zeitschrift für
Elektrochemie* 65, 581–591.

Pauling, L. (1929). The principles determining the structure of complex ionic crystals.
*Journal of the American Chemical Society* 51, 1010–1026.

Bowen, N. L. (1928). *The Evolution of the Igneous Rocks.* Princeton University Press.

Yardley, B. W. D. (1989). *An Introduction to Metamorphic Petrology.* Longman.

`ossification-as-the-state-variable.md`, `ossification-to-compactification-concept.md`,
`naming-structures-not-phenomena.md` §9, `2026-07-25-note-about-sio2-origami-market-games.md`
§8, `physarum-zeosemiocenum-monograph.md` §1.1 — corpus notes this one builds on or corrects.
