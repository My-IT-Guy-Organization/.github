# Coding Standards

General conventions across My IT Guy LLC projects. Project-specific docs can
extend or override these.

## All projects

- Copy [`templates/.editorconfig`](../../templates/.editorconfig) for
  consistent whitespace/indentation.
- CI must pass before merging to `main`.
- Secrets and credentials are never committed — use repo/organization
  secrets and gitignored `.env` files.

## JavaScript / TypeScript

- Define `lint`, `test`, and `build` npm scripts so the
  [reusable Node CI workflow](../../.github/workflows/reusable-node-ci.yml)
  can run them (each step is skipped with `--if-present` if undefined).
- Commit `package-lock.json` so `npm ci` works in CI.

## Python

- Lint with [`ruff`](https://docs.astral.sh/ruff/).
- Tests live under `tests/` and run with `pytest`.

## Static sites

- Keep `index.html` at the repo root, or set `publish-dir` accordingly for
  Netlify deploys.
