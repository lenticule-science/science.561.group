---
title: RITM Core Posetal Simulator
date-created: 2026-06-17
description: "A finite, dependency-free companion implementation to Relational Modality: Posetal and Categorical Construction: nuclei/interiors on a finite powerset Heyting algebra (Definitions 1.1-1.2 there), the relational category encoding of…"
---

# Documentation

## README

A finite, dependency-free companion implementation to [Relational Modality: Posetal and Categorical Construction](relational-modality-posetal-and-categorical-construction.org): nuclei/interiors on a finite powerset Heyting algebra (Definitions 1.1-1.2 there), the relational category encoding of Definition 1.5, the KZ-comonad of Definition 1.6, C/M-stable factorization, and a finite closure-tower stabilization loop. Ported from an earlier Scheme prototype.

This is a distinct implementation from [RITM Python Simulator](ritm-py.org) and [RITM.py](ritm-python-simulator.org), which simulate the boolean-matrix/comonadic-tick (C = box-of-diamond) side of RITM rather than the posetal Heyting-algebra/KZ-comonad side formalized in the Posetal and Categorical Construction document.

## Status

The Universe/Heyting-algebra/nucleus/interior/KZ-comonad/factorization/closure-tower portions below are complete, working finite implementations (everything total on finite inputs, no external dependencies). The final "presheaf cell" section is explicitly a stub in the source: its right-adjoint operators (`pcell_Pi_f`{.verbatim}, `pcell_Pi_b`{.verbatim}) and its Box/Diamond modalities are placeholder identity maps, not real computations of the presheaf-cell adjunctions — preserved here with that limitation intact rather than presented as more complete than it is.

A companion module, the Modal Formula Engine below, builds a small modal-logic parser and axiom-pack checker directly on top of this file's `Universe=/=interiors_forward_backward=/=heyting_implication`{.verbatim} — a working, computational instance of checking named modal axiom schemas (T, 4, K, D, Dual, S4, S5) against the forward/backward nucleus-interior pair defined here, rather than a restatement of the Heyting/KZ-comonad core itself.

# Code

