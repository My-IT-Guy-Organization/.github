# New Project Setup

Checklist for starting a new repo for My IT Guy LLC (client site, internal
tool, or automation script).

## 1. Create the repository

- Create the repo under the appropriate account/org.
- Add a clear description and topics.
- Set visibility (private by default for client work).

## 2. Bootstrap standard files

From a local clone of this DevOps repo, run:

```bash
./scripts/new-project.sh <node|python|static> /path/to/new-repo
```

This copies in:

- A starter CI workflow that calls the reusable workflows in this repo
- `.editorconfig`
- `.gitignore`
- `dependabot.yml`
- Issue and PR templates

## 3. Wire up CI

- Confirm the new repo's workflow references
  `My-IT-Guy-Organization/My-IT-Guy-DevOps/.github/workflows/reusable-*.yml@main`.
- If the new repo is private, make sure this DevOps repo's
  **Settings → Actions → General → Access** allows access from private
  repositories in the organization.

## 4. Add to the project dashboard

Add a row to [`PROJECTS.md`](../../PROJECTS.md) with the repo link, stack,
visibility, and status.

## 5. Set up deployment (if applicable)

- Static sites: see [Deploying to Netlify](./deploy-netlify.md).
- Other services: document the deploy process in that repo's own `docs/`.
