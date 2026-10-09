---
aliases:
  - lipid oxidation
  - free radical-mediated lipid damage
  - PUFA peroxidation
description: The radical-catalyzed oxidative damage of polyunsaturated fatty acids through free radical chain reactions, producing lipid peroxide intermediates and downstream aldehydes (malondialdehyde, 4-hydroxynonenal) and isoprostanes, measurable as indices of in vivo oxidative stress, with F2-isoprostanes being more specific than TBARS assays.
identity: lipid-peroxidation
name: Lipid Peroxidation
date-created: 2026-09-01
references:
  halliwell1999:
    authors:
      - Barry Halliwell
      - John M. Gutteridge
    title: Free Radicals in Biology and Medicine
    year: 1999
    publication: Oxford University Press
    note: Definitive reference on oxidative damage and lipid peroxidation mechanisms
  morrow2015:
    authors:
      - Jason D. Morrow
      - Lisa J. Roberts
    title: The isoprostanes - unique products of arachidonic acid oxidation
    year: 2015
    publication: Current Medicinal Chemistry
relations:
  produced-by: free-radical
  acts-on: polyunsaturated-fatty-acid
  delivers:
    - malondialdehyde
    - 4-hydroxynonenal
    - f2-isoprostane
  controlled-by:
    - vitamin-e
    - glutathione-peroxidase-4
  distinguished-from: enzymatic-eicosanoid-production
---

Lipid peroxidation is the oxidative damage of polyunsaturated fatty acids
(PUFAs) by free radicals, producing a chain reaction of radical propagation and
generating lipid peroxide intermediates and cytotoxic product molecules. This is
distinct from the enzymatic oxidation of fatty acids to produce signaling
eicosanoids — both processes attack the same PUFA substrates, but by different
mechanisms, and with opposite physiological meanings.

## The radical chain reaction mechanism

Free radicals are molecules with unpaired electrons; they are highly reactive and
will attack almost any nearby molecule. When a free radical encounters a PUFA
(such as arachidonic acid, linoleic acid, or any other polyunsaturated fatty
acid), it abstracts a hydrogen atom from one of the carbon-carbon double bonds.
This creates a carbon-centered radical on the PUFA. This radical is unstable and
immediately reacts with molecular oxygen, forming a lipid peroxyl radical (LOO•).
The peroxyl radical then abstracts a hydrogen from a neighboring PUFA molecule,
creating a new carbon-centered radical and producing a lipid hydroperoxide
(LOOH). The new carbon radical reacts with oxygen, and the cycle propagates.

The result is a chain reaction: one radical event triggers a cascade of
reactions, each attacking a new PUFA and creating new radicals. This chain
reaction can propagate through thousands of lipid molecules, producing extensive
damage, until it is terminated by an antioxidant (a molecule that can accept the
radical without producing a new reactive species).

## Products of lipid peroxidation

The lipid hydroperoxides (LOOH) produced in the chain reaction are themselves
unstable. They decompose into smaller molecules:

1. **Malondialdehyde (MDA)** — a three-carbon aldehyde produced from the
   decomposition of linoleic acid and arachidonic acid peroxides. MDA is one of
   the most commonly measured markers of lipid peroxidation, but its measurement
   is fraught with technical problems (see below).
2. **4-Hydroxynonenal (4-HNE)** — a nine-carbon unsaturated aldehyde produced
   primarily from linoleic acid peroxidation. 4-HNE is a potent electrophile and
   readily forms covalent adducts with proteins (Schiff base adducts), marking
   proteins as damaged and triggering proteolytic removal.
3. **F2-isoprostanes** — non-enzymatic oxidation products of arachidonic acid,
   produced in vivo as the result of free radical attack. F2-isoprostanes are
   structurally similar to prostaglandins but are formed by a radical mechanism
   rather than by enzymatic catalysis. Importantly, F2-isoprostanes are produced
   in vivo in the intact cell and enter circulation; they are therefore more
   reliable in vivo indices of lipid peroxidation than assays requiring sample
   preparation (such as TBARS assays).
4. **Lipid peroxides (LOOH) themselves** — can be measured directly, but they
   are unstable and rapidly converted to downstream products.

These products can exert direct toxic effects: MDA and 4-HNE form protein
adducts that may impair protein function, trigger inflammatory responses, or
mark proteins for removal. Protein damage accumulation is implicated in
neurodegeneration and in aging.

