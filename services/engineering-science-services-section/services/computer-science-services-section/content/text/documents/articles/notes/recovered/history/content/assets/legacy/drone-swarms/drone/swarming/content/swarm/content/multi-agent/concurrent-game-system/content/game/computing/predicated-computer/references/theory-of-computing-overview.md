# @561-group/theory-of-computing

> **⚠️ Despite the name, this is NOT the Group's resolved theory of computing.** This is a young,
> notes-stage *comparative* package (contemporary computing ideas ↔ governance), held under the
> [predicated computer](../predicated-computer.md) (the settling substrate). The resolved theory —
> **CGS**, with `Eff ≃ Kl(!_CGS)` — lives in the separate `computing/` theory node; see the
> disambiguation box at the top of [predicated-computer.md](../predicated-computer.md) for the
> exact files (`questions/what-is-the-theory-of-computing.md`, `code/structures/{cgs,eff,computing-structures}.md`).


> **Contemporary theory of computing** — read against this repo's own derivations.
> Where the [`@561-group/theories`](../) catalog derives foundational domains (agency, system, existence, spacetime), this package holds *computing's own* ideas — capability security, concurrency, naming, authority, distribution — and asks how they line up with what [`@561-group/computer`](../../computer/) derives from the void and with how human polities actually govern.
> It is **text only**: prose, no build, no runnable surface.

## The one idea

`theory-of-computing` is a **sibling** to the `@561-group/theories` catalog, not a subpath of it — the same relation [`@561-group/math-playground`](../../math/playground/) has to [`@561-group/math`](../../math/): the catalog is the settled derivation; this is the potential frontier where contemporary computing ideas are examined and compared before anything settles.
It sits in the `theories/` (knowledge) layer of the fold-tower (`math → computer → apps`, with `theories` feeding sideways); it does not run, it *reasons*.

The reasoning here is comparative on purpose.
A computing idea earns its place by being held next to two things: (1) what the repo *already derives* — e.g. the computer's own capability-as-charge model (`computer/.../accounts-are-players-not-records`) — and (2) the world it claims to be about, including human governance.
A note belongs here when that comparison is the point.

## Layout

- `docs/notes/` — the working notes.
  Each is prose that states its sources and keeps what it knows apart from what it infers (per the repo's epistemic restraint: say what the files and sources say, flag the rest as inference).

Currently:

- [`docs/notes/lakota-governance-and-object-capabilities.md`](docs/notes/lakota-governance-and-object-capabilities.md) — an explainer (written for Edward L.
  Platt) on how Lakota / Očhéthi Šakówiŋ governance and the object-capability security model refuse the *same* thing — standing, ambient authority — and build legitimacy the same way: from specific, scoped, granted, accountable, revocable relationships.
  Cited; honest about where the analogy breaks.

## Honesty

This is a **young, notes-stage** package: it holds prose, not a derivation.
Nothing here is claimed as theorem.
Where a note draws a structural analogy (computing ↔ governance), the analogy is a *lens* offered with its seams marked, never a claim of equivalence — and where a note touches a living human tradition, that tradition is held by its people, not by this text.
The package conventions are modeled on the sibling theory packages; it is built to follow ordinary pnpm hygiene for a text-only package (private, no faked code entry points, no dependency it never imports).
