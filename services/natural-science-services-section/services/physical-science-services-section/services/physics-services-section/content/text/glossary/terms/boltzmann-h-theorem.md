---
name: Boltzmann H-Theorem
date-created: 2026-09-03
references:
  boltzmann1872:
    authors: ["Ludwig Boltzmann"]
    title: "Weitere Studien über das Wärmegleichgewicht unter Gasmolekülen"
    publication: "Sitzungsberichte der Kaiserlichen Akademie der Wissenschaften Wien"
    year: 1872
  boltzmann1877:
    authors: ["Ludwig Boltzmann"]
    title: "Über die Beziehung zwischen dem zweiten Hauptsatze der mechanischen Wärmetheorie und der Wahrscheinlichkeitsrechnung respektive den Sätzen über das Wärmegleichgewicht"
    publication: "Sitzungsberichte der Kaiserlichen Akademie der Wissenschaften Wien"
    year: 1877
  landauer1961:
    authors: ["Rolf Landauer"]
    title: "Irreversibility and Heat Generation in the Computing Process"
    publication: "IBM Journal of Research and Development"
    year: 1961
---

Boltzmann's **H-theorem** (Boltzmann 1872) defines the functional $H = \int f \log f\,
dv$ over a gas's one-particle velocity distribution $f$, and proves that under the
[Boltzmann equation](./boltzmann-equation.md)'s collision dynamics, $H$ is
monotonically non-increasing in time, with equality only at the Maxwell–Boltzmann
equilibrium distribution. Since entropy is (up to sign and constants) $S = -kH$, this is
a microscopic derivation of the second law of thermodynamics — entropy never decreases —
for a dilute gas. **Loschmidt's objection**, raised immediately, is that this cannot be
a theorem of mechanics alone: the microscopic collision dynamics is time-reversible, so
for every entropy-increasing trajectory there is a time-reversed, equally valid
trajectory along which entropy decreases. The theorem's resolution — that $H$'s decrease
is a statement about overwhelmingly probable behavior among all microstates consistent
with a macrostate, not about every individual trajectory — is Boltzmann's own later
statistical reinterpretation of entropy (Boltzmann 1877).

## In Obsmetrologia

`Obsmetrologia.Thermodynamics.BoltzmannEntropy` proves the **real-valued** H-theorem
directly, without deferring to measure theory: a coarse configuration's number of
microstates $W$ gives entropy $S = k \log W$ (Boltzmann 1877), computed via a
Bishop-real logarithm. The module isolates Boltzmann's H-functional as $H = \sum \log
n_m!$ over occupation numbers $n_m$ (so $S = \log N! - H$, and maximizing entropy is
minimizing $H$) and proves `htheorem`: an equilibrating exchange — moving one particle
from a fuller velocity cell to an emptier one — never increases $H$, hence never
decreases entropy; `htheorem_evolution` extends this along a whole relaxation sequence.
Both theorems carry the measured axiom profile `propext, Quot.sound` — the
[closure-ordinal](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/closure-ordinal.md)
audit's own note is direct about what this spends: `Quot.sound` is *stipulated*
identification, "the erasure the corpus prices as a Landauer bit" — this pair of
theorems is one of only two places in the audited ledger where that erasure axiom is
spent, and the module's own header calls the finite-regime `H¹`/entropy accounting here
"exact... consonant with Landauer's principle" (Landauer 1961) that erasing information
in a finite system has an exact, accountable thermodynamic cost. This is the
deterministic monotone skeleton of the H-theorem — the smoothing direction, not a
probabilistic argument over an ensemble — proved as the entropic companion to the
conservation proofs of [molecular chaos](./molecular-chaos.md)'s collision module; the
stochastic-rate continuum Boltzmann $H = \int f \log f$ still needs measure theory and is
not what is proved here.

## See also

- [Boltzmann equation](./boltzmann-equation.md) — the dynamics this theorem's monotonicity is proved under
- [Landauer's principle](../../../../../../../../../information-science-services-section/services/semiotics-science-services-section/services/biomimetic-semiotics-science-services-section/content/text/glossary/terms/landauers-principle.md) — the erasure-cost principle this module's exact accounting is consonant with
- [Closure ordinal](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/closure-ordinal.md) — thermodynamic existence sits in the strict regime, $\kappa < \omega$
