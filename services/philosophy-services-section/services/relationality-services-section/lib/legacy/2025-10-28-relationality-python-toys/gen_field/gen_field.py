import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401 (needed for 3D)

# ================================================
# 3D Ambidexterity Surface: height = Pi - Gamma
# Derived from the dual-residuation ASCII model
# ================================================

def local_mean(img):
    up, down = np.roll(img,1,0), np.roll(img,-1,0)
    left, right = np.roll(img,1,1), np.roll(img,-1,1)
    return (img + up + down + left + right) / 5.0

# Canvas controls (tune for your machine)
W = 7.5          # half-width of domain
RES = 1800       # grid resolution per axis (1200–2400 is sensible)

x = np.linspace(-W, W, RES)
y = np.linspace(-W, W, RES)
X, Y = np.meshgrid(x, y)

# Polar frame for directional drift
r = np.sqrt(X**2 + Y**2)
theta = np.arctan2(Y, X)

# Distinction fields
Delta = np.sin(0.9*X*Y) + np.cos(0.5*(X**2 - Y**2))
Nabla = np.cos(0.9*X*Y) - np.sin(0.5*(X**2 - Y**2))

# Inclusion/Exclusion tensors (gradient + oriented curl)
dx, dy = x[1] - x[0], y[1] - y[0]
gx, gy = np.gradient(Delta, dx, dy)
hx, hy = np.gradient(Nabla, dx, dy)
inclusion = np.tanh(np.sqrt(gx**2 + gy**2))
exclusion = np.tanh(np.abs(gx*hy - gy*hx))

# Monoidal tensor and Lawvere residuation (hom)
tensor = np.tanh(Delta * Nabla)
hom = np.maximum(0.0, np.abs(Delta) - np.abs(Nabla))

# Modal pair (box, diamond)
box = np.minimum(tensor, local_mean(tensor))
diamond = np.maximum(hom, local_mean(hom))

# Iterated residuation feedback (Itr^3)
def itr(a, b):
    return np.tanh(a - 0.4*b + np.sin(a*b))

itr1 = itr(box, diamond)
itr2 = itr(itr1, box)
itr3 = itr(itr2, diamond)

# Nucleus j (stabilizer)
j_field = np.minimum(itr3, local_mean(itr3))
j_dual = np.maximum(itr3, local_mean(itr3))

# Directional comonad G (drift)
G = j_field + 0.25*np.sin(theta + j_dual*3)
for _ in range(3):
    G = 0.6*G + 0.4*np.roll(G, 1, axis=1)

# Cohesive middle: Pi, flat, sharp, Gamma
flat = np.tanh(G)
sharp = np.sin(G * Delta)
Pi = np.exp(-r*0.15) * flat + 0.5 * sharp
Gamma = np.exp(-0.10*r) * (flat - sharp)

# Height = ambidexterity curvature
H = Pi - Gamma

# Optional gentle normalization for cleaner surfaces
Hn = H / (np.max(np.abs(H)) + 1e-9)

# ---------------- Render 3D surface (4K) ----------------
fig = plt.figure(figsize=(16, 9), dpi=240)   # 3840x2160
ax = fig.add_subplot(111, projection='3d')
ax.view_init(elev=35, azim=35)
ax.set_axis_off()

# Downsample for faster surface rendering while keeping detail
step = max(1, RES // 900)   # aim ~900 samples per axis on the surface
Xs, Ys, Hs = X[::step, ::step], Y[::step, ::step], Hn[::step, ::step]

surf = ax.plot_surface(
    Xs, Ys, Hs,
    cmap='twilight_shifted',
    linewidth=0, antialiased=True, shade=True, rstride=1, cstride=1
)

# Add subtle contour projection on the “floor”
ax.contour(
    Xs, Ys, Hs, zdir='z', offset=Hn.min()-0.05,
    levels=20, cmap='twilight'
)

# Tight bbox, no margins
plt.tight_layout(pad=0)
plt.savefig("ambidexterity_surface_4k.png", dpi=240, bbox_inches='tight', pad_inches=0)
plt.show()

# ---------------- 2D contour map (also 4K) ----------------
fig2 = plt.figure(figsize=(16, 9), dpi=240)
plt.imshow(Hn, extent=(-W, W, -W, W), origin='lower', cmap='twilight_shifted')
plt.axis('off'); plt.tight_layout(pad=0)
plt.savefig("ambidexterity_contour_4k.png", dpi=240, bbox_inches='tight', pad_inches=0)
plt.show()
