---

title: "Prior"
aliases:
  - "prior"
  - "prior probability"
  - "prior distribution"
date-created: 2026-01-01
tags: []
---

A prior is a [probability](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/probability.md) distribution that represents what you believe about a hypothesis before seeing any evidence. It is the starting point of Bayesian inference — the baseline against which new data are weighed. If you are estimating the bias of a coin, the prior encodes your initial uncertainty: maybe you believe the coin is probably fair (prior concentrated near $p = 0.5$), or maybe you know nothing and consider all values equally plausible (uniform prior over $[0, 1]$).

Bayes' theorem updates the prior using the [likelihood](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/likelihood.md) to produce the [posterior](../../../../../../../../../../../../../../../../../../../../../../../../../content/text/glossary/terms/posterior.md): $P(H \mid E) = P(E \mid H) \cdot P(H) / P(E)$. The prior's influence depends on how strong it is. A strong prior — one concentrated on specific hypotheses — takes substantial evidence to overcome. If you are deeply confident the coin is fair, a few anomalous flips won't shift your belief much. A weak or flat prior — one spread broadly — lets the data dominate from the start. The choice of prior is the most discussed aspect of Bayesian statistics, because it is the main source of subjectivity: two analysts with different priors can reach different posteriors from the same data.

This subjectivity is both the strength and the vulnerability of Bayesian reasoning. The strength is that priors let you incorporate real background knowledge — a doctor's clinical experience, a physicist's theoretical constraints, an engineer's domain expertise. The vulnerability is that poorly chosen priors can bias conclusions, especially with small datasets. The Bayesian response is that all inference involves assumptions (frequentist methods are not assumption-free), and that making assumptions explicit, as priors do, is better than hiding them.

Several families of priors have special importance. An uninformative prior attempts to express maximal ignorance — to let the data speak without prejudice. The simplest version is the uniform distribution (all values equally likely), but for continuous parameters the uniform distribution depends on the parameterization: uniform on $p$ is not uniform on $\log p$. Harold Jeffreys proposed a principled solution in *Theory of Probability* (1939): the Jeffreys prior $\pi(\theta) \propto \sqrt{I(\theta)}$, where $I(\theta)$ is the Fisher information, is invariant under reparameterization.

A conjugate prior is one whose mathematical form is preserved by the updating process. If the prior is a beta distribution and the likelihood is binomial, the posterior is also a beta distribution — just with updated parameters. This conjugacy makes computation tractable and gives closed-form posteriors. The beta-binomial, normal-normal, and gamma-Poisson pairs are the most commonly used conjugate families.

As evidence accumulates, the influence of the prior diminishes. This is the asymptotic guarantee of Bayesian inference: with enough data, different priors converge to the same posterior. The data eventually overwhelm any prior, provided the prior assigns nonzero probability to a neighborhood of the true parameter value. This convergence justifies the Bayesian framework even for skeptics of subjective priors — in the long run, the starting point does not matter.
