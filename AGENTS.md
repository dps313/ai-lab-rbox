# AI Lab Tycoon — Codex Instructions

Read `PROJECT_CONSTITUTION.md` before making changes.

Read the relevant sections of `GAME_DESIGN.md` and `ROADMAP.md` when implementing gameplay features.

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
