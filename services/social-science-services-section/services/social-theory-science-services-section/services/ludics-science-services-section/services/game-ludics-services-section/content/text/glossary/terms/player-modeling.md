---
name: "Player Modeling"
description: "Classifying players into behavioral types by applying unsupervised clustering to their recorded telemetry, a method originating in Anders Drachen's 2009 study of Tomb Raider: Underworld."
instance-of: concept
date-created: 2026-08-22
references:
  drachen2014:
    authors: ["Anders Drachen", "Christian Thurau", "Rafet Sifa", "Christian Bauckhage"]
    title: "A Comparison of Methods for Player Clustering via Behavioral Telemetry"
    publication: "IEEE Transactions on Computational Intelligence and AI in Games (arXiv:1407.3950)"
    year: 2014
---

Player modeling is the practice of classifying players into behavioral types by applying unsupervised clustering to their recorded game-telemetry. Its founding paper is Drachen, Canossa and Yannakakis's "Player Modeling using Self-Organization in Tomb Raider: Underworld" (IEEE CIG, 2009). This entry could not obtain that 2009 paper directly; what is reported here is drawn from its detailed description in the authors' own 2014 follow-up, which was read in full. That follow-up describes the founding result exactly: it "classified the behavior of 1365 players of Tomb Raider: Underworld, using Self-Organizing Networks and k-means clustering, locating four classes of user behavior that encompassed over 90 percent of the users in the dataset. These were translated into design terminology for use by the game's developers, Crystal Dynamics" — the first documented instance of the telemetry-to-clustering-to-design-vocabulary loop this literature describes.

The 2014 follow-up, Drachen, Thurau, Sifa and Bauckhage's "A Comparison of Methods for Player Clustering via Behavioral Telemetry," extends the method to six years of World of Warcraft playtime and leveling data — 70,014 players sampled from roughly 18 million character records — and compares four clustering techniques: k-means, non-negative matrix factorization (NMF), principal component analysis (PCA), and Archetypal Analysis via Simplex Volume Maximization. Its finding is methodologically load-bearing for anyone doing this kind of work: k-means and Archetypal Analysis, which finds extreme points on the data's convex hull rather than averages, both produce human-interpretable player types such as "casual player" and "hardcore player," while PCA and NMF produce mathematically valid but uninterpretable factorizations that sometimes correspond to behaviors impossible in the actual game, such as players losing levels.

The stakes of that finding are worth stating plainly: the choice of clustering method itself determines whether the resulting player model is a legible claim about real player behavior, independent of how well the method fits the data statistically. A model can fit well and still describe no player who could ever exist.

Player modeling shares its raw material with two neighboring terms: it consumes exactly the data described under game-telemetry, and the same clustering apparatus that sorts players by playstyle is structurally identical to the apparatus economists such as EVE's Guðmundsson used to sort players by spending and economic footprint, and to what the GTA Online literature (see whale) uses to identify high-spending, low-productivity players.