``` python
from __future__ import annotations
from itertools import chain, combinations
from typing import Callable, Generic, Hashable, Iterable, List, Sequence, Tuple, TypeVar, Dict, Optional, Set

T = TypeVar('T', bound=Hashable)
SetLike = frozenset

__all__ = [
    # Universe and set ops
    'Universe', 'empty_set', 'seteq', 'subset', 'image', 'preimage',
    # Heyting algebra on P(E)
    'heyting_implication', 'heyting_negation',
    'is_nucleus', 'interior_from_closure', 'fixpoints',
    # Relations category (posetal encoding)
    'rel_id', 'rel_comp', 'rel_morphism',
    # KZ-comonad
    'KZComonad', 'epsilon_delta', 'coalgebra_predicate',
    # Preorders and induced nuclei
    'make_preorder', 'up_closure', 'down_closure',
    'c_forward', 'c_backward', 'interiors_forward_backward',
    'C_composite', 'M_composite', 'commute',
    # Factorization
    'C_stable', 'M_stable', 'factorize_CM',
    # Closure tower
    'closure_tower', 'tower_stabilize',
    # Presheaf cell
    'PCell', 'pcell_a_f', 'pcell_a_b', 'pcell_i_f', 'pcell_i_b',
    'pcell_Pi_f', 'pcell_Pi_b', 'pcell_Box', 'pcell_Diamond',
    'pcell_BoxDiamond', 'pcell_DiamondBox',
]

# ------------------------------
# Universe and finite-set utilities
# ------------------------------

def empty_set() -> SetLike:
    return frozenset()

def _uniq(seq: Iterable[T]) -> List[T]:
    seen: Set[T] = set()
    out: List[T] = []
    for x in seq:
        if x not in seen:
            seen.add(x)
            out.append(x)
    return out

class Universe(Generic[T]):
    def __init__(self, elements: Iterable[T]) -> None:
        self.U: Tuple[T, ...] = tuple(_uniq(elements))

    def ensure_subset(self, s: Iterable[T]) -> SetLike:
        fs = frozenset(s)
        extra = [x for x in fs if x not in self.U]
        if extra:
            raise ValueError(f"Element(s) not in universe: {extra}")
        return fs

    # Basic set operations on frozensets
    def complement(self, a: SetLike) -> SetLike:
        return frozenset(x for x in self.U if x not in a)

    def union(self, *sets: SetLike) -> SetLike:
        acc: Set[T] = set()
        for s in sets:
            acc.update(s)
        return frozenset(acc)

    def intersection(self, a: SetLike, b: SetLike) -> SetLike:
        return a & b

    def difference(self, a: SetLike, b: SetLike) -> SetLike:
        return a - b

    def power_set(self) -> List[SetLike]:
        Ulist = list(self.U)
        ps = []
        for r in range(len(Ulist)+1):
            for combo in combinations(Ulist, r):
                ps.append(frozenset(combo))
        return ps

    # Images and preimages relative to a function and subset
    def image(self, f: Callable[[T], T], s: SetLike) -> SetLike:
        return frozenset(_uniq(f(x) for x in s))

    def preimage(self, f: Callable[[T], T], s: SetLike) -> SetLike:
        sset = set(s)
        return frozenset(x for x in self.U if f(x) in sset)

    # Preorder-based closures
    def up_closure(self, leq: Callable[[T, T], bool]) -> Callable[[SetLike], SetLike]:
        Ulist = list(self.U)
        def upc(Uset: SetLike) -> SetLike:
            seen: Set[T] = set()
            front: List[T] = list(Uset)
            while front:
                x = front.pop()
                ups = [y for y in Ulist if leq(x, y)]
                for y in ups:
                    if y not in seen:
                        seen.add(y)
            # Also include the original elements (reflexivity expected)
            seen.update(Uset)
            return frozenset(seen)
        return upc

    def down_closure(self, leq: Callable[[T, T], bool]) -> Callable[[SetLike], SetLike]:
        Ulist = list(self.U)
        def downc(Uset: SetLike) -> SetLike:
            seen: Set[T] = set()
            front: List[T] = list(Uset)
            while front:
                x = front.pop()
                downs = [y for y in Ulist if leq(y, x)]
                for y in downs:
                    if y not in seen:
                        seen.add(y)
            seen.update(Uset)
            return frozenset(seen)
        return downc

# Predicates on sets of elements
def seteq(a: SetLike, b: SetLike) -> bool:
    return a == b

def subset(a: SetLike, b: SetLike) -> bool:
    return a.issubset(b)

def image(f: Callable[[T], T], s: SetLike) -> SetLike:
    return frozenset(_uniq(f(x) for x in s))

def preimage(f: Callable[[T], T], U: Universe[T], s: SetLike) -> SetLike:
    sset = set(s)
    return frozenset(x for x in U.U if f(x) in sset)

# ------------------------------
# Heyting algebra over P(E)
# ------------------------------

def heyting_implication(U: Universe[T]) -> Callable[[SetLike, SetLike], SetLike]:
    """Return implication operator on the powerset Heyting algebra: A => B = complement(A) union B."""
    def impl(A: SetLike, B: SetLike) -> SetLike:
        return U.union(U.complement(A), B)
    return impl

def heyting_negation(U: Universe[T]) -> Callable[[SetLike], SetLike]:
    """Return negation operator on powerset: not A = complement(A)."""
    return lambda A: U.complement(A)

# ------------------------------
# Nuclei (closures) and interiors on P(E)
# ------------------------------

def is_nucleus(c: Callable[[SetLike], SetLike],
               subsets: Sequence[SetLike],
               U: Universe[T]) -> bool:
    """Check closure axioms on finite families: inflationary, idempotent, monotone, meet-preserving."""
    # Precompute all pairs
    pairs = [(a, b) for a in subsets for b in subsets]

    # inflationary: a <= c(a)
    infl = all(subset(a, c(a)) for a in subsets)
    if not infl: return False

    # idempotent: c(c(a)) = c(a)
    idem = all(seteq(c(c(a)), c(a)) for a in subsets)
    if not idem: return False

    # monotone: a<=b => c(a)<=c(b)
    mono = all((not subset(a, b)) or subset(c(a), c(b)) for a, b in pairs)
    if not mono: return False

    # meet-preserving: c(a meet b) = c(a) meet c(b)
    meet = all(seteq(c(U.intersection(a, b)),
                     U.intersection(c(a), c(b)))
               for a, b in pairs)
    return meet

def interior_from_closure(c: Callable[[SetLike], SetLike],
                          U: Universe[T]) -> Callable[[SetLike], SetLike]:
    """i(A) = not c(not A)."""
    return lambda A: U.complement(c(U.complement(A)))

def fixpoints(c: Callable[[SetLike], SetLike],
              subsets: Sequence[SetLike]) -> List[SetLike]:
    return [a for a in subsets if seteq(c(a), a)]

# ------------------------------
# Relations category (posetal encoding)
# ------------------------------

def rel_id(impl: Callable[[SetLike, SetLike], SetLike], a: SetLike) -> SetLike:
    """Identity relation: a => a."""
    return impl(a, a)

def rel_morphism(r: SetLike, a: SetLike, b: SetLike,
                 impl: Callable[[SetLike, SetLike], SetLike]) -> bool:
    """Check r subset (a => b)."""
    return subset(r, impl(a, b))

def rel_comp(r: SetLike, s: SetLike, a: SetLike,
             impl: Callable[[SetLike, SetLike], SetLike],
             U: Universe[T]) -> SetLike:
    """Composition: s . r := r intersect (a => s)."""
    return U.intersection(r, impl(a, s))

# ------------------------------
# KZ-comonad G = i . c
# ------------------------------

class KZComonad(Generic[T]):
    def __init__(self,
                 closure: Callable[[SetLike], SetLike],
                 interior: Callable[[SetLike], SetLike]) -> None:
        self.c = closure
        self.i = interior

    def __call__(self, A: SetLike) -> SetLike:
        return self.i(self.c(A))

def epsilon_delta(G: KZComonad[T],
                  closure: Callable[[SetLike], SetLike],
                  interior: Callable[[SetLike], SetLike],
                  subset_pred: Callable[[SetLike, SetLike], bool] = subset
                  ) -> Tuple[Callable[[SetLike], bool], Callable[[SetLike], bool]]:
    """Return (epsilon_A: G A subset A, delta_A: G A subset G G A)."""
    epsilon = lambda A: subset_pred(G(A), A)
    delta = lambda A: subset_pred(G(A), G(G(A)))
    return epsilon, delta

def coalgebra_predicate(A: SetLike, G: KZComonad[T],
                        subset_pred: Callable[[SetLike, SetLike], bool] = subset) -> bool:
    """Coalgebra exists posetally if A subset G(A)."""
    return subset_pred(A, G(A))

# ------------------------------
# Preorders on E and induced closures
# ------------------------------

def make_preorder(U: Universe[T], leq: Callable[[T, T], bool]) -> Tuple[Universe[T], Callable[[T, T], bool]]:
    return U, leq

def up_closure(U: Universe[T], leq: Callable[[T, T], bool]) -> Callable[[SetLike], SetLike]:
    return U.up_closure(leq)

def down_closure(U: Universe[T], leq: Callable[[T, T], bool]) -> Callable[[SetLike], SetLike]:
    return U.down_closure(leq)

def c_forward(upc: Callable[[SetLike], SetLike]) -> Callable[[SetLike], SetLike]:
    return upc

def c_backward(downc: Callable[[SetLike], SetLike]) -> Callable[[SetLike], SetLike]:
    return downc

def interiors_forward_backward(cf: Callable[[SetLike], SetLike],
                               cb: Callable[[SetLike], SetLike],
                               U: Universe[T]) -> Tuple[Callable[[SetLike], SetLike], Callable[[SetLike], SetLike]]:
    return interior_from_closure(cf, U), interior_from_closure(cb, U)

def C_composite(i_f: Callable[[SetLike], SetLike],
                c_b: Callable[[SetLike], SetLike]) -> Callable[[SetLike], SetLike]:
    """C = i_f . c_b"""
    return lambda A: i_f(c_b(A))

def M_composite(i_b: Callable[[SetLike], SetLike],
                c_f: Callable[[SetLike], SetLike]) -> Callable[[SetLike], SetLike]:
    """M = i_b . c_f"""
    return lambda A: i_b(c_f(A))

def commute(cf: Callable[[SetLike], SetLike],
            cb: Callable[[SetLike], SetLike],
            subsets: Sequence[SetLike]) -> bool:
    """Check cf(cb(a)) == cb(cf(a)) for all a in subsets."""
    return all(seteq(cf(cb(a)), cb(cf(a))) for a in subsets)

# ------------------------------
# Factorization (posetal C-stable / M-stable)
# ------------------------------

def C_stable(x: SetLike, y: SetLike,
             C: Callable[[SetLike], SetLike],
             subset_pred: Callable[[SetLike, SetLike], bool] = subset) -> bool:
    return subset_pred(x, C(y))

def M_stable(x: SetLike, y: SetLike,
             M: Callable[[SetLike], SetLike],
             subset_pred: Callable[[SetLike, SetLike], bool] = subset) -> bool:
    return subset_pred(M(x), y)

def factorize_CM(x: SetLike, y: SetLike,
                 C: Callable[[SetLike], SetLike],
                 M: Callable[[SetLike], SetLike],
                 subset_pred: Callable[[SetLike, SetLike], bool] = subset
                 ) -> Tuple[SetLike, SetLike, SetLike, bool, bool]:
    """Return (left, mid, right, C-stable?, M-stable?)."""
    mid = C(y)
    return x, mid, y, C_stable(x, y, C, subset_pred), M_stable(mid, y, M, subset_pred)

# ------------------------------
# Closure tower (finite stabilization)
# ------------------------------

def _families_equal(A: Sequence[SetLike], B: Sequence[SetLike]) -> bool:
    return len(A) == len(B) and all(a in B for a in A) and all(b in A for b in B)

def closure_tower(nuclei: Sequence[Callable[[SetLike], SetLike]],
                  subsets: Sequence[SetLike]
                  ) -> Tuple[List[List[SetLike]], int]:
    """Iterate nuclei cyclically on families of fixpoints until the family stabilizes.
    Returns (history_of_families, index_where_stabilized)."""
    Hs: List[List[SetLike]] = [list(subsets)]
    idx = 0
    n = len(nuclei)
    if n == 0:
        return Hs, 0
    while True:
        c = nuclei[idx % n]
        fix = fixpoints(c, Hs[0])  # apply to the last family's elements
        if Hs and _families_equal(Hs[0], fix):
            return list(reversed(Hs)), idx
        Hs.insert(0, fix)
        idx += 1

def tower_stabilize(nuclei: Sequence[Callable[[SetLike], SetLike]],
                    subsets: Sequence[SetLike]) -> Tuple[List[List[SetLike]], int]:
    return closure_tower(nuclei, subsets)

# ------------------------------
# Minimal "presheaf cell" over arrow category 0 -> 1 (finite sets)
# ------------------------------

class PCell(Generic[T]):
    """Represent a presheaf cell X with finite sets X0, X1 and a map u*: X1 -> X0.
    For finite sets, represent X0, X1 as frozensets and u* either as a function or dict.
    """
    def __init__(self,
                 X0: Iterable[T],
                 X1: Iterable[T],
                 u_star: Callable[[T], Optional[T]] | Dict[T, Optional[T]]) -> None:
        self.X0: SetLike = frozenset(X0)
        self.X1: SetLike = frozenset(X1)
        if callable(u_star):
            self.u_star: Callable[[T], Optional[T]] = u_star
            self._map: Optional[Dict[T, Optional[T]]]= None
        elif isinstance(u_star, dict):
            self._map = dict(u_star)
            self.u_star = lambda x: self._map.get(x, None)
        else:
            raise TypeError("u_star must be a function or dict")

    def apply_u(self, x: T) -> Optional[T]:
        return self.u_star(x)

# Equalizer of f*, g*: X1 -> X0 is the subset of X1 where f*(x)=g*(x).
def equalizer_X1(X1: SetLike, f: Callable[[T], Optional[T]], g: Callable[[T], Optional[T]]) -> List[T]:
    return [x for x in X1 if f(x) == g(x)]

# Coequalizer: quotient X0 by relation f*(x) ~ g*(x).
def coequalize_X0(X0: SetLike, X1: SetLike,
                  f: Callable[[T], Optional[T]],
                  g: Callable[[T], Optional[T]]) -> List[T]:
    # Union-Find over representatives in X0
    parent: Dict[T, T] = {x: x for x in X0}

    def find(a: T) -> T:
        # Path compression
        while parent[a] != a:
            parent[a] = parent[parent[a]]
            a = parent[a]
        return a

    def union(a: T, b: T) -> None:
        ra, rb = find(a), find(b)
        if ra != rb:
            parent[ra] = rb

    for x1 in X1:
        a = f(x1)
        b = g(x1)
        if a is not None and b is not None and a in parent and b in parent:
            union(a, b)

    # Build classes; return list of representatives
    classes: Dict[T, List[T]] = {}
    for x0 in X0:
        r = find(x0)
        classes.setdefault(r, []).append(x0)
    return list(classes.keys())

# a_f: coequalize on X0 using (u*, g*) with default g* a constant to the first element, if available
def pcell_a_f(P: PCell[T], g_star: Optional[Callable[[T], Optional[T]]]=None) -> PCell[T]:
    X0, X1, u = P.X0, P.X1, P.u_star
    if g_star is None:
        # Default constant to first element if exists, else None
        const_val = next(iter(X0), None)
        g_star = (lambda x, c=const_val: c)
    new_X0_list = coequalize_X0(X0, X1, u, g_star)
    new_X0 = frozenset(new_X0_list)

    # New u*: pick the representative for u(x1) if any, else None
    rep_map: Dict[T, T] = {}
    # Build a map from old x0 to its representative
    # We reuse the coequalizer computation by reconstructing parent map
    # Simpler approach: map elements to themselves if present
    for x0 in X0:
        # choose self if it survived as representative, else choose an arbitrary equal rep if exists
        if x0 in new_X0:
            rep_map[x0] = x0
        else:
            # pick any representative (stable but arbitrary)
            rep_map[x0] = next(iter(new_X0), None)

    def new_u(x1: T) -> Optional[T]:
        ux = u(x1)
        return None if ux is None else rep_map.get(ux, None)

    return PCell(new_X0, X1, new_u)

# a_b: restrict X1 to equalizer of (u*, g*); default g* = u*
def pcell_a_b(P: PCell[T], g_star: Optional[Callable[[T], Optional[T]]]=None) -> PCell[T]:
    X0, X1, u = P.X0, P.X1, P.u_star
    if g_star is None:
        g_star = u
    eq = equalizer_X1(X1, u, g_star)
    new_X1 = frozenset(eq)

    def new_u(x1: T) -> Optional[T]:
        return u(x1)

    return PCell(X0, new_X1, new_u)

# Inclusions i_f / i_b: identity in this toy model
def pcell_i_f(P: PCell[T]) -> PCell[T]:
    return PCell(P.X0, P.X1, P.u_star if P._map is None else dict(P._map))

def pcell_i_b(P: PCell[T]) -> PCell[T]:
    return PCell(P.X0, P.X1, P.u_star if P._map is None else dict(P._map))

# Right adjoints Pi_f / Pi_b -- placeholders performing identity.
def pcell_Pi_f(P: PCell[T]) -> PCell[T]:
    return pcell_i_f(P)

def pcell_Pi_b(P: PCell[T]) -> PCell[T]:
    return pcell_i_b(P)

# Modalities Box=i_f, Diamond=i_b and composites
def pcell_Box(P: PCell[T]) -> PCell[T]:
    return pcell_i_f(P)

def pcell_Diamond(P: PCell[T]) -> PCell[T]:
    return pcell_i_b(P)

def pcell_BoxDiamond(P: PCell[T]) -> PCell[T]:
    return pcell_Box(pcell_Diamond(P))

def pcell_DiamondBox(P: PCell[T]) -> PCell[T]:
    return pcell_Diamond(pcell_Box(P))

# End of module
```

