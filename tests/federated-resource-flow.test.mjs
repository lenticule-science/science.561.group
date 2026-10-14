import assert from "node:assert/strict";
import test from "node:test";

// This is a falsifier for a scientific conservation model, not a fleet
// scheduler, accounting journal, or an Obsmetrologia formal proof.
const sum = values => values.reduce((total, value) => total + value, 0n);
const nat = value => {
  assert.equal(typeof value, "bigint");
  assert.ok(value >= 0n, "work units cannot be negative");
  return value;
};
const edges = [[0, 1], [1, 2], [2, 0]];
function initial(q = [5n, 2n, 0n]) {
  return { q: q.map(nat), z: [0n, 0n, 0n], admitted: 0n,
    completed: 0n, withdrawn: 0n, original: sum(q) };
}
function advance(s, {arrival, completion, withdrawal, send, receive}) {
  for (const xs of [arrival, completion, withdrawal, send, receive]) {
    assert.equal(xs.length, 3);
    xs.forEach(nat);
  }
  const incident = (units, endpoint) =>
    s.q.map((_, node) => sum(units.filter((_, edge) => edges[edge][endpoint] === node)));
  const outbound = incident(send, 0);
  const inbound = incident(receive, 1);
  const q = s.q.map((old, i) => old + arrival[i] - completion[i] -
    withdrawal[i] - outbound[i] + inbound[i]);
  const z = s.z.map((old, i) => old + send[i] - receive[i]);
  q.forEach(nat);
  z.forEach(nat);
  return { q, z, original: s.original,
    admitted: s.admitted + sum(arrival),
    completed: s.completed + sum(completion),
    withdrawn: s.withdrawn + sum(withdrawal) };
}
const conserved = s =>
  sum(s.q) + sum(s.z) + s.completed + s.withdrawn === s.original + s.admitted;

test("transfer, independent receiving and completion conserve unique work units", () => {
  const start = initial();
  let s = advance(start, {arrival:[2n,0n,0n], completion:[0n,1n,0n],
    withdrawal:[0n,0n,0n], send:[3n,0n,0n], receive:[0n,0n,0n]});
  assert.deepEqual(s.q, [4n,1n,0n]);
  assert.deepEqual(s.z, [3n,0n,0n]);
  assert.equal(conserved(s), true);
  s = advance(s, {arrival:[0n,0n,0n], completion:[0n,2n,0n],
    withdrawal:[0n,0n,0n], send:[0n,0n,0n], receive:[3n,0n,0n]});
  assert.deepEqual(s.q, [4n,2n,0n]);
  assert.equal(sum(s.z), 0n);
  assert.equal(conserved(s), true);
});

test("thousands of bounded synthetic admissions, cancellations and transfers conserve work", () => {
  let seed=0x561cafe;
  const rand = n => {
    seed ^= (seed << 13); seed ^= (seed >>> 17); seed ^= (seed << 5);
    seed >>>= 0;
    return BigInt(seed % n);
  };
  let s=initial([0n,0n,0n]);
  for (let t=0; t<5000; t++) {
    const arrival=[rand(4),rand(4),rand(4)];
    const receive=s.z.map(held => held === 0n ? 0n : rand(Number(held)+1));
    const completion=[], withdrawal=[], send=[];
    for (let i=0; i<3; i++) {
      let available=s.q[i]+arrival[i]+sum(receive.filter((_,edge)=>edges[edge][1]===i));
      const d=rand(Number((available<4n?available:4n)+1n));
      available-=d;
      const x=rand(Number((available<3n?available:3n)+1n));
      available-=x;
      const f=rand(Number((available<4n?available:4n)+1n));
      completion.push(d); withdrawal.push(x); send.push(f);
    }
    s=advance(s,{arrival,completion,withdrawal,send,receive});
    assert.ok(conserved(s), `conservation failed at step ${t}`);
  }
  assert.ok(s.admitted>0n);
  assert.ok(s.completed>0n);
});

