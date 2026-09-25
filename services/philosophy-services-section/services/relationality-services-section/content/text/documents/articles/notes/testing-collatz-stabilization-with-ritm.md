---
title: Testing Collatz stabilization with RITM
type: doc
status: draft
author: emsenn
date: 2025-10-16
keywords:
  - math
  - ritm
  - collatz
  - simulation
publish_to:
  - emsenn-net
date-created: 2025-10-16
description: from sim import import matplotlib.pyplot as plt
---

```python

  from sim import *
  import matplotlib.pyplot as plt

  # ----- Collatz relation modulo N -----
  def collatz_step(n, N):
      x = 3 * n + 1
      while x % 2 == 0:
          x //= 2
      return x % N

  def collatz_relation(N):
      pairs = [(i, collatz_step(i, N)) for i in range(N)]
      return relation_from_pairs(N, N, pairs)

  # ----- Idempotence check -----
  def is_idempotent(R, tol=0):
      CR = C_graph(R)
      diff = count_ones(mat_xor(R, CR))
      return diff <= tol, diff

  # ----- Experiment -----
  def collatz_experiment(N=20, steps=300, verbose=True):
      R = collatz_relation(N)
      Y = [row[:] for row in R]
      S_vals, sig_vals, diffs = [], [], []
      idempotent_step = None

      for k in range(steps):
          S = action_S(R, Y)
          sig = sigma_score(R, Y)
          idem, diff = is_idempotent(R)
          S_vals.append(S)
          sig_vals.append(sig)
          diffs.append(diff)
          if verbose:
              print(f"step {k:02d}: S={S:.3f}, σ={sig:.3f}, diff={diff}")

          if idem and idempotent_step is None:
              idempotent_step = k

          # comonadic evolution
          R = iterate_modal(R, 2, Y)
          Y = C_graph(Y)

      return S_vals, sig_vals, diffs, idempotent_step

  # ----- Run & Plot -----
  if __name__ == "__main__":
      N = 20
      steps = 30
      S_vals, sig_vals, diffs, idem_step = collatz_experiment(N, steps)

      plt.figure(figsize=(8,5))
      plt.plot(S_vals, label='Action S')
      plt.plot(sig_vals, label='σ coherence')
      if idem_step is not None:
          plt.axvline(idem_step, color='red', linestyle='--', label=f'Idempotent at {idem_step}')
      plt.xlabel('Iteration step')
      plt.ylabel('Value')
      plt.title(f'Collatz–RITM Stabilization mod {N}')
      plt.legend()
      plt.tight_layout()
      plt.show()

      if idem_step is not None:
          print(f"\nIdempotence detected at step {idem_step} (C(R)==R).")
      else:
          print("\nNo full idempotence reached within given steps.")
```


```python
  # RITM-Collatz Experiment Simulator
  # Requires: sim.py in the same directory

  from sim import *
  import matplotlib.pyplot as plt

  # --- Collatz relation construction ---
  def collatz_pairs(n:int):
      pairs = []
      for i in range(1, n):
          if i % 2 == 0:
              j = i // 2
          else:
              j = 3 * i + 1
          if j < n:
              pairs.append((i, j))
      return pairs

  # --- Simulation experiment ---
  def run_collatz_experiment(n=64, steps=20, conserve_degrees=True, verbose=True):
      Y0 = line_graph(n)
      R0 = relation_from_pairs(n, n, collatz_pairs(n))

      if verbose:
          print(f"=== RITM–Collatz experiment (n={n}) ===")
      R, Y, hist = evolve_RY_noether(R0, Y0, steps=steps, conserve_degrees=conserve_degrees, verbose=verbose)

      # collect metrics
      S_vals = [S for (_,_,S,_) in hist]
      sigma_vals = [sig for (_,_,_,sig) in hist]
      return hist, S_vals, sigma_vals

  # --- Visualization ---
  def plot_collatz_dynamics(S_vals, sigma_vals):
      fig, ax = plt.subplots(2, 1, figsize=(6,6))
      ax[0].plot(S_vals, marker='o')
      ax[0].set_title('Action S over steps (RITM energy descent)')
      ax[0].set_xlabel('Step')
      ax[0].set_ylabel('S')

      ax[1].plot(sigma_vals, marker='o', color='green')
      ax[1].set_title('σ coherence (stabilization index)')
      ax[1].set_xlabel('Step')
      ax[1].set_ylabel('σ')
      plt.tight_layout()
      plt.show()

  # --- Coalgebra extraction ---
  def stabilized_indices(R, Y):
      return defect_rows(R, Y)

  if __name__ == "__main__":
      hist, S_vals, sigma_vals = run_collatz_experiment(n=32, steps=15, conserve_degrees=False)
      plot_collatz_dynamics(S_vals, sigma_vals)

      Rf, Yf, Sf, sigf = hist[-1]
      stables = stabilized_indices(Rf, Yf)
      print(f"\nStabilized (coalgebra) indices: {stables}")
      print("Final topology Yf:")
      print(show_matrix(Yf))
```


