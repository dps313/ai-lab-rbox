---
name: issue
description: Start or resume a single AI Lab Tycoon GitHub issue in its own worktree. Use when invoked with an issue number, #number, or dps313/ai-lab-rbox issue URL.
---

# Start an issue

1. Take the issue number from the invocation. Accept a positive decimal integer, a #number, or an issue URL in dps313/ai-lab-rbox. Ask for the number if it is missing or ambiguous.
2. Read the current issue with `gh issue view N --repo dps313/ai-lab-rbox --comments`. Use the issue as project context. Check its status and dependencies. If it is closed, blocked, or a milestone tracker, report that and stop before implementation. For trackers, show the ready sub-issues.
3. Use branch `issue-N`. Inspect `git worktree list --porcelain` from the primary checkout. Reuse the issue branch's existing worktree if it is assigned to this session. If it exists elsewhere, check whether another session is using it before writing. If there is no issue worktree, create a sibling directory named `AI-Lab-Tycoon-issue-N` with `git worktree add -b issue-N <absolute-path> main` from the primary checkout. If the issue branch already exists, attach it without `-b`. Preserve any existing local changes.
4. Verify the worktree path and branch, then read its AGENTS.md and PROJECT_CONSTITUTION.md. Use that worktree as the working directory for subsequent commands and target its files for all edits. Keep one issue per session.
5. State the issue, worktree path, and intended checks. Proceed within the issue's scope. For QA-only issues, run the checklist and report pass, fail, or blocked with reproduction details. Use the primary checkout's ignored Rojo binary if the worktree has no Rojo executable. Publishing changes, posting comments, and closing issues require separate authorization.
