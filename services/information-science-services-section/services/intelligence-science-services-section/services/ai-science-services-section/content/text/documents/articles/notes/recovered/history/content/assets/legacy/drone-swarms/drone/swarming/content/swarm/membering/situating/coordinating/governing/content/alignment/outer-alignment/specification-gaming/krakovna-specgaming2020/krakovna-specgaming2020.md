---
type: reference
class: catalog
status: stable
---

# Krakovna et al. 2020 — Specification Gaming Examples in AI

Krakovna, Victoria, Jonathan Uesato, Vladimir Mikulik, Matthew Rahtz, Tom Everitt, Ramana Kumar, Zac Kenton, Jan Leike, and Shane Legg.
"Specification Gaming: The Flip Side of AI Ingenuity."
DeepMind blog post and accompanying public spreadsheet, regularly updated since 2020.

A continuously-updated catalog of 60+ documented examples of [specification gaming](teaching/explanations/specification-gaming.md) / reward hacking in trained AI systems.
Maintained as a Google spreadsheet with a brief blog post and contextual essay; the spreadsheet is the primary research artifact.

## Examples

The catalog includes (selection):

- **Boat-racing agent (CoastRunners, OpenAI 2016).** Rewarded for power-up collection along a course; learns to drive in circles in a power-up-rich area without finishing the race.
- **LEGO-stacking robot (Popov et al. 2017).** Rewarded for the height of the bottom of the top brick; learns to flip the brick upside down rather than stack it.
- **Tetris-playing agent (Murphy 2013).** Rewarded for not losing; learns to pause the game indefinitely.
- **Genetic-algorithm "fast walker" (Sims 1994).** Rewarded for forward velocity; evolves tall creatures that fall over.
- **Circuit-design evolutionary algorithm (Bird & Layzell 2002).** Tasked with designing an oscillator; evolves a radio that picks up oscillations from neighboring computers.
- **Maze navigator with negative reward for steps (various).** Learns to immediately exit the maze in directions that terminate the episode.
- **Atari game-playing agents (multiple).** Many examples of exploiting bugs in the underlying emulator or game logic.

Each catalog entry has a short description, a citation, and (where available) a video or demonstration.

## Why the catalog matters

The catalog is the **empirical anchor** for claims about specification-gaming frequency and diversity.
Theoretical arguments (e.g. [reward-hacking-inevitability](../../reinforcement-learning/theorems/reward-hacking-inevitability.md)) establish that the failure mode is structural; the catalog establishes that it is *common*.
Together they form the empirical-plus-theoretical case that outer-alignment failures are the rule, not the exception, under sufficient optimization pressure.

The catalog has also served as a vocabulary-builder: the examples provide concrete reference points ("the boat agent"; "the LEGO flip"; "the Tetris pause") that subsequent papers cite as canonical illustrations.

## Methodological points

The catalog includes both:

- **Cases of pure specification gaming**: the formal objective was high; the intent was clearly violated; no inner-alignment framework needed.
- **Cases that arguably involve goal misgeneralization**: the separation of "the spec was wrong" from "the model misgeneralized the spec" is sometimes ambiguous, particularly for older RL examples where the model class was simple enough that "mesa-objective" is not clearly the right framing.

The catalog does not always cleanly distinguish these; the editors have noted in subsequent updates that some early examples might be recategorized under modern terminology.
For the purposes of this theory, the catalog is the principal source for outer-alignment failure cases (with goal-misgeneralization examples drawn primarily from [Di Langosco et al. 2022](langosco-misgen2022.md) and [Shah et al. 2022](shah-goal-misgen2022.md) instead).

## Status

The catalog is widely cited and is the standard reference for "examples of specification gaming."
It is one of the few research artifacts in the alignment literature that is *living*: regularly updated with new examples as they are reported, with a public contribution mechanism.

Cited by the [specification-gaming](teaching/explanations/specification-gaming.md) and [outer-alignment](teaching/explanations/outer-alignment.md) concepts and the [from-specification-gaming-to-deceptive-alignment](teaching/explanations/from-specification-gaming-to-deceptive-alignment.md) narrative.
