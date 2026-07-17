# 0001 — Consolidate DevOps content into the org `.github` repo

- **Status:** Accepted
- **Date:** 2026-07

## Context

DevOps assets (reusable workflows, project templates, docs, scripts, and a
project dashboard) lived in a separate `My-IT-Guy-DevOps` repository, while the
org's special `.github` repo held only community-health files. Two homes meant
two places to look and a risk of drift.

## Decision

Merge the DevOps content into the org `.github` repository and make it the
single DevOps home:

- Reusable workflows live in `.github/workflows/` and are referenced as
  `My-IT-Guy-Organization/.github/.github/workflows/<file>@main` (the doubled
  `.github` is expected for a repo named `.github`).
- Templates, docs, scripts, and the (public-only) project dashboard live here.
- The old `My-IT-Guy-DevOps` repo is to be archived with a pointer here.

## Consequences

- One place to maintain shared CI, templates, and docs.
- Community-health files defined here cascade to every org repo automatically.
- Anything that referenced the old repo path must be repointed (templates,
  bootstrap script, runbooks) — done as part of the consolidation.
- The public dashboard lists public repos only; the full inventory is tracked
  privately.
