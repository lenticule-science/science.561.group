#!/usr/bin/env node

import { resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { createMarkdownDocument } from "@red-cup-engineering/create-markdown-document-service";
import { writeMarkdownFile } from "@red-cup-engineering/write-markdown-file-service";

const HELP = `Usage:
  write-a-term --name <term> --description <text> --author <identity> --output-directory <path> [options]

Options:
  --slug <slug>          Override the filename slug derived from the term name.
  --date-created <date>  Use an ISO calendar date (YYYY-MM-DD). Defaults to today in UTC.
  --force                Atomically replace an existing term file.
  --help                 Show this help text.
`;

function requireText(value, label) {
  if (typeof value !== "string" || value.trim() === "") {
    throw new TypeError(`${label} must be non-empty text`);
  }
  return value.replace(/\r\n?/g, "\n").trim();
}

export function slugifyTermName(name) {
  const slug = requireText(name, "name")
    .normalize("NFKD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/&/g, " and ")
    .replace(/[’']/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");

  if (slug === "") throw new TypeError("name must produce a non-empty filename slug");
  return slug;
}

function normalizeSlug(value) {
  const slug = requireText(value, "slug");
  if (!/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(slug)) {
    throw new TypeError("slug must contain lowercase letters, digits, and single hyphens only");
  }
  return slug;
}

function normalizeDate(value) {
  const date = requireText(value, "date-created");
  if (!/^\d{4}-\d{2}-\d{2}$/.test(date) || Number.isNaN(Date.parse(`${date}T00:00:00Z`))) {
    throw new TypeError("date-created must be a valid ISO calendar date (YYYY-MM-DD)");
  }
  return date;
}

export function renderTermMarkdown({ name, description, author, slug, dateCreated }) {
  const normalizedName = requireText(name, "name");
  const normalizedDescription = requireText(description, "description");
  const normalizedAuthor = requireText(author, "author");
  const normalizedSlug = slug === undefined ? slugifyTermName(normalizedName) : normalizeSlug(slug);
  const normalizedDate = normalizeDate(dateCreated);

  return createMarkdownDocument({
    authors: [normalizedAuthor],
    "date-created": normalizedDate,
    defines: [normalizedSlug],
    description: normalizedDescription,
    slug: normalizedSlug,
    title: normalizedName,
    type: "term",
    body: `${normalizedDescription}\n`
  }, { semanticLinefeeds: false });
}

export async function writeTermFile({ outputDirectory, force = false, ...term }) {
  const directory = resolve(requireText(outputDirectory, "output-directory"));
  const slug = term.slug === undefined ? slugifyTermName(term.name) : normalizeSlug(term.slug);
  const markdown = renderTermMarkdown({ ...term, slug });
  const receipt = await writeMarkdownFile({
    root: directory,
    path: `${slug}.md`,
    text: markdown,
    mode: force ? "upsert" : "create"
  });
  return receipt.path;
}

function parseArguments(argv) {
  const options = { force: false };
  for (let index = 0; index < argv.length; index += 1) {
    const argument = argv[index];
    if (argument === "--help") return { help: true };
    if (argument === "--force") {
      options.force = true;
      continue;
    }
    if (!["--name", "--description", "--author", "--output-directory", "--slug", "--date-created"].includes(argument)) {
      throw new TypeError(`unknown argument: ${argument}`);
    }
    const value = argv[index + 1];
    if (value === undefined || value.startsWith("--")) throw new TypeError(`${argument} requires a value`);
    index += 1;
    options[argument.slice(2).replace(/-([a-z])/g, (_, letter) => letter.toUpperCase())] = value;
  }
  return options;
}

async function main(argv) {
  const options = parseArguments(argv);
  if (options.help) {
    process.stdout.write(HELP);
    return;
  }
  options.dateCreated ??= new Date().toISOString().slice(0, 10);
  const outputPath = await writeTermFile(options);
  process.stdout.write(`${outputPath}\n`);
}

const isMain = process.argv[1] && resolve(process.argv[1]) === resolve(fileURLToPath(import.meta.url));
if (isMain) {
  main(process.argv.slice(2)).catch((error) => {
    process.stderr.write(`write-a-term: ${error.message}\n`);
    process.exitCode = 1;
  });
}
