import Obsmetrologia.Language.Settling
import Obsmetrologia.Closure.Regime

/-! # FormatsFour — serialization formats live in FOUR × FOUR

> **Home & verification.** This module witnesses the closure-hierarchy-of-formats
> result used by the lab notebook
> `sites/lab.emsenn.net/notebooks/30-closure-hierarchy-of-formats.py`. It belongs to
> the main `Obsmetrologia` Lake project; the lab carries its executable Python realization.

A serialization format is classified by two independent coordinates, each an
incarnation of the recurring FOUR:

* its **content corner** `⟨addressability, assertivity⟩` — the Belnap charge
  `Articulating.Corner` (`bytes = ⊥`, `json = t`, `plaintext = f`, `rdf/html/tex/markdown = ⊤`);
* its **completion regime** — the closure-orbit class `ClosureRegime`
  (`strict`/`scott`/`transfiniteBounded`/`aperiodic`), itself `≃ Articulating.Corner`.

The two projections are **independent**: the regime is *non-monotone* in the
knowledge order `≤ₖ` on corners. Ascending `⊑ₖ` (committing to more) can raise the
completion cost (`bytes ⊑ₖ json`, parsing gains non-monotone schema validation) or
lower it (`json ⊑ₖ rdf`, RDF's commitment is a monotone Scott closure). There is no
single ladder.

The same orthogonality is the **RMN-in-HTML** result: `rmnHtml` and `html` make the
same content commitment (`⊤`), but a document whose only scripts are total RMN settles
decidably (`scott`), while general HTML is Turing-undecidable (`aperiodic`).
-/

namespace Obsmetrologia

/-- The serialization formats of the closure hierarchy. Each constructor is an index;
its mathematical content is its `corner` and `regime`. `rmnHtml` is HTML whose only
scripts are total Relational Model Notation. -/
inductive Format where
  | bytes | plaintext | json | rdf | markdown | html | tex | rmnHtml
  deriving DecidableEq, Repr

namespace Format

/-- All eight analyzed formats. -/
def all : List Format := [bytes, plaintext, json, rdf, markdown, html, tex, rmnHtml]

/-- The content-commitment corner `⟨addressability, assertivity⟩ = (token, claim)`. -/
def corner : Format → Articulating.Corner
  | bytes     => Articulating.Corner.absurd
  | plaintext => Articulating.Corner.active
  | json      => Articulating.Corner.potential
  | rdf       => Articulating.Corner.stable
  | markdown  => Articulating.Corner.stable
  | html      => Articulating.Corner.stable
  | tex       => Articulating.Corner.stable
  | rmnHtml   => Articulating.Corner.stable

/-- The completion regime: the closure-orbit class of settling the surface into final
meaning. `strict` = identity/parse; `scott` = monotone entailment (κ=ω); `transfinite`
= non-monotone validation; `aperiodic` = Turing-complete completion. -/
def regime : Format → ClosureRegime
  | bytes     => ClosureRegime.strict
  | plaintext => ClosureRegime.strict
  | json      => ClosureRegime.transfiniteBounded
  | rdf       => ClosureRegime.scott
  | markdown  => ClosureRegime.strict
  | html      => ClosureRegime.aperiodic
  | tex       => ClosureRegime.aperiodic
  | rmnHtml   => ClosureRegime.scott

/-- The completion-cost height of a regime (its closure-ordinal class). -/
def regimeCost : ClosureRegime → Nat
  | ClosureRegime.strict             => 0
  | ClosureRegime.scott              => 1
  | ClosureRegime.transfiniteBounded => 2
  | ClosureRegime.aperiodic          => 3

/-- The completion cost of a format. -/
def cost (f : Format) : Nat := regimeCost (regime f)

/-- Whether a regime's completion is decidable: `strict` and `scott` settle in `κ≤ω`;
the non-Scott regimes do not. -/
def regimeDecidable : ClosureRegime → Bool
  | ClosureRegime.strict => true
  | ClosureRegime.scott  => true
  | _                    => false

/-- Exhaustive: exactly eight analyzed formats. -/
theorem card_eight : all.length = 8 := rfl

/-- The content corner is the recurring FOUR: every Belnap corner is some format's
commitment (the corner projection is onto). -/
theorem corner_onto (c : Articulating.Corner) : ∃ f : Format, corner f = c := by
  cases c <;> first
    | exact ⟨bytes, rfl⟩
    | exact ⟨json, rfl⟩
    | exact ⟨plaintext, rfl⟩
    | exact ⟨rdf, rfl⟩

/-- The completion regime projection also covers the four closure regimes. -/
theorem regime_onto (r : ClosureRegime) : ∃ f : Format, regime f = r := by
  cases r <;> first
    | exact ⟨bytes, rfl⟩
    | exact ⟨rdf, rfl⟩
    | exact ⟨json, rfl⟩
    | exact ⟨html, rfl⟩

/-- A `⊑ₖ`-increase that **raises** cost: `bytes ⊑ₖ json`, yet json costs more
(parsing gains non-monotone schema validation). -/
theorem cost_can_rise : Charge.KLE (corner bytes) (corner json) ∧ cost bytes < cost json := by
  decide

/-- A `⊑ₖ`-increase that **lowers** cost: `json ⊑ₖ rdf`, yet rdf costs less (RDF's
richer commitment is a monotone Scott closure). -/
theorem cost_can_fall : Charge.KLE (corner json) (corner rdf) ∧ cost rdf < cost json := by
  decide

/-- **Completion cost is non-monotone in the knowledge order.** There is no single
ladder: ascending `⊑ₖ` can raise or lower the completion cost. -/
theorem cost_nonmonotone_in_kle :
    (∃ f g, Charge.KLE (corner f) (corner g) ∧ cost f < cost g) ∧
      (∃ f g, Charge.KLE (corner f) (corner g) ∧ cost g < cost f) :=
  ⟨⟨bytes, json, cost_can_rise⟩, ⟨json, rdf, cost_can_fall⟩⟩

/-- The `⊤` corner is occupied at three different regimes: markdown (`strict`),
rdf (`scott`), html (`aperiodic`) all commit to `⊤` but settle at different costs. -/
theorem top_corner_multi_regime :
    corner markdown = Articulating.Corner.stable ∧ regime markdown = ClosureRegime.strict ∧
      corner rdf = Articulating.Corner.stable ∧ regime rdf = ClosureRegime.scott ∧
      corner html = Articulating.Corner.stable ∧ regime html = ClosureRegime.aperiodic := by
  decide

/-- **The RMN-in-HTML result.** `rmnHtml` and `html` make the same content commitment
(`⊤`), but an HTML document whose only scripts are total RMN settles decidably
(`scott`), while general HTML is Turing-undecidable (`aperiodic`). Restricting scripts
to RMN moves the cell from the aperiodic rung to the decidable Scott rung without
changing the corner. -/
theorem rmn_html_is_decidable :
    corner rmnHtml = corner html ∧
      regimeDecidable (regime rmnHtml) = true ∧
      regimeDecidable (regime html) = false := by
  decide

/-- The headline bundle: formats are FOUR × FOUR with the regime non-monotone in `≤ₖ`,
the `⊤` corner multiply occupied, and the RMN restriction recovering decidability. -/
structure FormatsClosureHierarchy where
  /-- The content projection covers the FOUR. -/
  corner_onto : ∀ c : Articulating.Corner, ∃ f : Format, corner f = c
  /-- The completion projection covers the four closure regimes. -/
  regime_onto : ∀ r : ClosureRegime, ∃ f : Format, regime f = r
  /-- Ascending `⊑ₖ` can raise the completion cost. -/
  cost_rises : ∃ f g, Charge.KLE (corner f) (corner g) ∧ cost f < cost g
  /-- Ascending `⊑ₖ` can lower the completion cost. -/
  cost_falls : ∃ f g, Charge.KLE (corner f) (corner g) ∧ cost g < cost f
  /-- Same `⊤` commitment, decidable under RMN, undecidable under general HTML. -/
  rmn_recovers_decidability :
    corner rmnHtml = corner html ∧
      regimeDecidable (regime rmnHtml) = true ∧ regimeDecidable (regime html) = false

/-- **THE FORMATS FACE.** Serialization formats are the recurring FOUR met twice —
content corner and completion regime — with the two projections independent: the
regime is non-monotone in the corner's knowledge order, the `⊤` corner is multiply
occupied, and restricting executable scripts to total RMN recovers decidability. -/
theorem formats_closure_hierarchy : FormatsClosureHierarchy where
  corner_onto := corner_onto
  regime_onto := regime_onto
  cost_rises := ⟨bytes, json, cost_can_rise⟩
  cost_falls := ⟨json, rdf, cost_can_fall⟩
  rmn_recovers_decidability := rmn_html_is_decidable

end Format

end Obsmetrologia
