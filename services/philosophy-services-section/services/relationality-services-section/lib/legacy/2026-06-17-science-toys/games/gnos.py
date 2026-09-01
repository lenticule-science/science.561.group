#!/usr/bin/env python3
# main.py — formally correct RITM-OS core with focus-based stabilization
# -----------------------------------
# Implements C = □∘◇  (Box after Diamond)
# Allows commit when topology (defect) is stable, even if residual > 0
# -----------------------------------

from __future__ import annotations
from dataclasses import dataclass
from typing import Dict, List, Set, Tuple, Callable, Optional
from time import time
import hashlib, json, sys

# -----------------------------------
# Utilities
# -----------------------------------

def log(msg: str):
    print(f"[{time():.3f}] {msg}", flush=True)

def _b(s: str) -> bytes:
    return s.encode("utf-8")

def _h(*parts: bytes) -> str:
    h = hashlib.sha256()
    for p in parts:
        h.update(p)
    return h.hexdigest()

def _atom_bytes(s, p, o) -> bytes:
    sb, pb, ob = _b(s), _b(p), _b(o)
    return len(sb).to_bytes(4, "big") + sb + len(pb).to_bytes(4, "big") + pb + len(ob).to_bytes(4, "big") + ob

# -----------------------------------
# Core Objects
# -----------------------------------

@dataclass(frozen=True)
class Atom:
    s: str
    p: str
    o: str
    @property
    def id(self): return _h(_atom_bytes(self.s, self.p, self.o))

@dataclass(frozen=True)
class Evidence:
    atom_id: str
    source: str
    method: str
    payload: dict
    t: float
    @property
    def id(self): return _h(_b(self.atom_id), _b(self.source), _b(self.method),
                            _b(json.dumps(self.payload, sort_keys=True)), str(self.t).encode())

@dataclass(frozen=True)
class Derivation:
    rule: str
    inputs: Tuple[str, ...]
    outputs: Tuple[str, ...]
    t: float
    @property
    def id(self): return _h(_b(self.rule), _b("|".join(self.inputs)),
                            _b("|".join(self.outputs)), str(self.t).encode())

@dataclass
class Proof:
    target_atom_id: str
    derivation_chain: List[str]

# -----------------------------------
# Store (append-only in-memory)
# -----------------------------------

class Store:
    def __init__(self):
        self.atoms: Dict[str, Atom] = {}
        self._atoms_by_spo: Dict[Tuple[str, str, str], str] = {}
        self.evd: Dict[str, Evidence] = {}
        self.drv: Dict[str, Derivation] = {}
        self._derivations_by_output: Dict[str, List[str]] = {}

    def add_atom(self, a: Atom) -> str:
        k = (a.s, a.p, a.o)
        if k in self._atoms_by_spo: return self._atoms_by_spo[k]
        aid = a.id
        self.atoms[aid] = a
        self._atoms_by_spo[k] = aid
        log(f"  [+atom] {a.s} --{a.p}--> {a.o}")
        return aid

    def get_atom_id(self, s: str, p: str, o: str) -> Optional[str]:
        return self._atoms_by_spo.get((s, p, o))

    def iter_atoms(self): return self.atoms.values()
    def atom_by_id(self, aid): return self.atoms[aid]

    def add_evidence(self, e: Evidence): self.evd[e.id] = e; return e.id
    def add_derivation(self, d: Derivation):
        self.drv[d.id] = d
        for out in d.outputs:
            self._derivations_by_output.setdefault(out, []).append(d.id)
        return d.id

    def derivations_for_output(self, aid: str) -> List[str]:
        return self._derivations_by_output.get(aid, [])

# -----------------------------------
# Modal operators (formally correct)
# -----------------------------------

ALLOWED = {"influences", "grounds", "extends", "uses", "relates_to"}
REACH_PRED = "reaches"

def diamond_expand(ws: Set[str], store: Store) -> List[Atom]:
    """◇: existential reachability"""
    edges = [store.atom_by_id(aid) for aid in ws]
    allowed_edges = [e for e in edges if e.p.split("/", 1)[0] in ALLOWED]
    out = set()
    for e1 in allowed_edges:
        for e2 in allowed_edges:
            if e1.o == e2.s and e1.s != e2.o:
                out.add((e1.s, REACH_PRED, e2.o))
    log(f"    [◇] produced {len(out)} reachability edges")
    return [Atom(s, p, o) for (s, p, o) in out]

