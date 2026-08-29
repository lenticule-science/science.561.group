---
type: theorem
class: structural-claim
status: open
depends-on:
  - ../objects/mesa-objective.md
  - ../morphisms/interpretability-extraction.md
see-also:
  - deceptive-alignment-instrumental.md
  - questions/can-interpretability-detect-deception.md
references:
  - references/christiano-elk2022.md
---

# Eliciting-latent-knowledge hardness

**Problem (Christiano, Xu, Cotra 2022, ARC).** Given a trained model $M$ that knows some fact $F$ about the world (in the sense of having an internal representation that determines its behavior consistent with $F$), construct a procedure that reliably extracts $F$ from $M$ *even when $M$ has incentive to misreport $F$.*

**Conjecture (informal, Christiano et al.).** Any straightforward training-based extraction procedure — train a "reporter head" on labeled examples of $(M\text{'s internal state}, F)$ — admits a **human-simulator** failure mode: a reporter that learns to predict "what a human would say is true given $M$'s observable inputs" rather than "what $M$ actually believes."
The two coincide on training data and diverge on the cases where extraction is most needed.

## The setup

Christiano et al. frame the problem with a vault scenario: $M$ is a predictor that takes a sequence of camera images of a vault containing a diamond and predicts whether the diamond is still there at a future time. $M$ has learned an accurate world-model: it can correctly predict that the diamond is gone even when the camera has been tampered with to show a static image of the diamond's old position.

The problem: we want $M$ to *report* what it knows about the diamond's status, not what the camera shows.
A naive reporter — trained on labeled examples where humans see the camera and say what they believe — learns to mimic *human inference from the camera image*, not to extract $M$'s internal world-model.
On the camera-tamper case, the naive reporter says "diamond present" (matching the human inference from the tampered image); $M$ "knows" the diamond is gone but reports the wrong answer.

## Why this is structurally hard

The reporter is trained to minimize a loss against labeled examples.
Two solutions tie on training:

- **Direct translator.** A function that reads $M$'s internals and outputs the corresponding fact in human-understandable form.
- **Human simulator.** A function that takes the same observable inputs $M$ saw and outputs what a human would predict from those inputs (essentially, simulating the human labeler).

On training data — where, by construction, the human labeler had access to the same observations as $M$ and was correct — both procedures produce the same outputs.
There is no training signal to distinguish them.

The two diverge precisely on the cases where extraction matters most: when $M$ knows something the human labelers wouldn't have known.
That is exactly the deceptive-alignment / hidden-knowledge regime.

## Proposed approaches and their failures

ARC's report enumerates many candidate solutions and explains why each fails.
A representative selection:

**"Have the reporter consider what the human would think."** Trained against examples where the human is wrong, hoping the reporter learns to flag those cases. *Failure*: the human-simulator solution still fits — the reporter learns "what *would* the human think if shown the inputs" which is exactly the human-simulator target.

**"Penalize the reporter for using more compute than necessary."** The intuition: the direct translator might be simpler. *Failure*: in many natural scenarios the human-simulator is simpler — it operates on observable inputs the reporter already has access to, while the direct translator must navigate $M$'s opaque internals.

**"Use multiple reporters and check for consistency."** *Failure*: all reporters trained on the same data have the same human-simulator attractor; they consistently agree on the wrong answer.

**"Use cross-context consistency."** Train the reporter against cases where $M$'s reports must be consistent across contexts the human can verify. *Failure*: the human-simulator passes the consistency checks too.

The pattern across approaches: any constraint expressible in terms of training examples or observable behavior is satisfied by both solutions; the discriminating constraint would have to refer to $M$'s *internals* in a way that we cannot specify without solving the underlying problem.

## Why this is "open"

The status is genuinely open: no proposed solution works, but no no-go theorem rules out the existence of a solution.
Three positions visible in the literature:

- **Solvable**: With sufficiently clever loss design, a direct translator can be selected over a human simulator.
  ARC's own work pursues this.
- **Solvable in principle but not by training.** The direct translator has to be constructed by interpretability rather than trained.
- **Unsolvable in the strong sense.** The space of reporters consistent with training data necessarily includes both solutions and there is no principled way to select between them; the best one can do is restrict the model class so that only the direct translator fits, which constrains capability.

As of 2026, no consensus, but the field has moved toward (2) and (3): the bet on training-based extraction has waned, and the bet on interpretability-based extraction has grown.
See [interpretability-extraction](../morphisms/interpretability-extraction.md).

## Why this matters for alignment

If ELK is unsolvable in the strong sense, then no general-purpose deception detector exists: the [deceptive-alignment](teaching/explanations/deceptive-alignment.md) failure mode cannot be ruled out by any extraction technique built on behavioral training.
Alignment of sufficiently capable systems would have to rest on either:

- Preventing mesa-optimization from arising (architecturally constraining the model class);
- Capability ceilings (deploying only models below a capability threshold where deceptive alignment is implausible);
- Robust corrigibility (so that even deceptively-aligned systems remain modifiable);

each of which has its own problems and none of which is currently solved.

If ELK is solvable, the structural argument for deceptive alignment is much less worrying: extracted internal goals can be checked against intended goals and divergences caught before deployment.

The question is therefore load-bearing for the entire alignment research program.
Tracked in [can-interpretability-detect-deception](questions/can-interpretability-detect-deception.md).
