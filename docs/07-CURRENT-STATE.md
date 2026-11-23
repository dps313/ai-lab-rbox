# AI Lab Tycoon — Current Implementation State

**Status:** Provisional, based on Codex reports and user playtesting. Requires audit in the actual Windows Git repository.

## Development environment reported

- Windows; project directory: `D:\Roblox\AI-Lab-Tycoon`
- Codex CLI, Roblox Studio, local Rojo executable `.tools\rojo.exe`
- Default Rojo port 34872; an already-running instance may occupy the port
- Local Git repository likely initialized; current GitHub remote, branch, and issue state **not inspected here**

## M1 — Reported working

- $100 starting cash and assigned garage.
- Physical shared store, CPUs/GPUs/RAM, unlimited new stock, limited used server-shared stock.
- Server-validated purchases, UI for cash/owned/installed hardware.
- Install required parts and power on PC.
- Full starter set reportedly costs $95.

## Reported checks from Codex

- Rojo build passed.
- In two-client Roblox Studio test, both clients purchased unlimited new GPU.
- Second client was blocked from sold-out used CPU.
- Used CPU restocked after 90 seconds.
- Both PCs powered on.

This is **reported evidence**, not tests re-run during documentation preparation.

## M1.1 — User-reported improvement

- Initial floor clipping and awkward contiguous layout noticed.
- Planned change to teleport between personal garage and shared store in same Roblox place.
- User reported M1.1 'looks better' and initial game working.
- Exact diff, test coverage, geometry quality, and current source state **not verified**.

## Scope restrictions

Current prototype is a technical base, **not validation that the proposed product loop is fun**. Do not assume AI model training/publishing, model income, lineages, employee mechanics, contracts or data centers are implemented. Some unplanned work may exist in the repo from other sessions and must be audited against product vision.

## Next actions

1. Audit Git status, modules, gameplay and GitHub issues without destructive changes.
2. Reconcile this factual state doc with what actually exists.
3. Review product docs one issue at a time.
4. Only then define implementation-ready tasks.
