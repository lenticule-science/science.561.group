"""
eidonic_image_v2.py
Generate a single aesthetic "Eidonic" image using perceptual targets.

Fixes vs previous:
- Adds macro-scale structure (multi-frequency Perlin + radial modulation)
- Limits palette to opponent-balanced anchors
- Tunes toward natural 1/f spectrum and target entropy/contrast
- Overlays curvature/flow lines aligned with image gradients
- Produces hierarchical structure (low, mid, high spatial frequencies)

Dependencies: numpy, pillow
Install:     pip install numpy pillow
Run:         python eidonic_image_v2.py
Outputs:     eidonic_art.png, eidonic_metrics.json
"""

import os, json, math, random, sys
from dataclasses import dataclass, asdict
from typing import Tuple
import numpy as np
from PIL import Image, ImageFilter, ImageOps

# -------------------- helpers --------------------

def _fade(t): return 6*t**5 - 15*t**4 + 10*t**3
def _lerp(a, b, t): return a + t*(b-a)

def _grad(hash_, x, y):
    h = hash_ & 3
    if h == 0:  return  x + y
    if h == 1:  return -x + y
    if h == 2:  return  x - y
    return -x - y

def perlin_noise(width, height, freq=3.0, seed=42):
    rng = np.random.RandomState(seed)
    gx = max(1, int(freq))
    gy = max(1, int(round(freq * (height/width))))
    p = np.arange(256, dtype=int); rng.shuffle(p); p = np.concatenate([p,p])
    xs = np.linspace(0, gx, width, endpoint=False)
    ys = np.linspace(0, gy, height, endpoint=False)
    xi = np.floor(xs).astype(int) & 255
    xf = xs - np.floor(xs); u = _fade(xf)
    out = np.zeros((height, width), dtype=np.float32)
    for j in range(height):
        y = ys[j] - np.floor(ys[j]); yi = int(np.floor(ys[j])) & 255
        y0 = yi; y1 = (yi+1)&255; v = _fade(y)
        for i in range(width):
            x = xf[i]; x0 = xi[i]; x1 = (xi[i]+1)&255
            aa = p[p[x0]+y0]; ab = p[p[x0]+y1]; ba = p[p[x1]+y0]; bb = p[p[x1]+y1]
            n00 = _grad(aa, x,   y   ); n10 = _grad(ba, x-1, y   )
            n01 = _grad(ab, x,   y-1 ); n11 = _grad(bb, x-1, y-1 )
            nx0 = _lerp(n00, n10, u[i]); nx1 = _lerp(n01, n11, u[i])
            out[j,i] = _lerp(nx0, nx1, v)
    out -= out.min(); m = out.max()
    if m>0: out /= m
    return out

def hsv_to_rgb_np(h, s, v):
    i = np.floor(h * 6).astype(np.int32)
    f = h * 6 - i
    p = v * (1 - s)
    q = v * (1 - f * s)
    t = v * (1 - (1 - f) * s)
    i_mod = i % 6
    r = np.empty_like(h); g = np.empty_like(h); b = np.empty_like(h)
    m = (i_mod==0); r[m]=v[m]; g[m]=t[m]; b[m]=p[m]
    m = (i_mod==1); r[m]=q[m]; g[m]=v[m]; b[m]=p[m]
    m = (i_mod==2); r[m]=p[m]; g[m]=v[m]; b[m]=t[m]
    m = (i_mod==3); r[m]=p[m]; g[m]=q[m]; b[m]=v[m]
    m = (i_mod==4); r[m]=t[m]; g[m]=p[m]; b[m]=v[m]
    m = (i_mod==5); r[m]=v[m]; g[m]=p[m]; b[m]=q[m]
    return np.stack([r,g,b], axis=-1)

def rgb_to_lum01(rgb01):
    return 0.2126*rgb01[...,0] + 0.7152*rgb01[...,1] + 0.0722*rgb01[...,2]

