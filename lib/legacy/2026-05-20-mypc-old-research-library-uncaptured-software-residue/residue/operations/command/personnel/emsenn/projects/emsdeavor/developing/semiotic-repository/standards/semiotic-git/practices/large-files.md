---
title: "Large Files (PDF/Video) as External Artifacts"
date-created: 2026-03-06T00:00:00
---
# Large Files (PDF/Video) as External Artifacts

Git works best when the repository history stays lightweight and text-first. For large binaries (PDFs, videos, datasets), treat the files as *external artifacts* and keep the repo as the *index* to those artifacts.

## Recommended Pattern

- Store large files in a local folder such as `media/`.
- Ignore the binaries in Git (e.g. `media/*.pdf`, `media/*.mp4`).
- Commit a small manifest with integrity hashes (e.g. SHA256) and stable filenames.
- Publish the actual binaries as GitHub Release assets (or in your archive) and link them from the manifest/README.

This keeps clones fast, diffs meaningful, and history rewrite rare.

## Minimal Repo Layout

- `media/README.md`: explains where the assets live and how to obtain them
- `media/manifest.txt`: filename + hash + optional source URL
- `.gitignore`: ignores `media/*.pdf`, `media/*.mp4`, etc.

## If the Large Files Were Already Committed

If the binaries are only in a very early commit and nobody has built downstream history, prefer rewriting immediately:

- If it’s the initial commit: remove the files, `git commit --amend`, then prune (`git gc`) and force-push.
- If there’s more history: use `git filter-repo` (or equivalent) to remove the paths from *all* commits, then force-push.

After rewriting public history, collaborators must re-clone or hard-reset to the new history.

## Alternative: Git LFS

Git LFS can be appropriate when you *need* binaries versioned alongside code, but it adds operational dependencies (LFS client, quota/billing constraints, hosting support). For “library media” publishing, Release assets + manifest is usually simpler and more portable.

