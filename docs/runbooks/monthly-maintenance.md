# Monthly Maintenance Checklist

Run once a month across active repos and sites. Copy this list into a tracking
issue and check items off.

## Dependencies & CI

- [ ] Review and merge open Dependabot PRs (start with security updates)
- [ ] Check for any repos with failing CI on `main` and fix or triage
- [ ] Skim Actions usage — any workflow burning unexpected minutes?

## Sites & uptime

- [ ] Review uptime for the month; note any incidents
- [ ] Verify each production site loads and its TLS cert is valid
- [ ] Confirm upcoming **domain renewals** (next 60 days) are handled

## Backups & data

- [ ] Verify backups exist and a restore has been spot-checked recently
- [ ] Confirm any databases are backed up and within retention

## Repos & docs

- [ ] Update `PROJECTS.md` for any new/archived public repos
- [ ] Prune stale branches and closed-but-unmerged PRs
- [ ] Skim runbooks/standards for anything now out of date

## Housekeeping

- [ ] Review open items in `PLAN.md` §1–§2 and pull the next one forward
- [ ] Add anything learned this month to the idea inbox or a decision record
