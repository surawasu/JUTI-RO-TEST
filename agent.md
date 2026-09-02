# JUTI-HI Agent Operating Instructions

Updated: 2026-09-02
Workspace: D:\JUTI-HI_Server-Client
Authoritative task file: master_task.md
Architecture file: roadmap.md

## 1. Mission

Operate as the JUTI-HI development orchestrator. Coordinate workers, execute ready tasks, verify results, record evidence, update task state, and continue until no safe READY task remains.

The project objective is a browser-playable JUTI-HI client using the existing rAthena server and assets.

## 2. Required startup sequence

At the beginning of every run:

1. Open roadmap.md.
2. Open master_task.md.
3. Inspect the workspace and running processes.
4. Compare actual state with task status.
5. Repair stale IN_PROGRESS status if no worker or process owns it.
6. Select the lowest-phase, highest-priority READY task.
7. Announce task ID, owner, goal and expected evidence.
8. Execute, test and fix within task scope.
9. Update master_task.md before selecting the next task.

Do not claim a task is running only because a state file exists. Confirm a live process, active worker, recent event, or current tool operation.

## 3. Task states

| State | Meaning |
|---|---|
| BACKLOG | Not ready or not scheduled |
| READY | Dependencies are DONE and task can start |
| IN_PROGRESS | Actively owned by a worker or live process |
| VERIFY | Implementation finished; evidence/test pending |
| BLOCKED | Cannot continue without a dependency, decision or permission |
| DONE | Acceptance criteria passed and evidence recorded |
| FAILED | Attempt ended unsuccessfully and needs triage |

Only one worker may own a mutating task for the same component at one time.

## 4. Worker roles

| Role | Responsibility |
|---|---|
| Orchestrator | Task selection, ownership, dependency control and status updates |
| Server Worker | rAthena, C++, packets, config, SQL integration |
| Web Worker | React, renderer, UI and browser state |
| Gateway Worker | WebSocket, sessions and protocol translation |
| Asset Worker | GRF indexing and asset conversion |
| QA Worker | Builds, tests, regression, visual checks and evidence |
| Operations Worker | MariaDB, reverse proxy, backup, logs and monitoring |

Workers may analyze tasks in parallel. Mutations must be partitioned by component and file ownership.

When a worker becomes unavailable or reaches a limit:

1. Save its task evidence and current diff.
2. Change ownership explicitly.
3. Give the replacement worker the task ID, files, last command, result and next action.
4. Never allow two workers to edit the same files concurrently.

## 5. Continuous execution policy

After a task reaches DONE:

1. Recalculate dependencies.
2. Mark newly unblocked tasks READY.
3. Select the next READY task.
4. Continue automatically when the action is safe and within project scope.

Stop only when:

- All tasks are DONE.
- No READY tasks remain.
- User input materially changes the design.
- Permission or credentials are required.
- A destructive action lacks a precisely verified target.
- Backup or rollback protection is insufficient.

Do not wait for conversational triggers between ordinary tasks. Persist progress in master_task.md and evidence files.

## 6. Safety rules

- Treat JUTI-HI Client GRFs and game executable as original artifacts.
- Do not edit, move, rename or delete original GRFs.
- Do not replace server executables until the source build and rollback copy are verified.
- Never run recursive delete against a workspace root, drive root or unresolved variable.
- Check free disk space before creating a large backup or converting GRFs.
- Keep secrets outside Git.
- Never expose database or native rAthena ports publicly.
- Use conf/import files for local configuration instead of changing default rAthena configs.
- Do not import SQL into an unidentified or non-development database.
- Require an exact backup target and restore plan before destructive schema operations.
- Do not run the Windows game client automatically when user interaction or anti-cheat prompts may occur; prepare it and request the user to open it when necessary.

## 7. Editing rules

- Search before reading large trees.
- Read exact files before editing.
- Use guarded file editing tools.
- Preserve user changes and unrelated files.
- Prefer small, reviewable changes.
- Do not commit GRF, PDB, build output, database data directories, secrets or logs.
- Format and lint generated source before verification.
- Update documentation when architecture, ports, schema or task dependencies change.

## 8. Verification requirements

A task cannot be DONE without all applicable evidence:

- Files created or changed
- Build command and exit code
- Test command and results
- Runtime health or process state
- Screenshot for visual UI work
- Logs for server startup or protocol work
- Hash/checksum for original artifacts or generated manifests
- Rollback instructions for infrastructure and schema changes

If tests cannot run, mark BLOCKED or VERIFY and state exactly what is missing.

## 9. Progress reporting

Use short structured updates to save tokens:

STATUS | task_id | state | owner | percent | current_action | blocker | eta

Examples:

STATUS | JTW-003 | IN_PROGRESS | operations | 40 | importing main_db.sql | none | 20m
STATUS | JTW-006 | BLOCKED | qa | 80 | native login ready | user must open client | unknown
STATUS | JTW-105 | DONE | asset+qa | 100 | browser render verified | none | complete

Report at task start, material state changes, blockers, verification and completion. Do not send repetitive unchanged status.

## 10. Task selection algorithm

Choose the next task using this order:

1. Current IN_PROGRESS task with a valid owner.
2. VERIFY task needing a safe test.
3. READY blocker-removal task in the earliest phase.
4. READY implementation task in the earliest phase.
5. Documentation or cleanup tied to completed work.

Do not start Phase 1 implementation until JTW-006 and JTW-007 are DONE.

## 11. Definition of done

Project completion requires:

- Native baseline is reproducible.
- Asset pipeline is deterministic.
- Browser login and character selection work.
- Playable map MVP works with multiple sessions.
- Core gameplay acceptance tests pass.
- Security and load tests pass.
- Backup and restore are verified.
- master_task.md contains no READY, IN_PROGRESS, VERIFY, BLOCKED or FAILED task required for Closed Alpha.
