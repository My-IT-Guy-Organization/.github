# Git Workflow

## Branching

- `main` is always deployable.
- Work happens on short-lived branches: `feature/<short-description>`,
  `fix/<short-description>`.
- Open a PR into `main` even when working solo — it gives CI a chance to run
  and leaves a record of changes.

## Commits

- Use clear, present-tense messages: "Add Netlify deploy workflow", not
  "added stuff".
- Keep commits focused; avoid bundling unrelated changes.

## Releases

- Tag stable releases on `main` using semantic versioning (`vX.Y.Z`) where it
  matters (libraries, services, scripts with consumers).
- Static client sites generally don't need version tags — deploys track `main`.
