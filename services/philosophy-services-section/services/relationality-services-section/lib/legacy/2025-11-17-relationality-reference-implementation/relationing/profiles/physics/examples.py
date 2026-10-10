"""
Concrete examples for the Treatise on Relationality.

This module provides small, fully-instantiated structures, nuclei,
flows, and a toy physical system over the Boolean Heyting algebra.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Any, List, Sequence, Set, Tuple, TypeVar

from relationing.geometry import EndomapFlow, Filter, Flow, Nucleus, FixedPointRegime
from relationing.physics import Observable, ProfilePhysicalSystem, RelationalPhysicalSystem
from relationing.structure import (
    BoolHA,
    IdentityReflex,
    RelationalStructure,
    ThreeHA,
    bool_relational_structure,
    three_ha_elements,
)
from relationing.profiles.geometry.profiles import (
    FiniteProfile,
    finite_profile_from_filter,
    finite_profile_from_discipline,
    composite_profile_from_filters,
    nested_profile_from_filters,
)
from relationing.language import Term, Var
from relationing.structures.semantics import compose_endomaps, interpret_closed_top_arrow_as_discipline


State = TypeVar("State")
FlowT = TypeVar("FlowT", bound=Flow[Any])
NucleusT = TypeVar("NucleusT", bound=Nucleus[Any])
ObservableT = TypeVar("ObservableT", bound=Observable[Any])


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
        bottom, mid, top = three_ha_elements()
        if x == bottom:
            return mid
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
        bottom, mid, top = three_ha_elements()
        if x == bottom:
            return mid
        return x


def three_profile_from_filter() -> FiniteProfile[ThreeHA]:
    """FiniteProfile induced by the ThreeProfileFilter on ThreeHA."""
    filt = ThreeProfileFilter()
    return finite_profile_from_filter(filt, three_ha_elements())


class ThreeReflexFilter(Filter[ThreeHA]):
    """Filter induced directly by ThreeReflex."""

    def __call__(self, x: ThreeHA) -> ThreeHA:
        from relationing.structure import ThreeReflex

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
        bottom, mid, top = three_ha_elements()
        if x == mid:
            return top
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

    base_filter = ThreeProfileFilter()
    nested_filter = ThreeAltFilter()
    return nested_profile_from_filters(base_filter, nested_filter, three_ha_elements())


@dataclass
class ThreeValueObservable(Observable[ThreeHA]):
    """Observable returning the underlying integer value."""

    def evaluate(self, state: ThreeHA) -> int:
        return state.value


def three_profile_physical_system() -> ProfilePhysicalSystem[ThreeHA, ThreeStepFlow, ThreePrincipalClosure, ThreeValueObservable]:
    """Profile-level physical system on the {1,2} profile of ThreeHA."""

    profile = three_profile_from_filter()
    flow = ThreeStepFlow()
    _, mid, _ = three_ha_elements()
    nucleus = ThreePrincipalClosure(mid)
    observables: List[ThreeValueObservable] = [ThreeValueObservable()]
    return ProfilePhysicalSystem(
        profile=profile,
        flow=flow,
        nuclei=[nucleus],
        observables=observables,
    )


class LambdaThreeStepFlow(Flow[ThreeHA]):
    """Flow obtained from a λ_R-defined Discipline on ThreeHA."""

    def __init__(self) -> None:
        # We use λx.reflex(x) : ⊤ ⇒ ⊤ as the underlying Discipline.
        from relationing.structure import three_relational_structure

        struct = three_relational_structure()
        x = Var("x")
        lam_reflex = Term.lam(x, Term.reflex(Term.var(x)))
        self._disc = interpret_closed_top_arrow_as_discipline(struct, lam_reflex)

    def __call__(self, x: ThreeHA) -> ThreeHA:
        return self._disc(x)


def three_lambda_profile_physical_system() -> ProfilePhysicalSystem[ThreeHA, LambdaThreeStepFlow, ThreePrincipalClosure, ThreeValueObservable]:
    """Profile-level system whose flow is induced by a λ_R Discipline."""

    profile = finite_profile_from_discipline(LambdaThreeStepFlow(), three_ha_elements())
    flow = LambdaThreeStepFlow()
    # Use the middle element (value 1) as the nucleus parameter.
    _, mid, _ = three_ha_elements()
    nucleus = ThreePrincipalClosure(mid)
    observables: List[ThreeValueObservable] = [ThreeValueObservable()]
    return ProfilePhysicalSystem(
        profile=profile,
        flow=flow,
        nuclei=[nucleus],
        observables=observables,
    )


def three_composite_top_discipline_profile() -> FiniteProfile[ThreeHA]:
    """Profile induced by a composite of λ_R-defined Top ⇒ Top Disciplines.

    We combine:
    - λx.reflex(x), which acts like ThreeReflex / ThreeStepFlow; and
    - λx.★, which induces the constant-⊤ Discipline.
    Their composite Discipline has a Regime given by the intersection
    of the individual Regimes; on ThreeHA this yields the singleton
    profile {⊤}.
    """

    from relationing.structure import three_relational_structure

    struct = three_relational_structure()
    x = Var("x")
    lam_reflex = Term.lam(x, Term.reflex(Term.var(x)))
    lam_const_top = Term.lam(x, Term.star())

    disc_reflex = interpret_closed_top_arrow_as_discipline(struct, lam_reflex)
    disc_const_top = interpret_closed_top_arrow_as_discipline(struct, lam_const_top)

    composite = compose_endomaps(disc_reflex, disc_const_top)
    return finite_profile_from_discipline(composite, three_ha_elements())


def three_composite_top_discipline_physical_system() -> ProfilePhysicalSystem[ThreeHA, EndomapFlow[ThreeHA], ThreePrincipalClosure, ThreeValueObservable]:
    """Profile-level system driven by a composite λ_R Top ⇒ Top Discipline."""

    from relationing.structure import three_relational_structure

    struct = three_relational_structure()
    x = Var("x")
    lam_reflex = Term.lam(x, Term.reflex(Term.var(x)))
    lam_const_top = Term.lam(x, Term.star())

    disc_reflex = interpret_closed_top_arrow_as_discipline(struct, lam_reflex)
    disc_const_top = interpret_closed_top_arrow_as_discipline(struct, lam_const_top)
    composite = compose_endomaps(disc_reflex, disc_const_top)

    profile = finite_profile_from_discipline(composite, three_ha_elements())
    flow = EndomapFlow(composite)
    _, mid, _ = three_ha_elements()
    nucleus = ThreePrincipalClosure(mid)
    observables: List[ThreeValueObservable] = [ThreeValueObservable()]
    return ProfilePhysicalSystem(
        profile=profile,
        flow=flow,
        nuclei=[nucleus],
        observables=observables,
    )


def simulate_profile_system(
    system: ProfilePhysicalSystem[State, FlowT, NucleusT, ObservableT],
    initial: State,
    steps: int,
) -> List[Tuple[State, Sequence[Any]]]:
    """Finite simulation trace for a ProfilePhysicalSystem.

    Starting from ``initial``, iterate the system's flow up to
    ``steps`` times, returning the sequence of states paired with the
    values of all observables at each step. This is a simple helper
    for examples and does not introduce new physical structure beyond
    the existing flow/observable data.
    """

    trace: List[Tuple[State, Sequence[Any]]] = []
    state = initial
    for _ in range(steps + 1):
        values = [obs.evaluate(state) for obs in system.observables]
        trace.append((state, values))
        state = system.flow(state)
    return trace
