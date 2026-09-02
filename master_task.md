# JUTI-HI Master Task Board

Updated: 2026-09-02
Workspace: D:\JUTI-HI_Server-Client
Current milestone: M0 Native Baseline
Implementation status: Phase 0 — 2/8 tasks complete
Planning and analysis status: 100%
Next task: JTW-003 (BLOCKED — Administrator access required)

## Agent roster

| Agent | Role | State | Current task |
|---|---|---|---|
| lnwjud | Main Agent / Orchestrator | ACTIVE | Durable goal: juti-webapp-project |
| JTW1 | Primary implementation worker | BLOCKED | JTW-003 requires Administrator access for MSI/service |
| JTW2 | ChatGPT writing and QA worker | DONE | JTW-003 install/security gates and validation checklist completed |

## Status legend

- [x] DONE
- [ ] READY
- [ ] BACKLOG
- [!] BLOCKED
- [?] VERIFY
- [~] IN_PROGRESS

master_task.md is the authoritative status source. Every DONE task must include evidence.

## Current verified facts

- Workspace is registered and accessible.
- Client and server inventory completed read-only.
- Server is rAthena with full C++ source.
- Client is Windows x86 using DirectX 9.
- Client points to 127.0.0.1:6900.
- Five GRFs total approximately 6.2 GB compressed.
- At least 384,529 entries were indexed outside deep data.grf inventory.
- Server is Pre-Renewal.
- PACKETVER candidates are 20220405 and 20220530.
- MySQL/MariaDB service is not installed.
- Git, Node/npm, .NET, CMake and Python 3.12 are available.
- MSBuild is not available from PATH.
- Project is a Git repository on branch `main`; verified baseline commit is `1c6fe012b32d6771091f8d86c7253bfa72e7b4b0`.

## Phase summary

| Phase | State | Exit milestone |
|---|---|---|
| Analysis and planning | DONE | Documents and initial inventory complete |
| Phase 0 Preserve and baseline | IN_PROGRESS | M0 Native Baseline |
| Phase 1 Asset PoC | BACKLOG | M1 Asset PoC |
| Phase 2 Web session | BACKLOG | M2 Web Session |
| Phase 3 Playable map | BACKLOG | M3 Playable Map |
| Phase 4 Core gameplay | BACKLOG | M4 Core Loop |
| Phase 5 Hardening | BACKLOG | M5 Closed Alpha |

## A. Analysis and planning

- [x] JTW-A001 — Discover and inspect D:\JUTI-HI_Server-Client
  - Evidence: workspace contains JUTI-HI Client and JUTI-HI Server.
- [x] JTW-A002 — Identify server architecture
  - Evidence: rAthena solution, C++ source, SQL schema and four server executables found.
- [x] JTW-A003 — Inventory client runtime and core assets
  - Evidence: x86 executable, DirectX 9 dependencies, five GRFs and asset type counts recorded.
- [x] JTW-A004 — Inspect existing rAthena web server
  - Evidence: config, auth and registered HTTP endpoints reviewed.
- [x] JTW-A005 — Create roadmap.md, agent.md and master_task.md
  - Evidence: files created at project root on 2026-09-02.

## Phase 0 — Preserve and baseline

### JTW-001 — Create recoverable original backup

State: DONE
Owner: JTW1 (primary), JTW2 (QA)
Depends on: JTW-A005

Tasks:

- [x] Check source size and free disk space.
- [x] Create a dated checksum manifest.
- [x] Select a backup target outside any recursively copied source folder.
- [x] Back up Client, Server source, configs, SQL and custom content.
- [x] Verify a sample restore and hashes.
- [x] Record backup path without exposing secrets.

Acceptance:

- Backup is recoverable.
- Original GRFs and executables match recorded SHA-256.
- Restore instructions are recorded.

Evidence:

- Backup: `C:\JUTI-HI_Backups\20260902-1129Z_JTW-001`.
- Source/destination: 3,570 files and 6,993,900,956 bytes each.
- Full SHA-256 verification: 0 missing, 0 extra, 0 mismatches.
- Restore sample: 5/5 files restored and hash-verified.
- Evidence files: `manifests\summary.json`, `source_sha256.csv`, `destination_sha256.csv`, `restore_test.csv`, `robocopy.log`, and `RESTORE_INSTRUCTIONS.txt`.

### JTW-002 — Initialize source control

State: DONE
Owner: JTW1 (primary), JTW2 (QA)
Depends on: JTW-001

Tasks:

- [x] Initialize Git at the agreed development root.
- [x] Add ignore rules for GRF, PDB, executables, DB data, logs, secrets and generated assets.
- [x] Commit server source/config, documentation and future web source.
- [x] Record baseline commit.

