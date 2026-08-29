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

from relationing.language import Context, Type, TypeKind, Term, Var, normalize, type_of
from relationing.structure import HeytingAlgebra, MonotoneEndomap, RelationalStructure
from relationing.geometry import Discipline


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
            # Prefer a classmethod bottom() when available (for
            # carriers like BoolHA / ThreeHA), falling back to a
            # search when the class does not support a universe-free
            # constructor (for example PowersetHeytingElement).
            sample_type = type(carrier[0])
            try:
                return sample_type.bottom()  # type: ignore[call-arg]
            except TypeError:
                candidate = carrier[0]
                for c in carrier:
                    if all(c.leq(x) for x in carrier):
                        candidate = c
                        break
                return candidate
        if atoms:
            return type(next(iter(atoms.values()))).bottom()  # type: ignore[call-arg]
        raise ValueError("BOTTOM requires a non-empty carrier or atoms mapping")

    if ty.kind == TypeKind.TOP:
        if carrier:
            sample_type = type(carrier[0])
            try:
                return sample_type.top()  # type: ignore[call-arg]
            except TypeError:
                candidate = carrier[0]
                for c in carrier:
                    if all(x.leq(c) for x in carrier):
                        candidate = c
                        break
                return candidate
        if atoms:
            return type(next(iter(atoms.values()))).top()  # type: ignore[call-arg]
        raise ValueError("TOP requires a non-empty carrier or atoms mapping")

    if ty.kind == TypeKind.AND:
        assert ty.left is not None and ty.right is not None
        a = interpret_type(ty.left, atoms, carrier)
        b = interpret_type(ty.right, atoms, carrier)
        return a.meet(b)  # type: ignore[return-value]

    if ty.kind == TypeKind.OR:
        assert ty.left is not None and ty.right is not None
        a = interpret_type(ty.left, atoms, carrier)
        b = interpret_type(ty.right, atoms, carrier)
        return a.join(b)  # type: ignore[return-value]

    if ty.kind == TypeKind.IMP:
        assert ty.left is not None and ty.right is not None
        a = interpret_type(ty.left, atoms, carrier)
        b = interpret_type(ty.right, atoms, carrier)
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


def interpret_term(
    term: Term,
    env: Env[A],
    reflex: MonotoneEndomap[A],
    carrier: Sequence[A] | None = None,
) -> A:
    """Reflex-parametric denotational semantics for (a fragment of) λ_R terms.

    For now we only interpret:
    - variables: looked up in `env`;
    - `star`: mapped to ⊤ of the carrier, then passed through `reflex`;
    - pairs and projections: via meet, computed using the Reflex-aware
      semantics on subterms;
    - `reflex(t)`: as `reflex(⟦t⟧_ρ)`.
    No λ/app (functions) are interpreted yet; this is sufficient to
    validate some simple typings on finite carriers.
    """

    if term.tag == "var":
        assert isinstance(term.value, Var)
        name = term.value.name
        if name not in env:
            raise KeyError(f"no semantic assignment for variable {name!r}")
        return env[name]

    if term.tag == "star":
        # Obtain ⊤ from the carrier when available; fall back to any
        # sample from the environment for backwards compatibility.
        sample: A | None = None
        if carrier:
            sample = carrier[0]
        elif env:
            sample = next(iter(env.values()))
        if sample is None:
            raise ValueError("cannot interpret ⊤ without a carrier or non-empty environment")
        sample_type = type(sample)
        try:
            top = sample_type.top()  # type: ignore[call-arg]
        except TypeError:
            if not carrier:
                raise
            candidate = carrier[0]
            for c in carrier:
                if all(x.leq(c) for x in carrier):
                    candidate = c
                    break
            top = candidate
        return reflex(top)

    if term.tag == "pair":
        first, second = term.value  # type: ignore[misc]
        assert isinstance(first, Term)
        assert isinstance(second, Term)
        v1 = interpret_term(first, env, reflex, carrier)
        v2 = interpret_term(second, env, reflex, carrier)
        return v1.meet(v2)  # type: ignore[return-value]

    if term.tag == "fst":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        # In the current model, products are identified with ∧, so we
        # do not distinguish components semantically and simply return
        # the product denotation.
        return interpret_term(pair, env, reflex, carrier)

    if term.tag == "snd":
        pair = term.value  # type: ignore[misc]
        assert isinstance(pair, Term)
        return interpret_term(pair, env, reflex, carrier)

    if term.tag == "reflex":
        inner = term.value  # type: ignore[misc]
        assert isinstance(inner, Term)
        return reflex(interpret_term(inner, env, reflex, carrier))

    if term.tag == "abort":
        # Semantics of abort(t, C): from a ⊥-typed argument we can
        # derive any recognition. At the level of recognitions we map
        # directly to the Reflex-processed top element; typing ensures
        # abort is only formed on ⊥.
        sample: A | None = None
        if carrier:
            sample = carrier[0]
        elif env:
            sample = next(iter(env.values()))
        if sample is None:
            raise ValueError("cannot interpret abort without a carrier or non-empty environment")
        sample_type = type(sample)
        try:
            top = sample_type.top()  # type: ignore[call-arg]
        except TypeError:
            if not carrier:
                raise
            candidate = carrier[0]
            for c in carrier:
                if all(x.leq(c) for x in carrier):
                    candidate = c
                    break
            top = candidate
        return reflex(top)

    # Fallback: interpret via normalization for tags we do not handle
    # compositionally yet (e.g. lam/app, sums, abort). This keeps
    # closed-term semantics usable for a larger fragment without
    # introducing a separate function-space model.
    original_tag = term.tag
    nf = normalize(term)
    if nf.tag == original_tag:
        # Still an unsupported constructor in normal form.
        raise ValueError(f"interpret_term: unsupported term tag {term.tag!r}")
    return interpret_term(nf, env, reflex, carrier)


