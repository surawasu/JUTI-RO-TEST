# JUTI-HI Client to Web App Roadmap

Updated: 2026-09-02
Project root: D:\JUTI-HI_Server-Client
Project state: Planning complete; implementation not started

## 1. Goal

Develop a real browser-playable JUTI-HI client while preserving the existing rAthena server, database schema, custom NPCs, custom items, maps, and gameplay rules.

The target is not to run the Windows executable inside a browser. The target is a new browser client connected to the existing server through a secure WebSocket gateway.

## 2. Verified baseline

- Server is rAthena with full C++ source.
- Server includes login-server, char-server, map-server, and web-server.
- Client is Windows x86 and uses DirectX 9.
- Client loads main.grf, Palettes-All.grf, JUTI.grf, addon.grf, and data.grf.
- Parsed GRFs contain at least 384,529 entries excluding deep inventory of data.grf.
- Client currently points to 127.0.0.1:6900.
- Server is configured as Pre-Renewal.
- Source default PACKETVER is 20220405, while an older build artifact records 20220530.
- MySQL or MariaDB service is not currently installed.
- Current project root is not a Git repository.

## 3. Architecture decisions

| Area | Decision |
|---|---|
| Game authority | rAthena remains server-authoritative |
| Browser client | TypeScript + React UI + PixiJS renderer |
| Realtime transport | HTTPS/WSS only |
| Gateway | Node.js/TypeScript initially; C++ integration only if profiling requires it |
| Asset conversion | Python 3.12 deterministic build pipeline |
| Database | MariaDB compatible with existing rAthena SQL |
| Web API | Separate website/admin API from realtime game gateway |
| Native ports | 6900, 6121, 5121 and 8888 stay private |
| Asset delivery | Versioned manifest with static HTTP/CDN delivery |
| Anti-cheat | Server-side validation, limits, telemetry, and reconciliation |

## 4. Target components

| Component | Purpose |
|---|---|
| JUTI-HI Server | Existing rAthena core and custom gameplay |
| web-app | Browser UI, renderer, game state, input |
| game-gateway | WebSocket sessions and protocol adapter |
| asset-pipeline | GRF indexing and web asset conversion |
| web-api | Accounts, character selection, admin and website functions |
| infra | MariaDB, reverse proxy, environment templates and backup |
| tests | Protocol, asset, integration and browser tests |
| docs | Architecture decisions, operations and task evidence |

## 5. Delivery phases

### Phase 0 — Preserve and baseline

Goal: prove the original server and native client work before changing architecture.

Deliverables:

- Original file inventory and checksums
- Recoverable backup
- Git tracking for source/config/scripts
- MariaDB installation and imported schemas
- Login, character and map servers booting cleanly
- Native client login through map entry
- Confirmed PACKETVER

Exit criteria:

Native Client → Login → Character selection → Enter map succeeds using a newly prepared database, and the exact packet version is recorded.

Estimated duration: 3–10 days.

### Phase 1 — Asset pipeline proof of concept

Goal: render one real JUTI map and character in a browser.

Deliverables:

- GRF priority-aware indexer
- SPR/ACT/PAL converter
- GAT/GND/RSW converter for one selected map
- Web asset manifest with hashes
- Browser render test

Exit criteria:

One JUTI map, one player animation and one monster animation render from converted project assets.

Estimated duration: 1–3 weeks.

### Phase 2 — Web login and character selection

Goal: create a secure browser session and enter the game gateway.

Deliverables:

- Web authentication
- Character list/create/select
- Short-lived session tokens
- Binary WebSocket contract
- Gateway connection to rAthena state

Exit criteria:

A player can log in, choose a character and establish an authenticated game session entirely from the browser.

Estimated duration: 2–4 weeks.

### Phase 3 — Playable map MVP

Goal: complete the first playable vertical slice.

Deliverables:

- Map snapshot
- Entity spawn/despawn
- Click-to-move
- Server reconciliation
- Player animation
- Chat
- NPC dialog
- Reconnect/resume

Exit criteria:

Multiple players can enter one map, see each other, walk, chat and interact with an NPC.

Estimated duration: 4–8 weeks.

### Phase 4 — Core gameplay

Goal: implement the primary gameplay loop.

Deliverables:

- Inventory and equipment
- Item pickup/drop/use
- Skill bar and cooldown
- Targeting and combat
- Status effects
- Shop, trade and vending
- Party, guild, friend and mail
- Quest and custom JUTI systems

Exit criteria:

The main JUTI gameplay loop is usable without opening the native client.

Estimated duration: 8–16 weeks.

### Phase 5 — Production hardening

Goal: prepare a closed alpha.

Deliverables:

- Security review
- Rate limits and anti-cheat checks
- TLS/WSS and secret management
- Load tests
- Monitoring
- CDN and patch manifests
- Backup/restore test
- Browser compatibility testing
- Rollback procedure

Exit criteria:

Closed Alpha can be operated, monitored, backed up, restored and rolled back safely.

Estimated duration: 4–8 weeks.

## 6. Milestones

| Milestone | Required result |
|---|---|
| M0 Native Baseline | Original client enters a map |
| M1 Asset PoC | Browser renders real JUTI assets |
| M2 Web Session | Browser login and character selection |
| M3 Playable Map | Movement, other players, chat and NPC |
| M4 Core Loop | Combat, skills, items and progression |
| M5 Closed Alpha | Secure and operational deployment |

## 7. Asset conversion rules

- Preserve GRF load priority from DATA.INI.
- Never overwrite original GRFs.
- Convert SPR/ACT to texture atlases and animation JSON.
- Convert PAL selectively or apply color at runtime.
- Convert GAT to collision and walkability data.
- Convert GND/RSW to web map data.
- Convert RSM/RSM2 to glTF only when required; use baked output for MVP when cheaper.
- Convert BMP/TGA to WebP or PNG.
- Use server YAML/SQL as canonical item, mob, skill and quest metadata.
- Do not execute client LUB bytecode in the browser.
- Every output must contain source path, source hash, converter version and output hash.

## 8. Security constraints

- Never expose MariaDB directly.
- Never expose native rAthena ports to the public Internet.
- Browser input is untrusted.
- Movement, combat, inventory and cooldown remain server-authoritative.
- Secrets must not be committed.
- Development, test and production databases must be separate.
- Public traffic must use HTTPS/WSS.
- Existing rAthena web token must not be reused as the final public session mechanism.
- Review token logging before any public deployment.

## 9. Main risks

| Risk | Level | Mitigation |
|---|---|---|
| PACKETVER mismatch | High | Complete native baseline and packet trace first |
| Very large asset set | High | Selective conversion, manifests and caching |
| Encoding mix | High | Explicit EUC-KR, CP874 and UTF-8 handling |
| Custom gameplay scope | High | Vertical slices and feature inventory |
| No Git history | High | Backup and initialize Git before implementation |
| Browser anti-cheat limits | Medium | Server authority and telemetry |
| Rights for public asset distribution | High | Verify ownership and distribution rights before launch |

## 10. Governance

- agent.md defines how lnwjud and workers operate.
- master_task.md is the only authoritative task-status file.
- A task is complete only when acceptance evidence is recorded.
- Architecture changes must be added to this file or a decision record before implementation.
- Work proceeds by the first READY task whose dependencies are DONE.
