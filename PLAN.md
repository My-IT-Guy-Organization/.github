# My IT Guy — DevOps Roadmap

A living plan for the org's DevOps hub (this repo) and the repos it supports.
Check items off as they land, add new ideas at the bottom of the matching
section, and prune anything that stops making sense. Review cadence is at the
end of the doc.

> **Scope note:** this file is public, so it tracks technical and
> documentation work only. Security hardening, credentials, and anything
> involving private or client repositories is tracked privately (see §3).

---

## 0. Recently completed (baseline)

- [x] Merge the `My-IT-Guy-DevOps` hub into this org `.github` repo — workflows, templates, docs, scripts (PR #1)
- [x] Fix `auto-assign.yml` failing on PR events; bump to `pozil/auto-assign-issue@v4`
- [x] Restrict `PROJECTS.md` to public repositories (PR #7)
- [x] Move security/conduct contacts to dedicated aliases (PR #7)
- [x] Dependabot live and merging action bumps (PRs #2, #3, #8)

## 1. Quick wins (this week)

- [ ] **Rename `Profile/` → `profile/`** — GitHub only renders the org profile README from lowercase `profile/README.md`, so the current capital-P folder likely isn't showing on the org page at all
- [ ] Fix the "Organzization" typo in the profile README heading
- [ ] Clean `.devcontainer/devcontainer.json`: remove the typo'd `chatgpt.openOnStar11tup` key, and drop the third-party `claude-code` devcontainer feature — `postCreateCommand` already installs Claude Code from the official package, so the extra feature is redundant
- [ ] Add descriptions + topics to every public repo; pin the best ones on the org profile
- [ ] Create the private ops repo that §3 and the scope note refer to

## 2. Consolidation — make this repo the single DevOps home

The DevOps content now lives here, but every pointer still targets the old
repo. Until this section is done, the two copies can drift apart.

- [ ] Repoint `uses:` references in `templates/workflows/*.yml` from
      `My-IT-Guy-Organization/My-IT-Guy-DevOps/...` → `My-IT-Guy-Organization/.github/.github/workflows/...@main`
- [ ] Update `scripts/new-project.sh` — `DEVOPS_REPO` should clone this repo (use the HTTPS URL so it works without SSH keys)
- [ ] Update `docs/runbooks/new-project-setup.md` step 3 to reference this repo's workflows
- [ ] Verify **Settings → Actions → General → Access** on this repo allows other org repos to call the reusable workflows
- [ ] Archive `My-IT-Guy-DevOps` with a README pointing here, so nobody updates the stale copy

## 3. Security & governance

Tracked in the private ops repo, not here — a public checklist of security
work would double as a map for attackers. This section exists only so the
plan is complete: create the private repo (§1), keep the hardening backlog
and reviews there, and keep this file to technical work.

## 4. CI/CD platform

- [ ] Add a **`workflow-templates/`** directory here — org "starter workflows" appear natively in every org repo's *Actions → New workflow* tab, which beats copying files by hand (mirror `templates/workflows/`, add matching `.properties.json` files)
- [ ] Roll the reusable CI out to each active public repo — track adoption in `PROJECTS.md` with a CI column/badge
- [ ] Roll `reusable-codeql.yml` out to public repos (CodeQL is free on public repos)
- [ ] Add a reusable **lint/format** workflow (Prettier + ESLint for JS, `ruff format` for Python) so style checks are uniform
- [ ] Add dependency caching to the node/python CI (`setup-node`/`setup-python` built-in cache) — faster runs, fewer minutes
- [ ] Netlify **deploy previews** on PRs, so reviews happen against a URL instead of a screenshot
- [ ] Add a scheduled **link checker** (e.g. lychee) over the markdown in this repo — docs rot silently
- [ ] Release automation where versioning matters (release-please or semantic-release) + generated changelogs
- [ ] CI status badges in each repo README

## 5. Templates & standards upgrades

- [ ] Convert `ISSUE_TEMPLATE/*.md` to **YAML issue forms** — structured, required fields produce far better bug reports
- [ ] Expand `ISSUE_TEMPLATE/config.yml` with contact links (security reporting, support → business site)
- [ ] Standardize labels org-wide: a `labels.yml` here + a sync workflow so every repo shares the same label set
- [ ] Create true **GitHub template repositories** (`site-template`, `python-tool-template`, `node-app-template`) — "Use this template" replaces most of `new-project.sh`
- [ ] Add to `templates/`: README skeleton, `CODEOWNERS` example, LICENSE guidance
- [ ] Auto-label PRs by path (actions/labeler) and by size — helps triage at a glance

## 6. Documentation & runbooks

Existing: `deploy-netlify.md`, `new-project-setup.md`, coding standards, git
workflow. Add:

- [ ] **Incident runbook**: site down — triage steps, hosting status, DNS checks, rollback procedure
- [ ] **DNS & domain management** runbook (procedures here; account specifics stay private)
- [ ] **Backup & restore** runbook: what's backed up, where, and how to restore it
- [ ] **Project onboarding** checklist: intake questions, asset collection, kickoff
- [ ] **Project offboarding** checklist: handover, archive/transfer steps
- [ ] **Monthly maintenance** checklist: dependency PRs, uptime review, backup verification
- [ ] Standards: PR review checklist, versioning policy, browser-support matrix, accessibility baseline (WCAG AA)
- [ ] Lightweight decision log (`docs/decisions/`, one short file per significant choice) — future-you will thank present-you

## 7. Site & service operations

- [ ] **Uptime monitoring** for production sites — Upptime (free, runs on Actions, public status page) or UptimeRobot
- [ ] Public **status page** people can check before emailing
- [ ] Define service tiers: what `Active` vs `Maintenance` means in practice (response time, update cadence)
- [ ] Privacy-friendly analytics baseline (Plausible/GoatCounter)
- [ ] Post-launch **handoff document** template: where the site lives, how to request changes, what's included

## 8. Org profile & marketing polish

- [ ] Flesh out the org profile README (after the `profile/` rename): services offered, featured projects, contact CTA, link to [myitguy.netlify.app](https://myitguy.netlify.app/)
- [ ] Buy a custom domain (e.g. `myitguy.com`) — enables real role emails later and looks more professional than `.netlify.app`
- [ ] Social preview images for the org and key repos
- [ ] Case-studies section on the site fed by public work

## 9. Longer-term / nice-to-have

- [ ] Dependabot **grouping** + auto-merge policy for patch-level action bumps (less PR noise, like #2/#3/#8)
- [ ] Terraform (or similar) if infra grows beyond Netlify — config as code from day one
- [ ] Self-hosted Actions runner if Actions minutes become a cost issue
- [ ] Monorepo vs polyrepo review once active projects pass ~20
- [ ] Quarterly **DevOps day**: review this plan, prune stale repos, update `PROJECTS.md`

## 10. Developer experience

- [ ] Adopt one `.devcontainer` as the org standard and reference it from every repo, so any project opens in Codespaces / VS Code with the same toolchain
- [ ] Add `.editorconfig` (already in `templates/`) to every active repo so editors agree on indentation and line endings
- [ ] Pre-commit framework config in `templates/` (format, lint, trailing-whitespace, large-file guard) — catches issues before CI even runs
- [ ] A `Makefile` or `justfile` convention (`setup`, `dev`, `test`, `lint`, `build`) so every repo has the same entry points regardless of stack
- [ ] `.nvmrc` / `.python-version` in templates to pin runtime versions per repo
- [ ] Document the "clone → run in 5 minutes" path in each repo's README; treat a longer path as a bug

## 11. Testing & quality

- [ ] Minimum-bar test setup per stack in `templates/` (Vitest/Jest for node, pytest for python) wired into the reusable CI
- [ ] Coverage reporting with a non-blocking threshold at first, ratcheting up over time
- [ ] Smoke-test step for static sites (build succeeds + key pages return 200) before a deploy is allowed
- [ ] Accessibility checks in CI for client sites (axe / pa11y) against the WCAG AA baseline from §6
- [ ] Lighthouse CI budget for performance/SEO/accessibility on production sites
- [ ] HTML/CSS validation and broken-anchor checks for the mostly-static sites

## 12. Performance, SEO & web standards

- [ ] Per-site performance budget (bundle size, LCP, CLS) checked in CI and tracked over time
- [ ] SEO baseline checklist in `docs/standards/`: meta tags, sitemap, robots.txt, Open Graph, structured data
- [ ] Image optimization convention (formats, sizes, lazy-loading) for client sites
- [ ] Security headers baseline (CSP, HSTS, X-Content-Type-Options) via `netlify.toml` template
- [ ] Favicon / touch-icon / manifest starter kit in `templates/`

## 13. Automation & bots

- [ ] Stale issue/PR bot (`actions/stale`) with gentle timelines so the backlog self-prunes
- [ ] Auto-add new issues/PRs to a GitHub Project board for a single triage view across repos
- [ ] Welcome workflow for first-time contributors (greeting + link to `CONTRIBUTING.md`)
- [ ] Nightly/weekly scheduled health workflow that opens an issue if a site is down or a check is failing
- [ ] Auto-generated release notes from Conventional Commits
- [ ] A `/` command bot or workflow_dispatch buttons for common ops (redeploy, purge cache) once they're routine

## 14. Observability & metrics

- [ ] Lightweight ops dashboard (could be a static page in this repo) summarizing repo count, CI health, and last-deploy times
- [ ] Track DORA-lite signals: deploy frequency and lead time, pulled from Actions run history
- [ ] Error tracking baseline for interactive apps (Sentry free tier) documented in `templates/`
- [ ] Monthly "state of the org" snapshot appended to a log file — repos added, sites shipped, incidents

## 15. Community & open-source health

- [ ] `FUNDING.yml` in this repo if sponsorship is ever wanted (applies org-wide)
- [ ] `.github/CONTRIBUTING.md` and `CODE_OF_CONDUCT.md` already exist here and cascade to every repo — verify they render on a repo with no local copy
- [ ] `SUPPORT.md` telling people where to ask questions vs file bugs
- [ ] Consistent LICENSE strategy: which repos are MIT/Apache vs all-rights-reserved, documented so it's a decision not an accident
- [ ] A short "good first issue" labeling habit to make public repos approachable

---

## Cadence

| When | What |
|---|---|
| Weekly | Merge dependency PRs, glance at uptime/CI failures |
| Monthly | Maintenance checklist (§6), review open items in §1–§2 |
| Quarterly | DevOps day (§9): full plan review, plus the private-side reviews (§3) |

## Idea inbox

Drop raw ideas here before sorting them into a section above.

- Newsletter / changelog page summarizing shipped work each month for clients
- Explore GitHub Pages for docs so runbooks/standards render as a browsable site
- A shared VS Code extension recommendations file (`.vscode/extensions.json`) in templates
- Reusable "notify on deploy" workflow (email/Slack/Discord) once a channel exists
- Investigate GitHub Environments with required reviewers for production deploys
- Cost dashboard: Actions minutes, Netlify bandwidth, domain renewals in one view
- Template for a per-client private "handbook" repo (structure only, no content, lives private)
- Annual dependency-major-version upgrade sprint (beyond Dependabot's incremental bumps)
