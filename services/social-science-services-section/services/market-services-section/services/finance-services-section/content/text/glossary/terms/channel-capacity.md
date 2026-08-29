---
title: "Channel Capacity"
date-created: 2026-08-27
aliases:
  - "channel capacity"
  - "information rate"
description: "The supremum of reliably achievable communication rates for a specified noisy channel, connected under particular fair-odds gambling models to the growth value of side information."
references: {}
---

**Channel capacity** is the supremum of rates at which information can be transmitted over a specified channel with error probability made arbitrarily small under the channel and coding assumptions. For a memoryless channel it is obtained by maximizing mutual information between input and output over admissible input distributions.

Kelly's gambling construction creates a precise connection between information and wealth growth under particular assumptions. In a repeated fair-odds model with side information, the increase in optimal expected log-growth attributable to that information is a mutual-information quantity. For a channel optimized over its input distribution, the corresponding maximum is channel capacity.

The equality is not a universal conversion from every trading signal into guaranteed financial return. It depends on the outcome distribution, odds or market prices, admissible bets, repeated-game structure, and absence or treatment of costs. With unfair odds, constrained positions, correlated outcomes, price impact, or model error, the growth value of information differs.

For sequential systems with feedback or causal side information, directed-information quantities can replace ordinary mutual information in suitably defined models. They prevent a model from crediting future observations to an earlier decision, but they do not by themselves establish an executable edge.

See the general [information-theory treatment](../../../../../../../../../information-science-services-section/services/information-theory-services-section/content/text/documents/articles/teaching-articles/explanations/channel-capacity-and-coding.md) and the [Kelly criterion](./kelly-criterion.md).
