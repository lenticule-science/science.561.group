import ObsmetrologiaManual.DocSetup
import ObsmetrologiaPhysicalScience.CausalSets.Causal.Diamond
import ObsmetrologiaPhysicalScience.CausalSets.Incidence.Mobius

open Verso.Genre Manual InlineLean
open Obsmetrologia
open Obsmetrologia.CausalSets.Causal.Cone
open Obsmetrologia.CausalSets.Causal.Diamond
open Obsmetrologia.CausalSets.Causal.Interval
open Obsmetrologia.CausalSets.Dimension.OrderingFraction
open Obsmetrologia.CausalSets.Incidence.Mobius

/-!
A teaching chapter for the first geometric projections of settled causal order.
-/

#doc (Manual) "Intervals, cones, and incidence" =>

# Intervals, Cones, And Incidence

Causal order becomes geometric only after it settles.

The claim-site carried here is:

* claim-site: intervals, cones, and incidence as derived comparisons of settled order;
* phase: relational spacetime;
* generating sites: settled reachability, finite event list, order interval,
  past layer, reflexive causal order;
* Lean carriers: `Obsmetrologia.CausalSets.Causal.Interval`,
  `Obsmetrologia.CausalSets.Causal.Cone`,
  `Obsmetrologia.CausalSets.Incidence.Mobius`;
* familiar comparisons: light cones, Alexandrov intervals, incidence algebra,
  Mobius inversion, Philip Hall chain counts;
* danger: treating geometry, topology, or operator coefficients as imported
  structure rather than as order-readings.

The governing sentence is:

> Once the causal order has settled, geometry is what the order can read from
> itself.

## Order Intervals

The open interval is:

{docstring Obsmetrologia.CausalSets.Causal.Interval.between}

Its abundance is:

{docstring Obsmetrologia.CausalSets.Causal.Interval.intervalCard}

Membership is not mysterious:

{docstring Obsmetrologia.CausalSets.Causal.Interval.mem_between}

and abundance zero is the covering-link case:

{docstring Obsmetrologia.CausalSets.Causal.Interval.intervalCard_zero_iff}

This is the first geometric projection. An interval is not a subset imported from a
background manifold. It is the finite list of events that the settled order
places strictly between two events.

## Past Layers

The causal past can be graded by interval abundance:

{docstring Obsmetrologia.CausalSets.Causal.Interval.pastLayer}

and counted:

{docstring Obsmetrologia.CausalSets.Causal.Interval.layerCount}

The membership theorem says exactly what the layer means:

{docstring Obsmetrologia.CausalSets.Causal.Interval.mem_pastLayer}

The diamond's top event has a visible layer profile:

{docstring Obsmetrologia.CausalSets.Causal.Interval.diamond_layer_profile}

and the visible layers partition the causal past:

{docstring Obsmetrologia.CausalSets.Causal.Interval.diamond_layers_partition_past}

Checked:

```lean
example :
    layerCount fourEvents diamondPrec 3 0 = 2 :=
  diamond_layer_profile.1

example :
    layerCount fourEvents diamondPrec 3 2 = 1 :=
  diamond_layer_profile.2.2

example :
    layerCount fourEvents diamondPrec 3 0
      + layerCount fourEvents diamondPrec 3 1
      + layerCount fourEvents diamondPrec 3 2
    = pastCount fourEvents diamondPrec 3 :=
  diamond_layers_partition_past
```

The layer profile is already the substrate for nonlocal causal operators. The
operator does not first ask for metric distance. It asks how many events lie
between causal predecessors and the apex.

## Cone Geometry

Strict future and past are just reachability read in the two directions:

{docstring Obsmetrologia.CausalSets.Causal.Cone.Future}

{docstring Obsmetrologia.CausalSets.Causal.Cone.Past}

The reflexive causal order is:

{docstring Obsmetrologia.CausalSets.Causal.Cone.CausalLe}

Spacelike separation is incomparability:

{docstring Obsmetrologia.CausalSets.Causal.Cone.Spacelike}

The bundled law is:

{docstring Obsmetrologia.CausalSets.Causal.Cone.causal_reachability_is_cone_geometry}

Checked:

```lean
example :
    Obsmetrologia.CausalSets.Causal.Cone.Spacelike
      diamondCausalSet 2 1 :=
  spacelike_symm diamondCausalSet diamond_b_spacelike_c

example :
    CausalLe diamondCausalSet 1 1 :=
  causalLe_refl diamondCausalSet 1
```

This is why "light cone" is a legitimate word only here. A cone is a name for a
reachability predicate after the order has settled. Before settlement, there is
only a seed relation and the pressure to close it.

## Mobius Incidence

The reflexive Boolean order is:

{docstring Obsmetrologia.CausalSets.Incidence.Mobius.leqB}

The incidence-algebra Mobius function is:

{docstring Obsmetrologia.CausalSets.Incidence.Mobius.mobius}

Layer coefficients are Mobius weights summed over past layers:

{docstring Obsmetrologia.CausalSets.Incidence.Mobius.coeff}

The diamond computes the first profile:

{docstring Obsmetrologia.CausalSets.Incidence.Mobius.diamond_mobius_profile}

and the layer coefficients:

{docstring Obsmetrologia.CausalSets.Incidence.Mobius.diamond_layer_coeffs}

Checked:

```lean
example :
    mobius fourEvents diamondPrec 0 3 = 1 :=
  diamond_mobius_profile.1

example :
    mobius fourEvents diamondPrec 1 3 = -1 :=
  diamond_mobius_profile.2.1

example :
    coeff fourEvents diamondPrec 3 0 = -2 :=
  diamond_layer_coeffs.1
```

The sign is not decoration. Incidence algebra is where the layered causal past
becomes an alternating measurement. This is the first place the book can speak
honestly about d'Alembertian coefficients: they are not fitted from outside, but
read from the order's own Mobius inversion.

## Philip Hall Coefficient

Mobius incidence also has a chain-count reading:

{docstring Obsmetrologia.CausalSets.Incidence.Mobius.diamond_chainCount}

and on the diamond the Hall sum matches the Mobius value:

{docstring Obsmetrologia.CausalSets.Incidence.Mobius.diamond_philip_hall}

The general theorem is:

{docstring Obsmetrologia.CausalSets.Incidence.Mobius.mobius_eq_hallSum}

Checked:

```lean
example :
    hallSum fourEvents diamondPrec 0 3
      = mobius fourEvents diamondPrec 0 3 :=
  diamond_philip_hall
```

This is the bridge from order to topology. Philip Hall's chain count is an Euler
characteristic projection of the interval. The Mobius coefficient is therefore both
incidence algebra and the first homological reading of causal spacetime.

## Repair Path

If this page fails for a reader, use this route:

1. Return to `CausalSet.reaches`: every object here reads from settled
   reachability.
2. Read `between`, `intervalCard`, and `pastLayer` before reading any operator.
3. Read `Future`, `Past`, `CausalLe`, and `Spacelike` as predicates, not as
   manifold geometry.
4. Read `mobius` and `coeff` as incidence algebra over the settled order.
5. Only then read d'Alembertian, curvature, action, and continuum chapters.

The next chapter should turn layer coefficients into operator constructions.
