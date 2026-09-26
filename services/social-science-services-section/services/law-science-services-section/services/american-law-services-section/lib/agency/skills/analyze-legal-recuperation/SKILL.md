---
name: analyze-legal-recuperation
description: Apply the full case-study pipeline to a legal proceeding — identify the evidentiary move, trace its formatting, assess propagation, predict structural effects, check for compounding.
requires-capabilities:
  - read
  - path-corpus
  - markdown-search-workbench
  - term-intension
  - read-term-catalog
  - write
  - markdown-file-workbench
  - utter
  - articulate
  - predicate
  - posit
  - settle
---

# Analyze Legal Recuperation

This is the integration skill: it applies the full five-step case study method to a specific legal proceeding, drawing on the recognition skill (`identify-evidentiary-formatting`), the sector-mapping skill (`map-credentialing-incentives`), and the proceeding-reading skill (`read-a-case-sociologically`).

## When to use

You are investigating how a particular trial or prosecution absorbed a subcultural form, and you want a structured analysis that goes from the courtroom moment to the sector-wide structural effect.

## How it works

1. **Identify the evidentiary move.** Find the moment(s) where a cultural practice was entered as character evidence. Note:
   - What practice was entered.
   - What it was entered as evidence of.
   - Who entered it (which legal person).
   - What community perspective is absent.

2. **Trace the formatting.** Apply the four-step model:
   - **Selection** — why this practice and not others?
   - **Decontextualization** — what social relations were stripped?
   - **Reattachment** — what legal proposition does it now support?
   - **Standardization** — can any institution reproduce it without community contact?

3. **Analyze propagation pathway.** Assess which channels carry the evidentiary move:
   - Direct citation in future proceedings (likely / unlikely?).
   - Professional diffusion through attorney networks (how wide is the sector?).
   - Institutional risk management adoption (how risk-averse is the sector?).
   - Estimated timescale for full propagation.

4. **Map structural effects.** Predict:
   - **Credentialing** — will institutions adopt the practice as a compliance artifact?
   - **Homogenization** — will the range of acceptable forms narrow?
   - **Displacement** — will the subcultural practice's meaning shift?

5. **Assess compounding.** Three conditions:
   - Mature market pathway for this practice (commercial infrastructure).
   - Established legal pathway (precedent, professional awareness).
   - Institutional capacity (organizations that can adopt).
   - All three present → compounding active. Document the interaction.

## Comparison checklist

After completing the analysis, compare to the prairieland reference case:

| Dimension | Prairieland | Your case |
|---|---|---|
| Practice formatted | Zine production | ? |
| Evidentiary function | Institutional good faith | ? |
| Community absent | Zine scene | ? |
| Market pathway mature | Yes | ? |
| Propagation speed | Months | ? |
| Compounding active | Yes | ? |

## Output

A written analysis following the five-step structure, with the comparison checklist filled. Note the analysis's limits — what community responses or contextual factors the structural framework can't capture.

## Related skills

- `read-a-case-sociologically` — the prerequisite reading method.
- `identify-evidentiary-formatting` — recognition at the institutional adoption moment.
- `map-credentialing-incentives` — model the sector-wide incentive structure.
