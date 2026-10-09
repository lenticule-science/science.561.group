import ObsmetrologiaManual.DocSetup
import ObsmetrologiaComputing.FormatsFour

open Verso.Genre Manual InlineLean
open Obsmetrologia

/-!
A teaching chapter for computing formats as FOUR crossed with closure regime.
-/

#doc (Manual) "Computing formats" =>

# Computing Formats

Computing enters the manual through a phase claim, not through file-format lore.
A serialization format has a content corner and a completion regime. Both are
generated objects already met in the spine.

The claim-site carried here is:

* claim-site: serialization formats as `FOUR x FOUR`;
* phase: recurring FOUR transported through closure regimes;
* generating sites: articulating corners, bilattice knowledge order, closure
  regimes, and completion cost;
* downstream uses: documentation surfaces, RMN-in-HTML diagnostics, executable
  notebooks, comparison-atlas format entries, and frontier-lab publication checks;
* Lean carrier: `Obsmetrologia.Computing.FormatsFour`;
* Blueprint/proof-tree nodes: `thm:format-carrier-eight`,
  `thm:format-corner-onto`, `thm:format-regime-onto`,
  `thm:format-cost-nonmonotone`, `thm:format-top-corner-multi-regime`,
  `thm:rmn-html-decidable`, and `thm:formats-closure-hierarchy`;
* provenance: closure-hierarchy-of-formats lab material;
* familiar comparison: bytes, plaintext, JSON, RDF, Markdown, HTML, TeX, and
  RMN-restricted HTML;
* reader closure: separate content commitment from completion regime;
* frontier status: parsers, formal language semantics, browser execution,
  TeX engines, RDF entailment completeness, and verified RMN interpreters are
  not supplied here.

The governing sentence is:

> A format is a content corner paired with a completion regime.

## The Format Carrier

The carrier is {name Obsmetrologia.Format}`Format`. It is an index whose
mathematical content is exposed by projections:

{docstring Obsmetrologia.Format.corner}

{docstring Obsmetrologia.Format.regime}

There are exactly eight analyzed formats:

{docstring Obsmetrologia.Format.card_eight}

Checked:

```lean
example :
    Format.all.length = 8 :=
  Format.card_eight
```

The list is not a universal taxonomy. It is the finite claim-site currently
settled by Lean.

## FOUR Coverage

The content projection covers the recurring FOUR:

{docstring Obsmetrologia.Format.corner_onto}

The completion-regime projection covers the four closure regimes:

{docstring Obsmetrologia.Format.regime_onto}

Checked:

```lean
example (c : Articulating.Corner) :
    exists f : Format, Format.corner f = c :=
  Format.corner_onto c

example (r : ClosureRegime) :
    exists f : Format, Format.regime f = r :=
  Format.regime_onto r
```

This is why the page belongs in Book V rather than in a subject chapter on
serialization. Computing formats are being used as a surface on which the
already-generated FOUR recurs. The new data are not bytes, JSON, or HTML as
such; the data are the two projections and their coverage laws.

## Non-Monotone Completion

The key result is that completion cost is not monotone in the knowledge order:

{docstring Obsmetrologia.Format.cost_nonmonotone_in_kle}

The two directions are separate witnesses:

{docstring Obsmetrologia.Format.cost_can_rise}

{docstring Obsmetrologia.Format.cost_can_fall}

Checked:

```lean
example :
    Reading.KLE (Format.corner Format.bytes)
        (Format.corner Format.json)
      /\ Format.cost Format.bytes <
        Format.cost Format.json :=
  Format.cost_can_rise

example :
    Reading.KLE (Format.corner Format.json)
        (Format.corner Format.rdf)
      /\ Format.cost Format.rdf <
        Format.cost Format.json :=
  Format.cost_can_fall

example :
    (exists f g,
      Reading.KLE (Format.corner f) (Format.corner g)
        /\ Format.cost f < Format.cost g)
    /\ (exists f g,
      Reading.KLE (Format.corner f) (Format.corner g)
        /\ Format.cost g < Format.cost f) :=
  Format.cost_nonmonotone_in_kle
```

This is why "more structured" is not a phase law. A stronger content corner may
raise completion cost or lower it, depending on the closure regime.

## Same Corner, Different Regime

The top content corner is multiply occupied:

{docstring Obsmetrologia.Format.top_corner_multi_regime}

The RMN-in-HTML result is:

{docstring Obsmetrologia.Format.rmn_html_is_decidable}

Checked:

```lean
example :
    Format.corner Format.rmnHtml =
        Format.corner Format.html
      /\ Format.regimeDecidable
          (Format.regime Format.rmnHtml) = true
      /\ Format.regimeDecidable
          (Format.regime Format.html) = false :=
  Format.rmn_html_is_decidable
```

The important lesson is phase separation. `html` and `rmnHtml` share content
commitment but differ in completion regime. That is a checked computing claim,
not a casual comparison of formats.

## The Bundled Claim-Site

The page's headline theorem is not any one format. It is the bundled claim that
the computing surface crosses content corner with completion regime:

{docstring Obsmetrologia.Format.FormatsClosureHierarchy}

{docstring Obsmetrologia.Format.formats_closure_hierarchy}

Checked:

```lean
example :
    Format.FormatsClosureHierarchy :=
  Format.formats_closure_hierarchy

example :
    exists f g,
      Reading.KLE (Format.corner f) (Format.corner g)
        /\ Format.cost f < Format.cost g :=
  Format.formats_closure_hierarchy.cost_rises

example (r : ClosureRegime) :
    exists f : Format, Format.regime f = r :=
  Format.formats_closure_hierarchy.regime_onto r

example :
    let H := Format.formats_closure_hierarchy
    H.rmn_recovers_decidability =
      Format.rmn_html_is_decidable :=
  rfl
```

The proof surface is small but not decorative. The carrier says that a
computing artifact can be highly articulate as content and still live in an
aperiodic completion regime, or keep the same content corner while recovering a
decidable regime by restriction.

## Frontier Status

To promote this page into verified computing infrastructure, the library would
need parsers, semantics, totality checks for RMN, and proof that the implemented
surfaces satisfy the classified regime. Today the settled theorem is the format
classification and its non-monotone regime behavior.
