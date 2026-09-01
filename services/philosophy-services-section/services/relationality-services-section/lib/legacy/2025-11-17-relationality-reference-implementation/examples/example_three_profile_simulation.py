from __future__ import annotations

from relationing.profiles.physics.examples import (
    ThreeStepFlow,
    three_profile_physical_system,
    simulate_profile_system,
)
from relationing.structure import three_ha_elements


def main() -> None:
    system = three_profile_physical_system()
    bottom, mid, top = three_ha_elements()

    # Simulate evolution inside the {1,2} profile starting from 0.
    # The profile filter first projects 0 ↦ 1, then the flow advances
    # 1 ↦ 1, 2 ↦ 2; we record the observable (integer value) at each step.
    trace = simulate_profile_system(system, initial=bottom, steps=4)

    print("ThreeHA profile physics simulation (state, observable values):")
    for i, (state, values) in enumerate(trace):
        print(f"t = {i}: state = {state.value}, observables = {tuple(values)}")


if __name__ == "__main__":  # pragma: no cover
    main()

