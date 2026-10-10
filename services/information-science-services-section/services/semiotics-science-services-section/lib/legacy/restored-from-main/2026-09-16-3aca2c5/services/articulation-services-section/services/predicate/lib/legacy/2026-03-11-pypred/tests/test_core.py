from pypred import BilatticeValue, PredicationCell, PredicationStore
from pypred.category import knowledge_join, negate


def test_bilattice_negation_and_knowledge_join() -> None:
    assert negate(BilatticeValue.T) is BilatticeValue.F
    assert knowledge_join(BilatticeValue.T, BilatticeValue.F) is BilatticeValue.TOP


def test_predication_store_merges_repeated_cells_by_knowledge() -> None:
    store = PredicationStore.from_cells(
        [
            PredicationCell("alice", "trusts", "bob", BilatticeValue.T),
            PredicationCell("alice", "trusts", "bob", BilatticeValue.F),
        ]
    )

    assert store.get("alice", "trusts", "bob") is BilatticeValue.TOP
