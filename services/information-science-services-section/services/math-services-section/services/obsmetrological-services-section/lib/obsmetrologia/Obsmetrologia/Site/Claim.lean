import Obsmetrologia.Language.Predicating.Claim
import Obsmetrologia.Site.Basic

/-!
# Claim site points

Once the settling site exists, a claim point can be placed in a site object by
adding a settling stratum and a clopen support. This is the site-level point over
a claim; covers and descent remain the structure of `Site`, not extra data on the
claim itself.

## Main definitions

* `Claim.SitePoint`
* `Claim.sitePoint`

## Main results

* `Claim.sitePoint_claim`
* `Claim.sitePoint_support`
* `Claim.fiberHom_support`
-/

namespace Obsmetrologia
namespace Claim

/-- A site point over a claim point: `(claim, settling stratum, clopen support)`. -/
abbrev SitePoint : Type :=
  Site.SiteObj Claim

/-- Place a claim point in the settling site. -/
def sitePoint (q : Claim) (tau : Nat) (support : Site.Clopen) : SitePoint where
  q := q
  tau := tau
  U := support

@[simp] theorem sitePoint_claim (q : Claim) (tau : Nat) (support : Site.Clopen) :
    (sitePoint q tau support).q = q := rfl

@[simp] theorem sitePoint_stratum (q : Claim) (tau : Nat) (support : Site.Clopen) :
    (sitePoint q tau support).tau = tau := rfl

@[simp] theorem sitePoint_support (q : Claim) (tau : Nat) (support : Site.Clopen) :
    (sitePoint q tau support).U = support := rfl

/-- Fiber morphisms between claim site points are fixed-claim, fixed-stratum clopen inclusions. -/
abbrev FiberHom (src dst : SitePoint) : Type :=
  Site.FiberHom Claim src dst

@[simp] theorem fiberHom_support {src dst : SitePoint} (f : FiberHom src dst) :
    f.support = src.U :=
  f.support_eq_src

end Claim
end Obsmetrologia
