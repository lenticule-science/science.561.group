# Claim. The pentatonic minor scale admits exactly five modal rotations, organized as the cyclic group C₅ acting on the scale.

**Claim.** The pentatonic minor pitch-set, with interval signature ⟨3, 2, 2, 3, 2⟩, admits exactly five modal rotations obtained by cyclic re-indexing — treating each scale degree in turn as the tonic.
The modal rotations form the cyclic group C₅ acting on the scale by index shift.
The five modes have distinct interval signatures (no rotation symmetry within the set), so each rotation produces a musically distinct mode.

**Argument.**

*Five rotations exist.* A scale with n distinct pitch classes admits n rotations (treating each in turn as tonic).
For n=5, there are five rotations.

*All five are distinct.* Two rotations produce the same mode iff the cyclic interval pattern is invariant under a non-trivial cyclic shift.
The pattern ⟨3, 2, 2, 3, 2⟩ has no such symmetry: the only cyclic shift that fixes it is the identity.
(Direct check: ⟨3,2,2,3,2⟩ ≠ ⟨2,2,3,2,3⟩ ≠ ⟨2,3,2,3,2⟩ ≠ ⟨3,2,3,2,2⟩ ≠ ⟨2,3,2,2,3⟩.)
Therefore all five rotations are musically distinct.

*Group structure.* Rotation by k+1 followed by rotation by m equals rotation by k+m+1 (mod 5).
The set of rotations under composition is therefore Z/5Z = C₅.

*Practice within the cedar flute.* The cedar flute defaults to mode I (the minor pentatonic with the lowest fingered note as tonic).
However, **internal tonal-center shifts** are an established device — a player establishes a different scale degree as the local tonic through repetition, dwelling, and phrase-ending behavior.
The action of C₅ is therefore realized in two ways: globally (choice of which note is the "home tonic" for the instrument) and locally (within-piece shifts of the perceived tonal center).

**Structures produced.**

- [modal-cycle](../code/structures/modal-cycle.md) — the cyclic group C₅ acting on the pentatonic-minor pitch-set by index rotation.

**Transformers produced.**

- [modal-rotation](../code/transformers/modal-rotation.md) — the generator of C₅, sending each scale-degree to its successor.