```python
  # RITM-Collatz Experiment Simulator (Stepwise Comonadic Version)
  # Requires: sim.py in the same directory

  from sim import *
  import matplotlib.pyplot as plt

  # --- Stepwise comonadic operators ---
  def box_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      n = len(A)
      C = [row[:] for row in A]
      for _ in range(steps):
          C_next = mat_bool_or(C, mat_bool_mul(C, A))
          for i in range(n):
              C_next[i][i] = 1  # ensure reflexivity
          C = C_next
      return C

  def diamond_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return transpose(box_step(transpose(A), steps=steps))

  def C_graph_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return box_step(diamond_step(A, steps=steps), steps=steps)

  # --- Collatz relation construction ---
  def collatz_pairs(n:int):
      pairs = []
      for i in range(1, n):
          if i % 2 == 0:
              j = i // 2
          else:
              j = 3 * i + 1
          if j < n:
              pairs.append((i, j))
      return pairs

  # --- Stepwise evolve ---
  def evolve_RY_stepwise(R, Y, steps=10, closure_step=1, verbose=True):
      hist = []
      for t in range(steps):
          CY = C_graph_step(Y, steps=closure_step)
          Rn = mat_bool_mul(R, CY)
          Yn = mat_bool_or(Y, CY)
          S = action_S(Rn, Yn)
          sig = sigma_score(Rn, Yn)
          if verbose:
              print(f"t={t:02d}  S={S:.3f}  σ={sig:.3f}")
          hist.append((Rn, Yn, S, sig))
          if t>0 and abs(hist[-1][2]-hist[-2][2])<1e-9:
              break
          R, Y = Rn, Yn
      return hist

  # --- Experiment driver ---
  def run_collatz_experiment_stepwise(n=32, steps=10, closure_step=1, verbose=True):
      Y0 = line_graph(n)
      R0 = relation_from_pairs(n, n, collatz_pairs(n))
      hist = evolve_RY_stepwise(R0, Y0, steps=steps, closure_step=closure_step, verbose=verbose)
      S_vals = [S for (_,_,S,_) in hist]
      sigma_vals = [sig for (_,_,_,sig) in hist]
      return hist, S_vals, sigma_vals

  # --- Visualization ---
  def plot_collatz_dynamics(S_vals, sigma_vals):
      fig, ax = plt.subplots(2, 1, figsize=(6,6))
      ax[0].plot(S_vals, marker='o')
      ax[0].set_title('Action S over steps (RITM energy descent)')
      ax[0].set_xlabel('Step')
      ax[0].set_ylabel('S')

      ax[1].plot(sigma_vals, marker='o', color='green')
      ax[1].set_title('σ coherence (stabilization index)')
      ax[1].set_xlabel('Step')
      ax[1].set_ylabel('σ')
      plt.tight_layout()
      plt.show()

  # --- Coalgebra extraction ---
  def stabilized_indices(R, Y):
      return defect_rows(R, Y)

  if __name__ == "__main__":
      hist, S_vals, sigma_vals = run_collatz_experiment_stepwise(n=32, steps=15, closure_step=1)
      plot_collatz_dynamics(S_vals, sigma_vals)
      Rf, Yf, Sf, sigf = hist[-1]
      print(f"\nStabilized indices: {stabilized_indices(Rf, Yf)}")
```


```python

  from sim import *
  import matplotlib.pyplot as plt
  from collections import defaultdict

  # --- Stepwise comonadic operators ---
  def box_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      n = len(A)
      C = [row[:] for row in A]
      for _ in range(steps):
          C_next = mat_bool_or(C, mat_bool_mul(C, A))
          for i in range(n):
              C_next[i][i] = 1
          C = C_next
      return C

  def diamond_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return transpose(box_step(transpose(A), steps=steps))

  def C_graph_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return box_step(diamond_step(A, steps=steps), steps=steps)

  # --- Collatz relation construction ---
  def collatz_pairs(n:int):
      pairs = []
      for i in range(1, n):
          if i % 2 == 0:
              j = i // 2
          else:
              j = 3 * i + 1
          if j < n:
              pairs.append((i, j))
      return pairs

  # --- Stepwise evolution ---
  def evolve_RY_stepwise(R, Y, steps=10, closure_step=1, verbose=True):
      hist = []
      for t in range(steps):
          CY = C_graph_step(Y, steps=closure_step)
          Rn = mat_bool_mul(R, CY)
          Yn = mat_bool_or(Y, CY)
          S = action_S(Rn, Yn)
          sig = sigma_score(Rn, Yn)
          if verbose:
              print(f"t={t:02d}  S={S:.3f}  σ={sig:.3f}")
          hist.append((Rn, Yn, S, sig))
          if t>0 and abs(hist[-1][2]-hist[-2][2])<1e-9:
              break
          R, Y = Rn, Yn
      return hist

  # --- Residue-class analysis ---
  def residue_partition(n:int, mod:int) -> Dict[int, List[int]]:
      part = defaultdict(list)
      for i in range(n):
          part[i % mod].append(i)
      return part

  def residue_metrics(R: List[List[int]], Y: List[List[int]], mod:int=6):
      n = len(Y)
      classes = residue_partition(n, mod)
      res_metrics = {}
      for r, idxs in classes.items():
          if not idxs:
              continue
          subR = [[R[i][j] for j in idxs] for i in idxs]
          subY = [[Y[i][j] for j in idxs] for i in idxs]
          S = action_S(subR, subY)
          sig = sigma_score(subR, subY)
          res_metrics[r] = (S, sig)
      return res_metrics

  # --- Experiment driver ---
  def run_collatz_experiment_residues(n=32, steps=10, closure_step=1, mod:int=6, verbose=True):
      Y0 = line_graph(n)
      R0 = relation_from_pairs(n, n, collatz_pairs(n))
      hist = evolve_RY_stepwise(R0, Y0, steps=steps, closure_step=closure_step, verbose=verbose)
      per_residue = []
      for R, Y, S, sig in hist:
          res = residue_metrics(R, Y, mod=mod)
          per_residue.append(res)
      return hist, per_residue

  # --- Visualization ---
  def plot_residue_dynamics(per_residue):
      mods = sorted(list(per_residue[0].keys()))
      steps = range(len(per_residue))
      fig, ax = plt.subplots(2, 1, figsize=(7,6))
      for m in mods:
          S_vals = [res[m][0] for res in per_residue]
          σ_vals = [res[m][1] for res in per_residue]
          ax[0].plot(steps, S_vals, marker='o', label=f"mod {m}")
          ax[1].plot(steps, σ_vals, marker='o', label=f"mod {m}")
      ax[0].set_title('Action S per residue class')
      ax[0].set_xlabel('Step')
      ax[0].set_ylabel('S')
      ax[0].legend()
      ax[1].set_title('σ coherence per residue class')
      ax[1].set_xlabel('Step')
      ax[1].set_ylabel('σ')
      ax[1].legend()
      plt.tight_layout()
      plt.show()

  # --- Main ---
  if __name__ == "__main__":
      hist, per_residue = run_collatz_experiment_residues(n=36, steps=10, closure_step=1, mod=6)
      plot_residue_dynamics(per_residue)
      Rf, Yf, Sf, sigf = hist[-1]
      print("Final stabilized indices:", defect_rows(Rf, Yf))
```