def interpret_term_in_structure(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    env: Env[A],
    term: Term,
) -> A:
    """Interpret a term using the Reflex endomap from a RelationalStructure."""

    return interpret_term(term, env, structure.reflex)


def denote_closed(term: Term, carrier: Sequence[A]) -> A:
    """Denotation of a closed term via normalization then interpretation.

    This is a minimal bridge from operational to denotational semantics
    on finite carriers. For now it assumes:
    - the term is closed (no free variables);
    - after normalization, only the subset of constructs handled by
      `interpret_term` remains in the term; and
    - we interpret using an identity-like Reflex on the carrier.
    """

    if not carrier:
        raise ValueError("carrier must be non-empty")

    class _IdReflex(MonotoneEndomap[A]):  # type: ignore[type-arg]
        def __call__(self, x: A) -> A:  # pragma: no cover - trivial
            return x

    env: Dict[str, A] = {}
    nf = normalize(term)
    return interpret_term(nf, env, _IdReflex(), carrier)


def denote_closed_in_structure(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    carrier: Sequence[A],
    term: Term,
) -> A:
    """Denote a closed term relative to a RelationalStructure.

    This is the Reflex-aware analogue of `denote_closed`: we first
    normalize the term using the λ_R small-step semantics, then
    interpret the resulting normal form using the structure's Reflex
    endomap via `interpret_term`.

    As with `denote_closed`, this is currently defined only for closed
    terms whose normal forms live in the fragment handled by
    `interpret_term`.
    """

    if not carrier:
        raise ValueError("carrier must be non-empty")
    env: Dict[str, A] = {}
    nf = normalize(term)
    return interpret_term(nf, env, structure.reflex, carrier)


def beta_equal_in_structure(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    carrier: Sequence[A],
    t1: Term,
    t2: Term,
) -> bool:
    """Check β/normalization equality of two closed terms in a structure.

    This helper compares the denotations of two λ_R terms after
    normalization, using the structure's Reflex-aware semantics. It is
    intended for closed terms; for open terms, any free variables must
    be accounted for in the (internally constructed) environment.
    """

    if not carrier:
        raise ValueError("carrier must be non-empty")
    env: Dict[str, A] = {}
    nf1 = normalize(t1)
    nf2 = normalize(t2)
    v1 = interpret_term(nf1, env, structure.reflex, carrier)
    v2 = interpret_term(nf2, env, structure.reflex, carrier)
    return v1.leq(v2) and v2.leq(v1)  # type: ignore[arg-type]


