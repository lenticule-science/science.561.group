Relational Language
===================

The goal of this section is to present an internal λ-like language
``λ_R`` that expresses and manipulates recognitions and their
operations, and to prove soundness into ``Relational Structure``. We
write ***Relational Language*** (*RelationalLanguage*) for the
mathematical system, whose main executable surface is exposed via
the :mod:`relationing.language` APIs.

.. meta::
   :since: 0.1.0


Language contents
~~~~~~~~~~~~~~~~~

The core syntactic and semantic components of the Relational Language
are documented atomically in the following notes:

.. toctree::
   :maxdepth: 1

   syntax_and_judgements
   inference_rules_conjunction
   inference_rules_disjunction
   inference_rules_implication
   inference_rules_bottom_top
   inference_rules_reflex
   standard_model
   reduction_rules
   syntactic_recognitions_and_canonical_model
   completeness_and_adequacy



Normalization and reducibility
------------------------------

For Normalization, strong normalization, reducibility candidates, the
Fundamental Theorem of Logical Relations, confluence, and the
syntactic recognitions structure, see the atomic fragments:

.. toctree::
   :maxdepth: 1

   preservation_and_progress
   soundness_and_logical_relations
   normalization_and_reducibility
   syntactic_recognitions_and_canonical_model

.. todo::

   :phase: spec-math

   Ensure the Relational Language spec is fully atomised (one
   definition/lemma/theorem per file), that each fragment carries
   precise ``:induced-by:`` metadata, and that every major infinite
   result has either an explicit finite witness under
   ``docs/math/finite/language`` / ``docs/math/finite/library`` or a
   TODO recording that a finite witness is still required.