test("a separately received spare node increases synthetic completions without inventing capacity", () => {
  function run(withAuthorizedTransfer) {
    let s=initial([0n,0n,0n]);
    for(let t=0;t<100;t++){
      const received=s.z[0];
      const atA=s.q[0]+2n;
      const atB=s.q[1]+received;
      const completeA=atA>0n?1n:0n;
      const completeB=atB>0n?1n:0n;
      // One transport slot and one CPU job/tick at each node. The rest
      // of B's apparent unused capacity is not spent or billed in this assay.
      const send=withAuthorizedTransfer && atA>completeA ? 1n : 0n;
      s=advance(s,{arrival:[2n,0n,0n],
        completion:[completeA,completeB,0n],withdrawal:[0n,0n,0n],
        send:[send,0n,0n],receive:[received,0n,0n]});
      assert.ok(conserved(s));
    }
    return s;
  }
  const fixed=run(false), redistributed=run(true);
  assert.equal(fixed.completed,100n);
  assert.equal(redistributed.completed,199n);
  assert.equal(sum(fixed.q)+sum(fixed.z),100n);
  assert.equal(sum(redistributed.q)+sum(redistributed.z),1n);
  // These results require an admissible transport and a separately
  // received second compute actor; the numerical example is not a cloud fact.
});

test("lost or fabricated transport receipts cannot be mistaken for completed throughput", () => {
  let s=advance(initial(), {arrival:[0n,0n,0n], completion:[0n,0n,0n],
    withdrawal:[0n,0n,0n], send:[2n,0n,0n], receive:[0n,0n,0n]});
  assert.equal(conserved(s),true);
  assert.equal(conserved({...s,z:[1n,0n,0n]}),false,"dropped outbound custody");
  assert.equal(conserved({...s,completed:s.completed+1n}),false,"invented completion");
  assert.throws(()=>advance(s,{arrival:[0n,0n,0n], completion:[0n,0n,0n],
    withdrawal:[0n,0n,0n], send:[0n,0n,0n], receive:[3n,0n,0n]}),
    /negative/,"receiver cannot accept more transfers than exist");
});

const ratio=(n,d=1n)=>({n:BigInt(n),d:BigInt(d)});
const mul=(a,b)=>ratio(a.n*b.n,a.d*b.d);
const div=(a,b)=>ratio(a.n*b.d,a.d*b.n);
const eq=(a,b)=>a.n*b.d===b.n*a.d;
const pathProduct=ts=>ts.reduce(mul,ratio(1n));

test("local invertible gauges preserve closed-path holonomy, including mismatches",()=>{
  const chart=[ratio(2n),ratio(3n),ratio(5n)];
  const transformed=transfers=>transfers.map((T,i)=>
    mul(chart[(i+1)%3],div(T,chart[i])));
  for(const transfers of [
    [ratio(2n),ratio(3n),ratio(1n,6n)],
    [ratio(2n),ratio(3n),ratio(1n,5n)],
  ])assert.ok(eq(pathProduct(transfers),pathProduct(transformed(transfers))));
  assert.equal(eq(pathProduct([ratio(2n),ratio(3n),ratio(1n,5n)]),ratio(1n)),false);
});

test("unqualified provider dimensions cannot be added as fungible commodities",()=>{
  const join=(a,b)=>{
    if(a.dimensionNi!==b.dimensionNi)throw new TypeError("resource dimension mismatch");
    return {dimensionNi:a.dimensionNi,quantity:a.quantity+b.quantity};
  };
  assert.deepEqual(join({dimensionNi:"ni:cpu-seconds",quantity:4n},
    {dimensionNi:"ni:cpu-seconds",quantity:5n}),{dimensionNi:"ni:cpu-seconds",quantity:9n});
  assert.throws(()=>join({dimensionNi:"ni:oracle-ocpu-hours",quantity:4n},
    {dimensionNi:"ni:gcp-vcpu-seconds",quantity:5n}),/resource dimension mismatch/);
});
