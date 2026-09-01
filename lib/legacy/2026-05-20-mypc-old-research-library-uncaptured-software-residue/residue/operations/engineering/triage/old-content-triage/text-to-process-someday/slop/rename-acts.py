"""Rename act identifiers from mathematical vocabulary to philosophical vocabulary.

Changes the `act:` field in definition files and all `top:`/`bottom:` references
in every act file. Does NOT rename the .md files themselves (they're in slop).
"""

import os
import re
import glob

ACTS_DIR = r"C:\Users\emsen\research\library\emsenn-net\content\slop\relationality\acts"

RENAMES = {
    "MeetRecognition": "Together",
    "JoinRecognition": "Either",
    "ImplyRecognition": "Implies",
    "IncludeRecognition": "Include",
    "ExcludeRecognition": "Excludes",
    "OrderRecognition": "Entails",
    "CapRecognition": "Top",
    "GroundRecognition": "Bottom",
    "ShapeRecognition": "Shape",
    "Nucleate": "Close",
    "IdentifyMorph": "Identity",
    "ComposeMorph": "Compose",
    "EqualizeTerms": "Equal",
    "BoxModality": "Must",
    "DiamondModality": "May",
    "ComonadCounit": "FlowCounit",
    "ComonadComultiply": "FlowComult",
}

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    original = content
    changes = []

    for old_name, new_name in RENAMES.items():
        # Replace act: field
        pattern = rf'^(act:\s*){re.escape(old_name)}(\s*)$'
        if re.search(pattern, content, re.MULTILINE):
            content = re.sub(pattern, rf'\g<1>{new_name}\2', content, flags=re.MULTILINE)
            changes.append(f"  act: {old_name} -> {new_name}")

        # Replace top: field
        pattern = rf'^(top:\s*){re.escape(old_name)}(\s*)$'
        if re.search(pattern, content, re.MULTILINE):
            content = re.sub(pattern, rf'\g<1>{new_name}\2', content, flags=re.MULTILINE)
            changes.append(f"  top: {old_name} -> {new_name}")

        # Replace bottom: field
        pattern = rf'^(bottom:\s*){re.escape(old_name)}(\s*)$'
        if re.search(pattern, content, re.MULTILINE):
            content = re.sub(pattern, rf'\g<1>{new_name}\2', content, flags=re.MULTILINE)
            changes.append(f"  bottom: {old_name} -> {new_name}")

    if content != original:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        return changes
    return []

def main():
    all_files = glob.glob(os.path.join(ACTS_DIR, "**", "*.md"), recursive=True)
    total_changes = 0
    files_changed = 0

    for filepath in sorted(all_files):
        changes = process_file(filepath)
        if changes:
            files_changed += 1
            total_changes += len(changes)
            relpath = os.path.relpath(filepath, ACTS_DIR)
            print(f"{relpath}:")
            for c in changes:
                print(c)

    print(f"\n--- Summary ---")
    print(f"Files changed: {files_changed}")
    print(f"Total field replacements: {total_changes}")
    print(f"Renames applied: {len(RENAMES)}")

if __name__ == "__main__":
    main()
