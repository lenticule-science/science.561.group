---
title: Thermodynamics Coverage Reference
description: Generated reference page listing Lean modules, Blueprint claim-site counts, and inherited Diataxis coverage for Thermodynamics.
date-created: 2026-06-30
keywords:
  - obsmetrologia
  - reference
  - generated
  - coverage
  - thermodynamics
---
# Thermodynamics Coverage Reference

Temperature and thermodynamic readings downstream of closure, valuation, flow, reaction, and probability-like carriers.

## Diataxis Pages

| Mode | Path |
| --- | --- |
| Tutorial | `tutorials/thermodynamics-path.md` |
| Guide | `guides/thermodynamics-maintenance.md` |
| Explanation | `explanations/thermodynamics.md` |
| Reference | `references/thermodynamics-coverage.md` |
| Concept atlas | `references/thermodynamics-concept-atlas.md` |
| Term ledger | `references/thermodynamics-term-ledger.md` |

## Lean Modules

| Module | Path |
| --- | --- |
| `Obsmetrologia.Thermodynamics` | `Obsmetrologia/Thermodynamics.lean` |
| `Obsmetrologia.Thermodynamics.Temperature` | `Obsmetrologia/Thermodynamics/Temperature.lean` |

## Blueprint Claims

| Status | Kind | Label | Title | Lean | Path |
| --- | --- | --- | --- | --- | --- |
| leanok | theorem | `thm:finite-thermodynamic-transition-production` | Finite thermodynamic transition production | `Obsmetrologia.Thermodynamics.Temperature.LiftedThermoTransition.produces_creation_landauer_and_discharge` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/02-value-category-and-stochastic-reals.tex` |
| leanok | theorem | `thm:zero-temperature-recovery` | Zero-temperature recovery | `Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow.recovers_nat_lyapunov`, `Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow.hard_closure_laws`, `Obsmetrologia.Thermodynamics.Temperature.zero_temperature_recovers_nat_lyapunov` | `docs/blueprint/src/chapters/phase-invariants/transfinite-values/02-value-category-and-stochastic-reals.tex` |
| leanok | theorem | `thm:temperature-bridge-glass-rung` | Temperature bridge and glass rung | `Obsmetrologia.Thermodynamics.Temperature.ZeroTemperatureFlow.recovers_nat_lyapunov`, `Obsmetrologia.Thermodynamics.Temperature.zero_temperature_recovers_nat_lyapunov`, `Obsmetrologia.Thermodynamics.Temperature.balancedTemperature_unique`, `Obsmetrologia.Thermodynamics.Temperature.rational_temperature_unique`, `Obsmetrologia.Thermodynamics.Temperature.stationary_temperature_unique`, `Obsmetrologia.Thermodynamics.Temperature.detailed_balance_temperature_unique`, `Obsmetrologia.Relational.Material.Glass.Substance.BasinThermalization.temperature_unique`, `Obsmetrologia.Relational.Material.Glass.Substance.BasinFreeEnergyBridge.temperature_bridge_and_glass_rung`, `Obsmetrologia.Relational.Material.Glass.Substance.RatBasinFreeEnergyBridge.produces_connectivity_glass_rung` | `docs/blueprint/src/chapters/relational-physics/material-states/02-topology-and-glass.tex` |



## Caution

Do not import external thermodynamics as explanatory ground; name the local carrier first.
