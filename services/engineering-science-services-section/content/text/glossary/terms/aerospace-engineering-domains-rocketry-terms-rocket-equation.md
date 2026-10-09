---
name: "Rocket Equation"
date-created: 2026-03-06
---

The Tsiolkovsky equation relating a rocket's velocity change to its exhaust velocity and mass ratio — the tyrannical constraint governing all chemical spaceflight.

The Tsiolkovsky rocket equation relates a rocket&rsquo;s achievable velocity change ([delta-v](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/delta-v.md)) to its exhaust velocity and [mass ratio](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/mass-ratio.md):

Δv = v_e × ln(m₀ / m_f)

where v_e is the effective exhaust velocity (= I_sp × g₀), m₀ is the initial mass (including propellant), m_f is the final mass (after propellant is consumed), and ln is the natural logarithm.

Rearranging to find the required mass ratio:

m₀ / m_f = e^(Δv / v_e)

This exponential relationship is the &ldquo;tyranny of the rocket equation.&rdquo; Small increases in required delta-v demand exponentially more propellant:

Δv / v_e
Mass ratio (m₀/m_f)
Propellant fraction

0.5
1.65
39%

1.0
2.72
63%

2.0
7.39
86%

3.0
20.1
95%

4.0
54.6
98.2%

Reaching LEO requires Δv ≈ 9.4 km/s (including gravity and drag losses). With kerosene/LOX (v_e ≈ 3,100 m/s), Δv/v_e ≈ 3.0, requiring a mass ratio of ~20. With hydrogen/LOX (v_e ≈ 4,400 m/s), Δv/v_e ≈ 2.1, requiring a mass ratio of ~8. These ratios explain why rockets are mostly propellant — and why [staging](../../../../services/aerospace-engineering-science-services-section/services/rocketry-services-section/content/text/glossary/terms/staging.md) is necessary.

### Why the equation is tyrannical

The exponential means that carrying more payload requires disproportionately more propellant. But more propellant means heavier tanks. Heavier tanks increase m_f, worsening the mass ratio. Heavier tanks also need more structural support, which adds more mass. Each kilogram of payload at the top of a rocket may require 50–100 kg of propellant and structure at the bottom. This cascading effect is why orbital launch vehicles are enormous compared to their payloads.

### What the equation ignores

The ideal rocket equation assumes:

- No gravity (no gravity losses from fighting Earth&rsquo;s pull during ascent)

- No atmospheric drag

- Constant exhaust velocity

- All propellant is consumed

Real rockets face gravity losses of 1,000–1,500 m/s and drag losses of 100–400 m/s during ascent, which is why the required Δv to LEO is ~9.4 km/s rather than the orbital velocity of 7.8 km/s.

### Historical note

Konstantin Tsiolkovsky derived this equation in 1903, before any liquid-fueled rocket had ever been built. Hermann Oberth independently derived it in 1923, and Robert Goddard likely knew it before his first liquid rocket flight in 1926. The equation is exact — there is no more advanced version. Every improvement in rocket performance comes from either increasing v_e (better propellants, better nozzle design) or improving the structural efficiency that determines how much of m₀ can be propellant.