```python
  # RITM-Collatz Experiment Simulator with Residue-Class Analysis & Decay Rates
  # Requires: sim.py in the same directory

  from sim import *
  import matplotlib.pyplot as plt
  from collections import defaultdict
  from typing import Dict, List, Tuple

  # --- Stepwise comonadic operators ---
  def box_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      n = len(A)
      C = [row[:] for row in A]
      for _ in range(steps):
          C_next = mat_bool_or(C, mat_bool_mul(C, A))
          for i in range(n):
              C_next[i][i] = 1
          C = C_next
      return C

  def diamond_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return transpose(box_step(transpose(A), steps=steps))

  def C_graph_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return box_step(diamond_step(A, steps=steps), steps=steps)

  # --- Collatz relation construction ---
  def collatz_pairs(n:int):
      pairs = []
      for i in range(1, n):
          if i % 2 == 0:
              j = i // 2
          else:
              j = 3 * i + 1
          if j < n:
              pairs.append((i, j))
      return pairs

  # --- Stepwise evolution ---
  def evolve_RY_stepwise(R, Y, steps=10, closure_step=1, verbose=True):
      hist = []
      for t in range(steps):
          CY = C_graph_step(Y, steps=closure_step)
          Rn = mat_bool_mul(R, CY)
          Yn = mat_bool_or(Y, CY)
          S = action_S(Rn, Yn)
          sig = sigma_score(Rn, Yn)
          if verbose:
              print(f"t={t:02d}  S={S:.3f}  σ={sig:.3f}")
          hist.append((Rn, Yn, S, sig))
          if t>0 and abs(hist[-1][2]-hist[-2][2])<1e-9:
              break
          R, Y = Rn, Yn
      return hist

  # --- Residue-class analysis ---
  def residue_partition(n:int, mod:int) -> Dict[int, List[int]]:
      part = defaultdict(list)
      for i in range(n):
          part[i % mod].append(i)
      return part

  def residue_metrics(R: List[List[int]], Y: List[List[int]], mod:int=6):
      n = len(Y)
      classes = residue_partition(n, mod)
      res_metrics = {}
      for r, idxs in classes.items():
          if not idxs:
              continue
          subR = [[R[i][j] for j in idxs] for i in idxs]
          subY = [[Y[i][j] for j in idxs] for i in idxs]
          S = action_S(subR, subY)
          sig = sigma_score(subR, subY)
          res_metrics[r] = (S, sig)
      return res_metrics

  # Compute simple decay stats: time-to-zero S, first-step drop ratio, and area under S
  DefStats = Dict[int, Dict[str, float]]

  def residue_decay_stats(per_residue: List[Dict[int, Tuple[float, float]]]) -> DefStats:
      # per_residue[t][r] = (S, σ)
      T = len(per_residue)
      residues = sorted(per_residue[0].keys())
      stats: DefStats = {}
      for r in residues:
          S_series = [per_residue[t][r][0] for t in range(T)]
          # time to hit zero S
          t0 = None
          for t, Sv in enumerate(S_series):
              if Sv == 0:
                  t0 = t
                  break
          # first-step drop ratio (avoid division by 0)
          S0 = S_series[0]
          S1 = S_series[1] if T > 1 else S0
          drop = (S0 - S1) / S0 if S0 > 0 else 1.0
          # discrete area under curve (AUC)
          auc = sum(S_series)
          stats[r] = {"time_to_zero": float(t0 if t0 is not None else -1),
                      "first_drop_ratio": float(drop),
                      "auc_S": float(auc)}
      return stats

  # --- Experiment drivers ---
  def run_collatz_experiment_residues(n=32, steps=10, closure_step=1, mod:int=6, verbose=True):
      Y0 = line_graph(n)
      R0 = relation_from_pairs(n, n, collatz_pairs(n))
      hist = evolve_RY_stepwise(R0, Y0, steps=steps, closure_step=closure_step, verbose=verbose)
      per_residue = []
      for R, Y, S, sig in hist:
          res = residue_metrics(R, Y, mod=mod)
          per_residue.append(res)
      return hist, per_residue

  # Multiple moduli wrapper

  def run_multi_moduli(n=48, steps=10, closure_step=1, mod_list:List[int]=[4,6,8,12], verbose=False):
      results = {}
      for m in mod_list:
          if verbose:
              print(f"\n=== modulus {m} ===")
          hist, per_residue = run_collatz_experiment_residues(n=n, steps=steps, closure_step=closure_step, mod=m, verbose=verbose)
          stats = residue_decay_stats(per_residue)
          results[m] = {"hist": hist, "per_residue": per_residue, "stats": stats}
      return results

  # --- Visualization ---

  def plot_residue_dynamics(per_residue, title_prefix=""):
      mods = sorted(list(per_residue[0].keys()))
      steps = range(len(per_residue))
      fig, ax = plt.subplots(2, 1, figsize=(7,6))
      for m in mods:
          S_vals = [res[m][0] for res in per_residue]
          σ_vals = [res[m][1] for res in per_residue]
          ax[0].plot(steps, S_vals, marker='o', label=f"mod {m}")
          ax[1].plot(steps, σ_vals, marker='o', label=f"mod {m}")
      ax[0].set_title(f'{title_prefix}Action S per residue class')
      ax[0].set_xlabel('Step')
      ax[0].set_ylabel('S')
      ax[0].legend()
      ax[1].set_title(f'{title_prefix}σ coherence per residue class')
      ax[1].set_xlabel('Step')
      ax[1].set_ylabel('σ')
      ax[1].legend()
      plt.tight_layout()
      plt.show()


  def plot_multi_moduli(results):
      # results[m]["per_residue"]
      M = len(results)
      figS, axesS = plt.subplots(M, 1, figsize=(7, 3*M), sharex=True)
      figσ, axesσ = plt.subplots(M, 1, figsize=(7, 3*M), sharex=True)
      if M == 1:
          axesS = [axesS]
          axesσ = [axesσ]
      for i, m in enumerate(sorted(results.keys())):
          per_residue = results[m]["per_residue"]
          residues = sorted(per_residue[0].keys())
          steps = range(len(per_residue))
          for r in residues:
              S_vals = [res[r][0] for res in per_residue]
              σ_vals = [res[r][1] for res in per_residue]
              axesS[i].plot(steps, S_vals, marker='o', label=f"r={r}")
              axesσ[i].plot(steps, σ_vals, marker='o', label=f"r={r}")
          axesS[i].set_title(f"Action S by residues (mod {m})")
          axesS[i].set_ylabel('S')
          axesS[i].legend(ncol=min(6, len(residues)))
          axesσ[i].set_title(f"σ by residues (mod {m})")
          axesσ[i].set_ylabel('σ')
          axesσ[i].legend(ncol=min(6, len(residues)))
      axesS[-1].set_xlabel('Step')
      axesσ[-1].set_xlabel('Step')
      figS.tight_layout(); figσ.tight_layout()
      plt.show()


  def print_decay_tables(results):
      # pretty-print decay stats per modulus
      for m in sorted(results.keys()):
          stats = results[m]["stats"]
          residues = sorted(stats.keys())
          print(f"\n=== Decay stats (mod {m}) ===")
          print("res  time_to_zero  first_drop  auc_S")
          for r in residues:
              s = stats[r]
              print(f"{r:>3}  {int(s['time_to_zero']):>12}  {s['first_drop_ratio']:.3f}     {s['auc_S']:.1f}")
          # modulus-level aggregates
          ttz_vals = [stats[r]['time_to_zero'] for r in residues]
          drop_vals = [stats[r]['first_drop_ratio'] for r in residues]
          auc_vals = [stats[r]['auc_S'] for r in residues]
          avg = lambda xs: sum(xs)/len(xs) if xs else 0.0
          print(f"-- avg --  {avg(ttz_vals):>12.2f}  {avg(drop_vals):.3f}     {avg(auc_vals):.1f}")

  # --- Main ---
  if __name__ == "__main__":
      # single-modulus quick run
      hist, per_residue = run_collatz_experiment_residues(n=36, steps=10, closure_step=1, mod=6)
      plot_residue_dynamics(per_residue)

      # multi-moduli comparison
      results = run_multi_moduli(n=60, steps=10, closure_step=1, mod_list=[4,6,8,12], verbose=False)
      plot_multi_moduli(results)
      print_decay_tables(results)

      # final stabilized set (for the last modulus run only)
      last_m = sorted(results.keys())[-1]
      Rf, Yf, Sf, sigf = results[last_m]["hist"][-1]
      print("\nFinal stabilized indices (last run):", defect_rows(Rf, Yf))
```

