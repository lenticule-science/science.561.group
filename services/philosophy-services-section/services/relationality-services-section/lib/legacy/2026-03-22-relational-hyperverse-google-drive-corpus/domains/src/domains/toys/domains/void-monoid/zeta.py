# zeta.py — spectral structure of the DPM partition function
#
# The grade stats give count sequences at each grade n.
# Each sequence has an asymptotic growth rate = a pole of its generating function.
# In beta-space (z = e^{-beta}), poles are phase transitions.
#
# Old drafts predicted beta_c = ln(phi) ~ 0.481 (Fibonacci pole, assuming F=empty).
# We show F != empty -> PS follows Padovan -> actual pole at ln(rho) ~ 0.281
# where rho ~ 1.3247 is the plastic number (rho^3 = rho + 1).

import sys, time, math
sys.path.insert(0, '.')
from pewpew import *

G   = dpm["generators"]
byp = dpm["bypasses"]

# ---------------------------------------------------------------------------
# Collect grade stats up to n=13 (or until slow)

print("Computing grade stats...")
rows = []
for n in range(14):
    t0 = time.time()
    total, ps, ns, ds, nc, mx = grade_stats(n, G, byp)
    dt = time.time() - t0
    # Four positions:  DS | S=PS-DS | T=NS-DS | F=Total-PS-NS+DS
    s = ps - ds
    t = ns - ds
    f = total - ps - ns + ds
    rows.append((n, total, ps, ns, ds, nc, s, t, f))
    print(f"  n={n:>2}: total={total:>7}  PS={ps:>6}  NS={ns:>5}  DS={ds:>3}"
          f"  S={s:>5}  T={t:>5}  F={f:>6}  NC={nc:>5}  ({dt:.2f}s)")
    if dt > 5:
        print("  (stopping)")
        break

print()

# ---------------------------------------------------------------------------
# Growth ratios — identify eigenvalues numerically

print("Asymptotic growth rates (ratio test):")
print(f"  {'n':>3}  {'Total':>8}  {'PS':>8}  {'NS':>8}  {'DS':>8}  {'F':>8}  {'NC':>8}")
for i in range(3, len(rows)):
    n0 = rows[i-1]
    n1 = rows[i]
    def ratio(col):
        a, b = n0[col], n1[col]
        return f"{b/a:.5f}" if a > 0 else "  ---  "
    print(f"  {n1[0]:>3}  {ratio(1):>8}  {ratio(2):>8}  {ratio(3):>8}"
          f"  {ratio(4):>8}  {ratio(8):>8}  {ratio(5):>8}")

print()

# Known analytic values:
phi  = (1 + math.sqrt(5)) / 2          # golden ratio ~ 1.618
rho  = 1.3247179572447460259           # plastic number, rho^3 = rho + 1
print(f"Known eigenvalues:")
print(f"  Total growth:    3        -> beta = ln(3)   = {math.log(3):.5f}")
print(f"  PS (Padovan):    rho      -> beta = ln(rho) = {math.log(rho):.5f}  (plastic number)")
print(f"  NS growth:       2        -> beta = ln(2)   = {math.log(2):.5f}")
print(f"  DS growth:       1 (poly) -> beta = ln(1)   = 0.00000  (double pole)")
print(f"  [OLD DRAFT predicted: phi -> beta = ln(phi) = {math.log(phi):.5f}]  (golden ratio, F=empty assumption)")
print()

# ---------------------------------------------------------------------------
# Partition functions  Z(beta) = sum_n count(n) * e^{-beta*n}
# evaluated at discrete beta values — shows which pole dominates

betas = [0.10, 0.20, math.log(rho), 0.35, math.log(phi), math.log(2), 0.80, math.log(3), 1.20]

print("Partition functions Z(beta) by position type:")
print(f"  {'beta':>8}  {'Z_total':>12}  {'Z_PS':>12}  {'Z_NS':>12}  {'Z_DS':>12}  {'Z_F':>12}")

