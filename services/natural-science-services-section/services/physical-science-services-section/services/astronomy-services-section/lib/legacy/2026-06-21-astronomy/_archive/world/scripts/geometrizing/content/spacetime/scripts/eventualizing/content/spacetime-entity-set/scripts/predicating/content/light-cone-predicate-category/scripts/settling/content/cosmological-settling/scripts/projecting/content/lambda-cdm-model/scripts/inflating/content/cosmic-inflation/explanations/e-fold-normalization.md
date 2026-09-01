---
name: e-fold-normalization
kind: morphism
symbol: "ν: restriction-frequencies → e-fold weights"
description: "The map from the big-bang-restriction's surviving-letter data to the additive e-fold weights w_a, w_b of the cosmic-scott Fibonacci skeleton. A value-category map (frequency → e-fold/log space), a dequantizing (Maslov) composition. The surviving-letter frequency ratio has exact closed form f_a/f_b = 1/(L−1) = L²/(L+1) (L = tribonacci constant); the e-fold weight is its log, giving additive tension ln L − ½ln(L+1) = 0.0876 and parameter-free predicted ratio H_late/H_early = 1.0916. Of the two canonical weight-readings, data selects frequency (left eigenvector): the tile-length (right eigenvector) reading gives 0.305 and is excluded. A postdiction on a posited chain, within current ~1σ error."
member-of: big-bang-restriction
kind-of: dequantizing-composition
domain: big-bang-restriction
codomain: cosmic-scott-skeleton
status: hacking
---

**E-fold-normalization** maps the [`big-bang-restriction`](../../big-bang-restriction.md)'s surviving-letter data to the additive **e-fold weights** $w_a, w_b$ of the [`cosmic-scott-skeleton`](../../../../../../../library/cosmic-scott-skeleton/cosmic-scott-skeleton.md).
It is a **value-category map** (frequency-space → e-fold/log-space), a [`dequantizing`](../../../../../../../library/dequantizing/dequantizing.md) (Maslov) composition.

## Exact closed form

Tribonacci letter frequencies are the normalized **left** Perron eigenvector (archive `pisot-accumulation-image-length-connection`: left eigenvector = frequencies, right = tile lengths).
Solving $M^{\mathsf T}x = Lx$ gives $x = (1,\ L-1,\ 1/L)$, so the surviving-letter frequency ratio is exact:

$$\frac{f_a}{f_b} = \frac{1}{L-1} = \frac{L^2}{L+1} = 1.191488\ldots, \qquad L = \text{tribonacci constant }(L^3=L^2+L+1).$$

The e-fold weight is the log (dequantized) frequency, so the additive tension is

$$\frac{|w_a-w_b|}{2} = \tfrac12\ln\frac{1}{L-1} = \ln L - \tfrac12\ln(L+1) = 0.08760\ldots$$

## Prediction vs data (parameter-free)

Predicted multiplicative ratio $e^{0.08760} = \mathbf{1.0916}$, from the tribonacci constant alone:

| | value |
|---|---|
| prediction $H_{\text{late}}/H_{\text{early}}$ | **1.0916** |
| observed $73.04/67.36$ (SH0ES / Planck18) | 1.0843 |
| predicted $H_{\text{late}}$ at Planck 67.36 vs obs $73.04\pm1.04$ | 73.53 → **0.5σ** |

(Planck 67.4 / SH0ES 73.2 → 0.3σ; DESI+CMB 67.97 / SH0ES → 1.1σ.)

## Data selects the frequency reading

Two canonical weight-readings; the data discriminates:

- **frequency** (left eigenvector): tension 0.0876 → ratio 1.0916 → **0.5σ**.
  Viable.
- **tile length** (right eigenvector, $f_a/f_b = L$): tension $\tfrac12\ln L = 0.305$ → ratio 1.36 → **excluded** (tens of σ).
