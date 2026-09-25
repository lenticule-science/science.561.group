---

title: "Combination"
aliases:
  - "combination"
  - "combinations"
date-created: 2026-03-05
tags: []
description: A combination is an unordered selection of objects from a collection — a choice of which objects to include, without regard to the order in which they are chosen.
---

A combination is an unordered selection of objects from a collection — a choice of *which* objects to include, without regard to the order in which they are chosen. From the letters A, B, C, D, the 3-letter combinations are {A,B,C}, {A,B,D}, {A,C,D}, and {B,C,D} — four in total. The arrangement ABC and the arrangement CBA are different [permutations](../terms/permutation.md) but the same combination, because they involve the same three letters.

The number of ways to choose $k$ objects from $n$ is the [binomial coefficient](../terms/binomial-coefficient.md) $\binom{n}{k} = \frac{n!}{k!(n-k)!}$. The formula comes from a simple overcounting argument: the number of $k$-permutations of $n$ objects is $\frac{n!}{(n-k)!}$ (you choose $k$ objects and arrange them). But each combination corresponds to $k!$ permutations (all possible orderings of the same $k$ objects). Dividing the number of permutations by $k!$ eliminates the duplicate orderings and gives the number of combinations.

The distinction between combinations and permutations is the distinction between "does order matter?" In a committee of three people, it does not — the committee {Alice, Bob, Carol} is the same regardless of the order you list them. That is a combination problem. In a president-vice-president-secretary assignment, it does — Alice as president is different from Alice as secretary. That is a permutation problem. Recognizing which type of problem you face is the first step in any counting argument.

Combinations arise throughout probability and statistics. The number of ways to get exactly 3 heads in 10 coin flips is $\binom{10}{3} = 120$ — you are choosing which 3 of the 10 flips come up heads, without caring about the order. The binomial distribution, which gives the probability of exactly $k$ successes in $n$ independent trials, uses $\binom{n}{k}$ as its combinatorial factor.

Blaise Pascal developed the systematic theory of combinations in *Traité du Triangle Arithmétique* (published posthumously, 1665), building on his correspondence with Pierre de Fermat about games of chance (1654). The arithmetic triangle of binomial coefficients was known much earlier — to Yang Hui in China (c. 1261), al-Karaji in Persia (c. 1000 CE), and Bhaskara II in India (*Lilavati*, 1150 CE) — but Pascal was the first to develop its combinatorial and probabilistic implications systematically.
