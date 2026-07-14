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

---

## Cadence

| When | What |
|---|---|
| Weekly | Merge dependency PRs, glance at uptime/CI failures |
| Monthly | Maintenance checklist (§6), review open items in §1–§2 |
| Quarterly | DevOps day (§9): full plan review, plus the private-side reviews (§3) |

## Idea inbox

Drop raw ideas here before sorting them into a section above.

- (empty)
