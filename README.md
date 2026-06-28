# My IT Guy DevOps Hub

Central DevOps hub for **My IT Guy LLC** — shared CI/CD workflows, project
templates, documentation, and a dashboard of every repo across the business.

## What's in here

| Path | Purpose |
|---|---|
| [`PROJECTS.md`](PROJECTS.md) | Dashboard of all business/client repos: stack, visibility, status |
| [`.github/workflows/`](.github/workflows) | Reusable GitHub Actions workflows (CI, deploy, security) shared across repos |
| [`templates/`](templates) | Starter files (CI workflows, `.gitignore`, `dependabot.yml`, `netlify.toml`, `.editorconfig`) to copy into new repos |
| [`docs/`](docs) | Runbooks and standards: new project setup, deployment, git workflow, coding standards |
| [`scripts/`](scripts) | Helper scripts — e.g. [`new-project.sh`](scripts/new-project.sh) to bootstrap a new repo |

## Using the reusable workflows

Other repos in the org can call the workflows defined here directly:

```yaml
jobs:
  ci:
    uses: My-IT-Guy-Organization/My-IT-Guy-DevOps/.github/workflows/reusable-node-ci.yml@main
```

> If the calling repo is private, confirm under **Settings → Actions → General → Access**
> on this repo that it allows access from other private repositories in the organization.

Available reusable workflows:

- [`reusable-node-ci.yml`](.github/workflows/reusable-node-ci.yml) — `npm ci`, lint, test, build
- [`reusable-python-ci.yml`](.github/workflows/reusable-python-ci.yml) — pip install, `ruff` lint, `pytest`
- [`reusable-netlify-deploy.yml`](.github/workflows/reusable-netlify-deploy.yml) — deploy a static site to Netlify
- [`reusable-codeql.yml`](.github/workflows/reusable-codeql.yml) — CodeQL security scanning

## Starting a new project

```bash
./scripts/new-project.sh <node|python|static> /path/to/new-repo
```

This drops in a starter CI workflow plus `.editorconfig`, `.gitignore`,
`dependabot.yml`, and issue/PR templates. Then follow
[docs/runbooks/new-project-setup.md](docs/runbooks/new-project-setup.md) and
add the new repo to [PROJECTS.md](PROJECTS.md).

## Standards

- [Git workflow](docs/standards/git-workflow.md)
- [Coding standards](docs/standards/coding-standards.md)

## Runbooks

- [New project setup](docs/runbooks/new-project-setup.md)
- [Deploying to Netlify](docs/runbooks/deploy-netlify.md)
