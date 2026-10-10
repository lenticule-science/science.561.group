from __future__ import annotations

from relationing.language import Type
from relationing.structures.unary_explorer import UnaryFragment, find_unary_ops
from relationing.structures.semantics import is_sequent_valid_in_models
from relationing.structure import Relationlessness, build_powerset_heyting_algebra


def main() -> None:
    fragment = UnaryFragment.small_implicational_fragment(atom="p")
    atoms = [fragment.atom]
    analyses = find_unary_ops(fragment)

    void = Relationlessness()
    bool_model = build_powerset_heyting_algebra(void, atoms).as_list()
    models = [bool_model]

    print("Triangle unary operators over atom p (depth 1):")
    for analysis in analyses:
        goal = analysis.goal
        print(f"- goal type: {goal}")
        print(f"  domain: {analysis.domain}")
        print(f"  globally valid: {analysis.globally_valid}")
        print(f"  top in model: {analysis.top_in_model}")
        print(f"  inhabited: {analysis.inhabited}")

        # Sanity check: validity in a generic powerset model.
        valid_generic = is_sequent_valid_in_models(
            assumptions=[],
            conclusion=goal,
            models=models,
            atom_names=atoms,
        )
        print(f"  validity in generic model: {valid_generic}")
        print()


if __name__ == "__main__":
    main()
