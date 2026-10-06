# Ordered-history null: analytic measurement-error benchmark

Work ref: `relational-substrate-order-history-null`

For the synthetic generator

- `Z = a B + b H + eps_z`
- `X = Z + eta`
- `Y = c Z + d H + eps_y`

with `Var(H)=Var(B)=1`, independent noise terms, `q = a^2 + Var(eps_z)`, and `s^2 = Var(eta)`, the population coefficient on history in `Y ~ X + H` is

`beta_H = d + c*b*s^2/(q+s^2)`.

Under endpoint sufficiency (`d = 0`), apparent history information caused only by endpoint measurement error must collapse to zero as `s^2 -> 0`. If a material residual survives exact endpoint measurement, endpoint sufficiency is falsified for that state description; this motivates missing-state search or an explicit history variable, not a metaphysical conclusion.

Acceptance test:
1. Simulate the current generator across decreasing endpoint-noise levels.
2. Check the fitted mean history coefficient follows the analytic curve within Monte Carlo tolerance.
3. Under `d=0`, require the exact-endpoint coefficient to be approximately zero.
4. Under `d=0.35`, require the exact-endpoint coefficient to recover approximately 0.35.
