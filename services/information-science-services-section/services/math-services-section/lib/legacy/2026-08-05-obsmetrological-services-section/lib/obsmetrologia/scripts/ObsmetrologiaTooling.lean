-- Import-root for whole-project tooling.
--
-- This module pulls in the entire Obsmetrologia library when a tool needs one named
-- root. Tool modules live outside `Obsmetrologia/`; the library never imports them.
import Obsmetrologia