Acceptance:

- Git status is clean.
- No large binary, credential or database file is tracked.

Evidence:

- Baseline commit: `1c6fe012b32d6771091f8d86c7253bfa72e7b4b0` (`chore: establish JUTI-HI source baseline`).
- Initial tree: 2,633 tracked files; no tracked file exceeds 10 MiB.
- Forbidden tracked files: 0 (Client, GRF, EXE, DLL, PDB, connection configs, histories and generated map cache excluded).
- Required custom content: `src/custom` 8 files; `db/import` 66 files; approved vendor libraries 6 files.
- Safe `conf/import` allowlist: exactly 6 files; credential-key scan returned 0 hits.
- Post-commit checks: clean status; `git fsck --full` exit 0; JTW2 QA GO.

### JTW-003 — Install development database

State: BLOCKED
Owner: JTW1 (primary), JTW2 (QA)
Depends on: JTW-001

Tasks:

- [x] Select MariaDB version after schema compatibility check.
- [ ] Install local service.
- [ ] Create least-privilege development user and databases.
- [x] Keep credentials outside Git.
- [ ] Verify service restart.

Acceptance:

- MariaDB is healthy after restart.
- Development user can access only required databases.

Evidence:

- Selected MariaDB 11.4.13 LTS x64 after reviewing the MySQL 8.0.30 dump and legacy `tis620`, `utf8mb3`, `latin1`, InnoDB and MyISAM requirements.
- Installer: `C:\JUTI-HI_Installers\mariadb-11.4.13-winx64.msi`.
- Official SHA-256 verified: `5AF228931E6E13C599060D9EAF78F71A9FA62879A3D3FA9327CB458B756A6C04`.
- Authenticode: Valid; signer `MariaDB USA, Inc.`.
- Preflight: no existing MySQL/MariaDB service and TCP 3306 is free.
- Random credentials are stored under ACL-restricted `C:\JUTI-HI_Secrets`; no credential was added to Git.
- Docker fallback was hardened to bind `127.0.0.1` and require `.env` secrets.

Blocker:

- The local runner returned `PERMISSION_DENIED: Administrator access is not available`; MSI installation and Windows service creation cannot continue until an Administrator-capable session is provided.

### JTW-004 — Import and configure rAthena databases

State: BACKLOG
Depends on: JTW-003

Tasks:

- [ ] Import sql-files/main_db.sql.
- [ ] Import sql-files/logs.sql.
- [ ] Validate custom tables.
- [ ] Configure conf/import files.
- [ ] Confirm encoding and collation.
- [ ] Create rollback dump.

Acceptance:

- Required tables exist.
- rAthena processes can connect without SQL errors.
- Import is reproducible.

### JTW-005 — Boot native server stack

State: BACKLOG
Depends on: JTW-004

Tasks:

- [ ] Start login-server.
- [ ] Start char-server.
- [ ] Start map-server.
- [ ] Start web-server only on a private/local interface.
- [ ] Capture startup logs and ports.
- [ ] Fix critical startup errors.

Acceptance:

- All required processes remain healthy.
- No critical SQL, map cache or inter-server connection error remains.

### JTW-006 — Verify native client vertical slice

State: BACKLOG
Depends on: JTW-005

Tasks:

- [ ] Prepare a development account.
- [ ] Ask user to open the client when interactive action is required.
- [ ] Login.
- [ ] Create or select character.
- [ ] Enter one map.
- [ ] Record server logs and result.

Acceptance:

- Native client reaches an in-game map on the prepared server/database.

### JTW-007 — Confirm packet version

State: BACKLOG
Depends on: JTW-006

Tasks:

- [ ] Compare successful packets against 20220405 and 20220530 definitions.
- [ ] Inspect build flags and executable behavior.
- [ ] Record exact PACKETVER and any packet obfuscation keys.
- [ ] Make build configuration explicit.
- [ ] Rebuild and re-test if required.

Acceptance:

- One PACKETVER is authoritative and reproducible.
- Native login regression still passes.

### JTW-008 — Create development component skeleton

State: BACKLOG
Depends on: JTW-002, JTW-007

Tasks:

- [ ] Create web-app.
- [ ] Create game-gateway.
- [ ] Create asset-pipeline.
- [ ] Create web-api.
- [ ] Create infra, tests and docs structure.
- [ ] Add environment templates without secrets.

Acceptance:

- Components build or run placeholder health checks.
- Workspace commands are documented.

## Phase 1 — Asset proof of concept

### JTW-101 — Build GRF priority-aware indexer

State: BACKLOG
Depends on: JTW-008

Acceptance:

