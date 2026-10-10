from __future__ import annotations

from relationing.profiles.physics.examples import three_profile_physical_system


def main() -> None:
    system = three_profile_physical_system()
    print("ThreeHA profile physical system:")
    print(system)


if __name__ == "__main__":
    main()

