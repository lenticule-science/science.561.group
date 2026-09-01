"""
Semantics for λ_R into RelationalStructures.

This module tightens the link between Relational Structure and
Relational Language by interpreting λ_R types as recognitions in a
Heyting algebra, interpreting a fragment of λ_R terms (with Reflex)
into those recognitions, and checking sequent validity over finite
RelationalStructures and their carriers.
"""

from __future__ import annotations

from itertools import product
from typing import Dict, Iterable, Mapping, Sequence, TypeVar

from .language import Context, Type, TypeKind, Term, Var, normalize, type_of
from .structure import HeytingAlgebra, MonotoneEndomap, RelationalStructure


A = TypeVar("A", bound=HeytingAlgebra)
Env = Mapping[str, A]


def interpret_type(
    ty: Type,
    atoms: Mapping[str, A],
    carrier: Sequence[A] | None = None,
) -> A:
    """Interpret a λ_R Type as an element of a Heyting algebra.

    - ATOM types are looked up in `atoms` by name.
    - BOTTOM/TOP map to ⊥/⊤.
    - AND/OR/IMP are interpreted via meet/join/imp.
    """

    if ty.kind == TypeKind.ATOM:
        if ty.atom is None or ty.atom not in atoms:
            raise KeyError(f"no semantic assignment for atom {ty.atom!r}")
        return atoms[ty.atom]

    if ty.kind == TypeKind.BOTTOM:
        if carrier:
            return type(carrier[0]).bottom()  # type: ignore[call-arg]
        if atoms:
            return type(next(iter(atoms.values()))).bottom()  # type: ignore[call-arg]
        raise ValueError("BOTTOM requires a non-empty carrier or atoms mapping")

    if ty.kind == TypeKind.TOP:
        if carrier:
            return type(carrier[0]).top()  # type: ignore[call-arg]
        if atoms:
            return type(next(iter(atoms.values()))).top()  # type: ignore[call-arg]
        raise ValueError("TOP requires a non-empty carrier or atoms mapping")

    if ty.kind == TypeKind.AND:
        assert ty.left is not None and ty.right is not None
        a = interpret_type(ty.left, atoms)
        b = interpret_type(ty.right, atoms)
        return a.meet(b)  # type: ignore[return-value]

    if ty.kind == TypeKind.OR:
        assert ty.left is not None and ty.right is not None
        a = interpret_type(ty.left, atoms)
        b = interpret_type(ty.right, atoms)
        return a.join(b)  # type: ignore[return-value]

    if ty.kind == TypeKind.IMP:
        assert ty.left is not None and ty.right is not None
        a = interpret_type(ty.left, atoms)
        b = interpret_type(ty.right, atoms)
        return a.imp(b)  # type: ignore[return-value]

    raise ValueError(f"unknown type kind {ty.kind!r}")


def interpret_type_in_structure(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    carrier: Sequence[A],
    ty: Type,
    atoms: Mapping[str, A],
) -> A:
    """Interpret a Type in the context of a RelationalStructure.

    For now this simply delegates to `interpret_type`, but it makes
    explicit that semantics is parameterised by a structure (in
    particular, its carrier and Reflex).
    """

    return interpret_type(ty, atoms, carrier)


def interpret_term(term: Term, env: Env[A]) -> A:
    """Very small denotational semantics for closed terms.

    For now we only interpret:
    - variables: looked up in `env`;
    - `star`: mapped to ⊤ of the carrier;
    - pairs and projections: via meet;
    - no λ/app (functions) are interpreted yet; this is sufficient to
      validate some simple typings on finite carriers.
    """

    if term.tag == "var":
        assert isinstance(term.value, Var)
        name = term.value.name
        if name not in env:
            raise KeyError(f"no semantic assignment for variable {name!r}")
        return env[name]

    if term.tag == "star":
        # We assume env is non-empty and take the carrier from any value.
        if not env:
            raise ValueError("cannot interpret ⊤ without a non-empty environment")
        sample = next(iter(env.values()))
        return sample.top()  # type: ignore[call-arg]

    if term.tag == "pair":
        first, second = term.value  # type: ignore[misc]
        assert isinstance(first, Term)
        assert isinstance(second, Term)
        v1 = interpret_term(first, env)
        v2 = interpret_term(second, env)
        return v1.meet(v2)  # type: ignore[return-value]

    if term.tag == "fst":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        # Interpret the whole pair then project via ≤; since we don't
        # track tuple structure semantically, we just return the meet
        # with the left component's denotation in simple tests.
        return interpret_term(pair, env)

    if term.tag == "snd":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        return interpret_term(pair, env)

    if term.tag == "reflex":
        inner = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        return interpret_term(inner, env)

    raise ValueError(f"interpret_term: unsupported term tag {term.tag!r}")


