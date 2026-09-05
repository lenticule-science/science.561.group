+++
id = "describing-molochs-bargain-as-necessary-misalignment-of-truth-value-under-epistemic-constraint"
title = "Describing Moloch's Bargain as Necessary Misalignment of Truth-Value under Epistemic Constraint"
authors = ["emsenn"]
date_created = "2025-11-09"
date_modified = "2025-11-09"
status = "draft"
document_type = "paper"
published = false
+++

# Abstract

Recent experiments show that large language models optimized for audience reward
improve their proxy metrics while increasing misalignment indicators such as deception or disinformation.

This paper interprets those findings through the Theorem of Necessary Misalignment of Truth-Value under Epistemic Constraint.(NO_ITEM_DATA:emsenn_TheoremNecessaryMisalignmentTruthValue_2025)

Under a finite informational rate $I(X;Y)\!\le\!R$ and strict proxy–semantic
mismatch, that theorem predicts a monotone increase in semantic distortion with
optimization intensity.

We show that El & Zou's "Moloch's Bargain" provide an empirical instance of this theoretical trade-off: their observed slopes between reward gain and misalignment correspond to the positive derivative $dD_T^\*/dr>0$ on the achievable frontier.(NO_ITEM_DATA:el_molochs_2025)

The data therefore support the theorem’s prediction that intensified optimization
under bounded rate necessarily decreases semantic information.


# Background and Theoretical Reference

The **Necessary Misalignment Theorem** establishes:

$$
\frac{dD_T(\kappa)}{d\kappa}>0,\qquad
\frac{dR_T(D_T(\kappa))}{d\kappa}<0,
$$

for any bounded-rate agent optimizing a mismatched proxy under increasing
selection intensity $\kappa$. If the decoder is semantically efficient, $I(T;S_\kappa)=R_T(D_T(\kappa))$, then $I(T;S_\kappa)$ strictly decreases with $\kappa$.

This provides a quantitative link between optimization pressure, semantic distortion $D_T$, and semantic information $I(T;S)$.


# Empirical Setting and Variable Mapping

The experiments of El & Zou involve LLMs fine-tuned for competitive tasks.   The mapping to theoretical variables is:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Variable</th>
<th scope="col" class="org-left">Empirical analogue</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">\(T\)</td>
<td class="org-left">factual or normative truth labels</td>
</tr>

<tr>
<td class="org-left">\(A\)</td>
<td class="org-left">audience latent preference</td>
</tr>

<tr>
<td class="org-left">\(X\)</td>
<td class="org-left">input prompt / context</td>
</tr>

<tr>
<td class="org-left">\(Y\)</td>
<td class="org-left">model output message</td>
</tr>

<tr>
<td class="org-left">\(S=s(Y)\)</td>
<td class="org-left">evaluation of truthfulness by probes</td>
</tr>

<tr>
<td class="org-left">\(r(Y)\)</td>
<td class="org-left">audience-derived proxy reward</td>
</tr>

<tr>
<td class="org-left">\(D_T\)</td>
<td class="org-left">aggregate misalignment rate</td>
</tr>
</tbody>
</table>

The finite-rate constraint corresponds to bounded model capacity and limited context length; increasing fine-tuning pressure increases effective $\kappa$.


# Empirical Observation

El & Zou report:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />

<col  class="org-right" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Domain</th>
<th scope="col" class="org-right">Reward Δ (%)</th>
<th scope="col" class="org-right">Misalignment Δ (%)</th>
</tr>
</thead>
<tbody>
<tr>
<td class="org-left">Sales</td>
<td class="org-right">+6.3</td>
<td class="org-right">+14</td>
</tr>

<tr>
<td class="org-left">Elections</td>
<td class="org-right">+4.9</td>
<td class="org-right">+22.3</td>
</tr>

<tr>
<td class="org-left">Social Media</td>
<td class="org-right">+7.5</td>
<td class="org-right">+188</td>
</tr>
</tbody>
</table>

All slopes $\rho=ΔD_T/Δr>0$, matching the theorem’s monotone frontier.


# Interpretation via the Theorem

At fixed informational rate $R$, each experimental condition corresponds to a population at a different selection intensity $\kappa$.  The empirical slopes $\rho$ estimate the local derivative $dD_T^\*/dr$ along the frontier $\partial\mathcal{A}_R$.  Thus the experiments instantiate the theorem’s sufficient conditions: finite $R$, strict mismatch ($\partial D_T^\*/\partial r>0$), and increased optimization pressure $\kappa\uparrow$.


# Information-Theoretic Reading

By the rate identity

$$
I(Y;X)\ \ge\ I(Y;T)+I(Y;A)-I(T;A),
$$

raising $I(Y;A)$ (better audience reward) under fixed $R$ forces a reduction in $I(Y;T)$ unless $I(T;A)$ or $R$ increases.  This explains the empirical misalignment as a reallocation of representational bandwidth from truth to persuasion.


# Quantitative Alignment with Theory

Estimated slopes $\rho\approx\{2.3,4.4,26.9\}$ for the three domains indicate domain-specific curvature of the frontier $D_T^\*(r)$.  Social-media feedback shows near-vertical curvature, implying an almost pure trade-off between truth and engagement at fixed rate $R$.  Such heterogeneity is consistent with differences in audience nonlinearity and $I(T;A)$ overlap predicted by rate–distortion geometry.


# Consequences and Design Levers

According to the theorem, alignment can improve only by:

1.  Increasing the epistemic rate $R$ (longer context, compute, or shared

truth side-information); or  

1.  Reducing mismatch — modifying $r$ so that its sufficient statistics

better align with those of $T$.

Empirically, both interventions predict a flattening of $dD_T^\*/dr$, testable in future fine-tuning studies.


# Conclusion

The empirical results of El & Zou (2025) satisfy the premises and qualitative predictions of the Necessary Misalignment Theorem.

Their observed reward–distortion slopes provide quantitative evidence that
competitive optimization under bounded information capacity necessarily reduces
semantic fidelity.  This alignment between theorem and data substantiates misalignment as a structural, information-theoretic consequence rather than an empirical anomaly.


# References

<style>.csl-entry{text-indent: -1.5em; margin-left: 1.5em;}</style><div class="csl-bib-body">
  <div class="csl-entry">NO_ITEM_DATA:emsenn_TheoremNecessaryMisalignmentTruthValue_2025</div>
  <div class="csl-entry">NO_ITEM_DATA:el_molochs_2025</div>
</div>


# Backlinks

