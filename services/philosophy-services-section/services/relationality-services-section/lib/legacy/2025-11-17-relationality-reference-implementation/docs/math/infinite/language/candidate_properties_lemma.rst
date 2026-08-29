Basic Properties of Candidates
==============================

Lemma — Basic properties of candidates
--------------------------------------

For any type ``A``:

1. If ``t ∈ ⟦A⟧`` and ``t → t′`` then ``t′ ∈ ⟦A⟧`` (closure under
   reduction).
2. If ``t ∈ ⟦A⟧`` then ``\mathrm{SN}(t)``.
3. If ``⟦A⟧`` contains all closed values of type ``A`` and is closed
   under the corresponding eliminations as above, then introduction
   forms built from reducible subterms are in ``⟦A⟧``.

**Proof.** Standard reducibility arguments by simultaneous induction
on type structure and reduction length; see the surrounding Language
spec fragments for details. ∎

