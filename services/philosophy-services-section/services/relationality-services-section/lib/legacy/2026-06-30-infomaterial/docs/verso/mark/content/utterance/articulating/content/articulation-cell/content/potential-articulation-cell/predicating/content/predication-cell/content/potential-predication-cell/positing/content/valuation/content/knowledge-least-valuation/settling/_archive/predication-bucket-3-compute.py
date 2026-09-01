"""Stochastic settling: Markov-chain iteration to stationary distribution.

For a transition matrix P on n states:
- v_k(s, o) = P^k(s, o) = probability of being in state o after k steps from s.
- Closure step: v_{k+1} = v_k * P (matrix multiplication).
- Settling = stationary distribution pi (rank-one kernel where every row is pi).

Pure Python implementation (no numpy on this VPS).

Empirical questions:
1. Convergence rate: ||v_k - pi||_inf decays like rho^k (rho = second eigenvalue magnitude).
2. Firing pattern: at what step k does each cell (s, o) first become non-zero?
3. Comparison: stationary distribution from iteration vs. solving pi P = pi.
"""

from fractions import Fraction


def matmul(A, B):
    """Matrix multiplication for list-of-lists."""
    n = len(A)
    m = len(B[0])
    k = len(B)
    return [[sum(A[i][z] * B[z][j] for z in range(k)) for j in range(m)] for i in range(n)]


def matsub(A, B):
    n = len(A)
    return [[A[i][j] - B[i][j] for j in range(len(A[0]))] for i in range(n)]


def matnorm_inf(A):
    return max(abs(x) for row in A for x in row)


def identity(n):
    return [[1.0 if i == j else 0.0 for j in range(n)] for i in range(n)]


def stationary_solve(P):
    """Solve pi P = pi, sum pi = 1, by power iteration on left.
    Just iterate until convergence."""
    n = len(P)
    pi = [1.0 / n] * n
    for _ in range(2000):
        new_pi = [sum(pi[s] * P[s][o] for s in range(n)) for o in range(n)]
        # normalize
        s = sum(new_pi)
        new_pi = [x / s for x in new_pi]
        if max(abs(new_pi[i] - pi[i]) for i in range(n)) < 1e-14:
            return new_pi
        pi = new_pi
    return pi


def power_iteration_eigenvalue_2(P, max_iter=2000):
    """Estimate the second-largest eigenvalue magnitude via deflation.
    Iterate (P - 1*pi*ones^T) and find its dominant eigenvalue magnitude."""
    n = len(P)
    pi = stationary_solve(P)
    # The dominant eigenpair is (1, ones-vector right; pi left).
    # Deflate: P_def = P - ones * pi^T. P_def has all eigenvalues of P except the 1.
    P_def = [[P[i][j] - pi[j] for j in range(n)] for i in range(n)]
    # Power iterate on P_def from a random vector.
    v = [1.0 / (i + 1) for i in range(n)]
    # Subtract component along ones (the deflated direction).
    s = sum(v) / n
    v = [x - s for x in v]
    last_norm = 0
    rho = 0
    for k in range(max_iter):
        new_v = [sum(P_def[i][j] * v[j] for j in range(n)) for i in range(n)]
        new_norm = max(abs(x) for x in new_v)
        if new_norm < 1e-15:
            return 0.0
        if last_norm > 0:
            rho = new_norm / last_norm
        v = [x / new_norm for x in new_v]
        last_norm = 1.0  # because we just normalized
        # Actually we need to track ratio properly.
    return rho


def settle(P, max_iter=500, tol=1e-12):
    """Iterate v_{k+1} = v_k P starting from v_0 = I."""
    n = len(P)
    pi = stationary_solve(P)
    pi_kernel = [[pi[j] for j in range(n)] for _ in range(n)]
    v = identity(n)
    history = [[row[:] for row in v]]
    deviations = []
    for k in range(1, max_iter + 1):
        v = matmul(v, P)
        history.append([row[:] for row in v])
        dev = matnorm_inf(matsub(v, pi_kernel))
        deviations.append(dev)
        if dev < tol:
            break
    return v, history, deviations, pi, pi_kernel


def first_firing(history, n):
    firings = {}
    for s in range(n):
        for o in range(n):
            for k, V in enumerate(history):
                if V[s][o] > 1e-12:
                    firings[(s, o)] = k
                    break
            else:
                firings[(s, o)] = None
    return firings


def fmt_mat(M, fmt="{:.4f}"):
    return "\n".join("  ".join(fmt.format(x) for x in row) for row in M)


def report(name, P):
    print(f"=== {name} ===")
    n = len(P)
    print(f"P =")
    print(fmt_mat(P))

    # Empirical rho: deviation ratio at late stages.
    # We'll compute it after settling.
    final, history, deviations, pi, pi_kernel = settle(P)
    print(f"\nStationary distribution pi = {[round(x, 6) for x in pi]}")

    # Estimate rho from deviation ratios at large k.
    if len(deviations) > 30:
        ratios = [deviations[k] / deviations[k-1] for k in range(20, min(40, len(deviations))) if deviations[k-1] > 1e-15]
        rho_emp = sum(ratios) / len(ratios) if ratios else None
        if rho_emp is not None:
            print(f"Empirical rho (avg ratio dev[k]/dev[k-1] at k=20-40): {rho_emp:.6f}")

    print(f"\nConvergence (max ||v_k - pi_kernel||_inf):")
    for k in [1, 2, 5, 10, 20, 50, len(deviations)]:
        if k <= len(deviations):
            print(f"  k = {k:>3}: dev = {deviations[k-1]:.3e}")

    firings = first_firing(history, n)
    firing_steps = [v for v in firings.values() if v is not None]
    n_fire_at = lambda x: sum(1 for v in firings.values() if v == x)
    print(f"\nFiring (first-positive-step) histogram:")
    for k in sorted(set(firing_steps)):
        print(f"  step {k}: {n_fire_at(k)} cells")
    n_never = sum(1 for v in firings.values() if v is None)
    if n_never > 0:
        print(f"  never: {n_never} cells (unreachable)")

    print(f"\nIterations to tol=1e-12: {len(deviations)}")
    print()


if __name__ == "__main__":
    P1 = [
        [0.0, 0.5, 0.5],
        [0.5, 0.0, 0.5],
        [0.5, 0.5, 0.0],
    ]
    report("Random walk on triangle K_3 (symmetric)", P1)

    P2 = [
        [0.5, 0.5, 0.0, 0.0],
        [0.3, 0.4, 0.3, 0.0],
        [0.0, 0.3, 0.4, 0.3],
        [0.0, 0.0, 0.5, 0.5],
    ]
    report("Birth-death chain on 4 states", P2)

    P3 = [
        [0.9, 0.1, 0.0, 0.0],
        [0.1, 0.8, 0.1, 0.0],
        [0.0, 0.1, 0.8, 0.1],
        [0.0, 0.0, 0.1, 0.9],
    ]
    report("Lazy walk on 4-line (slow-mixing)", P3)

    P4 = [
        [0.5, 0.5, 0.0],
        [0.0, 0.5, 0.5],
        [0.0, 0.0, 1.0],
    ]
    report("Absorbing chain (state 2 absorbs)", P4)
