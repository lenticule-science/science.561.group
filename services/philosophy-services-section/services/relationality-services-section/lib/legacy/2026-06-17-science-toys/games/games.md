# Games

CLI games and idle-sims that instantiate the project's modal /
relational structure as a sensorial medium. The "game" is the modal
algebra felt as an interactive system: closures fire, towers grow,
nuclei stabilize, and the player watches or nudges.

These are toys because they aren't meant to be *played to win* — they
are runnable instances of the formal system, where the gameplay is the
algebra.

## Toys

- [`idle.py`](idle.py) — *ritm_idle_plus.* Auto-tick idle game over
  `ritm_core` + `modal_lab`. Each tick advances the closure tower
  (`C = □◇` repeated until fixpoint), checks axiom assertions, drops
  artifacts when high-step towers fire, and optionally writes a DOT
  graph of the current Heyting algebra. Loads `ritm_core.py` and
  `modal_lab.py` from the same directory via importlib.
- [`ontogeny.py`](ontogeny.py) — *Slime → Crystal.* Idle-sim of
  nucleus closure dynamics. The world starts as undifferentiated slime
  (no fixpoints); over time, σ-stable and Δ-stable regions
  crystallize; the four nuclear zones emerge as visible terrain.
- [`gnos.py`](gnos.py) — *RITM-OS.* Single-file CLI shell built around
  focus-based stabilization. `C = □∘◇`; commit-when-topology-stable is
  the save-state mechanic. The shell exposes the modal operators as
  commands; the player navigates by stabilizing fragments of the
  Heyting algebra.
- [`mod-mud.py`](mod-mud.py) — Single-file MUD server. ECS over a
  typed-edge store; modalities Π / □ / ◇ / ∇ are the verbs. Movement
  and look are derivations; the world model is a lax-idempotent flow.
  Asyncio-based, runs as `python mod-mud.py`.

## Library files

- [`ritm_core.py`](ritm_core.py) — Finite-poset Heyting-algebra +
  KZ-comonad core (also lives in [`../math/modal-lab/`](../math/modal-lab/);
  duplicated here so `idle.py` finds it next to itself via importlib).
- [`modal_lab.py`](modal_lab.py) — Modal-formula engine with named
  modalities and axiom packs (also in [`../math/modal-lab/`](../math/modal-lab/)).
