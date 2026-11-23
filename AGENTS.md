# AI Lab Tycoon — Codex Instructions

Read `PROJECT_CONSTITUTION.md` before making changes.

## Product documentation

The repository is the canonical product record. Before proposing or implementing gameplay, read the relevant sections of the product baseline:

- [Vision](docs/01-VISION.md) and [player journey](docs/02-PLAYER-JOURNEY.md) for the intended experience.
- [Game systems](docs/03-GAME-SYSTEMS.md) and [decision log](docs/06-DECISIONS.md) for agreed directions, preferences, and deferred ideas.
- [Design questions](docs/04-DESIGN-QUESTIONS.md) for unresolved decisions and [current state](docs/07-CURRENT-STATE.md) for reported prototype behavior.
- [Canonical roadmap and work policy](docs/05-ROADMAP.md) for current priorities and implementation approval.

Record product decisions in the decision log. Product exploration, prototype behavior, and existing issues do not authorize coding. Assign or delegate only explicitly approved, implementation-ready work with clear acceptance criteria. Keep significant code changes isolated and reviewable, and report the checks actually run.

## Engineering rules

- Keep code concise, readable, and maintainable.
- Prefer simple solutions over complex abstractions.
- Follow existing code patterns unless there is a concrete reason to change them.
- Use typed Luau where useful.
- Keep gameplay state and economic calculations server-authoritative.
- Use centralized configuration for items, rarity, pricing, and progression.
- Keep UI and presentation separate from authoritative game logic.
- Do not implement speculative future systems.
- Do not introduce new dependencies or frameworks without justification.
- Avoid unrelated refactoring.
- Do not overwrite working features unnecessarily.

## Scope

Implement only the requested milestone.

If requirements are ambiguous, make a reasonable minimal assumption, document it, and continue unless the decision is fundamental to the product.

For substantial architectural changes, explain the proposed approach before implementing.

## Session isolation

- Give each issue session its own Git worktree and branch, including QA sessions. Use an issue-based branch name such as `issue-2-travel-qa`.
- Keep the primary checkout on `main` for coordination and integration. Start issue branches from the current baseline and verify the worktree path and branch before editing.
- Reuse the assigned worktree when resuming. Only one live session may write to a worktree. Worktrees share Git history and refs, so leave other sessions' branches and worktrees alone.
- Run Rojo and Studio checks against the assigned worktree. Use a separate Rojo port and Studio place per simultaneous playtest, or coordinate use of the same Studio instance. Write generated builds inside the assigned worktree.
- Keep changes and verification scoped to the assigned issue. Link the issue in the pull request when code changes are needed. For QA-only work, record the results on the issue.
- After the issue is done, remove the worktree only after preserving any needed changes and confirming it is clean and no session is using it.

## Verification

After making changes:

1. Run the available Rojo build.
2. Run relevant automated checks where available.
3. Verify multiplayer-sensitive operations when possible.
4. Report exactly what passed and what could not be tested.
5. Summarize changed files and any remaining issues.

Never claim successful verification without executing the checks.

## Completion criteria

A task is complete when the requested behavior works, existing behavior is preserved, and available verification passes.

Do not automatically begin the next milestone.

**Default principle: Choose the smallest clear implementation that works.**
