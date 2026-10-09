import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Site.Basic

/-!
# Predication cell site points

Once the settling site exists, a predication cell can be placed in a site object by
adding a settling stratum and a clopen support. This is the site-level point over
a predication cell; covers and descent remain the structure of `Site`, not extra
data on the cell itself.

## Main definitions

* `PredicationCell.SitePoint`
* `PredicationCell.sitePoint`

## Main results

* `PredicationCell.sitePoint_claim`
* `PredicationCell.sitePoint_support`
* `PredicationCell.fiberHom_support`
-/

namespace Obsmetrologia
namespace PredicationCell

/-- A site point over a predication cell: `(cell, settling stratum, clopen support)`. -/
abbrev SitePoint : Type :=
  Site.SiteObj PredicationCell

/-- Place a predication cell in the settling site. -/
def sitePoint (q : PredicationCell) (tau : Nat) (support : Site.Clopen) : SitePoint where
  q := q
  tau := tau
  U := support

@[simp] theorem sitePoint_claim (q : PredicationCell) (tau : Nat) (support : Site.Clopen) :
    (sitePoint q tau support).q = q := rfl

@[simp] theorem sitePoint_stratum (q : PredicationCell) (tau : Nat) (support : Site.Clopen) :
    (sitePoint q tau support).tau = tau := rfl

@[simp] theorem sitePoint_support (q : PredicationCell) (tau : Nat) (support : Site.Clopen) :
    (sitePoint q tau support).U = support := rfl

/-- Fiber morphisms between predication-cell site points are fixed-cell, fixed-stratum clopen inclusions. -/
abbrev FiberHom (src dst : SitePoint) : Type :=
  Site.FiberHom PredicationCell src dst

@[simp] theorem fiberHom_support {src dst : SitePoint} (f : FiberHom src dst) :
    f.support = src.U :=
  f.support_eq_src

end PredicationCell
end Obsmetrologia
