---
aliases:
  - lipid profiling
  - lipid mass spectrometry
description: The systematic measurement of hundreds to thousands of individual lipid species using mass spectrometry platforms (shotgun or chromatography-coupled approaches), distinguishing it from clinical lipid panels that measure aggregate quantities, with major challenges being species identification and isomer differentiation, extraction and normalization standardization, and reproducibility across laboratories.
identity: lipidomics
name: Lipidomics
provenance:
  date-created: 2026-09-01
references:
  fahy2009:
    authors:
      - Eoin Fahy
      - Suresh Subramanian
      - Alex C. Brown
    title: Comprehensive analysis of the lipidome using high-performance liquid chromatography-tandem mass spectrometry
    year: 2009
    publication: Journal of Lipid Research
    note: Methods paper establishing lipidomics standards
  wang2020:
    authors:
      - Xiulan Wang
      - Xia Zhou
    title: "Lipidomics: Profiling lipid metabolism"
    year: 2020
    publication: Current Opinion in Endocrine and Metabolic Research
relations:
  measures: lipid-species
  delivers: molecular-profile
  contrasts-with: clinical-lipid-panel
  requires: mass-spectrometry
---

Lipidomics is the systematic, unbiased measurement of hundreds to thousands of
individual lipid molecular species in a biological sample using mass spectrometry
(MS) platforms. It goes far beyond the clinical lipid panel, which typically
measures five to ten aggregate quantities (total cholesterol, LDL cholesterol,
HDL cholesterol, triglycerides, and a few others). Lipidomics identifies and
quantifies individual lipid species — defined by their headgroup, fatty acid
chain lengths, saturation, and substituents — producing a comprehensive molecular
profile of the lipidome.

## The principle: mass spectrometry-based identification

Lipids are ionized (usually by electrospray ionization) and sent through a mass
spectrometer, where they are separated by their mass-to-charge (m/z) ratio. The
m/z value is determined by the molecular weight of the intact lipid ion. By
measuring the intact mass, a lipidomics platform can identify lipid species:
phosphatidylcholine 36:2 (a phospholipid with a 36-carbon chain carrying 2
double bonds total across its two fatty acids) has a specific m/z; a different
PC species with different fatty acid composition has a different m/z. By
collecting and analyzing thousands of m/z values from a sample, a lipidomics
platform builds a comprehensive inventory.

## Two major platform types

### Shotgun lipidomics

Shotgun lipidomics introduces the lipid extract directly into the mass
spectrometer without prior chromatographic separation. The sample is ionized,
and the resulting m/z spectrum is recorded. A single infusion can identify
hundreds of lipid species. Shotgun approaches are rapid and can handle large
numbers of samples, but they lack separation in time or space, so lipids with
very similar m/z values can overlap and be misidentified.

### Liquid chromatography-coupled lipidomics

Liquid chromatography (LC) coupled to MS (LC-MS) separates lipids by their
chromatographic properties (typically based on hydrophobicity and polar
interactions with a column) before they enter the mass spectrometer. This
separation can resolve lipid species that would overlap in shotgun MS. LC-MS is
more time-consuming per sample (requiring 30–60 minute chromatographic runs) but
offers better specificity and the ability to detect lipids that might be hidden
by more abundant species in shotgun MS.

## Major challenges in lipidomics

### 1. Identification of lipid species and isomers

A measured m/z ratio corresponds to a molecular weight, but molecular weight
alone is ambiguous. Multiple lipid species can have the same mass. Additionally,
lipid isomers — molecules with the same atoms in different arrangements —
cannot be distinguished by mass alone. For example:

- **Fatty acid isomers:** A phospholipid with a 36:2 chain composition could be
  18:1/18:1 (one 18-carbon monounsaturated fatty acid on each side) or 20:2/16:0
  (a 20-carbon diunsaturated and a 16-carbon saturated). Both have the same
  molecular weight, but the biological properties differ.
- **Double-bond position isomers:** An 18:1 fatty acid could have the double bond
  in different positions along the chain (oleic acid, 18:1n-9, has the double
  bond at the 9th carbon from the carboxyl end, while vaccenic acid, 18:1n-11,
  has it at the 11th carbon). These have the same mass but different biological
  properties.

Standard MS cannot distinguish these isomers. Distinguishing them requires either
derivatization (chemical modification before measurement), tandem MS with
fragmentation analysis, or orthogonal techniques (nuclear magnetic resonance,
chromatographic retention time comparison). These are time-consuming and add
expense.

The consequence: reported lipidomics data often cannot specify the exact isomer
identity of every lipid species, leaving ambiguity in biological interpretation.

### 2. Extraction and normalization

Lipids are extracted from samples using organic solvents (chloroform, methanol,
or other mixtures). Different extraction protocols recover different yields of
different lipid classes — a solvent mixture optimized for phospholipids may not
recover sterols as efficiently. Additionally, lipid species have different
ionization efficiencies in the mass spectrometer — some ionize readily and
produce strong signals, while others ionize poorly and produce weak signals.
This means that the measured signal intensity does not directly reflect the
actual quantity of lipid in the sample.

Lipidomics studies address this with internal standards (isotope-labeled lipids
of known quantity added to each sample) and with normalization procedures (using
total lipid quantity or protein quantity to scale values across samples). However,
standards do not exist for all lipid species, and normalization procedures vary
across studies. This leads to non-standardized quantification across different
labs.

### 3. Inconsistency across studies and platforms

Different lipidomics platforms (shotgun vs. LC-MS), different commercial
instruments, different extraction protocols, and different normalization
procedures produce different results when analyzing the same biological samples.
A lipid species reported as elevated in one study may not be confirmed in another
study, not because the biology differs, but because the methodology differs.

## Clinical lipid panel vs. lipidomics

A clinical lipid panel measures:

- Total cholesterol
- LDL cholesterol
- HDL cholesterol
- Triglycerides
- Sometimes apoB or apoA-I

These are aggregate quantities, each representing the sum of dozens to hundreds
of individual lipid species. They are useful for cardiovascular risk assessment
but give no information about the composition of lipid species.

Lipidomics measures individual species, revealing which lipid species are
elevated or reduced. This can provide mechanistic insight: if a lipidomics study
reports that "phospholipid species X and Y are decreased," that is information
about membrane composition that a clinical panel would not reveal (which would
only show "normal or slightly elevated total phospholipid").

However, the reverse is also true: a single lipidomics paper reporting altered
levels of a few lipid species in a cohort is weak evidence for a mechanism
without large-scale replication. Lipidomics studies in ME/CFS and long COVID
have reported inconsistent changes across species, which may reflect true
biological differences between cohorts, or may reflect methodological
differences, or may reflect small sample sizes and publication bias (studies with
"interesting" lipid findings are more likely to be published than studies
showing no differences).

## Consequence: claims about lipids require specification

A statement like "lipids are abnormal in Disease X" is empty without
specification: which lipids? Which lipidomics study? With what methodology and
replication? A single lipidomics paper is a hypothesis-generating study, not a
hypothesis-testing study. Large-scale replication with standardized methodology
is required to establish whether a lipidomic signature is real and reproducible.

## Related terms

- Lipid — the molecules being measured
- Lipidomic signature — the specific pattern of lipid species in a sample or
  individual
- Mass spectrometry — the measurement technique
- Phospholipid — a major class measured in lipidomics
- Clinical lipid panel — the simpler aggregate measurement of lipid quantities
- Metabolomics — the broader field of measuring all small molecules, of which
  lipidomics is a specialization
