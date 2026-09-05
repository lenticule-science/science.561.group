Calculus of Language (λ_R)
==========================

This section documents the λ-like internal language λ_R as the
***Calculus of Relational Language*** (*Relational Calculus*) over
recognitions: syntax, typing, reduction, and semantics implemented by
:mod:`relationing.language`. It should be
read alongside:

- **Formal mathematical specification** – :doc:`Relational Language Spec <math/infinite/language/index>`
  and the more atomic fragments under ``docs/math/infinite/language/``.
- **System code documentation** – per-function and per-dataclass docs for
  :mod:`relationing.core.language` under ``docs/code/core/language/``.
  An index of the core Language API is provided at
  :doc:`code/core/language/index`, with one page per core helper or
  dataclass.
- **Test documentation** – Language-layer test docs under
  ``docs/tests/core/language/``.


Contents
--------

.. toctree::
   :maxdepth: 3

   math/infinite/language/index
   code/core/language/index
   tests/core/language/index

Mathematical background
-----------------------

For the full formal development of the Relational Language (including
syntax, inference rules, soundness, normalisation, and the canonical
model), see:

- :doc:`Relational Language Spec <math/infinite/language/index>`

Code overview (API)
-------------------

The public λ_R surface is provided by :mod:`relationing.language` and
re-exports the core implementation from
``relationing.core.language``:

.. automodule:: relationing.language
   :members: TypeKind, Type, Var, Term, Context, Binding, TypeError,
             Derivation, ReductionStep,
             type_of, type_of_with_derivation,
             normalize, normalize_with_trace,
             judgementally_equal,
             semantic_type_leq, semantic_type_leq_in_models,
             syntactic_type_leq
   :undoc-members:
   :show-inheritance:

Semantics
---------

Term and type semantics for λ_R are always interpreted relative to a
RelationalStructure, and in particular its designated Reflex endomap.
The core entrypoint for term semantics is therefore the Reflex-aware
`interpret_term_in_structure`, with the Reflex-agnostic helpers
(`interpret_type`, `interpret_term`, `denote_closed`) viewed as
IdentityReflex-specialised conveniences for finite test models. For
closed terms, `denote_closed_in_structure` provides a simple bridge
from operational normalization to Reflex-aware denotation.

For arrow types, the intended function space is the Reflex-world of
λ_R-definable, ρ-compatible endomaps on the carrier rather than an
arbitrary function space. Closed unary λ-terms can be interpreted as
such endomaps via `interpret_unary_lambda_as_endomap`, and
`apply_unary_lambda_in_structure` offers a tiny compositional λ/app
semantics that agrees with the normalization-based semantics on the
tested fragment. These λ_R-definable endomaps satisfy the `Discipline`
interface from the Geometry layer, so they can be treated as concrete
Disciplines that commute with example nuclei and flows on finite
models.

Core semantics versus helper APIs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The core, Reflex-aware semantics live in
``interpret_type_in_structure``, ``interpret_term_in_structure``,
``denote_closed_in_structure``, and ``beta_equal_in_structure``.
The λ→Discipline helpers (``LambdaEndomap`` and friends) are small
internal APIs that interpret unary arrow-typed terms as Disciplines
and are primarily intended for experiments with Reflex-world function
spaces.

.. automodule:: relationing.library.structures.semantics
   :members: interpret_type_in_structure, interpret_term_in_structure, is_sequent_valid_in_structure, typing_sound_in_model, denote_closed, denote_closed_in_structure, beta_equal_in_structure, interpret_unary_lambda_as_endomap, endomap_commutes_with_structure_reflex, apply_unary_lambda_in_structure, typed_unary_lambda_as_endomap, interpret_closed_top_arrow_as_discipline, interpret_closed_atom_arrow_as_discipline
   :undoc-members:
   :show-inheritance:

In addition to these semantics helpers, the finite syntactic models in
``relationing.library.structures.syntactic_model`` expose comparison
APIs such as
:func:`relationing.library.structures.syntactic_model.semantic_leq`,
:func:`relationing.library.structures.syntactic_model.syntactic_leq`,
and
:func:`relationing.library.structures.syntactic_model.implicational_fragment_agreeing_types`,
which provide finite witnesses that, on small implicational fragments,
semantic entailment in Relational powerset models coincides with
proof-search-based syntactic entailment.