# ---------------------------------------------------------------------------
# λ→Discipline helper APIs (Reflex-world function space for unary arrows)
# ---------------------------------------------------------------------------


class LambdaEndomap(Discipline[A], MonotoneEndomap[A]):
    """Endomap obtained from a unary λ_R term.

    This is a small, Reflex-compatible function-space construction for
    terms of the form `λx. body` in (effectively) empty context. Given
    a RelationalStructure and carrier, we interpret the body for each
    input recognition assigned to `x`, using the structure's Reflex.
    """

    def __init__(
        self,
        structure: RelationalStructure[A, MonotoneEndomap[A]],
        body: Term,
        param: Var,
    ) -> None:
        self._structure = structure
        self._body = body
        self._param = param

    def __call__(self, x: A) -> A:
        env: Dict[str, A] = {self._param.name: x}
        return interpret_term(self._body, env, self._structure.reflex)


class ComposedEndomap(Discipline[A], MonotoneEndomap[A]):
    """Pointwise composition of a finite family of endomaps.

    This class is used to compose λ_R-defined A ⇒ A endomaps inside
    the Reflex-aware semantics: if each component endomap has been
    obtained via `typed_unary_lambda_as_endomap` (or a compatible
    construction), then `ComposedEndomap` inherits their Reflex-world
    interpretation and can be used geometrically as a single
    Discipline or Flow candidate.
    """

    def __init__(self, endomaps: Sequence[MonotoneEndomap[A]]) -> None:
        self._endomaps = list(endomaps)

    def __call__(self, x: A) -> A:
        result = x
        for endomap in self._endomaps:
            result = endomap(result)
        return result


def compose_endomaps(
    *endomaps: MonotoneEndomap[A],
) -> MonotoneEndomap[A]:
    """Compose a finite family of endomaps as a single endomap.

    The resulting endomap applies the arguments left‑to‑right:
    `compose_endomaps(f, g)(x) == g(f(x))`. When each argument
    endomap commutes with a structure's Reflex (as checked by
    `endomap_commutes_with_structure_reflex`), their composition
    also commutes with that Reflex in all of our finite models.
    """

    if not endomaps:
        raise ValueError("compose_endomaps requires at least one endomap")
    if len(endomaps) == 1:
        return endomaps[0]
    return ComposedEndomap(list(endomaps))


def interpret_unary_lambda_as_endomap(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    term: Term,
) -> LambdaEndomap[A]:
    """Interpret a closed unary λ-term as an endomap on recognitions.

    This helper expects `term` to be a λ_R term of the form `lam(x,
    body)` where `x` is the only free λ-variable in `body` (other
    variables may still refer to atoms via type semantics). It returns
    a `LambdaEndomap` that maps each recognition `a` to the Reflex-aware
    denotation of `body` under the assignment `x ↦ a`.
    """

    if term.tag != "lam":
        raise TypeError("interpret_unary_lambda_as_endomap expects a lambda term")
    param, body = term.value  # type: ignore[misc]
    if not isinstance(param, Var) or not isinstance(body, Term):
        raise TypeError("malformed lambda term")
    return LambdaEndomap(structure, body, param)


def endomap_commutes_with_structure_reflex(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    carrier: Sequence[A],
    endomap: MonotoneEndomap[A],
) -> bool:
    """Check whether an endomap commutes with the structure's Reflex.

    This is a small helper for Phase 2: on a finite carrier, we can
    empirically test ρ(f(x)) = f(ρ(x)) for all recognitions x.
    """

    for x in carrier:
        left = endomap(structure.reflex(x))
        right = structure.reflex(endomap(x))
        if not (left.leq(right) and right.leq(left)):  # type: ignore[arg-type]
            return False
    return True