def sobel_gradients(gray01):
    Kx = np.array([[1,0,-1],[2,0,-2],[1,0,-1]], dtype=np.float32)
    Ky = np.array([[1,2,1],[0,0,0],[-1,-2,-1]], dtype=np.float32)
    p = np.pad(gray01, ((1,1),(1,1)), mode='edge')
    gx = (
        Kx[0,0]*p[0:-2,0:-2] + Kx[0,1]*p[0:-2,1:-1] + Kx[0,2]*p[0:-2,2:] +
        Kx[1,0]*p[1:-1,0:-2] + Kx[1,1]*p[1:-1,1:-1] + Kx[1,2]*p[1:-1,2:] +
        Kx[2,0]*p[2:  ,0:-2] + Kx[2,1]*p[2:  ,1:-1] + Kx[2,2]*p[2:  ,2:]
    )
    gy = (
        Ky[0,0]*p[0:-2,0:-2] + Ky[0,1]*p[0:-2,1:-1] + Ky[0,2]*p[0:-2,2:] +
        Ky[1,0]*p[1:-1,0:-2] + Ky[1,1]*p[1:-1,1:-1] + Ky[1,2]*p[1:-1,2:] +
        Ky[2,0]*p[2:  ,0:-2] + Ky[2,1]*p[2:  ,1:-1] + Ky[2,2]*p[2:  ,2:]
    )
    return gx, gy, np.hypot(gx, gy)

def radial_fft_slope(rgb01):
    lum = rgb_to_lum01(rgb01)
    f = np.fft.fftshift(np.fft.fft2(lum))
    ps = np.abs(f)**2
    H,W = lum.shape; cy,cx = H//2, W//2
    Y,X = np.indices(lum.shape); R = np.sqrt((X-cx)**2 + (Y-cy)**2).astype(np.int32)
    max_r = min(cx, cy)
    radial = np.bincount(R.ravel(), ps.ravel(), minlength=max_r+1) / \
             (np.bincount(R.ravel(), minlength=max_r+1) + 1e-9)
    radii = np.arange(1, max_r); vals = radial[1:max_r]; vals = np.where(vals>0, vals, 1e-12)
    xlog = np.log(radii); ylog = np.log(vals)
    A = np.vstack([xlog, np.ones_like(xlog)]).T
    slope, intercept = np.linalg.lstsq(A, ylog, rcond=None)[0]
    return float(slope)

def local_entropy_bits(rgb8, block=64):
    lum = 0.2126*rgb8[...,0] + 0.7152*rgb8[...,1] + 0.0722*rgb8[...,2]
    Hs=[]; H,W = lum.shape
    for y in range(0,H,block):
        for x in range(0,W,block):
            tile = lum[y:min(y+block,H), x:min(x+block,W)].astype(np.uint8)
            hist, _ = np.histogram(tile, bins=256, range=(0,255), density=True)
            hist = hist[hist>0]
            Hs.append(-np.sum(hist*np.log2(hist)) if len(hist) else 0.0)
    return float(np.mean(Hs)) if Hs else 0.0

def rms_contrast(rgb8):
    lum = 0.2126*rgb8[...,0] + 0.7152*rgb8[...,1] + 0.0722*rgb8[...,2]
    mu = float(np.mean(lum)); 
    return float(np.sqrt(np.mean((lum-mu)**2)) / (mu+1e-9)) if mu>0 else 0.0

