"""Parser utilities for the Relational Expression Syntax (RES).

This module tokenizes S-expression source code and builds a simple
abstract syntax tree represented by nested Python lists and strings.
"""
from __future__ import annotations

from dataclasses import dataclass
from typing import Iterable, List, Sequence


class ResSyntaxError(RuntimeError):
    pass


def tokenize(source: str) -> List[str]:
    """Convert a RES snippet into a list of lexical tokens."""
    tokens: List[str] = []
    i = 0
    length = len(source)
    while i < length:
        ch = source[i]
        if ch.isspace():
            i += 1
            continue
        if ch in "()":
            tokens.append(ch)
            i += 1
            continue
        if ch == '"':
            # Parse quoted atom with escaping.
            i += 1
            buffer = []
            while i < length:
                ch = source[i]
                if ch == '\\':
                    i += 1
                    if i >= length:
                        raise ResSyntaxError("unterminated escape in string literal")
                    buffer.append(source[i])
                    i += 1
                    continue
                if ch == '"':
                    i += 1
                    break
                buffer.append(ch)
                i += 1
            else:
                raise ResSyntaxError("unterminated string literal")
            tokens.append('"' + ''.join(buffer) + '"')
            continue
        # Bare atom
        start = i
        while i < length and not source[i].isspace() and source[i] not in "()":
            i += 1
        tokens.append(source[start:i])
    return tokens


class TokenStream:
    def __init__(self, tokens: Sequence[str]):
        self.tokens = tokens
        self.index = 0

    def peek(self) -> str | None:
        return self.tokens[self.index] if self.index < len(self.tokens) else None

    def pop(self) -> str:
        if self.index >= len(self.tokens):
            raise ResSyntaxError("unexpected end of tokens")
        token = self.tokens[self.index]
        self.index += 1
        return token


def parse_expression(source: str):
    """Parse a RES source string into a nested Python representation."""
    tokens = tokenize(source)
    stream = TokenStream(tokens)
    expr = _parse_expr(stream)
    if stream.peek() is not None:
        raise ResSyntaxError("unexpected tokens after expression")
    return expr


def _parse_expr(stream: TokenStream):
    token = stream.pop()
    if token == '(':
        elements = []
        while True:
            next_tok = stream.peek()
            if next_tok is None:
                raise ResSyntaxError("unterminated list")
            if next_tok == ')':
                stream.pop()
                break
            elements.append(_parse_expr(stream))
        return elements
    if token == ')':
        raise ResSyntaxError("unexpected ')'")
    return token
