"""
Concrete examples for the Treatise on Relationality.

This module provides small, fully-instantiated structures, nuclei,
flows, and a toy physical system over the Boolean Heyting algebra.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import List, Set

from .geometry import Filter, Flow, Nucleus, FixedPointRegime
from .profiles import FiniteProfile, finite_profile_from_filter
from .physics import Observable, ProfilePhysicalSystem, RelationalPhysicalSystem
from .structure import (
    BoolHA,
    IdentityReflex,
    RelationalStructure,
    ThreeHA,
    bool_relational_structure,
    three_ha_elements,
)


class BoolPrincipalClosure(Nucleus[BoolHA]):
    """Principal closure nucleus ν_k(x) = x ∨ k on BoolHA."""

    def __init__(self, k: BoolHA) -> None:
        self.k = k

    def __call__(self, x: BoolHA) -> BoolHA:
        return x.join(self.k)


class BoolIdentityFlow(Flow[BoolHA]):
    """Identity flow F(x) = x on BoolHA."""

    def __call__(self, x: BoolHA) -> BoolHA:
        return x


def bool_fixed_points_of_nucleus(nu: Nucleus[BoolHA]) -> Set[BoolHA]:
    """Enumerate ν-fixed recognitions for BoolHA."""
    all_states = {BoolHA.bottom(), BoolHA.top()}
    return {x for x in all_states if nu(x) == x}


def bool_fixed_points_of_flow(flow: Flow[BoolHA]) -> Set[BoolHA]:
    """Enumerate F-fixed recognitions for BoolHA."""
    all_states = {BoolHA.bottom(), BoolHA.top()}
    return {x for x in all_states if flow(x) == x}


@dataclass
class TruthObservable(Observable[BoolHA]):
    """Observable that reads out the underlying Boolean value."""

    def evaluate(self, state: BoolHA) -> bool:
        return state.value


def boolean_physical_system(
    k: BoolHA | None = None,
) -> RelationalPhysicalSystem[BoolHA, IdentityReflex, BoolIdentityFlow, BoolPrincipalClosure, TruthObservable]:
    """Construct a toy RelationalPhysicalSystem over BoolHA.

    - geometry: BoolHA with identity Reflex;
    - flow: identity flow (no evolution);
    - nucleus: principal closure at k (default ⊤);
    - observable: truth-value observable.
    """

    structure: RelationalStructure[BoolHA, IdentityReflex] = bool_relational_structure()
    flow = BoolIdentityFlow()
    nucleus = BoolPrincipalClosure(k or BoolHA.top())
    observables: List[TruthObservable] = [TruthObservable()]
    return RelationalPhysicalSystem(
        structure=structure,
        flow=flow,
        nuclei=[nucleus],
        observables=observables,
    )


class ThreePrincipalClosure(Nucleus[ThreeHA]):
    """Principal closure nucleus ν_k(x) = x ∨ k on ThreeHA."""

    def __init__(self, k: ThreeHA) -> None:
        self.k = k

    def __call__(self, x: ThreeHA) -> ThreeHA:
        return x.join(self.k)


class ThreeStepFlow(Flow[ThreeHA]):
    """Inflationary, idempotent flow on ThreeHA: 0 ↦ 1, 1 ↦ 1, 2 ↦ 2."""

    def __call__(self, x: ThreeHA) -> ThreeHA:
        if x.value == 0:
            return ThreeHA(1)
        return x


def three_flow_implication(flow: Flow[ThreeHA], a: ThreeHA, b: ThreeHA) -> ThreeHA:
    """Dynamic implication a ⇒_F b along a flow on ThreeHA.

    Defined as the greatest z such that F(z ∧ a) ≤ b, computed by
    scanning the finite carrier and taking the join of all candidates.
    """
    candidates: list[ThreeHA] = []
    for z in three_ha_elements():
        if flow(z.meet(a)).leq(b):
            candidates.append(z)
    if not candidates:
        # No candidate: return bottom.
        return ThreeHA.bottom()
    acc = candidates[0]
    for z in candidates[1:]:
        acc = acc.join(z)
    return acc


def three_fixed_points_of_nucleus(nu: Nucleus[ThreeHA]) -> Set[ThreeHA]:
    """Enumerate ν-fixed recognitions for ThreeHA."""
    all_states = set(three_ha_elements())
    return {x for x in all_states if nu(x) == x}


def three_fixed_points_of_flow(flow: Flow[ThreeHA]) -> Set[ThreeHA]:
    """Enumerate F-fixed recognitions for ThreeHA."""
    all_states = set(three_ha_elements())
    return {x for x in all_states if flow(x) == x}


def three_fixed_point_regime_for_nucleus(nu: Nucleus[ThreeHA]) -> FixedPointRegime[ThreeHA]:
    """Regime of ν-fixed points on ThreeHA."""
    return FixedPointRegime(endomap=nu)  # type: ignore[arg-type]


class ThreeProfileFilter(Filter[ThreeHA]):
    """Filter projecting onto the {1,2} profile on ThreeHA.

    Concretely, it acts like the ThreeStepFlow: 0 ↦ 1, 1 ↦ 1, 2 ↦ 2.
    """

    def __call__(self, x: ThreeHA) -> ThreeHA:
        if x.value == 0:
            return ThreeHA(1)
        return x


def three_profile_from_filter() -> FiniteProfile[ThreeHA]:
    """FiniteProfile induced by the ThreeProfileFilter on ThreeHA."""
    filt = ThreeProfileFilter()
    return finite_profile_from_filter(filt, three_ha_elements())


class ThreeReflexFilter(Filter[ThreeHA]):
    """Filter induced directly by ThreeReflex."""

    def __call__(self, x: ThreeHA) -> ThreeHA:
        from .structure import ThreeReflex

        return ThreeReflex()(x)


def three_reflex_profile() -> FiniteProfile[ThreeHA]:
    """Profile induced by the ThreeReflexFilter on ThreeHA."""
    filt = ThreeReflexFilter()
    return finite_profile_from_filter(filt, three_ha_elements())


class ThreeAltFilter(Filter[ThreeHA]):
    """Alternate filter projecting onto the {0,2} profile on ThreeHA.

    Concretely: 0 ↦ 0, 1 ↦ 2, 2 ↦ 2.
    """

    def __call__(self, x: ThreeHA) -> ThreeHA:
        if x.value == 1:
            return ThreeHA(2)
        return x


def three_composite_profile_from_filters() -> FiniteProfile[ThreeHA]:
    """Composite profile induced by ThreeProfileFilter and ThreeAltFilter.

    The composite filter is their pointwise composition; its fixed
    points form the intersection profile.
    """

    f1 = ThreeProfileFilter()
    f2 = ThreeAltFilter()

    class CompositeFilter(Filter[ThreeHA]):  # type: ignore[misc]
        def __call__(self, x: ThreeHA) -> ThreeHA:
            return f2(f1(x))

    composite = CompositeFilter()
    return finite_profile_from_filter(composite, three_ha_elements())


def three_nested_profile_from_filters() -> FiniteProfile[ThreeHA]:
    """Nested profile: apply ThreeAltFilter on the ThreeProfileFilter profile.

    This witnesses a simple Profile tower: start from the {1,2}
    profile induced by ThreeProfileFilter, then restrict ThreeAltFilter
    to that profile to obtain a nested profile.
    """

    base_profile = three_profile_from_filter()
    alt = ThreeAltFilter()
    carrier = list(base_profile.elements)
    return finite_profile_from_filter(alt, carrier)


@dataclass
class ThreeValueObservable(Observable[ThreeHA]):
    """Observable returning the underlying integer value."""

    def evaluate(self, state: ThreeHA) -> int:
        return state.value


def three_profile_physical_system() -> ProfilePhysicalSystem[ThreeHA, ThreeStepFlow, ThreePrincipalClosure, ThreeValueObservable]:
    """Profile-level physical system on the {1,2} profile of ThreeHA."""

    profile = three_profile_from_filter()
    flow = ThreeStepFlow()
    nucleus = ThreePrincipalClosure(ThreeHA(1))
    observables: List[ThreeValueObservable] = [ThreeValueObservable()]
    return ProfilePhysicalSystem(
        profile=profile,
        flow=flow,
        nuclei=[nucleus],
        observables=observables,
    )
