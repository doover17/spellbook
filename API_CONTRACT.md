# API Contract (Placeholder)

> This file documents placeholder endpoints for future integration. No networking is implemented yet.

## Spells
- **GET /spells**
  - Response: list of spell summaries.
  - Fields: `id`, `name`, `level`, `school`, `summary`.

- **GET /spells/{id}**
  - Response: spell detail.
  - Fields: `id`, `name`, `level`, `school`, `castingTime`, `range`, `components`, `duration`, `description`.

## Spellbooks
- **GET /spellbooks**
  - Response: list of spellbooks.
  - Fields: `id`, `name`, `spellCount`, `updatedAt`.

- **GET /spellbooks/{id}**
  - Response: spellbook detail.
  - Fields: `id`, `name`, `spells` (array of spell summaries).

## Notes
- These are placeholders only; no API client exists in the project yet.