def box_consolidate(ws: Set[str], store: Store) -> List[Atom]:
    """□: symmetric coherence over reachability"""
    pairs = {(store.atom_by_id(aid).s, store.atom_by_id(aid).o)
             for aid in ws if store.atom_by_id(aid).p == REACH_PRED}
    out = [Atom(x, "coheres_with", y) for (x, y) in pairs if (y, x) in pairs and x != y]
    log(f"    [□] produced {len(out)} coherences")
    return out

# -----------------------------------
# View, Stabilization, Focus
# -----------------------------------

@dataclass
class View:
    name: str
    select: Callable[[Atom], bool]
    policy: str = "generic"

@dataclass
class StabilizationReport:
    iterations: int
    produced: int
    residual: int
    defect: int
    outputs: List[str]
    proofs: Dict[str, Proof]

def _entities_in_ws(ws: Set[str], store: Store) -> Set[str]:
    ents = set()
    for aid in ws:
        a = store.atom_by_id(aid)
        ents.add(a.s); ents.add(a.o)
    return ents

def grow_by_adjacency(ws: Set[str], store: Store) -> Set[str]:
    ents = _entities_in_ws(ws, store)
    added = set()
    for a in store.iter_atoms():
        if a.s in ents or a.o in ents:
            added.add(a.id)
    return ws | added

# -----------------------------------
# RITM-OS Kernel
# -----------------------------------

class RITMOS:
    def __init__(self):
        self.store = Store()
        self.views: Dict[str, View] = {}
        self.commits: Dict[str, Dict] = {}

    # Evidence
    def submit_evidence(self, s, p, o, source="user", method="manual", payload=None):
        a = Atom(s, p, o)
        aid = self.store.add_atom(a)
        e = Evidence(atom_id=aid, source=source, method=method,
                     payload=(payload or {}), t=time())
        self.store.add_evidence(e)
        return aid

    def define_view(self, name, selector, policy="generic"):
        v = View(name, selector, policy)
        self.views[name] = v
        log(f"[view] defined '{name}'")
        return v

    def _ws(self, v: View) -> Set[str]:
        ws = {a.id for a in self.store.iter_atoms() if v.select(a)}
        log(f"[view:{v.name}] materialized {len(ws)} atoms")
        return ws

    # Global stabilization
    def stabilize(self, view_name, max_iter=100, tol=0) -> StabilizationReport:
        v = self.views[view_name]
        ws = self._ws(v)
        produced, proofs = [], {}
        iterations, residual, defect = 0, 0, -1
        log(f"[stabilize:{v.name}] starting (C = □∘◇)")
        while iterations < max_iter:
            iterations += 1
            log(f"  [iter {iterations}] ws={len(ws)}")
            exp = diamond_expand(ws, self.store)
            exp_ids = [self.store.add_atom(a) for a in exp]
            box = box_consolidate(ws | set(exp_ids), self.store)
            box_ids = [self.store.add_atom(a) for a in box]
            delta = [aid for aid in exp_ids + box_ids if aid not in ws]
            residual = len(delta)
            if not delta:
                defect = 0
                log(f"  [iter {iterations}] fixpoint reached")
                break
            drv = Derivation(rule=f"C-pass#{iterations}",
                             inputs=tuple(sorted(ws)),
                             outputs=tuple(sorted(delta)),
                             t=time())
            did = self.store.add_derivation(drv)
            for out in delta:
                produced.append(out)
                proofs[out] = Proof(target_atom_id=out, derivation_chain=[did])
            ws |= set(delta)
            hyp = diamond_expand(ws, self.store)
            hyp_ids = {self.store.add_atom(a) for a in hyp}
            new_from_hyp = [aid for aid in hyp_ids if aid not in ws]
            defect = len(new_from_hyp)
            log(f"    [Δ]={residual} [defect]={defect}")
            if defect <= tol:
                log(f"  [iter {iterations}] near fixpoint (defect≤{tol})")
                break
        log(f"[stabilize:{v.name}] done iters={iterations} produced={len(produced)} residual={residual} defect={defect}")
        return StabilizationReport(iterations, len(produced), residual, defect, produced, proofs)

    # Focus-based stabilization (auto-expanding neighborhood)
    def stabilize_focus(self, seed_entity: str, max_iter=100, tol=0) -> StabilizationReport:
        log(f"[focus] seed='{seed_entity}' — starting local stabilization")
        ws = {a.id for a in self.store.iter_atoms() if a.s == seed_entity or a.o == seed_entity}
        ws = grow_by_adjacency(ws, self.store)
        produced, proofs = [], {}
        iterations, residual, defect = 0, 0, -1
        while iterations < max_iter:
            iterations += 1
            log(f"  [iter {iterations}] ws={len(ws)}")
            ws = grow_by_adjacency(ws, self.store)
            exp_atoms = diamond_expand(ws, self.store)
            exp_ids = [self.store.add_atom(a) for a in exp_atoms]
            box_atoms = box_consolidate(ws | set(exp_ids), self.store)
            box_ids = [self.store.add_atom(a) for a in box_atoms]
            delta = [aid for aid in exp_ids + box_ids if aid not in ws]
            residual = len(delta)
            log(f"    [Δ]={residual}")
            if delta:
                drv = Derivation(rule=f"focus-pass#{iterations}",
                                 inputs=tuple(sorted(ws)),
                                 outputs=tuple(sorted(delta)), t=time())
                did = self.store.add_derivation(drv)
                for out in delta:
                    produced.append(out)
                    proofs[out] = Proof(target_atom_id=out, derivation_chain=[did])
                ws |= set(delta)
            hyp = diamond_expand(ws, self.store)
            hyp_ids = {self.store.add_atom(a) for a in hyp}
            new_from_hyp = [aid for aid in hyp_ids if aid not in ws]
            defect = len(new_from_hyp)
            log(f"    [defect]={defect}")
            if defect <= tol:
                log(f"[focus] topology stabilized at iter={iterations} (defect≤{tol})")
                break
        log(f"[focus] done iters={iterations} produced={len(produced)} residual={residual} defect={defect}")
        return StabilizationReport(iterations, len(produced), residual, defect, produced, proofs)

    # Commit: allow residual, require defect=0
    def commit(self, view_name: str, report: StabilizationReport, meta=None) -> str:
        if report.defect != 0:
            log(f"[commit:{view_name}] rejected: defect={report.defect} (topology not stable)")
            raise RuntimeError(f"Defect nonzero ({report.defect})")
        v = self.views[view_name]
        ws = sorted(list(self._ws(v)))
        root = _h(_b("|".join(ws)))
        cm = {
            "view": view_name,
            "root": root,
            "policy": v.policy,
            "meta": {**(meta or {}), "residual": report.residual},
            "t": time(),
            "outputs": report.outputs,
        }
        commit_id = _h(_b(json.dumps(cm, sort_keys=True)))
        self.commits[commit_id] = cm
        log(f"[commit:{view_name}] accepted id={commit_id[:12]} (residual={report.residual})")
        return commit_id

    # Export
    def export_rdf(self, view_name: str, path: str):
        v = self.views[view_name]
        ws = sorted(list(self._ws(v)))
        log(f"[export:{v.name}] writing {len(ws)} atoms to {path}")
        with open(path, "w", encoding="utf-8") as f:
            f.write("@prefix : <http://example.org/ritm#> .\n\n")
            for aid in ws:
                a = self.store.atom_by_id(aid)
                s, p, o = [x.replace(" ", "_") for x in (a.s, a.p, a.o)]
                f.write(f":{s} :{p} :{o} .\n")
        log(f"[export:{v.name}] done")