```python
  # RITM—Affine Family (Collatz-like) Modal Spectrum
  # Requires: sim.py in the same directory

  from sim import *
  import matplotlib.pyplot as plt
  from collections import defaultdict
  from typing import Dict, List, Tuple, Iterable
  import math

  # =============================================
  # Stepwise comonadic operators
  # =============================================

  def box_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      n = len(A)
      C = [row[:] for row in A]
      for _ in range(steps):
          C_next = mat_bool_or(C, mat_bool_mul(C, A))
          for i in range(n):
              C_next[i][i] = 1
          C = C_next
      return C

  def diamond_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return transpose(box_step(transpose(A), steps=steps))

  def C_graph_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return box_step(diamond_step(A, steps=steps), steps=steps)

  # =============================================
  # Relation constructors
  # =============================================

  def pairs_from_function(n:int, f)->List[Tuple[int,int]]:
      pairs = []
      for i in range(n):
          j = f(i)
          if 0 <= j < n:
              pairs.append((i, j))
      return pairs

  # Collatz-like family: even→ n//d  (integer division), odd→ a*n + b
  # Standard Collatz is (d=2, a=3, b=1).

  def collatz_like_pairs(n:int, d:int=2, a:int=3, b:int=1) -> List[Tuple[int,int]]:
      def f(i:int)->int:
          if i==0: return 0
          if i % 2 == 0:
              return i // d
          else:
              return a*i + b
      return pairs_from_function(n, f)

  # Pure affine map f(n)=a*n + b (no parity split)

  def affine_pairs(n:int, a:int, b:int) -> List[Tuple[int,int]]:
      return pairs_from_function(n, lambda i: a*i + b)

  # =============================================
  # Stepwise evolution
  # =============================================

  def evolve_RY_stepwise(R, Y, steps=10, closure_step=1, verbose=False):
      hist = []
      for t in range(steps):
          CY = C_graph_step(Y, steps=closure_step)
          Rn = mat_bool_mul(R, CY)
          Yn = mat_bool_or(Y, CY)
          S = action_S(Rn, Yn)
          sig = sigma_score(Rn, Yn)
          if verbose:
              print(f"t={t:02d}  S={S:.3f}  σ={sig:.3f}")
          hist.append((Rn, Yn, S, sig))
          if t>0 and abs(hist[-1][2]-hist[-2][2])<1e-9:
              break
          R, Y = Rn, Yn
      return hist

  # =============================================
  # Residue-class analysis & stats
  # =============================================

  def residue_partition(n:int, mod:int) -> Dict[int, List[int]]:
      part = defaultdict(list)
      for i in range(n):
          part[i % mod].append(i)
      return part


  def residue_metrics(R: List[List[int]], Y: List[List[int]], mod:int=6):
      n = len(Y)
      classes = residue_partition(n, mod)
      res_metrics: Dict[int, Tuple[float,float]] = {}
      for r, idxs in classes.items():
          if not idxs: continue
          subR = [[R[i][j] for j in idxs] for i in idxs]
          subY = [[Y[i][j] for j in idxs] for i in idxs]
          S = action_S(subR, subY)
          sig = sigma_score(subR, subY)
          res_metrics[r] = (S, sig)
      return res_metrics


  def residue_decay_stats(per_residue: List[Dict[int, Tuple[float, float]]]):
      T = len(per_residue)
      residues = sorted(per_residue[0].keys())
      stats = {}
      for r in residues:
          S_series = [per_residue[t][r][0] for t in range(T)]
          t0 = None
          for t, Sv in enumerate(S_series):
              if Sv == 0:
                  t0 = t
                  break
          S0 = S_series[0]
          S1 = S_series[1] if T>1 else S0
          drop = (S0 - S1) / S0 if S0>0 else 1.0
          auc = sum(S_series)
          stats[r] = {"time_to_zero": float(t0 if t0 is not None else -1),
                      "first_drop_ratio": float(drop),
                      "auc_S": float(auc)}
      # Modulus-level aggregates
      def avg(xs): return sum(xs)/len(xs) if xs else 0.0
      agg = {
          "avg_time_to_zero": avg([v["time_to_zero"] for v in stats.values()]),
          "avg_first_drop_ratio": avg([v["first_drop_ratio"] for v in stats.values()]),
          "avg_auc_S": avg([v["auc_S"] for v in stats.values()])
      }
      return stats, agg

  # =============================================
  # Experiment wrappers
  # =============================================

  def run_residue_experiment(R, n:int, steps:int, closure_step:int, mod_list:List[int]):
      Y0 = line_graph(n)
      hist = evolve_RY_stepwise(R, Y0, steps=steps, closure_step=closure_step, verbose=False)
      per_mod_residue = {}
      per_mod_agg = {}
      for m in mod_list:
          per_residue = [residue_metrics(Rt, Yt, mod=m) for (Rt, Yt, _, _) in hist]
          stats, agg = residue_decay_stats(per_residue)
          per_mod_residue[m] = per_residue
          per_mod_agg[m] = agg
      return hist, per_mod_residue, per_mod_agg

  # Sweep over a,b for collatz-like family (even→n//2, odd→a*n+b)

  def sweep_collatz_like(n:int=80, steps:int=10, closure_step:int=1, a_vals:Iterable[int]=range(2,6), b_vals:Iterable[int]=range(1,6), mod_list:List[int]=[4,6,8,12]):
      results = {}
      for a in a_vals:
          for b in b_vals:
              R = relation_from_pairs(n, n, collatz_like_pairs(n, d=2, a=a, b=b))
              hist, per_mod_residue, per_mod_agg = run_residue_experiment(R, n, steps, closure_step, mod_list)
              results[(a,b)] = {"hist": hist, "per_mod_residue": per_mod_residue, "per_mod_agg": per_mod_agg}
      return results

  # Optional: sweep pure affine (not default Collatz-like)

  def sweep_affine(n:int=80, steps:int=10, closure_step:int=1, a_vals:Iterable[int]=range(2,6), b_vals:Iterable[int]=range(1,6), mod_list:List[int]=[4,6,8,12]):
      results = {}
      for a in a_vals:
          for b in b_vals:
              R = relation_from_pairs(n, n, affine_pairs(n, a, b))
              hist, per_mod_residue, per_mod_agg = run_residue_experiment(R, n, steps, closure_step, mod_list)
              results[(a,b)] = {"hist": hist, "per_mod_residue": per_mod_residue, "per_mod_agg": per_mod_agg}
      return results

  # =============================================
  # Visualization
  # =============================================

  def heatmap_mod_spectrum(results:Dict[Tuple[int,int], dict], mod:int, metric:str="avg_auc_S", title_prefix:str="Collatz-like"):
      # Build grid for a,b
      a_vals = sorted({a for (a,_) in results.keys()})
      b_vals = sorted({b for (_,b) in results.keys()})
      Z = [[0.0 for _ in b_vals] for _ in a_vals]
      for ia, a in enumerate(a_vals):
          for ib, b in enumerate(b_vals):
              Z[ia][ib] = results[(a,b)]["per_mod_agg"][mod][metric]
      fig, ax = plt.subplots(figsize=(6,5))
      im = ax.imshow(Z, aspect='auto')
      ax.set_xticks(range(len(b_vals))); ax.set_xticklabels([str(b) for b in b_vals])
      ax.set_yticks(range(len(a_vals))); ax.set_yticklabels([str(a) for a in a_vals])
      ax.set_xlabel('b'); ax.set_ylabel('a')
      ax.set_title(f"{title_prefix}: {metric} (mod {mod})")
      plt.colorbar(im, ax=ax)
      plt.tight_layout(); plt.show()


  def print_mod_agg_table(results:Dict[Tuple[int,int], dict], mod:int):
      print(f"\n=== Modulus {mod} aggregates ===")
      print(" a  b   avg_ttz  avg_drop  avg_auc_S")
      for (a,b), rec in sorted(results.items()):
          agg = rec["per_mod_agg"][mod]
          print(f" {a:>1}  {b:>1}   {agg['avg_time_to_zero']:.2f}    {agg['avg_first_drop_ratio']:.3f}     {agg['avg_auc_S']:.2f}")

  # =============================================
  # Main: run a sweep and visualize
  # =============================================
  if __name__ == "__main__":
      n = 80
      steps = 10
      closure_step = 1
      mod_list = [4,6,8,12]

      # Sweep Collatz-like family (even→n//2, odd→a*n+b)
      results = sweep_collatz_like(n=n, steps=steps, closure_step=closure_step, a_vals=range(2,6), b_vals=range(1,6), mod_list=mod_list)

      # Show heatmaps for a couple of metrics at key moduli
      heatmap_mod_spectrum(results, mod=6, metric="avg_auc_S", title_prefix="Collatz-like")
      heatmap_mod_spectrum(results, mod=4, metric="avg_auc_S", title_prefix="Collatz-like")

      # Print compact tables at mod 6 and mod 4
      print_mod_agg_table(results, mod=6)
      print_mod_agg_table(results, mod=4)

      # (Optional) compare pure affine family by uncommenting below
      aff_results = sweep_affine(n=n, steps=steps, closure_step=closure_step, a_vals=range(2,6), b_vals=range(1,6), mod_list=mod_list)
      heatmap_mod_spectrum(aff_results, mod=6, metric="avg_auc_S", title_prefix="Affine a*n+b")
      print_mod_agg_table(aff_results, mod=6)
```


