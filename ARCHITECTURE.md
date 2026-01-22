# Architecture

## Overview
Spellbook follows a simple MVVM structure designed for a macOS SwiftUI app. The codebase is intentionally minimal and layered to make future slices straightforward.

## Layering
- **Views** → SwiftUI screens and components.
- **ViewModels** → Presentation logic and state.
- **Repositories** → Data access boundaries for future persistence/networking.
- **Services** → Planned layer for persistence and networking implementations.

## Notes
- Persistence and networking are intentionally deferred to later slices.
- async/await will be used for repository/service boundaries when those layers are introduced.
