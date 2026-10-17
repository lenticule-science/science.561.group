# Corner naming convention: the evidence reading is authoritative

Ruled: 2026-08-05

## Result

The corner labels in `Obsmetrologia/Articulation/Articulating/Cell.lean` — the
evidence reading — are the deliberate, authoritative convention:

| Corner      | (token, claim) | reading                                  |
| ----------- | -------------- | ---------------------------------------- |
| `absurd`    | (no, no)       | told none — the initial cell             |
| `potential` | (yes, no)      | told true: token articulated, claim not  |
| `active`    | (no, yes)      | told false: claim articulated, token not |
| `stable`    | (yes, yes)     | told both: both sides articulated        |

`Charge` inherits the same labels through `abbrev Charge := Articulating.Corner`:
⊥ₖ = `absurd`, t = `potential`, f = `active`, ⊤ₖ = `stable`.

## The divergence this resolves

RelMath (and prose derived from it) used a rotated labeling: `potential` =
(no, no) initial, `absurd` = (yes, yes) both-articulated. The relabeling to the
evidence reading entered the Lean in the original-evidence commit
`c10ad51` ("chore: settle accumulated workspace state", 2026-07-29) without a
reconciling note, leaving the library's own verso/blueprint prose asserting the
opposite polarity of the compiling source. That drift is what this ledger entry
closes: the code was right; the prose was stale.

## Why the evidence reading is the deliberate one

- **It ties the birth corner to the founding paradox.** `absurd` names the claim
  that holds only because nothing constrains it — no evidence either way. That is
  the condition of relationlessness itself, so every claim is born in the same
  state the system is born from, and articulation is what carries it out of
  absurdity. Under the old labeling the initial corner connected to nothing in
  the metaphysics.
- **Calling the told-both corner "absurd" was a classical projection.** Reading
  contradiction as absurdity is ex-falso vocabulary. In the paraconsistent
  bilattice this corpus derives, told-both does not explode; it is the
  ≤ₖ-absorbing point no further posit can move — which is to say, **stable**.
  Contesting (⊤) is the only speech-act class stable under closure.
- **It makes predicating's domain coherent.** Predicating seeds the reflexive
  triple ⟨token, claim, token⟩, which requires an articulated token. Its carrier
  `PotentialCell` is the told-true corner (yes, no) — a cell with something to
  say — not a contentless (no, no) cell.

## Consequences

- The seed value `Charge.kBot = absurd` is consistent with this naming: the
  knowledge-least valuation starts every cell with no evidence. Note the naming
  ruling does **not** settle the separate, still-open semantics question of
  whether the bottom charge is *seeded* onto every cell (the knowledge-least
  valuation, as the Lean currently does) or *measured* from each cell's givens
  (the 2026-06-06 package's "measured, not seeded" discipline, under which a
  fresh cell with a given token measures at `potential`, not `absurd`). The
  bilattice references file records these as unreconciled readings —
  closure-of-assertions vs LFP-of-the-measured-carrier. What the discipline
  does forbid under either reading: **`stable` is only ever reached** — no cell
  may be born told-both.
- Under the token-before-claim working theory the natural progression is
  `absurd → potential → stable`, with `active` (claim without token) off that
  path. Which ordering is right remains open work, as before.
- RelMath and `assets/legacy/` material keep the old labeling. They are honest
  history and are not to be rewritten; read them with the rotation in mind.
