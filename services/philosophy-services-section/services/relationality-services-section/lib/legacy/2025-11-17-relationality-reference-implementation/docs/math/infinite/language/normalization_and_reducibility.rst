Normalization and reducibility
==============================

This section collects the Normalization theorem and its supporting
definitions and lemmas. The atomic fragments are:

.. toctree::
   :maxdepth: 1

   normalization_theorem
   strong_normalization_definition
   sn_context_closure_lemma
   reducibility_candidates
   candidate_properties_lemma

These definitions and lemmas support the standard reducibility
argument for Normalization in the λ_R setting. The Fundamental
Theorem of Logical Relations and its use of reducible environments
are stated in :doc:`soundness_and_logical_relations`; together with
Preservation and Progress they yield the full normalisation result.

.. todo::

   :phase: spec-math

   Add dedicated finite Normalization witnesses in
   ``docs/math/finite/language`` and
   ``docs/math/finite/library/structures`` together with focused
   tests that expose strong normalisation claims on explicit finite
   fragments, beyond the current indirect coverage via finite proof
   search and models.
