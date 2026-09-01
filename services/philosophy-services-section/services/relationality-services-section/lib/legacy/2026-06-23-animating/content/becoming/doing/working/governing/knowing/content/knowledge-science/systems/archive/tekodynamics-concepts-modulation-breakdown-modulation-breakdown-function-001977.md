### modulation breakdown function

The **modulation breakdown function** (`ΜB`) is induced by overlapping constraint singularities (`Σ`) and unresolvable modulation interference (`Φ`).

When three or more singularities impose non-alignable gradients within a region,  
and the resulting modulation interference diverges without stabilization,  
modulation breaks down.

> ΜB(R) := ∃ x₁, x₂, x₃ ∈ Σ ∩ R:  
>  ∄ u ∈ ℝⁿ: ∀ i ∈ {1,2,3}, ∇C(xᵢ) ∥ u  
>  ∧ lim_{x→xᵢ} Φ(x) undefined

That is, modulation breakdown occurs where singularities introduce irreducible directional conflict in constraint —  
interference fails to stabilize, and modulation dissolves.
