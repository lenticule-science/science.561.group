"""Predication cells and finite predication stores."""

from __future__ import annotations

from dataclasses import dataclass
from typing import Hashable, Iterable, Iterator

from pypred.category.bilattice import BilatticeValue, knowledge_join


@dataclass(frozen=True)
class PredicationCell:
    """An immutable ``(subject, predicate, object, value)`` predication cell."""

    subject: Hashable
    predicate: Hashable
    object: Hashable
    value: BilatticeValue = BilatticeValue.T

    @property
    def key(self) -> tuple[Hashable, Hashable, Hashable]:
        """Return the value-independent predication key."""
        return (self.subject, self.predicate, self.object)


@dataclass(frozen=True)
class PredicationStore:
    """A finite map of predication keys to bilattice values.

    Re-inserting the same ``(subject, predicate, object)`` merges values with
    the bilattice knowledge join. This makes repeated observations monotone in
    evidence: learning both ``t`` and ``f`` yields ``top``.
    """

    _values: dict[tuple[Hashable, Hashable, Hashable], BilatticeValue]

    @classmethod
    def empty(cls) -> "PredicationStore":
        """Return an empty predication store."""
        return cls({})

    @classmethod
    def from_cells(cls, cells: Iterable[PredicationCell]) -> "PredicationStore":
        """Build a store by inserting cells in order."""
        store = cls.empty()
        for cell in cells:
            store = store.insert(cell)
        return store

    def insert(self, cell: PredicationCell) -> "PredicationStore":
        """Return a new store with ``cell`` merged into it."""
        values = dict(self._values)
        existing = values.get(cell.key, BilatticeValue.BOT)
        values[cell.key] = knowledge_join(existing, cell.value)
        return PredicationStore(values)

    def get(
        self,
        subject: Hashable,
        predicate: Hashable,
        object: Hashable,
        default: BilatticeValue = BilatticeValue.BOT,
    ) -> BilatticeValue:
        """Return a cell value, or ``default`` when the key is absent."""
        return self._values.get((subject, predicate, object), default)

    def cells(self) -> Iterator[PredicationCell]:
        """Yield all cells in deterministic key order."""
        for subject, predicate, object_ in sorted(self._values, key=lambda item: tuple(map(str, item))):
            yield PredicationCell(
                subject=subject,
                predicate=predicate,
                object=object_,
                value=self._values[(subject, predicate, object_)],
            )

    def merge(self, other: "PredicationStore") -> "PredicationStore":
        """Knowledge-merge two stores."""
        result = self
        for cell in other.cells():
            result = result.insert(cell)
        return result
