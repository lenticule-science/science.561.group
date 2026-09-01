---

description: "Runs the math corpus build script and returns the exit status. Use after writing or modifying any math unit file to confirm the build is clean."
skill-closure-kind: process
---

# build-math

domain: none (operates on the current state of `math/`)

codomain: `build_result` — `{status: ok | error, message: string}`

---

1. Run: `python src/pipeline/build.py`

2. Read exit code and stderr. Produce `build_result` by lookup:

   ```
   exit_code → build_result
   0         → {status: ok,    message: "build clean"}
   nonzero   → {status: error, message: <stderr output>}
   ```

3. Return `build_result` to caller. Do not interpret or fix errors here —
   report them as-is. The caller decides whether to retry or escalate.
