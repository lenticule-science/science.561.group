---
type: concept
class: runtime-implementation-discipline
depends-on: [code-as-substrate, runtime, deployment-target]
see-also: [boot-sequence]
---

# Native compilation target

The *machine-level representation* into which substrate-resident code is compiled for execution. Per [code-as-substrate](theories/functional-runtime-platform/concepts/code-as-substrate.md), the substrate's programs are substrate content (source-form); per [compile](theories/functional-runtime-platform/morphisms/compile.md), they're transformed into evaluatable forms. The native compilation target is the *deepest* of those forms — code that runs directly on the host CPU.

Common native targets:

- **CPU machine code.** Direct compilation to x86-64, aarch64, RISC-V, etc. Maximum performance; deployment-target-architecture-specific.
- **WebAssembly (Wasm).** Portable binary format that runs on any Wasm runtime (browsers, wasmtime, wasmer). Slightly slower than native CPU but architecture-portable.
- **JIT-compiled bytecode.** JVM bytecode, Python bytecode, JavaScript via V8. Run by a managed runtime; performance depends on JIT quality.
- **Interpreted source.** No compilation; the runtime evaluates source directly. Slowest but simplest — used during development.

The substrate's compile pipeline:

1. **Source form** (per [code-record](theories/functional-runtime-platform/objects/code-record.md)) — substrate-content AST or text.
2. **Type-checked form** (per [check-type](theories/functional-runtime-platform/morphisms/check-type.md)) — annotated with type information.
3. **Optimized intermediate form** — runtime-specific optimizations (inlining, constant folding, dead-code elimination).
4. **Native target** — final machine-code-or-equivalent form.

Per [deployment-determinism](../theorems/deployment-determinism.md), the same source form compiled for the same target on different hosts produces byte-identical native bytes — the substrate's compilation is reproducible per [hash-injectivity-under-canonical-form](../theorems/hash-injectivity-under-canonical-form.md).

Per [deployment-target](deployment-target.md), each deployment-target supports certain native targets:

- **Replit / Nix / Docker** — typically Wasm or JIT-bytecode; native CPU code requires careful sandboxing.
- **Bare-metal / VM** — native CPU code is fine; the substrate has direct CPU access.
- **Embedded systems** — native CPU code with cross-compilation; runtime is minimal.
- **Browser** — Wasm only; JavaScript JIT also admissible.

The choice of native target affects performance (CPU > Wasm > JIT > interpreted) but not correctness. Per [function-purity-replay-fidelity](theories/functional-runtime-platform/theorems/function-purity-replay-fidelity.md), pure functions produce the same output regardless of compilation target.
