"""
Quasicrystalline visualization of the Relational Hyperverse -- version 2.

Dark field with two overlapping geometric light-networks:
  - BLUE-CYAN network: the sigma nucleus (saturation, backward)
  - AMBER-GOLD network: the delta nucleus (transfer, forward)
  - WHITE-GOLD stars: the joint fixed points H*

The two networks have incommensurable spacings (ratio phi), so they
can never fully synchronize. The quasicrystalline structure is their
eternal near-miss — aperiodic, relatively dense, uniquely ergodic.

Each network is 5 families of parallel lines at 72-degree intervals.
The five-fold symmetry comes from the golden ratio: cos(2pi/5) = (phi-1)/2.
"""

from pathlib import Path
import numpy as np
BUILD_ART = Path(__file__).parent.parent.parent / "build" / "art"
BUILD_ART.mkdir(parents=True, exist_ok=True)
import matplotlib.pyplot as plt

phi = (1 + np.sqrt(5)) / 2

# --- Resolution and domain ---
res = 4000
span = 10.0
x = np.linspace(-span, span, res)
y = np.linspace(-span, span, res)
X, Y = np.meshgrid(x, y)

n_fold = 5

# ──────────────────────────────────────────────
# Edge detection: find the grid lines of each nucleus
# cos(2*pi*freq*proj) = 0 at the grid lines.
# exp(-cos^2 / width^2) peaks at those zero-crossings.
# Two widths: thin (geometric edges) and wide (glow/bloom).
# ──────────────────────────────────────────────

sigma_thin = np.zeros_like(X)
sigma_glow = np.zeros_like(X)
delta_thin = np.zeros_like(X)
delta_glow = np.zeros_like(X)
sigma_fill = np.zeros_like(X)
delta_fill = np.zeros_like(X)

for i in range(n_fold):
    angle = 2 * np.pi * i / n_fold
    kx, ky = np.cos(angle), np.sin(angle)
    proj = kx * X + ky * Y

    # Sigma: frequency 1
    cs = np.cos(2 * np.pi * proj)
    sigma_thin += np.exp(-cs**2 / 0.008)
    sigma_glow += np.exp(-cs**2 / 0.06)
    sigma_fill += cs

    # Delta: frequency phi
    cd = np.cos(2 * np.pi * phi * proj)
    delta_thin += np.exp(-cd**2 / 0.008)
    delta_glow += np.exp(-cd**2 / 0.06)
    delta_fill += cd

    # Second harmonic for richer texture
    cs2 = np.cos(4 * np.pi * proj)
    cd2 = np.cos(4 * np.pi * phi * proj)
    sigma_thin += 0.3 * np.exp(-cs2**2 / 0.008)
    sigma_glow += 0.15 * np.exp(-cs2**2 / 0.04)
    delta_thin += 0.3 * np.exp(-cd2**2 / 0.008)
    delta_glow += 0.15 * np.exp(-cd2**2 / 0.04)

# Normalize
for arr in [sigma_thin, sigma_glow, delta_thin, delta_glow]:
    arr /= arr.max()

sigma_fill /= np.abs(sigma_fill).max()
delta_fill /= np.abs(delta_fill).max()

# ──────────────────────────────────────────────
# Fixed points: where both networks intersect
# ──────────────────────────────────────────────

joint_thin = (sigma_thin * delta_thin)
joint_thin = (joint_thin / joint_thin.max()) ** 0.4  # boost

joint_glow = (sigma_glow * delta_glow)
joint_glow = (joint_glow / joint_glow.max()) ** 0.3  # softer boost

# ──────────────────────────────────────────────
# Subtle cell fill: stained-glass effect
# Use tanh to create flat regions with soft edges
# ──────────────────────────────────────────────

cell_sigma = 0.5 * (1 + np.tanh(3 * sigma_fill))  # [0, 1], flat plateaus
cell_delta = 0.5 * (1 + np.tanh(3 * delta_fill))

# ──────────────────────────────────────────────
# Vignette
# ──────────────────────────────────────────────
R_dist = np.sqrt(X**2 + Y**2)
vignette = np.exp(-0.5 * (R_dist / (span * 0.78)) ** 3)

# ──────────────────────────────────────────────
# Color assembly
# ──────────────────────────────────────────────

# Background: very dark with subtle blue tint
bg_r = 0.008
bg_g = 0.005
bg_b = 0.02

# Subtle cell fill (the "stained glass" behind the lines)
fill_r = 0.025 * cell_delta * (1 - 0.3 * cell_sigma)
fill_g = 0.008 * (cell_sigma * cell_delta)
fill_b = 0.025 * cell_sigma * (1 - 0.3 * cell_delta)

# Sigma network: blue-cyan glow + bright cyan lines
s_r = 0.02 * sigma_glow + 0.06 * sigma_thin
s_g = 0.10 * sigma_glow + 0.28 * sigma_thin
s_b = 0.22 * sigma_glow + 0.55 * sigma_thin

# Delta network: amber-gold glow + bright gold lines
d_r = 0.28 * delta_glow + 0.65 * delta_thin
d_g = 0.14 * delta_glow + 0.35 * delta_thin
d_b = 0.01 * delta_glow + 0.04 * delta_thin

# Joint fixed points: bright white-gold STARS
j_r = 0.7 * joint_glow + 1.0 * joint_thin
j_g = 0.6 * joint_glow + 0.9 * joint_thin
j_b = 0.4 * joint_glow + 0.7 * joint_thin

# Combine all layers
r = np.clip((bg_r + fill_r + s_r + d_r + j_r) * vignette, 0, 1)
g = np.clip((bg_g + fill_g + s_g + d_g + j_g) * vignette, 0, 1)
b = np.clip((bg_b + fill_b + s_b + d_b + j_b) * vignette, 0, 1)

# Gamma correction for depth
gamma = 0.82
r = r ** gamma
g = g ** gamma
b = b ** gamma

rgb = np.stack([r, g, b], axis=-1)
rgb = np.clip(rgb, 0, 1)

# ──────────────────────────────────────────────
# Render
# ──────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(20, 20), dpi=200)
ax.imshow(rgb, extent=[-span, span, -span, span], interpolation='lanczos', origin='lower')
ax.axis('off')
plt.subplots_adjust(left=0, right=1, top=1, bottom=0)
out = BUILD_ART / 'quasicrystal-2.png'
plt.savefig(out, bbox_inches='tight', pad_inches=0, dpi=200, facecolor='black')
plt.close()

print(f"Saved build/art/quasicrystal-2.png ({res}x{res}, 200 dpi)")
print(f"phi = {phi:.10f}")