for beta in betas:
    z = math.exp(-beta)
    Z_total = sum(r[1] * z**r[0] for r in rows)
    Z_ps    = sum(r[2] * z**r[0] for r in rows)
    Z_ns    = sum(r[3] * z**r[0] for r in rows)
    Z_ds    = sum(r[4] * z**r[0] for r in rows)
    Z_f     = sum(r[8] * z**r[0] for r in rows)

    label = ""
    if abs(beta - math.log(rho)) < 0.001: label = " <- ln(rho), plastic"
    if abs(beta - math.log(phi)) < 0.001: label = " <- ln(phi), golden [old draft beta_c]"
    if abs(beta - math.log(2))   < 0.001: label = " <- ln(2),   NS"
    if abs(beta - math.log(3))   < 0.001: label = " <- ln(3),   Total"

    print(f"  {beta:>8.4f}  {Z_total:>12.3f}  {Z_ps:>12.3f}  {Z_ns:>12.3f}"
          f"  {Z_ds:>12.3f}  {Z_f:>12.3f}{label}")

print()

# ---------------------------------------------------------------------------
# The NC sequence and its eigenvalue

print("NC sequence and growth:")
nc_rows = [(r[0], r[5]) for r in rows if r[5] > 0]
for i in range(1, len(nc_rows)):
    n, nc  = nc_rows[i]
    _, nc0 = nc_rows[i-1]
    # also: what fraction of F is NC?
    f = rows[n][8]
    print(f"  n={n}: NC={nc:>5}  ratio={nc/nc0:.4f}  NC/F={nc/f:.4f}  NC/Total={nc/rows[n][1]:.4f}")

print()

# ---------------------------------------------------------------------------
# Transfer matrix for (S, T, F) — does it have plastic eigenvalues?
# Fit: [S(n+1), T(n+1), F(n+1)] = M * [S(n), T(n), F(n)] + correction
# (not exact since S and T have sub-leading polynomial corrections)
# Instead: fit the purely-exponential dominant parts

print("Dominant growth of each position type:")
for col, name in [(6,'S'), (7,'T'), (8,'F')]:
    vals = [r[col] for r in rows]
    # fit ratio at large n
    ratios = [vals[i]/vals[i-1] for i in range(4, len(vals)) if vals[i-1] > 0]
    if ratios:
        avg = sum(ratios[-3:]) / len(ratios[-3:])
        print(f"  {name}: late ratios = {[f'{r:.4f}' for r in ratios[-4:]]}"
              f"  -> dominant eigenvalue ~ {avg:.5f}")

print()
print(f"  Compare: rho = {rho:.5f},  2 = 2.00000,  3 = 3.00000")
print(f"  Plastic number rho solves x^3 = x + 1")
print()

# ---------------------------------------------------------------------------
# The product formula — does Z factor?
# Z_total(z) ~ 1/(1-3z)
# Z_PS(z) ~ (numerator)/(1-z^2-z^3) — Padovan poles
# Z_NS(z) ~ 1/(1-2z)
# Z_DS(z) ~ 1/(1-z)^2
#
# Old draft: Z(beta) = 1/((1-z)^2 * (1-z-z^2))  [Fibonacci, F=empty]
# Corrected: the Possible-settled piece has poles at roots of 1-z^2-z^3=0 [Padovan, F!=empty]

print("Pole locations of each generating function:")
print(f"  Z_total:  pole at z = 1/3     = {1/3:.5f}  -> beta = {math.log(3):.5f}")
print(f"  Z_PS:     pole at z = 1/rho   = {1/rho:.5f}  -> beta = {math.log(rho):.5f}  (Padovan dominant)")
print(f"  Z_NS:     pole at z = 1/2     = {1/2:.5f}  -> beta = {math.log(2):.5f}")
print(f"  Z_DS:     pole at z = 1 (x2)  = {1.0:.5f}  -> beta = {0.0:.5f}  (polynomial growth)")
print()
print(f"  Old draft Z(z) = 1/((1-z)^2 (1-z-z^2)):")
print(f"    poles: z=1 (double), z=1/phi={1/phi:.5f} (Fibonacci)")
print(f"    predicted beta_c = ln(phi) = {math.log(phi):.5f}")
print()
print(f"  Corrected Z_PS(z) has Padovan poles, not Fibonacci:")
print(f"    first real pole at z=1/rho={1/rho:.5f}")
print(f"    actual first beta_c = ln(rho) = {math.log(rho):.5f}")
print(f"    correction factor: ln(rho)/ln(phi) = {math.log(rho)/math.log(phi):.5f}")
