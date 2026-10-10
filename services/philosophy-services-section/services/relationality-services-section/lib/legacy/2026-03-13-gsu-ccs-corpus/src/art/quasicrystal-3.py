"""
The Relational Hyperverse -- version 3.

Glowing geometric web emerging from void. Looking down the tower.

- Center = maximum tower depth (8 levels of detail)
- Edge = ground level (coarse structure only)
- Blue-cyan lines: sigma grid (saturation nucleus)
- Amber-gold lines: delta grid (transfer nucleus)
- White-hot vertices: joint fixed points H*
- Deep black: void (neither nucleus active)
- Concentric rings: tower level boundaries
- Central bright point: the Zeno residual
"""

from pathlib import Path
import numpy as np
BUILD_ART = Path(__file__).parent.parent.parent / "build" / "art"
BUILD_ART.mkdir(parents=True, exist_ok=True)
import matplotlib.pyplot as plt

phi = (1 + np.sqrt(5)) / 2

res = 4096
span = 8.0
x = np.linspace(-span, span, res)
y = np.linspace(-span, span, res)
X, Y = np.meshgrid(x, y)
R = np.sqrt(X**2 + Y**2) + 1e-10

n_fold = 5
n_tower = 8

# ── Tower depth: center is deep, edges shallow ──
depth_field = n_tower * np.exp(-(R / (span * 0.62)) ** 2.5)

# ── Multi-scale edge detection ──
# At each tower level, detect the EDGES of both nucleus gratings.
# Edges = where cos(2*pi*freq*proj) crosses zero.
# exp(-cos^2/w^2) peaks at zero crossings.

sigma_edges = np.zeros_like(X)   # blue-cyan network
delta_edges = np.zeros_like(X)   # amber-gold network
sigma_glow = np.zeros_like(X)    # soft bloom around sigma lines
delta_glow = np.zeros_like(X)    # soft bloom around delta lines

for level in range(n_tower):
    freq = phi ** (level * 0.5)
    vis = 1.0 / (1.0 + np.exp(7 * (level - depth_field)))
    amp = phi ** (-level * 0.25) * vis

    # Each higher level slightly rotated (the tower twist)
    rot = level * 2 * np.pi / (n_fold * phi ** 2)

    for i in range(n_fold):
        angle = 2 * np.pi * i / n_fold + rot
        kx, ky = np.cos(angle), np.sin(angle)
        proj = kx * X + ky * Y

        cs = np.cos(2 * np.pi * freq * proj)
        cd = np.cos(2 * np.pi * freq * phi * proj)

        # Thin bright edges + wider glow
        sigma_edges += amp * np.exp(-cs**2 / 0.005)
        sigma_glow  += amp * np.exp(-cs**2 / 0.04)
        delta_edges += amp * np.exp(-cd**2 / 0.005)
        delta_glow  += amp * np.exp(-cd**2 / 0.04)

# Normalize all to [0, 1]
for arr in [sigma_edges, sigma_glow, delta_edges, delta_glow]:
    mx = arr.max()
    if mx > 0:
        arr /= mx

# ── Joint fixed points: where both networks cross ──
joint_sharp = (sigma_edges * delta_edges)
joint_sharp = (joint_sharp / max(joint_sharp.max(), 1e-10)) ** 0.35

joint_soft = (sigma_glow * delta_glow)
joint_soft = (joint_soft / max(joint_soft.max(), 1e-10)) ** 0.25

# ── Tower boundary rings ──
tower_rings = np.zeros_like(X)
for n in range(1, n_tower):
    val = n / n_tower
    if val > 0 and val < 1:
        ring_r = span * 0.62 * (-np.log(val)) ** (1 / 2.5)
        if ring_r < span:
            tower_rings += 0.08 * np.exp(-((R - ring_r) / 0.06) ** 2)

# ── Zeno core ──
zeno = np.zeros_like(X)
for k in range(1, 20):
    zeno += (0.65 ** k) * np.cos(2 * np.pi * phi ** (k * 0.7) * R)
zeno *= np.exp(-(R / 0.3) ** 2)
zeno = np.clip(np.abs(zeno), 0, None)
zeno /= max(zeno.max(), 1e-10)

# ── COLOR: emerge from darkness ──

# Sigma network: blue-cyan
s_r = 0.015 * sigma_glow + 0.03 * sigma_edges
s_g = 0.08  * sigma_glow + 0.20 * sigma_edges
s_b = 0.20  * sigma_glow + 0.50 * sigma_edges

# Delta network: amber-gold
d_r = 0.22 * delta_glow + 0.55 * delta_edges
d_g = 0.10 * delta_glow + 0.28 * delta_edges
d_b = 0.01 * delta_glow + 0.03 * delta_edges

# Joint: white-hot
j_r = 0.50 * joint_soft + 0.90 * joint_sharp
j_g = 0.45 * joint_soft + 0.85 * joint_sharp
j_b = 0.30 * joint_soft + 0.65 * joint_sharp

# Tower rings: warm glow
t_r = 0.6 * tower_rings
t_g = 0.35 * tower_rings
t_b = 0.15 * tower_rings

# Zeno core: white-hot point
z_r = 0.9 * zeno
z_g = 0.8 * zeno
z_b = 0.6 * zeno

# Assemble on black background
red   = np.clip(0.003 + s_r + d_r + j_r + t_r + z_r, 0, 1)
green = np.clip(0.002 + s_g + d_g + j_g + t_g + z_g, 0, 1)
blue  = np.clip(0.005 + s_b + d_b + j_b + t_b + z_b, 0, 1)

# Gentle vignette
vig = 0.03 + 0.97 * np.exp(-0.15 * (R / span) ** 3)
red *= vig
green *= vig
blue *= vig

# Gamma
gamma = 0.72
red   = np.clip(red,   0, 1) ** gamma
green = np.clip(green, 0, 1) ** gamma
blue  = np.clip(blue,  0, 1) ** gamma

rgb = np.stack([red, green, blue], axis=-1)

# ── Render ──
fig, ax = plt.subplots(figsize=(20, 20), dpi=200)
ax.imshow(rgb, extent=[-span, span, -span, span],
          interpolation='lanczos', origin='lower')
ax.axis('off')
plt.subplots_adjust(left=0, right=1, top=1, bottom=0)
out = BUILD_ART / 'quasicrystal-3.png'
plt.savefig(out, bbox_inches='tight', pad_inches=0, dpi=200, facecolor='black')
plt.close()
print(f"Saved build/art/quasicrystal-3.png ({res}x{res})")
