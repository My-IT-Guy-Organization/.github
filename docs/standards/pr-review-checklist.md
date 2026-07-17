# Pull Request Review Checklist

A lightweight standard for reviewing (and self-reviewing) PRs across the org.
Not every item applies to every change — use judgement.

## Before requesting review (author)

- [ ] The PR does one thing; the title and description say what and why
- [ ] CI is green (lint, test, build)
- [ ] No secrets, tokens, or credentials committed
- [ ] Docs/README updated if behavior or setup changed
- [ ] Self-reviewed the diff — no debug logs, commented-out code, or stray files

## Reviewing (reviewer)

- [ ] **Correctness** — does it do what it claims? Any obvious edge cases missed?
- [ ] **Scope** — changes match the description; no unrelated drive-by edits
- [ ] **Security** — input handling, no secrets, dependencies from trusted sources
- [ ] **Readability** — names, structure, and comments match the surrounding code
- [ ] **Tests** — new behavior is covered; existing tests still make sense
- [ ] **Docs** — user-facing or setup changes are documented

## Merging

- [ ] Prefer squash-merge for a clean history unless the commits are meaningful
- [ ] Delete the branch after merge
- [ ] Confirm any follow-ups are captured as issues, not lost in review threads
