# Project: Zombie Defense Tycoon (UEFN)

A solo/co-op zombie defence tycoon built in UEFN with Verse.
Full design lives in Notion under My Ideas Hub > Fortnite Map > Zombie Defense Tycoon.
Repo: https://github.com/tomasryoung-maker/zombie-defence-tycoon

## Tech
- UEFN (Unreal Editor for Fortnite)
- Verse for scripting
- Git/GitHub for version control
- UEFN project files live in subfolder: ZombieDefenseTycoon/

## Architecture Principles
- Event-driven, not tick-driven (tick only for movement and AI pathing)
- One source of truth per concern
- Persistence isolated to PersistenceLayer module - nothing else touches storage
- UEFN devices are leaves, Verse modules orchestrate

## Module Layout
GameStateManager (root) coordinates: WaveSystem, EconomySystem, PlayerLoadout,
BuildSystem, NPCSystem, ZombieSpawner, ZombieAI, UpgradeShop, PrestigeSystem,
PersistenceLayer, UIManager, AnalyticsLogger.

All cross-module messages flow through a central event bus, never direct calls.

## Conventions
- Verse files: snake_case.verse
- Verse classes: PascalCase
- Verse functions: snake_case
- Save schema has a version field; migrations are mandatory from day one

## Things To Never Do
- Never bypass PersistenceLayer for storage access
- Never tick when an event will do
- Never silently break old player saves
- Never commit secrets, .env files, or build artifacts
- Never add new mechanics during Phase 4 (polish phase)
- Never modify files inside the .urc/ directory (UEFN's internal version control)

## Current Phase
Phase 1 - Foundation. Goal: skeleton end-to-end loop.
Player spawns, kills a zombie, earns a coin, buys a wall. That's it.
No art. No sound. No UI polish. No second weapon.

## Working Style
- Always read CLAUDE.md before suggesting work
- Prefer small, reviewable commits over large refactors
- When uncertain about Verse syntax, say so - Verse is niche, don't guess
- Ask before adding new modules outside the architecture map
- Tom is the human running this. Tom drives UEFN editor work. You drive Verse code.
