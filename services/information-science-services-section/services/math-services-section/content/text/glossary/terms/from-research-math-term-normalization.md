---
title: "Normalization"
type: "term"
date-created: 2026-03-29
---

Requires

- measure
- division

Normalization is dividing a quantity by a base to make it comparable. Raw numbers are hard to compare — a site earning 500from100,000pageviewsandasiteearning500 from 100,000 pageviews and a site earning 50 from 1,000 pageviews look different until you normalize by pageviews: 5RPMvs5 RPM vs 50 RPM.

The base you normalize against determines what the resulting ratio means. Dividing revenue by pageviews gives you revenue per pageview. Dividing by sessions gives you revenue per visit. The choice of denominator frames the comparison.

In mathematics, normalization rescales values to a standard range or divides out a common factor so that the structure rather than the scale is visible. A unit vector is a vector normalized by its length. A probability distribution is a measure normalized so the total is 1.

When this library uses `normalizes` as a predicate, the subject is a ratio metric and the object is its denominator — the base it divides by to produce a rate.
