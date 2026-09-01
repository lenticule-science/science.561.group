from __future__ import annotations

from relationing.language import Context, Term, Type, type_of


def main() -> None:
    ctx = Context.empty()
    term = Term.star()
    ty = type_of(ctx, term)
    print(f"Type of star is: {ty}")
    assert ty == Type.top()


if __name__ == "__main__":
    main()
