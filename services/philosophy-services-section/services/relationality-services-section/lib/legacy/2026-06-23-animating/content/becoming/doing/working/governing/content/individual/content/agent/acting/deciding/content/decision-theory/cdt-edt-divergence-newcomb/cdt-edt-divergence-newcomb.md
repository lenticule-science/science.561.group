---
type: theorem
class: classical
status: proved
depends-on:
  - teaching/explanations/decision-theory.md
  - ../objects/decision-problem.md
see-also:
  - fdt-newcomb-resolution.md
references:
  - references/gibbard-harper1978.md
  - references/jeffrey1965.md
---

# CDT-EDT divergence on Newcomb's problem

## Statement

There exist decision problems on which Causal Decision Theory (CDT) and Evidential Decision Theory (EDT) prescribe different acts.
The canonical examples are *Newcomb's problem* and the *Smoking Lesion*; the divergence is provable from the formal definitions of the two theories.

## Newcomb's problem

A predictor with a long track record of accuracy presents the agent with two boxes: - Box A is transparent and contains $1{,}000. - Box B is opaque and contains either $1{,}000{,}000 or $0, determined by the predictor's prediction: - If the predictor predicted "one-box," B contains $1M. - If the predictor predicted "two-box," B contains $0.

The agent chooses *one-box* (take only B) or *two-box* (take both).
The predictor has already made the prediction.

**EDT.** The act is evidence about what the predictor predicted. $P(\text{predictor predicted one-box} \mid \text{agent one-boxes})$ is high; $P(\text{predictor predicted two-box} \mid \text{agent two-boxes})$ is high.
So $\mathbb{E}_{\text{EDT}}[u \mid \text{one-box}] \approx 1{,}000{,}000$ and $\mathbb{E}_{\text{EDT}}[u \mid \text{two-box}] \approx 1{,}000$. *EDT one-boxes.*

**CDT.** The predictor has *already* made the prediction; the act cannot causally affect the prediction.
The causal expected value of two-boxing is $1{,}000$ more than that of one-boxing (you get the contents of B in either case, plus an extra $1{,}000 from A if you two-box). *CDT two-boxes.*

The two theories give opposite answers.
The predictor's accuracy means the EDT-rational act earns $1M and the CDT-rational act earns $1k.

## Smoking Lesion

A genetic factor causes both a desire to smoke and lung cancer; smoking itself does not cause cancer.
An agent who enjoys smoking and dislikes cancer asks: should I smoke?

**EDT.** Smoking is evidence of having the lesion, hence evidence of cancer. $\mathbb{E}_{\text{EDT}}[u \mid \text{smoke}]$ includes a higher conditional probability of cancer. *EDT abstains.*

**CDT.** Smoking does not cause cancer; the lesion does.
The causal expected value of smoking is just the enjoyment. *CDT smokes.*

Most readers' intuition agrees with CDT here: don't punish yourself for evidence you can't change.
EDT and CDT each give the intuitive answer on one of the two problems, neither on both.

## Why this happens

The divergence arises because the two theories use different expected values:

- EDT uses *evidential expected value*: $\mathbb{E}[u \mid a] = \sum_s P(s \mid a)\, u(o(a, s))$.
- CDT uses *causal expected value*: $\mathbb{E}[u \mid \mathrm{do}(a)] = \sum_s P(s \mid \mathrm{do}(a))\, u(o(a, s))$ where $\mathrm{do}(a)$ severs the causal links into $a$.

When the act is correlated with the state through *non-causal* channels (e.g. a common cause like a predictor or a lesion), the two expectations differ.

## Proof

For any decision problem in which there exists a state $S$ and act $A$ with $P(S \mid A) \ne P(S \mid \mathrm{do}(A))$ — i.e. where act and state are correlated by some non-causal channel — the two theories' expected-value computations differ on at least one act.
If the difference dominates the utility calculation, the theories choose different acts.
Both Newcomb and Smoking Lesion are constructive instances. $\square$

## Why it matters

The divergence shows that classical decision theory does not uniquely determine rational choice under all conditions.
It opens the door to variant decision theories ([Functional Decision Theory](fdt-newcomb-resolution.md), Updateless Decision Theory) that aim to satisfy both intuitions at once.
It also matters operationally for AI agents: a predictor capable of modeling an AI's decision procedure puts the AI in a Newcomblike position with respect to that predictor, and the AI's decision-theoretic substrate determines how it responds.
