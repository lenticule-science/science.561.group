/**
 * Recursive directory traversal.
 *
 * Returns a flat list of every file path under rootDir. FARS is the
 * filesystem substrate layer — files are first-class regardless of
 * extension. Filetype-aware filtering is a downstream concern; the
 * walker does not pre-judge what's interesting.
 *
 * Skip rules:
 *
 *   - Hidden entries (any name starting with ".") are skipped.
 *   - Build / cache / vendored directories listed in
 *     DEFAULT_SKIP_DIRS are skipped.
 *   - Files larger than DEFAULT_MAX_FILE_SIZE are skipped by default.
 *     Override per-call via options.maxFileSize, or pass 0 to
 *     disable the size cap.
 *   - Foreign git repos: any directory that contains its own .git/
 *     subdirectory and isn't the rootDir itself is skipped. This
 *     catches cloned upstream projects sitting inside the tree.
 *   - Path patterns: any substring in options.excludePatterns matches
 *     against the absolute path and skips the entry. These can come
 *     from a .gitignore reader, a .farsignore file, or be passed in
 *     directly.
 *
 * Options:
 *
 *   extensions       array of lowercase extensions (no dot); if
 *                    provided, only files matching one of these are
 *                    emitted. By default every file is emitted.
 *   skipDirs         additional directory names to skip; merged with
 *                    DEFAULT_SKIP_DIRS
 *   excludePatterns  array of substrings to match against the absolute
 *                    path; matching paths (file or directory) are
 *                    skipped
 *   includeForeignGit  if true, do not skip directories that contain
 *                      their own .git/. Default false.
 *   maxFileSize      byte cap; 0 disables
 */

import fs from "node:fs";
import path from "node:path";

const DEFAULT_SKIP_DIRS = new Set([
  "node_modules",
  ".git",
  ".claude",
  ".codex",
  "dist",
  "build",
  "target",
  "cache",
  ".cache",
]);

const DEFAULT_MAX_FILE_SIZE = 256 * 1024;

function walkDir(rootDir, options) {
  if (!options) options = {};
  const extensions = options.extensions
    ? new Set(options.extensions.map((e) => e.toLowerCase()))
    : null;
  const skipDirs = options.skipDirs
    ? new Set([...DEFAULT_SKIP_DIRS, ...options.skipDirs])
    : DEFAULT_SKIP_DIRS;
  const excludePatterns = Array.isArray(options.excludePatterns)
    ? options.excludePatterns
    : [];
  const includeForeignGit = Boolean(options.includeForeignGit);
  const maxFileSize = options.maxFileSize != null ? options.maxFileSize : DEFAULT_MAX_FILE_SIZE;

  const absRoot = path.resolve(rootDir);
  const files = [];
  if (!fs.existsSync(absRoot)) return files;

  function isExcluded(absPath) {
    for (const pat of excludePatterns) {
      if (!pat) continue;
      if (absPath.indexOf(pat) >= 0) return true;
    }
    return false;
  }

  function isForeignGitRepo(absDir) {
    if (includeForeignGit) return false;
    if (absDir === absRoot) return false;
    try {
      const gitPath = path.join(absDir, ".git");
      const st = fs.statSync(gitPath);
      return st.isDirectory();
    } catch {
      return false;
    }
  }

  function recurse(dir) {
    if (isForeignGitRepo(dir)) return;

    let entries;
    try {
      entries = fs.readdirSync(dir, { withFileTypes: true });
    } catch (err) {
      return; // unreadable directory; skip
    }
    for (const entry of entries) {
      if (entry.name.startsWith(".")) continue;
      const fullPath = path.join(dir, entry.name);
      if (isExcluded(fullPath)) continue;
      if (entry.isDirectory()) {
        if (skipDirs.has(entry.name)) continue;
        recurse(fullPath);
      } else if (entry.isFile()) {
        if (extensions) {
          const ext = entry.name.split(".").pop().toLowerCase();
          if (!extensions.has(ext)) continue;
        }
        if (maxFileSize > 0) {
          try {
            const stat = fs.statSync(fullPath);
            if (stat.size > maxFileSize) continue;
          } catch {
            continue;
          }
        }
        files.push(fullPath);
      }
    }
  }

  recurse(absRoot);
  return files;
}

/**
 * Read a .gitignore-style file at `gitignorePath` and return the list
 * of substring patterns to exclude. The reader is intentionally
 * minimal: each non-blank, non-comment, non-negated line becomes a
 * literal substring matched against absolute paths. Trailing slashes
 * are stripped (we don't distinguish file from directory). Glob
 * metacharacters are NOT supported — lines containing them are
 * dropped. This catches common path-prefix patterns like
 * `operations/engineering/src/cline/` and skips glob ones.
 *
 * Returns an empty array if the file is missing or unreadable.
 */
// note: glob lines like the doublestar ones are detected by the
// has-glob-meta regex below and silently dropped (no full glob parser).
function readGitignorePatterns(gitignorePath) {
  let text;
  try {
    text = fs.readFileSync(gitignorePath, "utf8");
  } catch {
    return [];
  }
  const patterns = [];
  for (const rawLine of text.split(/\r?\n/)) {
    const line = rawLine.trim();
    if (!line) continue;
    if (line.startsWith("#")) continue;
    if (line.startsWith("!")) continue; // negations not supported
    if (/[*?\[]/.test(line)) continue;  // skip glob patterns
    const stripped = line.replace(/\/+$/, "").replace(/^\/+/, "");
    if (stripped) patterns.push(stripped);
  }
  return patterns;
}

export {
  walkDir,
  readGitignorePatterns,
  DEFAULT_SKIP_DIRS,
  DEFAULT_MAX_FILE_SIZE,
};