- Index honors DATA.INI priority.
- Every record includes source GRF, path, size and checksum.
- Originals remain unchanged.

### JTW-102 — Convert player and monster animation

State: BACKLOG
Depends on: JTW-101

Acceptance:

- One player and one monster render idle/walk frames from SPR/ACT/PAL.
- Output is deterministic.

### JTW-103 — Convert one test map

State: BACKLOG
Depends on: JTW-101

Acceptance:

- One map converts from GAT/GND/RSW.
- Walkability and visible map layout align.

### JTW-104 — Build asset manifest and delivery

State: BACKLOG
Depends on: JTW-102, JTW-103

Acceptance:

- Browser requests only versioned outputs.
- Changed assets update manifest hashes.

### JTW-105 — Verify browser asset scene

State: BACKLOG
Depends on: JTW-104

Acceptance:

- Browser displays map, player and monster.
- Screenshot and performance measurements are recorded.

## Phase 2 — Web login and character selection

### JTW-201 — Define public session and threat model

State: BACKLOG
Depends on: JTW-007, JTW-008

Acceptance:

- Session lifetime, refresh, logout and abuse controls are documented.
- Native ports and DB remain private.

### JTW-202 — Implement login API

State: BACKLOG
Depends on: JTW-201

Acceptance:

- Valid login creates a short-lived session.
- Invalid attempts are rate-limited and safely logged.

### JTW-203 — Implement character API and UI

State: BACKLOG
Depends on: JTW-202

Acceptance:

- Character list, create and select pass integration tests.

### JTW-204 — Implement WebSocket gateway contract

State: BACKLOG
Depends on: JTW-201

Acceptance:

- Versioned binary messages have encode/decode tests.
- Invalid messages cannot mutate game state.

### JTW-205 — Connect selected character to rAthena state

State: BACKLOG
Depends on: JTW-203, JTW-204

Acceptance:

- Browser session reaches authenticated map-session initialization.

## Phase 3 — Playable map MVP

### JTW-301 — Map snapshot and entity lifecycle
State: BACKLOG
Depends on: JTW-105, JTW-205

### JTW-302 — Movement, pathfinding and reconciliation
State: BACKLOG
Depends on: JTW-301

### JTW-303 — Player animation and direction
State: BACKLOG
Depends on: JTW-301

### JTW-304 — Public and private chat
State: BACKLOG
Depends on: JTW-301

### JTW-305 — NPC dialog
State: BACKLOG
Depends on: JTW-302

### JTW-306 — Reconnect and resume
State: BACKLOG
Depends on: JTW-301, JTW-302

M3 acceptance:

- Two browser sessions enter one map.
- Players see movement consistently.
- Chat and one NPC interaction work.
- Disconnect and reconnect do not corrupt character state.

## Phase 4 — Core gameplay

- [ ] JTW-401 — Inventory, equipment and storage
- [ ] JTW-402 — Item pickup, drop and use
- [ ] JTW-403 — Skill bar, targeting and cooldown
- [ ] JTW-404 — Combat, damage and status effects
- [ ] JTW-405 — Shop, trade and vending
- [ ] JTW-406 — Party, guild, friend and mail
- [ ] JTW-407 — Quest and custom JUTI systems

Phase state: BACKLOG
Depends on: M3 Playable Map

M4 acceptance:

- Core gameplay regression suite passes.
- No browser command bypasses server authority.
- Important custom JUTI systems have an explicit compatibility result.

## Phase 5 — Production hardening

- [ ] JTW-501 — Security review and server-authoritative abuse tests
- [ ] JTW-502 — HTTPS/WSS, secret management and private network rules
- [ ] JTW-503 — CDN, cache and patch manifest
- [ ] JTW-504 — Load and soak testing
- [ ] JTW-505 — Backup, restore and rollback drill
- [ ] JTW-506 — Browser/device compatibility and performance budget

Phase state: BACKLOG
Depends on: M4 Core Loop

M5 acceptance:

- Closed Alpha deployment is monitored.
- Backups and rollback are tested.
- Security and load blockers are closed.
- Required tasks contain evidence and no critical FAILED/BLOCKED item remains.

## Active task

Task: JTW-003
State: BLOCKED
Owner: JTW1 (primary), JTW2 (QA)
Next action: resume from an Administrator-capable session; install the verified MariaDB 11.4.13 MSI as local-only service `MariaDB-JUTI-DEV`, then run service, listener, engine, charset, grants and restart checks.
Prerequisite evidence: JTW-001 backup verified; JTW-002 baseline commit `1c6fe012b32d6771091f8d86c7253bfa72e7b4b0` verified.
Continuation: paused to prevent repeated privileged install attempts.
Blocker: Administrator access is unavailable to the local runner.
