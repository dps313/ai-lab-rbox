# AI Lab Tycoon — Initial Product Documentation Bundle

This bundle captures the product discussion as **drafts**, not approved coding tasks. It deliberately does not overwrite the existing repository's `AGENTS.md` or code.

## Install into existing Windows repository

1. Extract this zip.
2. Copy its `docs` directory into `D:\Roblox\AI-Lab-Tycoon\docs` (review existing files first; do not overwrite unrelated work without diffing).
3. From a terminal in the repository, review `git status` and `git diff -- docs`.
4. Commit documentation only to a dedicated branch, then push to your existing remote, preferably for review in a PR.

```cmd
cd /d D:\Roblox\AI-Lab-Tycoon
git switch -c docs/initial-product-baseline
git add docs
git commit -m "docs: capture initial AI Lab Tycoon product vision"
git push -u origin docs/initial-product-baseline
```

If the branch already exists, use another branch name. If `origin` is not configured, inspect `git remote -v` before attempting to push.

## Important

Do not implement gameplay from these drafts alone. The next step is to review one open design question at a time, starting with the first model-development experience.