# Modal Formula Engine (modal<sub>lab</sub>.py) {#modal-formula-engine-modallab.py}

A modal-formula lexer/parser and axiom-pack checker built on top of the Universe/interiors/implication above. Formulas use `[]f=/`{.verbatim}\[\]b= (forward/backward box) and `<>f=/=<>b`{.verbatim} (forward/backward diamond), plus `~`{.verbatim}, `&`{.verbatim}, `|`{.verbatim}, `->`{.verbatim}; `[]=/=<>`{.verbatim} default to the forward reading. `pack_holds`{.verbatim} checks a named axiom pack against a given assignment of propositional letters to subsets.

``` {.python tangle="./src/ritm/modal-lab.py"}
from __future__ import annotations
import re
from typing import Dict, Callable, Optional, Tuple, List

import importlib.util, os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
_modpath = os.path.join(HERE, "ritm-core.py")
spec = importlib.util.spec_from_file_location("ritm_core", _modpath)
ritm_core = importlib.util.module_from_spec(spec)  # type: ignore
sys.modules["ritm_core"] = ritm_core  # type: ignore
spec.loader.exec_module(ritm_core)  # type: ignore

# ---------- Lexer / Parser ----------
Token = Tuple[str,str]

def tokenize(s: str) -> List[Token]:
    specs = [
        ('SKIP',  r'\s+'),
        ('BOXF',  r'\[\]f'), ('BOXB', r'\[\]b'),
        ('DIAF',  r'<>f'),  ('DIAB', r'<>b'),
        ('BOX',   r'\[\]'), ('DIA',  r'<>'),
        ('NEG',   r'~'),
        ('AND',   r'&'),
        ('OR',    r'\|'),
        ('IMP',   r'->'),
        ('LP',    r'\('),
        ('RP',    r'\)'),
        ('ID',    r'[A-Za-z_][A-Za-z0-9_]*'),
    ]
    rx = '|'.join('(?P<%s>%s)' % p for p in specs)
    out: List[Token] = []
    pos = 0
    for m in re.finditer(rx, s):
        k = m.lastgroup; v = m.group()
        if k != 'SKIP':
            out.append((k, v))
        pos = m.end()
    if pos != len(s):
        raise SyntaxError(f"modal_lab: bad token at {pos}")
    return out

class Parser:
    # Precedence: ~,[],<> > & > | > -> (right-assoc for ->)
    def __init__(self, toks: List[Token]):
        self.t = toks; self.i = 0
    def peek(self) -> Optional[Token]:
        return self.t[self.i] if self.i < len(self.t) else None
    def take(self, kind: Optional[str]=None) -> Token:
        tok = self.peek()
        if tok is None:
            raise SyntaxError("modal_lab: unexpected EOF")
        if kind and tok[0] != kind:
            raise SyntaxError(f"modal_lab: expected {kind}, got {tok}")
        self.i += 1
        return tok
    def parse(self):
        return self._imp()
    def _imp(self):
        left = self._or()
        t = self.peek()
        if t and t[0] == 'IMP':
            self.take('IMP')
            right = self._imp()
            return ('IMP', left, right)
        return left
    def _or(self):
        left = self._and()
        while True:
            t = self.peek()
            if t and t[0] == 'OR':
                self.take('OR')
                right = self._and()
                left = ('OR', left, right)
            else:
                return left
    def _and(self):
        left = self._un()
        while True:
            t = self.peek()
            if t and t[0] == 'AND':
                self.take('AND')
                right = self._un()
                left = ('AND', left, right)
            else:
                return left
    def _un(self):
        t = self.peek()
        if t and t[0] in ('NEG','BOX','DIA','BOXF','BOXB','DIAF','DIAB'):
            self.take(t[0])
            sub = self._un()
            return (t[0], sub)
        if t and t[0] == 'LP':
            self.take('LP')
            node = self.parse()
            self.take('RP')
            return node
        if t and t[0] == 'ID':
            self.take('ID')
            return ('ID', t[1])
        raise SyntaxError(f"modal_lab: unexpected token {t}")

def parse(s: str):
    return Parser(tokenize(s)).parse()

# ---------- Builder / Semantics ----------
def build(U: "ritm_core.Universe", leq) -> Dict:
    cf = U.up_closure(leq)
    cb = U.down_closure(leq)
    i_f, i_b = ritm_core.interiors_forward_backward(cf, cb, U)
    impl = ritm_core.heyting_implication(U)

    def eval_ast(ast, env: Dict[str, frozenset], mode: str = 'forward') -> frozenset:
        k = ast[0]
        if k == 'ID':
            return env.get(ast[1], frozenset())
        if k == 'NEG':
            return U.complement(eval_ast(ast[1], env, mode))
        if k in ('BOX','BOXF'):   # box-forward
            return i_f(eval_ast(ast[1], env, mode))
        if k == 'BOXB':           # box-backward
            return i_b(eval_ast(ast[1], env, mode))
        if k in ('DIA','DIAF'):   # diamond-forward
            return cf(eval_ast(ast[1], env, mode))
        if k == 'DIAB':           # diamond-backward
            return cb(eval_ast(ast[1], env, mode))
        if k == 'AND':
            A = eval_ast(ast[1], env, mode)
            B = eval_ast(ast[2], env, mode)
            return U.intersection(A, B)
        if k == 'OR':
            A = eval_ast(ast[1], env, mode)
            B = eval_ast(ast[2], env, mode)
            return U.union(A, B)
        if k == 'IMP':
            A = eval_ast(ast[1], env, mode)
            B = eval_ast(ast[2], env, mode)
            return impl(A, B)
        raise ValueError("modal_lab: bad AST")

    def holds(ast, env, mode: str = 'forward') -> bool:
        return eval_ast(ast, env, mode) == frozenset(U.U)

    return {
        'eval':  eval_ast,
        'parse': parse,
        'holds': holds,
        'modes': ['forward', 'backward']  # named []f/<>f, []b/<>b also supported inside formulas
    }

# ---------- Axiom packs ----------
AXIOM_PACKS: Dict[str, List[str]] = {
    "T":   ["([]p) -> p"],
    "4":   ["([]p) -> ([]([]p))"],
    "K":   ["([](p->q)) -> (([]p)->([]q))"],
    "D":   ["([]p) -> (<>p)"],
    "Dual":["([]p) -> (~(<>(~p)))"],
    "S4":  ["([]p) -> p", "([]p) -> ([]([]p))", "([](p->q)) -> (([]p)->([]q))"],
    "S5":  ["([]p) -> p", "([]p) -> ([]([]p))", "(<>p) -> ([]<>p)"]
}

def pack_holds(pack: str, U: "ritm_core.Universe", leq, env: Dict[str,frozenset], mode='forward') -> bool:
    if pack not in AXIOM_PACKS:
        raise KeyError(f"Unknown axiom pack {pack}")
    sem = build(U, leq)
    return all(sem['holds'](sem['parse'](ax), env, mode) for ax in AXIOM_PACKS[pack])

if __name__ == "__main__":
    # Minimal smoke test
    U = ritm_core.Universe([0,1,2,3])
    env = {'p': frozenset([0,1]), 'q': frozenset([2,3])}
    ok = pack_holds("T", U, lambda x,y: x<=y, env)
    print("T holds (forward):", ok)
```