```python
  # RITM—Affine Family (Collatz-like) Modal Spectrum
  # Requires: sim.py in the same directory

  from sim import *
  import matplotlib.pyplot as plt
  from collections import defaultdict
  from typing import Dict, List, Tuple, Iterable
  import math

  # =============================================
  # Stepwise comonadic operators
  # =============================================

  def box_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      n = len(A)
      C = [row[:] for row in A]
      for _ in range(steps):
          C_next = mat_bool_or(C, mat_bool_mul(C, A))
          for i in range(n):
              C_next[i][i] = 1
          C = C_next
      return C

  def diamond_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return transpose(box_step(transpose(A), steps=steps))

  def C_graph_step(A: List[List[int]], steps:int=1) -> List[List[int]]:
      return box_step(diamond_step(A, steps=steps), steps=steps)

  # =============================================
  # Relation constructors
  # =============================================

  def pairs_from_function(n:int, f)->List[Tuple[int,int]]:
      pairs = []
      for i in range(n):
          j = f(i)
          if 0 <= j < n:
              pairs.append((i, j))
      return pairs

  # Collatz-like family: even→ n//d  (integer division), odd→ a*n + b
  # Standard Collatz is (d=2, a=3, b=1).

  def collatz_like_pairs(n:int, d:int=2, a:int=3, b:int=1) -> List[Tuple[int,int]]:
      def f(i:int)->int:
          if i==0: return 0
          if i % 2 == 0:
              return i // d
          else:
              return a*i + b
      return pairs_from_function(n, f)

  # Pure affine map f(n)=a*n + b (no parity split)

  def affine_pairs(n:int, a:int, b:int) -> List[Tuple[int,int]]:
      return pairs_from_function(n, lambda i: a*i + b)

  # =============================================
  # Stepwise evolution
  # =============================================

  def evolve_RY_stepwise(R, Y, steps=10, closure_step=1, verbose=False):
      hist = []
      for t in range(steps):
          CY = C_graph_step(Y, steps=closure_step)
          Rn = mat_bool_mul(R, CY)
          Yn = mat_bool_or(Y, CY)
          S = action_S(Rn, Yn)
          sig = sigma_score(Rn, Yn)
          if verbose:
              print(f"t={t:02d}  S={S:.3f}  σ={sig:.3f}")
          hist.append((Rn, Yn, S, sig))
          if t>0 and abs(hist[-1][2]-hist[-2][2])<1e-9:
              break
          R, Y = Rn, Yn
      return hist

  # =============================================
  # Residue-class analysis & stats
  # =============================================

  def residue_partition(n:int, mod:int) -> Dict[int, List[int]]:
      part = defaultdict(list)
      for i in range(n):
          part[i % mod].append(i)
      return part


  def residue_metrics(R: List[List[int]], Y: List[List[int]], mod:int=6):
      n = len(Y)
      classes = residue_partition(n, mod)
      res_metrics: Dict[int, Tuple[float,float]] = {}
      for r, idxs in classes.items():
          if not idxs: continue
          subR = [[R[i][j] for j in idxs] for i in idxs]
          subY = [[Y[i][j] for j in idxs] for i in idxs]
          S = action_S(subR, subY)
          sig = sigma_score(subR, subY)
          res_metrics[r] = (S, sig)
      return res_metrics


  def residue_decay_stats(per_residue: List[Dict[int, Tuple[float, float]]]):
      T = len(per_residue)
      residues = sorted(per_residue[0].keys())
      stats = {}
      for r in residues:
          S_series = [per_residue[t][r][0] for t in range(T)]
          t0 = None
          for t, Sv in enumerate(S_series):
              if Sv == 0:
                  t0 = t
                  break
          S0 = S_series[0]
          S1 = S_series[1] if T>1 else S0
          drop = (S0 - S1) / S0 if S0>0 else 1.0
          auc = sum(S_series)
          stats[r] = {"time_to_zero": float(t0 if t0 is not None else -1),
                      "first_drop_ratio": float(drop),
                      "auc_S": float(auc)}
      # Modulus-level aggregates
      def avg(xs): return sum(xs)/len(xs) if xs else 0.0
      agg = {
          "avg_time_to_zero": avg([v["time_to_zero"] for v in stats.values()]),
          "avg_first_drop_ratio": avg([v["first_drop_ratio"] for v in stats.values()]),
          "avg_auc_S": avg([v["auc_S"] for v in stats.values()])
      }
      return stats, agg

  # =============================================
  # Experiment wrappers
  # =============================================

  def run_residue_experiment(R, n:int, steps:int, closure_step:int, mod_list:List[int]):
      Y0 = line_graph(n)
      hist = evolve_RY_stepwise(R, Y0, steps=steps, closure_step=closure_step, verbose=False)
      per_mod_residue = {}
      per_mod_agg = {}
      for m in mod_list:
          per_residue = [residue_metrics(Rt, Yt, mod=m) for (Rt, Yt, _, _) in hist]
          stats, agg = residue_decay_stats(per_residue)
          per_mod_residue[m] = per_residue
          per_mod_agg[m] = agg
      return hist, per_mod_residue, per_mod_agg

  # Sweep over a,b for collatz-like family (even→n//2, odd→a*n+b)

  def sweep_collatz_like(n:int=80, steps:int=10, closure_step:int=1, a_vals:Iterable[int]=range(2,6), b_vals:Iterable[int]=range(1,6), mod_list:List[int]=[4,6,8,12]):
      results = {}
      for a in a_vals:
          for b in b_vals:
              R = relation_from_pairs(n, n, collatz_like_pairs(n, d=2, a=a, b=b))
              hist, per_mod_residue, per_mod_agg = run_residue_experiment(R, n, steps, closure_step, mod_list)
              results[(a,b)] = {"hist": hist, "per_mod_residue": per_mod_residue, "per_mod_agg": per_mod_agg}
      return results

  # Optional: sweep pure affine (not default Collatz-like)

  def sweep_affine(n:int=80, steps:int=10, closure_step:int=1, a_vals:Iterable[int]=range(2,6), b_vals:Iterable[int]=range(1,6), mod_list:List[int]=[4,6,8,12]):
      results = {}
      for a in a_vals:
          for b in b_vals:
              R = relation_from_pairs(n, n, affine_pairs(n, a, b))
              hist, per_mod_residue, per_mod_agg = run_residue_experiment(R, n, steps, closure_step, mod_list)
              results[(a,b)] = {"hist": hist, "per_mod_residue": per_mod_residue, "per_mod_agg": per_mod_agg}
      return results

  # =============================================
  # Visualization
  # =============================================

  def heatmap_mod_spectrum(results:Dict[Tuple[int,int], dict], mod:int, metric:str="avg_auc_S", title_prefix:str="Collatz-like"):
      # Build grid for a,b
      a_vals = sorted({a for (a,_) in results.keys()})
      b_vals = sorted({b for (_,b) in results.keys()})
      Z = [[0.0 for _ in b_vals] for _ in a_vals]
      for ia, a in enumerate(a_vals):
          for ib, b in enumerate(b_vals):
              Z[ia][ib] = results[(a,b)]["per_mod_agg"][mod][metric]
      fig, ax = plt.subplots(figsize=(6,5))
      im = ax.imshow(Z, aspect='auto')
      ax.set_xticks(range(len(b_vals))); ax.set_xticklabels([str(b) for b in b_vals])
      ax.set_yticks(range(len(a_vals))); ax.set_yticklabels([str(a) for a in a_vals])
      ax.set_xlabel('b'); ax.set_ylabel('a')
      ax.set_title(f"{title_prefix}: {metric} (mod {mod})")
      plt.colorbar(im, ax=ax)
      plt.tight_layout(); plt.show()


  def print_mod_agg_table(results:Dict[Tuple[int,int], dict], mod:int):
      print(f"\n=== Modulus {mod} aggregates ===")
      print(" a  b   avg_ttz  avg_drop  avg_auc_S")
      for (a,b), rec in sorted(results.items()):
          agg = rec["per_mod_agg"][mod]
          print(f" {a:>1}  {b:>1}   {agg['avg_time_to_zero']:.2f}    {agg['avg_first_drop_ratio']:.3f}     {agg['avg_auc_S']:.2f}")

  # =============================================
  # Main: run a sweep and visualize
  # =============================================
  if __name__ == "__main__":
      n = 80
      steps = 10
      closure_step = 1
      mod_list = [4,6,8,12]

      # Sweep Collatz-like family (even→n//2, odd→a*n+b)
      results = sweep_collatz_like(n=n, steps=steps, closure_step=closure_step, a_vals=range(2,6), b_vals=range(1,6), mod_list=mod_list)

      # Show heatmaps for a couple of metrics at key moduli
      heatmap_mod_spectrum(results, mod=6, metric="avg_auc_S", title_prefix="Collatz-like")
      heatmap_mod_spectrum(results, mod=4, metric="avg_auc_S", title_prefix="Collatz-like")

      # Print compact tables at mod 6 and mod 4
      print_mod_agg_table(results, mod=6)
      print_mod_agg_table(results, mod=4)

      # (Optional) compare pure affine family by uncommenting below
      # aff_results = sweep_affine(n=n, steps=steps, closure_step=closure_step, a_vals=range(2,6), b_vals=range(1,6), mod_list=mod_list)
      # heatmap_mod_spectrum(aff_results, mod=6, metric="avg_auc_S", title_prefix="Affine a*n+b")
      # print_mod_agg_table(aff_results, mod=6)


  # === Parity-commutation vs instant stabilization (formal test kit) ===
  # Utilities to test the equivalence at modulus m (default 6).

  from typing import Optional

  # Solve d * t ≡ r (mod m). Returns all solutions t in [0, m-1].
  def solve_linear_congruence(d: int, r: int, m: int):
      from math import gcd
      g = gcd(d, m)
      sols = []
      if r % g != 0:
          return sols  # no solution
      d1, r1, m1 = d // g, r // g, m // g
      # find inverse of d1 modulo m1
      # (m1 and d1 are coprime now)
      inv = pow(d1, -1, m1)
      t0 = (inv * r1) % m1
      # lift to all g solutions modulo m
      for k in range(g):
          sols.append((t0 + k * m1) % m)
      return sols

  def residue_relation_collatz_like(a:int, b:int, d:int, m:int):
      # existential lift: r -> any t with f(x) ≡ t (mod m) for some x ≡ r (mod m)
      R = zeros(m, m)
      for r in range(m):
          if r % 2 == 1:
              t = (a * r + b) % m               # odd branch is single-valued mod m
              R[r][t] = 1
          else:
              # even branch: x -> x/d, lifted: all t with d*t ≡ r (mod m)
              for t in solve_linear_congruence(d, r, m):
                  R[r][t] = 1
      return R


  def extract_block(R: List[List[int]], idxs: List[int]) -> List[List[int]]:
      return [[R[i][j] for j in idxs] for i in idxs]

  def embed_block(B: List[List[int]], idxs: List[int], m:int) -> List[List[int]]:
      O = zeros(m, m)
      for a,i in enumerate(idxs):
          for b,j in enumerate(idxs):
              O[i][j] = B[a][b]
      return O

  def bool_xor(A: List[List[int]], B: List[List[int]]) -> List[List[int]]:
      n = len(A); m = len(A[0]) if n else 0
      X = zeros(n,m)
      for i in range(n):
          for j in range(m):
              X[i][j] = A[i][j] ^ B[i][j]
      return X

  def nnz(A: List[List[int]]) -> int:
      return count_ones(A)

  def nucleus_block_step(R: List[List[int]], idxs: List[int], use_step: bool=True) -> List[List[int]]:
      m = len(R)
      sub = extract_block(R, idxs)
      closed = C_graph_step(sub, steps=1) if use_step else rtc(sub)
      return embed_block(closed, idxs, m)

  def parity_commutation_defect(R: List[List[int]], m:int, use_step: bool=True) -> int:
      E = [i for i in range(m) if i % 2 == 0]
      O = [i for i in range(m) if i % 2 == 1]
      NE = nucleus_block_step(R, E, use_step=use_step)
      NO = nucleus_block_step(R, O, use_step=use_step)
      A = nucleus_block_step(NO, E, use_step=use_step)  # N_E(N_O(R))
      B = nucleus_block_step(NE, O, use_step=use_step)  # N_O(N_E(R))
      return nnz(bool_xor(A,B))

  def stabilization_depth_on_residues(R: List[List[int]], max_steps:int=6) -> Optional[int]:
      # returns the smallest t s.t. rho_t = 0 when evolving with stepwise C
      cur = [row[:] for row in R]
      for t in range(max_steps+1):
          rho = mat_xor(cur, C_graph_step(cur, steps=1))
          if nnz(rho) == 0:
              return t
          cur = C_graph_step(cur, steps=1)
      return None

  # Driver: sweep (a,b) and build confusion matrix for m=6

  def test_equivalence_mod6(a_vals=range(2,6), b_vals=range(1,6), d:int=2, m:int=6, use_step:bool=True):
      cm = {('Δ=0','τ=0'):0, ('Δ=0','τ>0'):0, ('Δ>0','τ=0'):0, ('Δ>0','τ>0'):0}
      rows = []
      for a in a_vals:
          for b in b_vals:
              R6 = residue_relation_collatz_like(a,b,d,m)
              delta = parity_commutation_defect(R6, m, use_step=use_step)
              tau   = stabilization_depth_on_residues(R6)
              key = ( 'Δ=0' if delta==0 else 'Δ>0', 'τ=0' if tau==0 else 'τ>0' )
              cm[key] += 1
              rows.append((a,b,delta,tau))
      return cm, rows

  if __name__ == "__main__":
      print("  === Parity-commutation vs instant stabilization @ mod 6 ===")
      cm, rows = test_equivalence_mod6()
      for k in [('Δ=0','τ=0'), ('Δ=0','τ>0'), ('Δ>0','τ=0'), ('Δ>0','τ>0')]:
          print(f"{k}: {cm[k]}")
      print("  Sample rows (a,b, Δ, τ):")
      for rec in rows:
          print(rec)
```

## Earlier material

#+begin_src python :tangle ./src/ritm/collatz-stabilizer-0.1.0.py

#+begin_src python :tangle ./src/ritm/collatz-stabilizer-0.1.1.py
  # RITM-Collatz Experiment Simulator
  # Requires: sim.py in the same directory

#+begin_src python :tangle ./src/ritm/collatz-stabilizer-0.1.2.py
  # RITM-Collatz Experiment Simulator (Stepwise Comonadic Version)
  # Requires: sim.py in the same directory

#+begin_src python :tangle ./src/ritm/collatz-stabilizer-0.1.3.py

#+begin_src python :tangle ./src/ritm/collatz-stabilizer-0.1.4.py
  # RITM-Collatz Experiment Simulator with Residue-Class Analysis & Decay Rates
  # Requires: sim.py in the same directory

#+begin_src python :tangle ./src/ritm/collatz-explorer-0.1.0.py
  # RITM—Affine Family (Collatz-like) Modal Spectrum
  # Requires: sim.py in the same directory

#+begin_src python :tangle ./src/ritm/affine-explorer-0.1.0.py
  # RITM—Affine Family (Collatz-like) Modal Spectrum
  # Requires: sim.py in the same directory
