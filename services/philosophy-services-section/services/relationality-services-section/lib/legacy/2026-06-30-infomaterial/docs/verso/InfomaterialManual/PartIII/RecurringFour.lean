import InfomaterialManual.DocSetup
import InfomaterialManual.PartIII.QuartetRecurrence

open Verso.Genre Manual InlineLean

#doc (Manual) "The recurring four" =>

# Part III: The Recurring Four

The same four-corner coherence cell recurs across the program. At articulation it
appears as potential, active, stable, absurd. At value it appears as no information,
truth, falsity, and overdetermination. At later stages it appears as Klein-four
symmetry, nuclear quartet, modal shape, and closure-regime signature.

The recurrence is not a visual motif. It is one of the central mathematical claims
of Infomaterial: the four is generated at the first two-sided articulation and then met
again at successive depths.

## Why this needs its own part

Without a dedicated account, readers will either miss the recurrence or over-read
it as a slogan. The manual needs a place where each occurrence is compared with
the others:

* articulation phase;
* bilattice charge;
* truth and knowledge orders;
* negation and conflation;
* Klein-four action;
* nuclear quartet;
* modal pair;
* closure regime.

Each comparison should eventually point to the Lean theorem that makes the
conflation precise. The prose should be generous, but it should not replace proof
with resemblance.

The next section does exactly that: it states the conflation as the theorem
`quartet_recurrence`, isolates the recurring coherence square as
`twistoring_eq_commutating`, and links every step to the declaration that proves
it.

{include 1 InfomaterialManual.PartIII.QuartetRecurrence}
