# Deploying a Static Site to Netlify

Most client websites are deployed as static sites via Netlify.

## One-time setup

1. Create a Netlify site linked to the GitHub repo (via the Netlify
   dashboard or CLI).
2. Grab the Netlify **Site ID** and a **Personal Access Token**.
3. Add them as repo secrets on the project repo:
   - `NETLIFY_AUTH_TOKEN`
   - `NETLIFY_SITE_ID`

## CI-based deploys

Copy [`templates/workflows/deploy-netlify.yml`](../../templates/workflows/deploy-netlify.yml)
into the project's `.github/workflows/`. It calls the
[reusable Netlify deploy workflow](../../.github/workflows/reusable-netlify-deploy.yml)
in this repo.

Adjust the inputs to match the project:

- Plain HTML/CSS site: `publish-dir: .`, no build command.
- Built site (e.g. Vite/React): `publish-dir: dist`, `build-command: npm run build`.

Also copy [`templates/netlify.toml`](../../templates/netlify.toml) into the
project root and adjust `publish`/`command` as needed.

## Manual deploys

```bash
npx netlify-cli deploy --prod --dir <publish-dir>
```