## Defenses against lipid peroxidation

Cells have enzymatic and non-enzymatic defenses against lipid peroxidation:

1. **Vitamin E (alpha-tocopherol)** — a lipid-soluble radical scavenger that
   donates an electron to lipid peroxyl radicals, terminating the chain reaction.
   Vitamin E is incorporated into membranes and is the primary non-enzymatic
   antioxidant protecting PUFAs from radical attack.
2. **Glutathione peroxidase 4 (GPX4)** — a selenium-containing enzyme that
   directly reduces lipid hydroperoxides (LOOH) to lipid alcohols, before they
   decompose into MDA and 4-HNE. GPX4 is the only known enzyme that can reduce
   lipid hydroperoxides in vivo; other glutathione peroxidases (GPX1, GPX3) reduce
   hydrogen peroxide and organic hydroperoxides but not lipid peroxides.
3. **Catalase and superoxide dismutase (SOD)** — remove the upstream free
   radicals (superoxide, hydrogen peroxide) that would otherwise attack PUFAs,
   though they are not direct antioxidants of lipid peroxides themselves.

Vitamin E and GPX4 are therefore the critical defenses; deficiency in either
allows lipid peroxidation to proceed.

## Distinction: lipid peroxidation vs. enzymatic eicosanoid production

Lipid peroxidation and eicosanoid synthesis both attack polyunsaturated fatty
acids, but they are mechanistically and physiologically opposite:

- **Lipid peroxidation** is free radical-mediated, uncontrolled, and damaging.
  It produces MDA, 4-HNE, isoprostanes, and protein damage. It is a sign of
  oxidative stress and is generally pathologic.
- **Eicosanoid synthesis** is enzymatic (catalyzed by cyclooxygenase or
  lipoxygenase), controlled, and productive. It produces prostaglandins,
  leukotrienes, thromboxanes, and resolvins. These are signaling molecules with
  defined roles in inflammation resolution, hemostasis, and homeostasis. They
  are regulated by hormones and cell signals.

The substrates are the same (arachidonic acid and other PUFAs), but the outcome
is entirely different. A high rate of arachidonic acid oxidation can be either
(1) elevated eicosanoid production in response to a legitimate inflammatory or
hemostatic demand, which is appropriate, or (2) uncontrolled lipid peroxidation
from excessive free radicals, which is pathologic. The assay used determines what
conclusion is drawn.

## Measurement and the TBARS problem

The most common assay for lipid peroxidation is the TBARS (thiobarbituric acid
reactive substances) assay, which measures malondialdehyde by its reaction with
thiobarbituric acid, producing a colored product measurable by absorption or
fluorescence. The TBARS assay is simple and inexpensive, but it has a critical
weakness: thiobarbituric acid reacts with many aldehydes and nucleic acid
breakdown products, not only MDA produced from lipid peroxidation. The assay is
therefore not specific to lipid peroxidation, and TBARS values can be elevated
in samples with elevated nucleic acid breakdown, oxidative damage to proteins,
or other sources of aldehydes, regardless of whether lipid peroxidation was
actually elevated.

**The consequence:** A TBARS value reported as elevated without supporting
evidence from more specific assays (such as F2-isoprostane measurement, direct
lipid hydroperoxide measurement, or 4-HNE protein adduct measurement) should be
interpreted cautiously. TBARS is sensitive but not specific; a positive TBARS
result is worth investigating further, but is not sufficient by itself to
establish lipid peroxidation.

In contrast, **F2-isoprostanes** are produced only by free radical oxidation of
arachidonic acid. They are structurally distinct from enzymatically produced
prostaglandins (they are the non-enzymatic isomers). F2-isoprostanes are
produced in vivo and enter circulation; measurement of plasma or urine F2-
isoprostanes is therefore a more specific in vivo index of lipid peroxidation
burden.

## Related terms

- Free radical — the oxidizing species that initiates peroxidation
- Polyunsaturated fatty acid — the substrate attacked in peroxidation
- Malondialdehyde — a marker of peroxidation, measured by TBARS assay
- 4-Hydroxynonenal — a cytotoxic peroxidation product
- F2-isoprostane — a non-enzymatic isoprostane, specific for lipid peroxidation
- Vitamin E — lipid-soluble radical scavenger
- Glutathione peroxidase 4 — enzyme reducing lipid peroxides
- Eicosanoid — enzymatic products of arachidonic acid, not peroxidation