def interpret_term_with_reflex(term: Term, env: Env[A], reflex: MonotoneEndomap[A]) -> A:
    """Interpret a term with an explicit Reflex endomap.

    This mirrors `interpret_term` but interprets `reflex(t)` as
    `reflex(interpret_term_with_reflex(t))` instead of acting as the
    identity. On BoolHA, using IdentityReflex recovers the old
    behaviour; on ThreeHA, using ThreeReflex yields a nontrivial ρ.
    """

    if term.tag == "reflex":
        inner = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        return reflex(interpret_term_with_reflex(inner, env, reflex))

    # For all other tags, fall back to the reflex-agnostic semantics.
    return interpret_term(term, env)


def interpret_term_in_structure(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    env: Env[A],
    term: Term,
) -> A:
    """Interpret a term using the Reflex endomap from a RelationalStructure."""

    return interpret_term_with_reflex(term, env, structure.reflex)


def denote_closed(term: Term, carrier: Sequence[A]) -> A:
    """Denotation of a closed term via normalization then interpretation.

    This is a minimal bridge from operational to denotational semantics
    on finite carriers. For now it assumes:
    - the term is closed (no free variables);
    - after normalization, only the subset of constructs handled by
      `interpret_term` remains in the term.
    """

    if not carrier:
        raise ValueError("carrier must be non-empty")
    sample = carrier[0]
    env: Dict[str, A] = {"_": sample}
    nf = normalize(term)
    return interpret_term(nf, env)


def context_denotation(ctx: Context, atoms: Mapping[str, A], carrier: Sequence[A]) -> A:
    """Interpret a typing context Γ as the meet of its types."""

    if not ctx.entries:
        # Empty context denotes ⊤.
        return interpret_type(Type.top(), atoms, carrier)
    vals: list[A] = []
    for binding in ctx.entries:
        vals.append(interpret_type(binding.ty, atoms, carrier))
    acc = interpret_type(Type.top(), atoms, carrier)
    for v in vals:
        acc = acc.meet(v)  # type: ignore[assignment]
    return acc


def is_sequent_valid(
    assumptions: Iterable[Type],
    conclusion: Type,
    carrier: Sequence[A],
    atom_names: Sequence[str],
) -> bool:
    """Check Γ ⊢ A is valid in a finite Heyting algebra.

    Semantically: for all valuations of atoms into `carrier`, the meet
    of Γ's denotations is ≤ the denotation of A.
    """

    assumptions = list(assumptions)
    if not carrier:
        raise ValueError("carrier must be non-empty")

    # Precompute a top element.
    top_val = carrier[0].top()  # type: ignore[call-arg]

    for values in product(carrier, repeat=len(atom_names)):
        env = dict(zip(atom_names, values))
        # Meet of Γ under this valuation.
        if assumptions:
            acc = interpret_type(assumptions[0], env, carrier)
            for ty in assumptions[1:]:
                acc = acc.meet(interpret_type(ty, env, carrier))  # type: ignore[assignment]
        else:
            acc = top_val
        concl_val = interpret_type(conclusion, env, carrier)
        if not acc.leq(concl_val):
            return False
    return True


def is_sequent_valid_in_structure(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    carrier: Sequence[A],
    assumptions: Iterable[Type],
    conclusion: Type,
    atom_names: Sequence[str],
) -> bool:
    """Wrapper to check sequent validity relative to a RelationalStructure."""

    return is_sequent_valid(assumptions, conclusion, carrier, atom_names)


def typing_sound_in_model(
    ctx: Context,
    term: Term,
    carrier: Sequence[A],
    atom_names: Sequence[str],
) -> bool:
    """Check that a particular typing judgement is sound in a model.

    Given Γ and t, we infer A from Γ ⊢ t : A, then check that the
    corresponding sequent Γ ⊢ A is valid in the given Heyting algebra
    (as in is_sequent_valid).
    """

    ty = type_of(ctx, term)
    assumptions = [b.ty for b in ctx.entries]
    return is_sequent_valid(assumptions, ty, carrier, atom_names)