# -----------------------------------
# Demo
# -----------------------------------

if __name__ == "__main__":
    log("=== RITM-OS Formal Demo ===")
    osys = RITMOS()

    # Evidence
    osys.submit_evidence("Fanon", "influences", "Freire")
    osys.submit_evidence("Freire", "grounds", "Praxis")
    osys.submit_evidence("Freire", "influences", "Fanon", source="nlp")

    # View and global stabilization
    focus = {"Fanon", "Freire", "Praxis"}
    osys.define_view("cluster", lambda a: a.s in focus or a.o in focus)
    rep_global = osys.stabilize("cluster", max_iter=20)
    log(f"[global] iters={rep_global.iterations} residual={rep_global.residual} defect={rep_global.defect}")

    # Focus on Fanon: pull in relations until topology stabilizes
    rep_fanon = osys.stabilize_focus("Fanon", max_iter=30)
    log(f"[focus:Fanon] iters={rep_fanon.iterations} residual={rep_fanon.residual} defect={rep_fanon.defect}")

    # Commit using coalgebraic gate (defect==0)
    try:
        cid = osys.commit("cluster", rep_fanon, meta={"scope": "focus:Fanon"})
        log(f"[main] commit id={cid[:12]}")
    except Exception as e:
        log(f"[main] no commit: {e}")

    osys.export_rdf("cluster", "ritm_cluster.ttl")
    log("=== Done ===")
