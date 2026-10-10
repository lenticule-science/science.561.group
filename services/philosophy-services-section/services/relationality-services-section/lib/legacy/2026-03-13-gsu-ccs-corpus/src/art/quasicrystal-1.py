"""
Quasicrystalline visualization of the nuclear quartet.

Two sets of plane waves at golden-ratio frequencies represent the two nuclei
sigma (saturation, backward) and Delta (transfer, forward). Their interference
produces a 5-fold quasicrystalline pattern. The coloring reflects the quartet:

  - Deep void (neither nucleus active)
  - Sigma-fixed regions (blue-teal)
  - Delta-fixed regions (amber-gold)
  - Joint fixed point H* (bright, white-gold)

The golden ratio governs both the frequency ratio between the two wave families
and the 5-fold rotational symmetry (cos(2pi/5) = (phi-1)/2).
"""

from pathlib import Path
import numpy as np
BUILD_ART = Path(__file__).parent.parent.parent / "build" / "art"
BUILD_ART.mkdir(parents=True, exist_ok=True)
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap

phi = (1 + np.sqrt(5)) / 2

# --- Resolution and domain ---
res = 3000
span = 6.0
x = np.linspace(-span, span, res)
y = np.linspace(-span, span, res)
X, Y = np.meshgrid(x, y)

# --- Two families of plane waves: sigma and delta ---
n_fold = 5
sigma_field = np.zeros_like(X)
delta_field = np.zeros_like(X)

for i in range(n_fold):
    theta = 2 * np.pi * i / n_fold
    kx, ky = np.cos(theta), np.sin(theta)
    proj = kx * X + ky * Y

    # Sigma: frequency 1 (backward-looking, saturation)
    sigma_field += np.cos(2 * np.pi * proj)

    # Delta: frequency phi (forward-looking, transfer)
    delta_field += np.cos(2 * np.pi * phi * proj)

# --- Nuclear quartet decomposition ---
# Normalize each to [-1, 1]
sigma_norm = sigma_field / np.abs(sigma_field).max()
delta_norm = delta_field / np.abs(delta_field).max()

# The joint projection pi = sigma . delta
# Product captures where BOTH nuclei are simultaneously active
joint = sigma_norm * delta_norm

# The "defect" field: how far from the joint fixed point
defect = np.sqrt(sigma_norm**2 + delta_norm**2) * (1 - joint)

# Combine into a rich field that shows all four quartet corners
Z = (
    0.3 * sigma_norm
    + 0.3 * delta_norm
    + 0.8 * joint
    + 0.15 * np.sin(4 * np.pi * defect)
)

# Smooth nonlinear compression for visual depth
Z = np.tanh(Z * 1.2)
Z = (Z - Z.min()) / (Z.max() - Z.min())

# --- Colormap: the quartet in color ---
cmap_colors = [
    (0.02, 0.02, 0.08),
    (0.04, 0.08, 0.20),
    (0.06, 0.18, 0.35),
    (0.10, 0.30, 0.42),
    (0.25, 0.42, 0.38),
    (0.55, 0.48, 0.22),
    (0.78, 0.58, 0.15),
    (0.92, 0.72, 0.25),
    (0.96, 0.85, 0.55),
    (1.00, 0.96, 0.88),
]
cmap = LinearSegmentedColormap.from_list('quartet', cmap_colors, N=512)

# --- Render ---
fig, ax = plt.subplots(figsize=(20, 20), dpi=150)
ax.imshow(
    Z,
    cmap=cmap,
    extent=[-span, span, -span, span],
    interpolation='lanczos',
    origin='lower',
)
ax.axis('off')
plt.subplots_adjust(left=0, right=1, top=1, bottom=0)
plt.savefig(
    BUILD_ART / 'quasicrystal-1.png',
    bbox_inches='tight',
    pad_inches=0,
    dpi=150,
    facecolor='black',
)
plt.close()

print(f"Saved build/art/quasicrystal-1.png ({res}x{res} pixels)")
print(f"Golden ratio phi = {phi:.10f}")
print(f"5-fold symmetry: cos(2pi/5) = {np.cos(2*np.pi/5):.10f} = (phi-1)/2 = {(phi-1)/2:.10f}")