def boxcount_fractal_dimension(edge01, k_grid=(2,3,4,6,8,12,16,24,32,48,64)):
    img = (edge01>0).astype(np.uint8)
    H,W = img.shape; xs=[]; ys=[]
    for S in k_grid:
        Hp = int(math.ceil(H/S)*S); Wp = int(math.ceil(W/S)*S)
        p = np.zeros((Hp,Wp), dtype=np.uint8); p[:H,:W]=img
        bs = p.reshape(Hp//S, S, Wp//S, S)
        N = int((bs.max(axis=3).max(axis=1) > 0).sum())
        if N>0: xs.append(math.log(1.0/S)); ys.append(math.log(N))
    if len(xs)<2: return 1.0
    A = np.vstack([xs, np.ones_like(xs)]).T
    slope,_ = np.linalg.lstsq(A, np.array(ys), rcond=None)[0]
    return float(-slope)

def erode_bool(mask):
    m = np.pad(mask, ((1,1),(1,1)), mode='edge')
    return (
        m[0:-2,0:-2] & m[0:-2,1:-1] & m[0:-2,2:] &
        m[1:-1,0:-2] & m[1:-1,1:-1] & m[1:-1,2:] &
        m[2:,0:-2] & m[2:,1:-1] & m[2:,2:]
    )

# -------------------- parameters --------------------

@dataclass
class Params:
    width:int=1024
    height:int=1024
    seed:int=33
    mean_lum:float=0.55
    sat_min:float=0.25
    sat_max:float=0.80
    perlin_freq_small:float=7.0   # high-frequency texture
    perlin_freq_mid:float=2.5     # mid structure
    perlin_freq_macro:float=0.6   # macro flow
    perlin_amp_small:float=0.45
    perlin_amp_mid:float=0.35
    perlin_amp_macro:float=0.20
    palette_mode:str="triad"      # "triad" or "analog"
    base_hue_deg:float=25.0
    radial_strength:float=0.20    # macro radial luminance modulation
    tune_steps:int=24

TARGET = {
    "fft_slope": -1.0,       # natural scene 1/f
    "entropy_bits": 6.3,     # moderate complexity
    "rms_contrast": 0.20,    # comfortable contrast
    "fractal_D": 1.40        # edge complexity sweet spot
}

# -------------------- generation --------------------

def multi_freq_field(p: Params):
    H,W = p.height, p.width
    n_small = perlin_noise(W,H,p.perlin_freq_small, seed=p.seed+1)
    n_mid   = perlin_noise(W,H,p.perlin_freq_mid,   seed=p.seed+2)
    n_macro = perlin_noise(W,H,p.perlin_freq_macro, seed=p.seed+3)

    # weighted sum then normalize
    f = p.perlin_amp_small*n_small + p.perlin_amp_mid*n_mid + p.perlin_amp_macro*n_macro
    f -= f.min(); f /= (f.max()+1e-9)

    # radial luminance modulation, center near golden-ratio point
    cy = int(H*(1/1.618)); cx = int(W*(1-1/1.618))
    Y,X = np.indices((H,W)); R = np.sqrt((X-cx)**2 + (Y-cy)**2)
    Rn = (R - R.min())/(R.max()-R.min()+1e-9)
    v = TARGET["rms_contrast"]  # start magnitude proxy
    lum = np.clip(p.mean_lum * (1 - p.radial_strength*(Rn-0.5)), 0.05, 0.95)

    # palette-limited hue from field
    base = (p.base_hue_deg % 360)/360.0
    if p.palette_mode=="triad":
        anchors = np.array([base, (base+1/3)%1.0, (base+2/3)%1.0], dtype=np.float32)
    else: # analog
        anchors = np.array([base, (base+0.08)%1.0, (base-0.08)%1.0], dtype=np.float32)

    # map field to nearest anchor with softmix to avoid posterization
    # compute three weights from f
    w1 = f
    w2 = (f*1.3) % 1.0
    w3 = (f*0.7 + 0.2) % 1.0
    Wsum = w1+w2+w3+1e-9
    w1/=Wsum; w2/=Wsum; w3/=Wsum
    hue = (w1*anchors[0] + w2*anchors[1] + w3*anchors[2]) % 1.0

    # saturation tied to local variance to introduce mid-scale hierarchy
    # compute fast local variance via blur difference
    pil = Image.fromarray((f*255).astype(np.uint8),'L').filter(ImageFilter.GaussianBlur(radius=3))
    g = np.asarray(pil).astype(np.float32)/255.0
    var = np.abs(f - g)
    s = np.clip(p.sat_min + (p.sat_max-p.sat_min)*(0.5+0.5*(var - var.mean())/(var.std()+1e-9)), 0, 1)

    rgb = hsv_to_rgb_np(hue, s, np.full_like(f, p.mean_lum))
    # apply soft macro blur to knit micro-structure into larger forms
    rgb = np.asarray(Image.fromarray((rgb*255).astype(np.uint8),'RGB').filter(
        ImageFilter.GaussianBlur(radius=1.2)
    )).astype(np.float32)/255.0

    # multiply luminance by radial modulation
    lum0 = rgb_to_lum01(rgb)
    scale = np.clip(1 + p.radial_strength*(0.5 - Rn), 0.8, 1.2)
    rgb = rgb * scale[...,None]
    # renormalize to avoid clipping
    mx = rgb.max(); 
    if mx>1: rgb = rgb/mx
    return np.clip(rgb,0,1)

def tune(rgb, steps, rng):
    for _ in range(steps):
        rgb8 = (np.clip(rgb,0,1)*255).astype(np.uint8)
        slope = radial_fft_slope(rgb.astype(np.float32))
        Hloc  = local_entropy_bits(rgb8, block=64)
        rms   = rms_contrast(rgb8)
        lum01 = rgb_to_lum01(rgb)
        gx,gy,gm = sobel_gradients(lum01)
        th = np.quantile(gm, 0.80); edge = (gm >= th).astype(np.uint8)
        D = boxcount_fractal_dimension(edge)

        # FFT slope adjust
        if slope < TARGET["fft_slope"] - 0.08:   # too steep: add mid/high freq
            rgb = np.asarray(Image.fromarray(rgb8,'RGB').filter(
                ImageFilter.UnsharpMask(radius=1.6, percent=120, threshold=0)
            )).astype(np.float32)/255.0
        elif slope > TARGET["fft_slope"] + 0.08: # too shallow: smooth
            rgb = np.asarray(Image.fromarray(rgb8,'RGB').filter(
                ImageFilter.GaussianBlur(radius=1.0)
            )).astype(np.float32)/255.0

        # Entropy adjust
        if Hloc < TARGET["entropy_bits"] - 0.2:
            noise = (rng.rand(*rgb.shape)-0.5) * (1/255.0)*22
            rgb = np.clip(rgb + noise, 0, 1)
        elif Hloc > TARGET["entropy_bits"] + 0.2:
            base = np.asarray(Image.fromarray(rgb8,'RGB').filter(
                ImageFilter.GaussianBlur(radius=0.9)
            )).astype(np.float32)/255.0
            rgb = 0.7*base + 0.3*rgb

        # Contrast adjust
        rgb8 = (np.clip(rgb,0,1)*255).astype(np.uint8)
        rms = rms_contrast(rgb8)
        if rms < TARGET["rms_contrast"] - 0.02:
            rgb = np.asarray(Image.fromarray(rgb8,'RGB').filter(
                ImageFilter.UnsharpMask(radius=1.2, percent=140, threshold=0)
            )).astype(np.float32)/255.0
        elif rms > TARGET["rms_contrast"] + 0.02:
            rgb = np.asarray(Image.fromarray(rgb8,'RGB').filter(
                ImageFilter.GaussianBlur(radius=0.7)
            )).astype(np.float32)/255.0

        # Fractal dimension adjust
        if D < TARGET["fractal_D"] - 0.05:
            rgb = np.asarray(Image.fromarray((rgb*255).astype(np.uint8),'RGB').filter(
                ImageFilter.UnsharpMask(radius=0.8, percent=120, threshold=0)
            )).astype(np.float32)/255.0
        elif D > TARGET["fractal_D"] + 0.05:
            rgb = np.asarray(Image.fromarray((rgb*255).astype(np.uint8),'RGB').filter(
                ImageFilter.GaussianBlur(radius=0.6)
            )).astype(np.float32)/255.0

        # small hue–luminance coupling to co-locate cues
        lum01 = rgb_to_lum01(rgb); L = (lum01 - lum01.min())/(lum01.max()-lum01.min()+1e-9)
        rgb[...,0] = np.clip(rgb[...,0]*(0.985 + 0.03*L), 0,1)
        rgb[...,2] = np.clip(rgb[...,2]*(1.015 - 0.03*L), 0,1)
    return np.clip(rgb,0,1)

def overlay_isolines_and_flows(rgb, seed=99):
    arr = np.clip(rgb,0,1)
    lum = rgb_to_lum01(arr)
    lum_s = np.asarray(Image.fromarray((lum*255).astype(np.uint8),'L').filter(
        ImageFilter.GaussianBlur(radius=2.0)
    )).astype(np.float32)/255.0

    H,W = lum.shape
    out = (arr*255).astype(np.uint8)
    img = Image.fromarray(out, 'RGB')
    px = img.load()

    # isolines
    levels = 7; iso_alpha = 0.26
    for k in range(1, levels):
        t = k/levels
        mask = (lum_s >= t)
        er = erode_bool(mask)
        boundary = mask ^ er
        inv = 1.0 - lum_s
        for y in range(H):
            for x in range(W):
                if boundary[y,x]:
                    r = int(np.clip(inv[y,x]*255*0.95, 0,255))
                    g = int(np.clip(inv[y,x]*255*0.98, 0,255))
                    b = int(np.clip(inv[y,x]*255*1.00, 0,255))
                    R,G,B = px[x,y]
                    px[x,y] = (
                        int((1-iso_alpha)*R + iso_alpha*r),
                        int((1-iso_alpha)*G + iso_alpha*g),
                        int((1-iso_alpha)*B + iso_alpha*b),
                    )

    # flow lines along level sets (tangent = (-gy, gx))
    gx,gy,gm = sobel_gradients(lum_s)
    lo = np.quantile(gm, 0.55); hi = np.quantile(gm, 0.70)
    mid = (gm>=lo) & (gm<=hi)

    rng = random.Random(seed)
    seeds = []
    for _ in range(160):
        y = rng.randrange(0,H); x = rng.randrange(0,W)
        if mid[y,x]: seeds.append((x,y))

    accent_alpha = 0.16; step = 1.2; max_len = 48
    comp = 1.0 - arr
    comp = 0.65*comp + 0.35*lum_s[...,None]

    for sx,sy in seeds:
        x, y = float(sx), float(sy)
        for _ in range(max_len):
            ix, iy = int(round(x)), int(round(y))
            if ix<1 or iy<1 or ix>=W-1 or iy>=H-1: break
            if not mid[iy,ix]: break
            gxx = gx[iy,ix]; gyy = gy[iy,ix]
            mag = math.hypot(gxx, gyy) + 1e-9
            tx, ty = -gyy/mag, gxx/mag
            r0,g0,b0 = px[ix,iy]
            rr,gg,bb = (comp[iy,ix]*255).astype(np.uint8)
            px[ix,iy] = (
                int((1-accent_alpha)*r0 + accent_alpha*rr),
                int((1-accent_alpha)*g0 + accent_alpha*gg),
                int((1-accent_alpha)*b0 + accent_alpha*bb),
            )
            x += tx*step; y += ty*step

    return np.asarray(img).astype(np.uint8)

# -------------------- main --------------------

def main():
    p = Params()
    rng = np.random.RandomState(p.seed)
    rgb = multi_freq_field(p)
    rgb = tune(rgb, p.tune_steps, rng)
    out8 = overlay_isolines_and_flows(rgb, seed=p.seed+7)

    # metrics
    slope = radial_fft_slope(out8.astype(np.float32)/255.0)
    Hloc  = local_entropy_bits(out8, block=64)
    rms   = rms_contrast(out8)
    lum01 = rgb_to_lum01(out8.astype(np.float32)/255.0)
    gx,gy,gm = sobel_gradients(lum01)
    th = np.quantile(gm, 0.80); D = boxcount_fractal_dimension((gm>=th).astype(np.uint8))

    Image.fromarray(out8, 'RGB').save("eidonic_art.png", "PNG")
    with open("eidonic_metrics.json","w") as f:
        json.dump({
            "targets": TARGET,
            "results": {
                "fft_slope": slope,
                "entropy_bits": Hloc,
                "rms_contrast": rms,
                "fractal_D": D
            },
            "params": asdict(p)
        }, f, indent=2)

    print("Saved: eidonic_art.png, eidonic_metrics.json")
    print("Results:", {"fft_slope":slope, "entropy_bits":Hloc, "rms_contrast":rms, "fractal_D":D})

if __name__ == "__main__":
    main()
