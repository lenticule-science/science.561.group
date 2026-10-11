"""
Test the modified Fibonacci prediction: does the number of distinct
shortcut shapes TRUNCATED TO THEIR FIRST k STEPS grow like F_{k+1}?

This corresponds to the tower's depth-k truncation rather than the
full trajectory.
"""

from collections import defaultdict


def v2(n):
    if n == 0:
        return float('inf')
    count = 0
    while n % 2 == 0:
        count += 1
        n //= 2
    return count


def collatz_shortcut_shape(n, max_steps=None):
    """Compute shortcut shape: tuple of v_2 values at each odd step."""
    shape = []
    current = n
    seen = set()
    while current != 1:
        if current in seen:
            return None
        seen.add(current)
        if current % 2 == 0:
            current //= 2
        else:
            val = 3 * current + 1
            shape.append(v2(val))
            current = val >> v2(val)
            if max_steps is not None and len(shape) >= max_steps:
                break
    return tuple(shape)


def test_truncated_fibonacci(limit=100000):
    """
    For each truncation depth k, count distinct k-prefixes of shortcut shapes.
    """
    # Collect all shortcut shapes for odd n up to limit
    all_shapes = []
    for n in range(3, limit + 1, 2):
        shape = collatz_shortcut_shape(n)
        if shape is not None and len(shape) > 0:
            all_shapes.append(shape)

    max_depth = min(20, max(len(s) for s in all_shapes) if all_shapes else 0)

    # Fibonacci numbers
    fib = [0, 1]
    for _ in range(max_depth + 3):
        fib.append(fib[-1] + fib[-2])

    print(f"Truncated shape prediction (odd n up to {limit}, {len(all_shapes)} trajectories):")
    print(f"{'k':>4}  {'distinct k-prefixes':>20}  {'F_{k+1}':>8}  {'ratio':>10}  {'delta':>10}")
    print("-" * 62)

    prev_count = 0
    prev_prev_count = 0
    for k in range(1, max_depth + 1):
        prefixes = set()
        for shape in all_shapes:
            if len(shape) >= k:
                prefixes.add(shape[:k])
        count = len(prefixes)
        fib_val = fib[k + 1]
        ratio = count / fib_val if fib_val > 0 else float('inf')

        # Check additive Fibonacci property: count(k) =? count(k-1) + count(k-2)
        if k >= 3:
            fib_sum = prev_count + prev_prev_count
            delta = count - fib_sum
        else:
            delta = None

        delta_str = f"{delta:>10}" if delta is not None else "         -"
        print(f"{k:>4}  {count:>20}  {fib_val:>8}  {ratio:>10.2f}  {delta_str}")

        prev_prev_count = prev_count
        prev_count = count


def test_shape_length_distribution(limit=100000):
    """How many distinct shapes have length exactly k?"""
    shapes_by_length = defaultdict(set)
    for n in range(3, limit + 1, 2):
        shape = collatz_shortcut_shape(n)
        if shape is not None:
            shapes_by_length[len(shape)].add(shape)

    fib = [0, 1]
    for _ in range(50):
        fib.append(fib[-1] + fib[-2])

    print(f"\nDistinct shapes of length exactly k (odd n up to {limit}):")
    print(f"{'k':>4}  {'|shapes|':>10}  {'F_{k+1}':>8}  {'ratio':>10}  {'consecutive ratio':>18}")
    print("-" * 62)

    prev = 0
    for k in sorted(shapes_by_length.keys()):
        if k > 50:
            break
        count = len(shapes_by_length[k])
        fib_val = fib[k + 1] if k + 1 < len(fib) else None
        ratio = count / fib_val if fib_val and fib_val > 0 else None
        consec = count / prev if prev > 0 else None
        ratio_str = f"{ratio:>10.2f}" if ratio is not None else "         -"
        consec_str = f"{consec:>18.4f}" if consec is not None else "                 -"
        print(f"{k:>4}  {count:>10}  {fib_val if fib_val else '?':>8}  {ratio_str}  {consec_str}")
        prev = count


def test_v2_alphabet_shapes(limit=100000):
    """
    Alternative: count distinct shapes using a REDUCED alphabet.
    Instead of the exact v_2 value, use just {1, 2+} (one halving vs multiple).
    This binary reduction might show Fibonacci structure.
    """
    def reduce_shape(shape):
        return tuple(1 if v == 1 else 2 for v in shape)

    shapes_by_length = defaultdict(set)
    for n in range(3, limit + 1, 2):
        shape = collatz_shortcut_shape(n)
        if shape is not None:
            reduced = reduce_shape(shape)
            shapes_by_length[len(reduced)].add(reduced)

    fib = [0, 1]
    for _ in range(50):
        fib.append(fib[-1] + fib[-2])

    print(f"\nReduced shapes (v2=1 vs v2>=2) of length k (odd n up to {limit}):")
    print(f"{'k':>4}  {'|shapes|':>10}  {'2^k':>10}  {'F_{k+1}':>8}  {'ratio/F':>10}")
    print("-" * 52)

    for k in sorted(shapes_by_length.keys()):
        if k > 30:
            break
        count = len(shapes_by_length[k])
        pow2 = 2 ** k
        fib_val = fib[k + 1] if k + 1 < len(fib) else None
        ratio_f = count / fib_val if fib_val and fib_val > 0 else None
        ratio_str = f"{ratio_f:>10.2f}" if ratio_f is not None else "         -"
        print(f"{k:>4}  {count:>10}  {pow2:>10}  {fib_val if fib_val else '?':>8}  {ratio_str}")


if __name__ == "__main__":
    test_truncated_fibonacci(limit=50000)
    print("\n" + "=" * 62 + "\n")
    test_shape_length_distribution(limit=50000)
    print("\n" + "=" * 62 + "\n")
    test_v2_alphabet_shapes(limit=50000)
