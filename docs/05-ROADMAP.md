# AI Lab Tycoon — Roadmap and Work Policy

**Status:** Draft 0.1 — existing GitHub issues need audit, not wholesale replacement.

This is the canonical product roadmap and work policy. The [historical roadmap proposal](../ROADMAP.md) preserves earlier prototype planning and issue context.

## Goal state

An accessible multiplayer Roblox tycoon in which players discover/collect hardware, build PCs, develop and publish AI products, understand meaningful strategic consequences, reinvest, customize and eventually move from solo manual work toward staffing, infrastructure and diversified business.

## Work states

| State | Meaning | Code authorized? |
|---|---|---|
| Goal State | Intended experience or long-range capability | No |
| Ideas | Speculative opportunities | No |
| Design Exploration | Questions, alternatives, mockups, research | No |
| Design Ready | Player behavior specified for product review | No |
| Implementation Ready | Approved scope, acceptance criteria, dependencies and verification | Yes, when assigned |
| In Progress | Authorized bounded work underway | Only assigned scope |
| Done | Verified against criteria; limitations recorded | N/A |

## Current work: Documentation baseline

**Goal:** One durable, shared product record before new mechanics are implemented.

- [ ] Review and approve `01-VISION.md`.
- [ ] Review and approve early phases of `02-PLAYER-JOURNEY.md`.
- [ ] Refine `03-GAME-SYSTEMS.md` and resolve contradictions.
- [ ] Work through P0 questions in `04-DESIGN-QUESTIONS.md`, one at a time.
- [ ] Reconcile GitHub issues and current code with approved decisions.
- [x] Update existing `AGENTS.md` to require reading canonical docs.

## Current prototype (reported)

- M1: Starter garage, $100, shared new/used hardware store, server-validated purchase, inventory, CPU/GPU/RAM install and PC power-on.
- M1.1: Garage/store travel and floor/layout improvements reportedly playable.
- Repo/code verification still needed. Preserve current prototype and history.

## Next design milestones (not coding tasks)

- **D1 — First model creation experience:** Select project, decisions, training investment, reveal, feedback, publish, then voluntary second cycle.
- **D2 — Early model economy:** Training times, hardware value, earnings, lineage, diminishing returns.
- **D3 — Collection and progression:** Store rarity, restock, display/visual upgrades, short/long-term goals.
- **D4 — First delegation transition:** Work that becomes automatable and new choices it unlocks.

## Deferred idea backlog

Hardware auctions/resale; datasets and labeling; researchers/technicians; offices and server racks; shipments and data centers; compute rental; contracts and demand; PR/press conferences; market events; offline rewards; optional advanced model engineering.

## Implementation issue admission criteria

Every coding issue must have: linked approved design decision, player-facing behavior, explicit in/out scope, dependencies, acceptance criteria, and feasible test evidence. Avoid converting high-level brainstorming directly to `ready`.

## GitHub issue reset policy

Audit each current issue into `aligned`, `premature`, `requires redesign`, or `obsolete`. Do **not** delete GitHub issues or rewrite Git history. Close/supersede only with a rationale and after review.

## Done definition

Tests passing alone are insufficient. Work must meet the *intended player experience*, preserve existing mechanics, be checked for unnecessary complexity, and include a concise verification record.
