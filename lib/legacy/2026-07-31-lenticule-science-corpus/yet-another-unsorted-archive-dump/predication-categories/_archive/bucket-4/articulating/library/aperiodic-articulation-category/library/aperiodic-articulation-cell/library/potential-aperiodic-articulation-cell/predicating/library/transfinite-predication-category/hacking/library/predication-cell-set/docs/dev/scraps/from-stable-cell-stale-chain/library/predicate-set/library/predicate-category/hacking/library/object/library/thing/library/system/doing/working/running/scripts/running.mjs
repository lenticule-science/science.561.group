// Generic run of any system. The most abstract layer in the running specialization chain.
// Per code/transformers/running.md: domain = (process, input), codomain = updated state + witness.
// Concrete behavior is provided by subkinds (operating-system, computer-operating-system, ...).

export async function run() {
  throw new Error('system.run: abstract — specialize per subkind of system');
}
