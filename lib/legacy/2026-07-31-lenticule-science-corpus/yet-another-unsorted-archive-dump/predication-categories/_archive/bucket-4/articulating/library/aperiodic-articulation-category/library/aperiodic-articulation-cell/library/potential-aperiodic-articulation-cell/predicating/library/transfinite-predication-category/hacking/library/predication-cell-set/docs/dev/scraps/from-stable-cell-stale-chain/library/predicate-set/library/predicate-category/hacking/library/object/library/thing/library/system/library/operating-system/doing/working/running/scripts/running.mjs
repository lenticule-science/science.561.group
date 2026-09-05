// Run of any operating-system: a system that supervises subsystems.
// Extends system.run with the subsystem-supervision contract; concrete behavior is provided
// by subkinds (computer-operating-system specializes for POSIX).

import { run as runSystem } from '../../../../../doing/working/running/scripts/running.mjs';

export async function run() {
  // operating-system.run is still abstract — POSIX-specific behavior lives at computer-operating-system.
  throw new Error('operating-system.run: abstract — specialize per subkind of operating-system');
}

export { runSystem };
