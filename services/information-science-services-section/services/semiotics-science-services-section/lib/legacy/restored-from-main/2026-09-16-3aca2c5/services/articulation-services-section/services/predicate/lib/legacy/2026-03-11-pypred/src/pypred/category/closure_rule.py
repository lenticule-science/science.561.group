"""Closure rule system primitive.

A closure-rule system is a set of inference rules driving a closure operator T
on subsets of a cell set. Each rule has antecedents (cells whose presence
triggers the rule) and consequents (cells the rule produces).

Used across the corpus's tools for:

- forward-trajectory computation (settling dynamics, regime classification),
- cosettling enumeration (iterated-cosettling-counts theorem and friends),
- benchmark-suite verification.

For multi-valued / bilattice-valued cells, this needs extension; the current
primitive handles binary-presence cells only (sufficient for the strict-regime
combinatorial theorems).
"""

from __future__ import annotations

from dataclasses import dataclass, field
from itertools import combinations
from typing import Hashable, Iterable

State = frozenset


@dataclass(frozen=True)
class Rule:
    """A closure rule: if all antecedents are present, produce consequents.

    Both antecedents and consequents are tuples of cell labels. Rule firing
    is monotone — antecedent satisfaction in state S implies consequents
    are added to T(S).
    """

    antecedents: tuple[Hashable, ...]
    consequents: tuple[Hashable, ...]

    def fires_on(self, state: State) -> bool:
        return all(c in state for c in self.antecedents)


@dataclass(frozen=True)
class ClosureRuleSystem:
    """A closure-rule system: finite set of rules + cell universe.

    Construction validates that consequents and antecedents reference cells
    that exist in the universe (when universe is supplied). When universe
    is None, the universe is inferred as the union of all rule cells.
    """

    rules: tuple[Rule, ...]
    universe: frozenset[Hashable] | None = None

    def __post_init__(self) -> None:
        if self.universe is not None:
            for rule in self.rules:
                for c in rule.antecedents:
                    if c not in self.universe:
                        raise ValueError(f"rule antecedent {c!r} not in universe")
                for c in rule.consequents:
                    if c not in self.universe:
                        raise ValueError(f"rule consequent {c!r} not in universe")

    def cells(self) -> frozenset[Hashable]:
        """The cell universe — explicitly provided, or inferred from rules."""
        if self.universe is not None:
            return self.universe
        result: set[Hashable] = set()
        for rule in self.rules:
            result.update(rule.antecedents)
            result.update(rule.consequents)
        return frozenset(result)

    def apply(self, state: State) -> State:
        """One closure step: fire every rule whose antecedent is satisfied.
        Inflation is automatic (cells in state stay)."""
        new_state = set(state)
        for rule in self.rules:
            if rule.fires_on(state):
                new_state.update(rule.consequents)
        return frozenset(new_state)

    def forward_trajectory(self, seed: Iterable[Hashable], max_steps: int = 1000) -> list[State]:
        """Forward trajectory from seed until closure-stable. Raises if it
        doesn't stabilize within max_steps (the strict-regime theorems hold
        for max_steps < ω, where stabilization is finite by definition)."""
        traj: list[State] = [frozenset(seed)]
        for _ in range(max_steps):
            nxt = self.apply(traj[-1])
            if nxt == traj[-1]:
                return traj
            traj.append(nxt)
        raise RuntimeError(f"trajectory did not stabilize within {max_steps} steps")

    def cosettling(self, target: Iterable[Hashable]) -> list[State]:
        """T^{-1}(target): all v ⊆ target with T(v) = target.

        Enumeration over 2^|target| subsets — exponential but tractable for
        small targets (which is what the strict-regime benchmarks use).
        """
        target_fs = frozenset(target)
        cells_list = sorted(target_fs, key=lambda x: str(x))
        result: list[State] = []
        for r in range(len(cells_list) + 1):
            for combo in combinations(cells_list, r):
                v = frozenset(combo)
                if self.apply(v) == target_fs:
                    result.append(v)
        return result

    def iterated_cosettling(self, target: Iterable[Hashable], max_iter: int = 100) -> set[State]:
        """T^{*-1}(target): all v with T^k(v) = target for some k ≥ 0.

        Uses backward BFS from target via T^{-1}; converges when the frontier
        stabilizes (no new pre-images appear).
        """
        target_fs = frozenset(target)
        seen: set[State] = {target_fs}
        frontier: set[State] = {target_fs}
        for _ in range(max_iter):
            new_frontier: set[State] = set()
            for s in frontier:
                preimages = self.cosettling(s)
                for v in preimages:
                    if v not in seen:
                        seen.add(v)
                        new_frontier.add(v)
            if not new_frontier:
                return seen
            frontier = new_frontier
        raise RuntimeError(f"iterated cosettling did not stabilize within {max_iter} iterations")

    def closure_ordinal(self, seed: Iterable[Hashable]) -> int:
        """Smallest k such that T^k(seed) is closure-stable.

        For strict-regime systems this is finite; for non-strict systems
        you need transfinite iteration which this primitive doesn't handle.
        """
        return len(self.forward_trajectory(seed)) - 1


def rule(antecedents: Iterable[Hashable], consequents: Iterable[Hashable]) -> Rule:
    """Convenience constructor for Rule from any iterables."""
    return Rule(
        antecedents=tuple(antecedents),
        consequents=tuple(consequents),
    )
