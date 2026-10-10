"""
Canonical unary Disciplines, Regimes, and profiles.

This module collects a few named Disciplines and the finite profiles
they induce on our small carriers (BoolHA, ThreeHA), obtained from
specific λ_R inhabitants of unary arrow types (for example p ⇒ p and
⊤ ⇒ ⊤). It does not introduce new abstract "spec" notions; it simply
re-exports concrete relational forms: Disciplines, flows, and
profiles.
"""

from __future__ import annotations

from relationing.geometry import Discipline, EndomapFlow
from relationing.language import Term, Var
from relationing.profiles.geometry.profiles import FiniteProfile, finite_profile_from_discipline
from relationing.structure import (
    BoolHA,
    ThreeHA,
    bool_ha_elements,
    bool_relational_structure,
    three_ha_elements,
    three_relational_structure,
)
from relationing.structures.semantics import (
    compose_endomaps,
    interpret_closed_atom_arrow_as_discipline,
    interpret_closed_top_arrow_as_discipline,
)


# ---------------------------------------------------------------------------
# p ⇒ p identity Disciplines
# ---------------------------------------------------------------------------


def bool_p_implies_p_identity_discipline() -> Discipline[BoolHA]:
    """λx.x : p ⇒ p interpreted as a Discipline on BoolHA."""

    x = Var("x")
    lam = Term.lam(x, Term.var(x))
    struct = bool_relational_structure()
    return interpret_closed_atom_arrow_as_discipline(struct, "p", lam)


def three_p_implies_p_identity_discipline() -> Discipline[ThreeHA]:
    """λx.x : p ⇒ p interpreted as a Discipline on ThreeHA."""

    x = Var("x")
    lam = Term.lam(x, Term.var(x))
    struct = three_relational_structure()
    return interpret_closed_atom_arrow_as_discipline(struct, "p", lam)


# ---------------------------------------------------------------------------
# ⊤ ⇒ ⊤ Disciplines on ThreeHA
# ---------------------------------------------------------------------------


def three_top_identity_discipline() -> Discipline[ThreeHA]:
    """λx.x : ⊤ ⇒ ⊤ interpreted as a Discipline on ThreeHA."""

    x = Var("x")
    lam = Term.lam(x, Term.var(x))
    struct = three_relational_structure()
    return interpret_closed_top_arrow_as_discipline(struct, lam)


def three_top_reflex_discipline() -> Discipline[ThreeHA]:
    """λx.reflex(x) : ⊤ ⇒ ⊤ interpreted as a Discipline on ThreeHA."""

    x = Var("x")
    lam = Term.lam(x, Term.reflex(Term.var(x)))
    struct = three_relational_structure()
    return interpret_closed_top_arrow_as_discipline(struct, lam)


def three_top_const_top_discipline() -> Discipline[ThreeHA]:
    """λx.★ : ⊤ ⇒ ⊤ interpreted as a Discipline on ThreeHA."""

    x = Var("x")
    lam = Term.lam(x, Term.star())
    struct = three_relational_structure()
    return interpret_closed_top_arrow_as_discipline(struct, lam)


def three_top_reflex_profile() -> FiniteProfile[ThreeHA]:
    """Finite Regime/profile induced by three_top_reflex_discipline."""

    disc = three_top_reflex_discipline()
    return finite_profile_from_discipline(disc, three_ha_elements())


def three_top_const_top_profile() -> FiniteProfile[ThreeHA]:
    """Finite Regime/profile induced by three_top_const_top_discipline."""

    disc = three_top_const_top_discipline()
    return finite_profile_from_discipline(disc, three_ha_elements())


# ---------------------------------------------------------------------------
# Composite and nested profiles from ⊤ ⇒ ⊤ Disciplines
# ---------------------------------------------------------------------------


def three_top_reflex_const_top_composite_discipline() -> Discipline[ThreeHA]:
    """Composite Discipline from λx.reflex(x) and λx.★ on ThreeHA."""

    disc_reflex = three_top_reflex_discipline()
    disc_const = three_top_const_top_discipline()
    return compose_endomaps(disc_reflex, disc_const)


def three_top_reflex_const_top_composite_profile() -> FiniteProfile[ThreeHA]:
    """Composite Regime/profile: intersection of Reflex and const-⊤ Regimes."""

    composite = three_top_reflex_const_top_composite_discipline()
    return finite_profile_from_discipline(composite, three_ha_elements())


def three_top_reflex_const_top_nested_profile() -> FiniteProfile[ThreeHA]:
    """Nested profile tower: const-⊤ Discipline restricted to Reflex Regime."""

    base_profile = three_top_reflex_profile()
    nested_disc = three_top_const_top_discipline()
    carrier = list(base_profile.elements)
    return finite_profile_from_discipline(nested_disc, carrier)


# ---------------------------------------------------------------------------
# Flows derived from Disciplines
# ---------------------------------------------------------------------------


def three_top_reflex_flow() -> EndomapFlow[ThreeHA]:
    """Flow obtained from three_top_reflex_discipline."""

    return EndomapFlow(three_top_reflex_discipline())


def three_top_reflex_const_top_composite_flow() -> EndomapFlow[ThreeHA]:
    """Flow obtained from the composite Discipline three_top_reflex_const_top."""

    return EndomapFlow(three_top_reflex_const_top_composite_discipline())

