"""
Test the framework's predictions about Collatz trajectory structure.

Prediction 1 (§collatz-fibonacci-prediction): The number of distinct
"shortcut shapes" (sequences of v_2 values at each odd step) realized
by Collatz trajectories of numbers with Omega(n) <= k grows like F_{k+1}.

Prediction 2 (§v2-kc-correspondence): The distribution of v_2(3n+1)
for odd n in Collatz trajectories is geometric with parameter 1/2.

We test both against actual Collatz data.
"""

from collections import defaultdict
from math import gcd


def omega(n):
    """Number of prime factors of n counted with multiplicity."""
    if n <= 1:
        return 0
    count = 0
    d = 2
    while d * d <= n:
        while n % d == 0:
            count += 1
            n //= d
        d += 1
    if n > 1:
        count += 1
    return count


def v2(n):
    """2-adic valuation of n."""
    if n == 0:
        return float('inf')
    count = 0
    while n % 2 == 0:
        count += 1
        n //= 2
    return count


def collatz_shortcut_shape(n):
    """
    Compute the shortcut shape of n's Collatz trajectory.

    The shortcut shape is the tuple of v_2(3m+1) values for each odd m
    encountered in the trajectory (excluding the final 1).

    For example, n=7: 7 -> 22 (v2=1) -> 11 -> 34 (v2=1) -> 17 -> 52 (v2=2) -> 13 -> ...
    The shape records the number of halvings after each tripling step.
    """
    shape = []
    current = n
    seen = set()
    while current != 1:
        if current in seen:
            return None  # cycle detected (shouldn't happen for small n)
        seen.add(current)
        if current % 2 == 0:
            current //= 2
        else:
            val = 3 * current + 1
            v = v2(val)
            shape.append(v)
            current = val >> v  # shortcut: apply all halvings at once
    return tuple(shape)


def collatz_v2_distribution(limit):
    """
    Collect the distribution of v_2(3n+1) for all odd n in Collatz
    trajectories of starting values up to `limit`.
    """
    counts = defaultdict(int)
    total = 0
    for start in range(3, limit + 1, 2):  # odd starting values
        n = start
        seen = set()
        while n != 1 and n not in seen:
            seen.add(n)
            if n % 2 == 0:
                n //= 2
            else:
                val = 3 * n + 1
                v = v2(val)
                counts[v] += 1
                total += 1
                n = val >> v
    return counts, total


def fibonacci(k):
    """Return F_k (0-indexed: F_0=0, F_1=1, F_2=1, F_3=2, ...)."""
    a, b = 0, 1
    for _ in range(k):
        a, b = b, a + b
    return a


def test_fibonacci_prediction(limit=10000):
    """
    Test: does the number of distinct shortcut shapes for Omega(n) <= k
    grow like F_{k+1}?
    """
    # Compute shortcut shapes and group by Omega
    shapes_by_max_omega = defaultdict(set)

    for n in range(2, limit + 1):
        if n % 2 == 0:
            continue  # only odd starting values have meaningful shortcut shapes
        om = omega(n)
        shape = collatz_shortcut_shape(n)
        if shape is not None:
            # This shape is realized by a number with Omega = om,
            # so it contributes to all k >= om
            shapes_by_max_omega[om].add(shape)

    # Accumulate: shapes for Omega <= k
    max_k = max(shapes_by_max_omega.keys()) if shapes_by_max_omega else 0
    cumulative = set()
    print(f"Fibonacci prediction test (odd n up to {limit}):")
    print(f"{'k':>4}  {'|shapes| Omega<=k':>18}  {'F_{k+1}':>8}  {'ratio':>8}")
    print("-" * 50)

    for k in range(1, max_k + 1):
        cumulative |= shapes_by_max_omega.get(k, set())
        count = len(cumulative)
        fib = fibonacci(k + 1)
        ratio = count / fib if fib > 0 else float('inf')
        print(f"{k:>4}  {count:>18}  {fib:>8}  {ratio:>8.2f}")


def test_v2_distribution(limit=50000):
    """
    Test: is v_2(3n+1) geometric with parameter 1/2?
    """
    counts, total = collatz_v2_distribution(limit)
    print(f"\nv_2(3n+1) distribution (odd steps in trajectories up to {limit}):")
    print(f"{'v_2':>4}  {'observed':>10}  {'freq':>8}  {'predicted (1/2^v)':>18}")
    print("-" * 50)

    for v in sorted(counts.keys()):
        freq = counts[v] / total
        predicted = 1.0 / (2 ** v)
        print(f"{v:>4}  {counts[v]:>10}  {freq:>8.4f}  {predicted:>18.4f}")

    print(f"\nTotal odd steps: {total}")


def test_shortcut_shape_examples():
    """Show shortcut shapes for small odd numbers."""
    print("Shortcut shapes for small odd n:")
    print(f"{'n':>6}  {'Omega':>5}  {'shape':>30}")
    print("-" * 50)
    for n in range(3, 100, 2):
        shape = collatz_shortcut_shape(n)
        om = omega(n)
        print(f"{n:>6}  {om:>5}  {str(shape):>30}")


if __name__ == "__main__":
    test_shortcut_shape_examples()
    print("\n" + "=" * 60 + "\n")
    test_fibonacci_prediction(limit=10000)
    print("\n" + "=" * 60 + "\n")
    test_v2_distribution(limit=50000)
