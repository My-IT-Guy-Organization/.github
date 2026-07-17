# Incident Response — Site Down

Use this when a production site (client or business) is unreachable, erroring,
or badly degraded.

## 1. Confirm & scope

- Reproduce: load the site in a fresh browser / incognito and from a phone on
  cellular (rules out your local network/DNS cache).
- Check the host status: [Netlify status](https://www.netlifystatus.com/).
- Note the start time and what changed recently (last deploy, DNS edit, domain
  renewal, dependency update).

## 2. Triage by symptom

| Symptom | Likely cause | First check |
|---|---|---|
| DNS / "server not found" | DNS or domain expiry | Registrar + DNS records; domain renewal date |
| TLS / certificate error | Cert not provisioned/renewed | Host TLS settings; re-provision cert |
| 404 on all pages | Wrong publish dir / bad deploy | Last deploy's `publish-dir`, build log |
| 500 / function error | App or serverless function | Function logs; recent code change |
| Slow / partial | Upstream API or asset host | Third-party status; network tab |

## 3. Mitigate

- **Bad deploy?** Roll back to the last good deploy in the host dashboard
  (Netlify: Deploys → previous → "Publish deploy"). This is the fastest fix.
- **DNS/domain?** Restore the correct record or renew; DNS changes take time to
  propagate — communicate an ETA.
- **Dependency/build break?** Revert the offending commit, redeploy, then fix
  forward on a branch.

## 4. Communicate

- Tell the affected client/stakeholder: what's wrong, that it's being worked on,
  and a rough ETA. Update the status page if one exists.

## 5. After: write it up

- Add a short entry to the decision/incident log (`docs/decisions/`): timeline,
  root cause, fix, and one preventive action.
- If it was preventable by a check, add that check to CI or monitoring.
