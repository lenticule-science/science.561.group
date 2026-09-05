-- Import-root for whole-project tooling.
--
-- This module pulls in the entire Infomaterial library when a tool needs one named
-- root. Tool modules live outside `Infomaterial/`; the library never imports them.
import Infomaterial