Specification–implementation mapping
------------------------------------

The formal syntax, typing rules, operational semantics, and soundness
results in :doc:`Relational Language Spec <math/infinite/language/index>`
are implemented by:

- Types (atoms, ``∧, ∨, ⇒, ⊥, ⊤``) and terms (variables, λ-abstraction,
  application, pairs, sums, ``⋆``, ``abort``, and ``ρ``) via
  :class:`relationing.language.TypeKind`,
  :class:`relationing.language.Type`,
  :class:`relationing.language.Term`,
  :class:`relationing.language.Var`, and
  :class:`relationing.language.Context`.
- Typing judgements ``Γ ⊢ t : A`` via the executable typing algorithm
  :func:`relationing.language.type_of`, whose behaviour corresponds to
  the inference rules stated in the Language notes. For debugging and
  explanatory purposes, :class:`relationing.language.Derivation` and
  :func:`relationing.language.type_of_with_derivation` provide
  explicit derivation objects that mirror the formal typing trees
  (Conjunction/Disjunction/Implication, Bottom/Top, Reflex) for a
  given judgement ``Γ ⊢ t : A``.
- Normalization and the Normalization theorem via the small-step
  reduction and normalisation function
  :func:`relationing.language.normalize`, with tests checking that
  well-typed λ_R terms reduce to normal forms. For debugging and
  explanatory purposes,
  :class:`relationing.language.ReductionStep` and
  :func:`relationing.language.normalize_with_trace` provide labelled
  small-step traces whose rule names mirror the ``β``, projection,
  case, and ``ρ`` rules from the Language notes.
- Judgemental and semantic type preorders corresponding to the
  ``Type-level semantics`` and ``Soundness`` sections of the notes via
  :func:`relationing.language.judgementally_equal`,
  :func:`relationing.language.syntactic_type_leq`,
  :func:`relationing.language.semantic_type_leq`, and
  :func:`relationing.language.semantic_type_leq_in_models`.
- Interpretation of types and terms into finite Heyting models of
  :class:`relationing.structure.RelationalStructure` via
  :func:`relationing.library.structures.semantics.interpret_type_in_structure`,
  :func:`relationing.library.structures.semantics.interpret_term_in_structure`,
  :func:`relationing.library.structures.semantics.denote_closed`, and
  :func:`relationing.library.structures.semantics.denote_closed_in_structure`,
  which realise the "Standard Model" and "Soundness" theorems on
  finite carriers.
- Sequent validity and typing soundness in models via
  :func:`relationing.library.structures.semantics.is_sequent_valid_in_structure`
  and
  :func:`relationing.library.structures.semantics.typing_sound_in_model`,
  providing the executable counterpart of the sequent-level soundness
  results.
- The λ→Discipline interpretation of unary arrow types as Reflex-aware
  endomaps (used in the Geometry/Physics layers) via
  :class:`relationing.library.structures.semantics.LambdaEndomap`,
  :func:`relationing.library.structures.semantics.interpret_unary_lambda_as_endomap`,
  :func:`relationing.library.structures.semantics.typed_unary_lambda_as_endomap`,
  and related helpers listed above, which instantiate the "Reflex
  operator" and function-space discussions in the Language and
  Geometry notes on finite examples.


Core Language code index
------------------------

.. toctree::
   :maxdepth: 1

   code/core/language/index


.. _impl-language-preservation:

Preservation and Progress (implementation)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The operational behaviour of reduction with respect to typing, used in
the Preservation and Progress theorems, is implemented by the
combination of :func:`relationing.language.type_of` and
:func:`relationing.language.normalize`, together with the labelled
small-step traces of
:func:`relationing.language.normalize_with_trace`. The typing tests
in ``tests/test_language_typing_and_judgements.py`` exercise these
APIs on finite examples.


.. _impl-language-logical-relations:

Logical relations and soundness (implementation)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Soundness and Fundamental Theorem of Logical Relations results are
realised operationally by interpreting typing judgements into finite
Relational models via
``relationing.library.structures.semantics`` (for example,
``interpret_type_in_structure``,
``interpret_term_in_structure``, and ``typing_sound_in_model``) and
comparing them with ``type_of`` and ``normalize``. The tests in
``tests/test_language_soundness_semantics.py`` instantiate these
properties on concrete finite powerset models.