def apply_unary_lambda_in_structure(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    carrier: Sequence[A],
    lam_term: Term,
    arg_term: Term,
) -> A:
    """Apply a unary λ-term compositionally to a closed argument.

    We interpret the λ-term as a `LambdaEndomap` and the argument via
    `denote_closed_in_structure`, then apply the endomap to the
    argument's denotation. For the small closed fragment we currently
    use in tests, this agrees with interpreting the application term
    via normalization-based semantics.
    """

    if not carrier:
        raise ValueError("carrier must be non-empty")
    endomap = interpret_unary_lambda_as_endomap(structure, lam_term)
    arg_val = denote_closed_in_structure(structure, carrier, arg_term)
    return endomap(arg_val)


def typed_unary_lambda_as_endomap(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    ctx: Context,
    lam_term: Term,
) -> LambdaEndomap[A]:
    """Interpret a typed unary λ-term of type A ⇒ A as an endomap.

    This helper enforces that `lam_term` is a lambda in the given
    typing context whose inferred type is an arrow A ⇒ A for some
    type A. It then delegates to `interpret_unary_lambda_as_endomap`
    to obtain the corresponding Reflex-aware endomap on recognitions.
    """

    if lam_term.tag != "lam":
        raise TypeError("typed_unary_lambda_as_endomap expects a lambda term")

    ty = type_of(ctx, lam_term)
    if ty.kind != TypeKind.IMP or ty.left is None or ty.right is None:
        raise TypeError("lambda term must have arrow type")
    if ty.left != ty.right:
        raise TypeError("typed unary endomap requires an A ⇒ A arrow type")

    return interpret_unary_lambda_as_endomap(structure, lam_term)


def interpret_closed_top_arrow_as_discipline(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    lam_term: Term,
) -> Discipline[A]:
    """Interpret a closed λ-term of type ⊤ ⇒ ⊤ as a Discipline.

    This is a small geometric reading of arrow types: for closed unary
    terms inhabiting Top ⇒ Top, we treat their λ_R-denotations as
    Disciplines on recognitions, obtained via the Reflex-aware
    endomap semantics.
    """

    if lam_term.tag != "lam":
        raise TypeError("interpret_closed_top_arrow_as_discipline expects a lambda term")
    param, _ = lam_term.value  # type: ignore[misc]
    if not isinstance(param, Var):
        raise TypeError("malformed lambda term")

    ctx = Context.empty().extend(param, Type.top())
    return typed_unary_lambda_as_endomap(structure, ctx, lam_term)


def interpret_closed_atom_arrow_as_discipline(
    structure: RelationalStructure[A, MonotoneEndomap[A]],
    atom_name: str,
    lam_term: Term,
) -> Discipline[A]:
    """Interpret a closed λ-term of type p ⇒ p as a Discipline.

    Here p is a distinguished atomic Type given by `atom_name`. This
    helper mirrors `interpret_closed_top_arrow_as_discipline` but uses
    an atomic type as the unary arrow's domain/codomain.
    """

    if lam_term.tag != "lam":
        raise TypeError("interpret_closed_atom_arrow_as_discipline expects a lambda term")
    param, _ = lam_term.value  # type: ignore[misc]
    if not isinstance(param, Var):
        raise TypeError("malformed lambda term")

    ctx = Context.empty().extend(param, Type.atom(atom_name))
    return typed_unary_lambda_as_endomap(structure, ctx, lam_term)


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

    # Precompute a top element. Prefer a classmethod top() when
    # available, falling back to a search otherwise.
    sample_type = type(carrier[0])
    try:
        top_val = sample_type.top()  # type: ignore[call-arg]
    except TypeError:
        top_val = carrier[0]
        for candidate in carrier:
            if all(x.leq(candidate) for x in carrier):
                top_val = candidate
                break

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


def is_sequent_valid_in_models(
    assumptions: Iterable[Type],
    conclusion: Type,
    models: Sequence[Sequence[A]],
    atom_names: Sequence[str],
) -> bool:
    """Check sequent validity uniformly across a family of models.

    Given a collection of finite Heyting algebra carriers, return True
    exactly when Γ ⊢ A holds in every model in ``models``.
    """

    for carrier in models:
        if not is_sequent_valid(assumptions, conclusion, carrier, atom_names):
            return False
    return True


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
