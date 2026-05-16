# ICHI8 - 一か八か

> "All or nothing."
>
> A cross-platform idle ARPG inspired by Diablo-like loot systems and endless progression.

## Overview

**ICHI8** is a dark fantasy idle ARPG focused on deep loot systems, build experimentation, endless progression, offline gains, and cross-platform gameplay.

The project aims to deliver a satisfying hack'n'slash and incremental experience playable on:

- Web
- iOS
- Android

The name **一か八か** (*ichikabachika*) is a Japanese idiom meaning "all or nothing", "sink or swim", or "go for broke".

## Vision

ICHI8 is not trying to recreate Path of Exile.

The goal is to build a clean and readable idle ARPG with meaningful loot, impactful build choices, and long-term progression, while remaining accessible on mobile devices.

The game is designed around:

- Short play sessions
- Offline progression
- Theorycrafting
- Loot dopamine
- Continuous optimization

## Planned Features

### Gameplay

- Infinite dungeon progression
- Procedural loot generation
- Random affixes and rarity tiers
- Legendary items that alter gameplay
- Skill synergies and build crafting
- Offline progression system
- Prestige and rebirth mechanics
- Seasonal content

### Online Features

- Cross-platform account sync
- Cloud saves
- Leaderboards
- Build sharing
- Events and limited-time challenges

### Platforms

- Web
- iOS
- Android

## Tech Stack

### Frontend

- Flutter
- Riverpod
- GoRouter
- Dio

### Backend

- Rust
- Axum
- Tokio
- SQLx

### Infrastructure

- PostgreSQL
- Redis
- Docker
- Nginx

## Architecture

The project follows a modular monolith architecture for the MVP phase.

```txt
apps/
├── client/        # Flutter application
├── server/        # Rust backend
└── admin/         # Admin dashboard, planned for later

docs/
├── game-design/
├── api/
└── lore/
```

## Core Principles

### Server Authoritative

Critical progression is validated server-side, including:

- Loot
- Inventory
- Currencies
- Character progression
- Rewards

### Offline Progression

The backend recalculates progression based on:

- Elapsed time
- Player build
- Area difficulty
- Validated character statistics

### Data-Driven Design

Game balance and item definitions are designed to be fully data-driven, making iteration on loot, enemies, areas, skills, and progression easier over time.

## Current Status

ICHI8 is currently in early pre-production and prototype planning.

The main goals are to:

- Establish the technical foundations
- Validate the core gameplay loop
- Create the first playable prototype

## Roadmap

### MVP

- Authentication
- Single character class
- Infinite dungeon
- Basic loot generation
- Inventory system
- Equipment system
- Offline progression
- Cloud synchronization

### Alpha

- Multiple classes
- Skill trees
- Legendary items
- Events
- Leaderboards

### Beta

- Seasonal systems
- Guild and community features
- Expanded endgame
- Mobile store release preparation

## Development

### Requirements

- Flutter SDK
- Rust stable
- Docker
- PostgreSQL

### Run Backend

```sh
cd apps/server
cargo run
```

### Run Flutter App

```sh
cd apps/client
flutter run
```

## Inspirations

- Path of Exile
- Diablo II
- Diablo III
- Melvor Idle
- RuneScape
- Incremental and idle games

## Contributing

The project is currently private and in active early development.

## License

MIT License
